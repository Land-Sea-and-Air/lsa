FAC = {
    facs = {}
}
---Creates a new instance of FAC.
---@param name string
---@param type string
---@param side number
---@param cost number
---@param freq number
---@param modulation string
---@param location table
---@param heading number
---@return table
function FAC.new(name, type, side, cost, freq, modulation, location, heading)
    local groupName = Dashed(name, FAC.next())
    local unitName = Dashed(groupName, "1")
    local fac = {
        name = groupName,
        unitName = unitName,
        callsign = CallsignGenerator.forwardAirControllerCallsign(),
        type = type,
        cost = cost,
        side = side,
        freq = freq,
        modulation = modulation,
        location = location,
        heading = heading,
        smokeCanisters = 10, -- [TODO] move to settings
        lastSmokedOn = nil,
        lasingId = nil,
        laser = nil,
        ir = nil,
        target = nil,
        laserCode = nil,
        status = "ready"
    }
    return fac
end

---Returns a sequential number.
---@return integer
function FAC.next()
    LSA.state.counters.fac = (LSA.state.counters.fac or 0) + 1
    return LSA.state.counters.fac
end

---Finds a FAC by the callsign.
---@param callsign string
---@return table|nil
function FAC.findByCallSign(callsign)
    for _, fac in pairs(FAC.facs) do
        if fac.callsign.name == callsign then
            return fac
        end
    end

    return nil
end

---Resets transient properties to their default values
function FAC.__reset(fac)
    fac.lasingId = nil
    fac.laser = nil
    fac.ir = nil
    fac.target = nil
    fac.laserCode = nil
    fac.lastSmokedOn = nil
    fac.status = "ready"
end

---Spawns a new FAC.
---@param fac table
function FAC.spawn(fac)
    FAC.__reset(fac)

    local scheme = FAC.__scheme(fac)
    LSA.spawnGroup2(scheme, fac.side)

    -- [REVIEW] should we allow the FAC to become a default DCS FAC (by assigning it the FAC task)?

    FAC.__updateMenus(fac)

    FAC.facs[fac.unitName] = fac
    RefUnits.new(fac.unitName, fac)
end

---Removes menu entries related to the give FAC from all players.
---@param fac table
function FAC.__removeMenus(fac)
    local menuPath = { "Forward Air Controller", fac.callsign.name }

    local units = coalition.getPlayers(fac.side)
    for _, unit in ipairs(units) do
        local groupId = unit:getGroup():getID()
        missionCommands.removeItemForGroup(groupId, menuPath)
    end
end

function FAC.__updateMenus(fac)
    local playersIds = net.get_player_list()
    for _, playerId in ipairs(playersIds) do
        local player = Player.operatingById(playerId)
        if player ~= nil and player.side == fac.side then
            FAC.__addMenus(player, fac)
        end
    end
end

function FAC.onUnitBirth(event)
    local initiatorName = event.initiator:getName()
    local player = Player.operating(initiatorName)
    if player ~= nil then
        Dump(FAC.facs)
        for _, fac in pairs(FAC.facs) do
            if player.side == fac.side then
                FAC.__addMenus(player, fac)
            end
        end
    end
end

function FAC.__addMenus(player, fac)
    local menuPath = { "Forward Air Controller" }
    local rootMenu = missionCommands.addSubMenuForGroup(player.groupId, fac.callsign.name, menuPath)
    local function menu(caption, fn)
        missionCommands.addCommandForGroup(
            player.groupId, caption, rootMenu, fn, { fac = fac, player = player }
        )
    end

    menu("Status", FAC.onStatusMenu)
    menu("Battle Damage Assessment", FAC.onBdaMenu)
    menu("Lase Target", FAC.onLaseMenu)
    menu("Smoke Target", FAC.onSmokeMenu)
    menu("Stand Down", FAC.onStandDownMenu)

    -- missionCommands.addCommandForGroup(
    --     player.groupId, "Status", rootMenu, FAC.onStatusMenu, { fac = fac, player = player }
    -- )
    -- missionCommands.addCommandForGroup(
    --     player.groupId, "Lase Target", rootMenu, FAC.onLaseMenu, { fac = fac, player = player }
    -- )
    -- missionCommands.addCommandForGroup(
    --     player.groupId, "Stand Down", rootMenu, FAC.onStandDownMenu, { fac = fac, player = player }
    -- )
    -- missionCommands.addCommandForGroup(
    --     player.groupId, "Smoke Target", rootMenu, FAC.onSmokeMenu, { fac = fac, player = player }
    -- )
end

---Returns the current location of the FAC.
---@param fac table
---@return table|nil
function FAC.__currentLocation(fac)
    if fac == nil then return nil end
    local unit = LSA.getUnit(fac.unitName)
    if unit == nil then return nil end

    return ToVec2(unit:getPoint())
end

function FAC.onBdaMenu(args)
    local player = args.player
    local fac = args.fac
    local searchRadius = 10000 -- [TODO] move to settings

    -- get the current location of the FAC
    local currentLocation = FAC.__currentLocation(fac)
    if currentLocation == nil then return end

    -- find nearest enemy base
    local nearestEnemyBase = nil
    local nearestDistance = nil
    local found = LSA.findAirbases(currentLocation, searchRadius)
    for _, obj in ipairs(found) do
        local base = LSA.findBase(obj:getName())
        if base ~= nil and base.side ~= player.side then
            local distance = Distance(currentLocation, base.location)
            local hasLOS = LSA.hasLOS(currentLocation, base.location)
            if (nearestDistance == nil or distance < nearestDistance) and hasLOS then
                nearestDistance = distance
                nearestEnemyBase = base
            end
        end
    end

    -- if no enemy base nearby is found, send message
    if nearestEnemyBase == nil then
        LSA.messagePlayer(player,
            string.format("Unable, no enemy bases nearby (%s meters).", searchRadius)
        )
        return
    end

    -- send message about enemy base strength
    local strength = Round(Base.strength(nearestEnemyBase))
    LSA.messagePlayer(player,
        string.format("Estimate base at %s%% strength.", strength)
    )
end

function FAC.onSmokeMenu(args)
    local player = args.player
    local fac = args.fac

    local _, message = FAC.smoke(fac)
    if #message then
        LSA.messagePlayer(player, message)
    end
end

function FAC.smoke(fac)
    if fac.smokeCanisters < 1 then
        return false, "Unable, no more smoke markers."
    end

    -- [TODO] check range, since smoke must be thrown in range should be reduced

    if fac.lastSmokedOn ~= nil and (LSA.getNow() - fac.lastSmokedOn) < (5 * 60) then -- [TODO] move to settings or determine accurately how long smoke goes for
        return false, "Negative, target is already marked with smoke."
    end

    -- find nearby targets
    local targets = FAC.__findTargets(fac)
    if #targets == 0 then
        return false, "Unable, no targets in sight."
    end

    -- [TODO] create a prioritized list of targets and pick the
    -- highest priority target

    local target = targets[1]
    local targetPoint = target:getPoint()
    local descriptor = target:getDesc()
    local smokeColorName = ""

    local smokeOffset = { distance = math.random(5, 16), angle = math.random(1, 360) }
    local smokePosition = ToVec3(LSA.newPos(ToVec2(targetPoint), smokeOffset))
    smokePosition.y = smokePosition.y + 5 -- elevate the smoke just a bit
    if fac.side == coalition.side.RED then
        smokeColorName = "blue"
        trigger.action.smoke(smokePosition, trigger.smokeColor.Blue)
    elseif fac.side == coalition.side.BLUE then
        smokeColorName = "red"
        trigger.action.smoke(smokePosition, trigger.smokeColor.Red)
    end

    fac.lastSmokedOn = LSA.getNow()
    fac.smokeCanisters = fac.smokeCanisters - 1

    return true, string.format(
        "Target %s marked with %s smoke, still %s smoke markers left.",
        descriptor.displayName, smokeColorName, fac.smokeCanisters
    )
end

function FAC.onStandDownMenu(args)
    local player = args.player
    local fac = args.fac
    FAC.turnOffLaser(fac)
    -- [TODO] sounds?
    LSA.messagePlayer(player, "Roger, laser off.")
end

function FAC.turnOnLaser(fac, targetPoint)
    local facUnit = LSA.getUnit(fac.unitName)
    local localRef = { x = 0, y = 1.5, z = 0 } -- one and a half meter above the FAC
    local minCode = 1111
    local maxCode = 1788
    fac.laserCode = fac.laserCode or math.random(minCode, maxCode)
    fac.laser = Spot.createLaser(facUnit, localRef, targetPoint, fac.laserCode)
    fac.ir = Spot.createInfraRed(facUnit, localRef, targetPoint)
end

---Turns off the laser on the given FAC.
---@param fac table
function FAC.turnOffLaser(fac)
    fac.laser:destroy()
    fac.ir:destroy()

    fac.target = nil
    fac.laserCode = nil
    fac.lasingId = nil
    fac.laser = nil
    fac.ir = nil
    fac.status = "ready"
end

---Sets the laser code on the given FAC.
---@param fac table
---@param laserCode number
---@return boolean
---@return string
function FAC.setLaserCode(fac, laserCode)
    if laserCode < 1111 or laserCode > 1788 then
        return false, "Unable, invalid laser code (must be between 1111 and 1788)."
    end

    if fac.status == "lasign" then
        FAC.turnOffLaser(fac)
    end

    fac.laserCode = laserCode

    return true, string.format("Roger, turning off laser and changing code to %s, %s out.", laserCode, fac.callsign.name)
end

function FAC.onLaseMenu(args)
    local player = args.player
    local fac = args.fac

    -- find nearby targets
    local targets = FAC.__findTargets(fac)
    if #targets == 0 then
        LSA.messagePlayer(player, "Unable, no targets in sight")
        return
    end

    -- [TODO] create a prioritized list of targets and pick the
    -- highest priority target

    local target = targets[1]
    local targetPoint = target:getPoint()
    local descriptor = target:getDesc()
    FAC.turnOnLaser(fac, targetPoint)
    fac.target = descriptor.displayName
    fac.status = "lasing"
    LSA.messagePlayer(player,
        string.format("Target %s being lased with code %s.", descriptor.displayName, "1688")
    )

    -- keep lasing
    fac.lasingId = TS.task(fac.callsign.name .. " lasing", function(_, time)
        local detections = FAC.__findTargets(fac)
        local inSight = false
        for _, detection in ipairs(detections) do
            if detection:getName() == target:getName() then
                inSight = true
                break
            end
        end

        if not inSight then
            LSA.messagePlayer(player,
                string.format("Lost target %s, laser off.", descriptor.displayName)
            )
            FAC.turnOffLaser(fac)
            fac.lasingId = nil
            return nil
        end

        return time + 3 -- [TODO] move to settings
    end)
end

function FAC.__findTargets(fac)
    local targets = {}

    -- [REVIEW] radius should reduce if weather and/or time of day are adverse
    local radius = 10000 -- [TODO] move to settings
    local unitNames = LSA.findUnitsAt(fac.location.x, fac.location.y, radius)
    for _, unitName in ipairs(unitNames) do
        local unit = LSA.getUnit(unitName)

        -- only consider alive enemy units
        if unit ~= nil and unit:getCoalition() ~= fac.side and unit:getLife() > 0 then
            local unitPosition = ToVec2(unit:getPoint())
            local hasLOS = LSA.hasLOS(fac.location, unitPosition)
            if hasLOS then
                table.insert(targets, unit)
            end
        end
    end

    return targets
end

function FAC.__getNearbyTargetsMessage(fac)
    local targets = FAC.__findTargets(fac)
    if #targets == 0 then
        return "No targets in sight."
    end

    local message = { "Visual on:\n" }
    for _, target in ipairs(targets) do
        -- name
        local descriptor = target:getDesc()
        local displayName = descriptor.displayName
        table.insert(message, string.format("hostile %s", displayName))
        -- distance
        local targetLocation = ToVec2(target:getPoint())
        local distance = Distance(fac.location, targetLocation)
        local e = math.max(0, Digits(distance) - 2)
        local estimation = Round(distance / 10 ^ (e)) * 10 ^ (e)
        table.insert(message, string.format("at roughly %s meters", math.floor(estimation)))
        table.insert(message, "\n")
    end

    return table.concat(message, " ")
end

function FAC.__getNearbyTargetsMessage2(fac)
    -- find nearby targets
    local facUnit = LSA.getUnit(fac.unitName)
    if facUnit == nil then return end

    local unitCtrl = facUnit:getController()
    if unitCtrl == nil then return end

    local detections = unitCtrl:getDetectedTargets()
    if #detections == 0 then
        return "No targets in sight"
    end

    local message = { "Visual on:\n" }
    for _, detection in ipairs(detections) do
        local target = detection.object
        local descriptor = target:getDesc()
        if detection.visible then
            local displayName = descriptor.displayName
            if detection.type and displayName ~= nil and #displayName > 0 then
                table.insert(message, string.format("hostile %s", displayName))
            else
                table.insert(message, "unknown hostile")
            end
            if detection.distance then
                local targetLocation = ToVec2(target:getPoint())
                local distance = Distance(fac.location, targetLocation)
                local e = math.max(0, Digits(distance) - 2)
                local estimation = Round(distance / 10 ^ (e)) * 10 ^ (e)
                table.insert(message, string.format("at roughly %s meters", math.floor(estimation)))
            else
                table.insert(message, "unknown distance")
            end
            table.insert(message, "\n")
        end
    end

    return table.concat(message, " ")
end

---Returns current FAC state.
---@return table
function FAC.state()
    return FAC.facs
end

---Processes the unit lost event for FAC.
---@param event unknown
function FAC.onLostUnit(event)
    local unit = event.initiator
    local unitName = unit:getName()
    local fac = FAC.facs[unitName]
    if fac == nil then return end

    FAC.__removeMenus(fac)

    FAC.facs[unitName] = nil
end

function FAC.onStatusMenu(args)
    local fac = args.fac
    local group = LSA.getGroup(fac.name)
    local unit = group:getUnit(1)
    local player = args.player

    local lat, lon, _ = coord.LOtoLL(unit:getPoint())
    local mgrs = coord.LLtoMGRS(lat, lon)

    local grid = string.format("%s %s %s %s", mgrs.UTMZone, mgrs.MGRSDigraph, mgrs.Easting, mgrs.Northing)
    local m = string.format("%s at grid %s", unit:getCallsign(), grid)
    LSA.messagePlayer(player, m, 10, false)
    if fac.status == "ready" then
        LSA.messagePlayer(player, FAC.__getNearbyTargetsMessage(fac), 10, false)
    else
        LSA.messagePlayer(player, FAC.__getLasingMessage(fac), 10, false)
    end
end

function FAC.__getLasingMessage(fac)
    return string.format("Lasing target %s, laser code: %s", fac.target, fac.laserCode)
end

function FAC.updateLocations()
    for _, fac in pairs(FAC.facs) do
        local unit = LSA.getUnit(fac.unitName)
        if unit ~= nil then
            local position = unit:getPosition()
            local location = ToVec2(position.p)
            local heading = LSA.heading(position)
            fac.location = location
            fac.heading = heading
        end
    end
end

---Creates the scheme for a FAC.
---@param fac table
---@return table
function FAC.__scheme(fac)
    return {
        ["hiddenOnMFD"] = true,
        ["visible"] = false,
        ["tasks"] =
        {
        },
        ["uncontrollable"] = false,
        ["task"] = "Ground Nothing",
        ["taskSelected"] = true,
        ["route"] =
        {
            ["points"] =
            {
                [1] =
                {
                    ["alt"] = land.getHeight(fac.location),
                    ["type"] = "Turning Point",
                    ["ETA"] = 0,
                    ["alt_type"] = "BARO",
                    ["formation_template"] = "",
                    ["y"] = fac.location.y,
                    ["x"] = fac.location.x,
                    ["ETA_locked"] = true,
                    ["speed"] = 0,
                    ["action"] = "Off Road",
                    ["task"] =
                    {
                        ["id"] = "ComboTask",
                        ["params"] =
                        {
                            ["tasks"] =
                            {
                                [1] =
                                {
                                    ["enabled"] = true,
                                    ["id"] = "FAC",
                                    ["number"] = 1,
                                    ["params"] =
                                    {
                                        ["number"] = fac.callsign.number,
                                        ["designation"] = "Auto",
                                        ["modulation"] = LSA.getRadioModulation(fac.modulation),
                                        ["callname"] = fac.callsign.callsign,
                                        ["datalink"] = true,
                                        ["frequency"] = fac.freq,
                                    },
                                },
                            },
                        },
                    },
                    ["speed_locked"] = true,
                },
            },
        },
        ["hidden"] = false,
        ["units"] =
        {
            [1] =
            {
                ["skill"] = LSA.settings.defaultUnitSkillLevel,
                ["coldAtStart"] = false,
                ["type"] = fac.type,
                ["y"] = fac.location.y,
                ["x"] = fac.location.x,
                ["name"] = fac.unitName,
                ["heading"] = math.rad(fac.heading),
                ["playerCanDrive"] = true,
            },
        },
        ["y"] = fac.location.y,
        ["x"] = fac.location.x,
        ["name"] = fac.name,
        ["start_time"] = 0,
    }
end