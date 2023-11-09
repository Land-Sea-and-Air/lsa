LSA = {}

LSA.version = Version
LSA.dev = os.getenv("LSA_DEV") == "true"

--#region Settings
LSA.settings = {}
LSA.settings.path = os.getenv("LSA_MISSION_PATH")
LSA.settings.soundFilesPath = "l10n\\DEFAULT"
LSA.settings.bombersEnabled = false
LSA.settings.awacsEnabled = false
LSA.settings.sessionLengthSeconds = 6 * 60 * 60
LSA.settings.baseCaptureTimeDelay = 10 * 60
LSA.settings.outsidePerimeterDelay = 30
LSA.settings.minimumBaseStrength = 30
LSA.settings.defaultUnitSkillLevel = "Excellent"
LSA.settings.maxPlayerLives = 3
LSA.settings.maxSearchRadiusMeters = 300
LSA.settings.crateType = "container_cargo"
LSA.settings.maxSupplies = 100
LSA.settings.regeneratedSupplyQuantity = 1
LSA.settings.timeToSupplyRegeneration = 60 * 60
LSA.settings.baseAttackCooldownDelay = 40 * 60
LSA.settings.crateSpawnDistance = 25
LSA.settings.personnelSpawnDistance = 30
LSA.settings.timeToNewLife = 3 * 60 * 60
LSA.settings.shipSpeedMetersPerSecond = 6                  -- meters per second
LSA.settings.waitPeriodForNewCarrier = 10 * (24 * 60 * 60) -- ten days in seconds
LSA.settings.waitPeriodForNewBomber = 10 * (24 * 60 * 60)  -- ten days in seconds
LSA.settings.waitPeriodForNewTanker = 10 * (24 * 60 * 60)  -- ten days in seconds
LSA.settings.saveMissionInterval = 5 * 60
--#endregion

--#region State
LSA.state = {}
LSA.state.facs = {}
LSA.state.assets = {}
LSA.state.personnel = {}
LSA.state.createdOn = nil
LSA.state.counter = 1
LSA.state.counters = {}

LSA.state.players = {}

LSA.state.carriers = {}

LSA.state.bases = {}
LSA.state.faction = {}
LSA.state.faction.supplies = {
    red = 0,
    blue = 0,
}
LSA.state.faction.groups = {}
LSA.state.faction.groups.red = {}
LSA.state.faction.groups.blue = {}
--#endregion

--#region Logistic Templates
LSA.logistics = {}
LSA.logistics.personnel = {}
LSA.logistics.personnel.red = {
    {
        name = "Special-Forces",
        mass = 600,
        types = {
            { type = "Paratrooper AKS-74", distance = 000, angle = 000, heading = 000 },
            { type = "Paratrooper AKS-74", distance = 005, angle = 130, heading = 000 },
            { type = "Infantry AK ver2",   distance = 005, angle = 235, heading = 000 },
            { type = "Infantry AK ver2",   distance = 013, angle = 130, heading = 000 },
            { type = "Infantry AK ver2",   distance = 018, angle = 125, heading = 000 }
        }
    }
}
LSA.logistics.personnel.blue = {
    {
        name = "Special-Forces",
        mass = 600,
        types = {
            { type = "Soldier M249", distance = 000, angle = 000, heading = 000 },
            { type = "Soldier M249", distance = 005, angle = 130, heading = 000 },
            { type = "Soldier M4",   distance = 005, angle = 235, heading = 000 },
            { type = "Soldier M4",   distance = 013, angle = 130, heading = 000 },
            { type = "Soldier M4",   distance = 018, angle = 125, heading = 000 }
        }
    }
}
--#endregion

LSA.transports = {
    ["Mi-8MT"] = { type = "Mi-8MT", seats = 12 },
    ["Mi-24P"] = { type = "Mi-24P", seats = 8 },
    ["UH-1H"] = { type = "UH-1H", seats = 7 },
    ["BMP-1"] = { type = "BMP-1", seats = 5 }
}

LSA.index = {}
LSA.index.units = {}

LSA.misc = {}
LSA.misc.events = {}

LSA.OceanPoly = {}

function LSA.start()
    local start = os.time()
    Log.info("Mission L.S.A has started (v%s)", LSA.version)
    Log.info(_VERSION)
    Log.info("Working path set to: '%s'", LSA.settings.path)
    Log.info("Log debug is: %s, trace is: %s", Log.settings.debug, Log.settings.trace)

    -- check if server state file exists
    -- this file contains information about the previous running mission
    -- in case of a server crash, it can be used to reload the correct mission
    if FileExists(LSA.settings.path .. "\\server.state.lua") then
        -- the file exists which means we have to check it for the
        -- correct mission
        local server = Loader.loadFile("server.state.lua")()
        local year = env.mission.date.Year
        local month = env.mission.date.Month
        local day = env.mission.date.Day

        if year ~= server.missionYear or month ~= server.missionMonth or day ~= server.missionDay then
            Log.info("Found server state mission mismatch | Server State Date: %s-%s-%s | Mission Date: %s-%s-%s",
                server.missionYear, server.missionMonth, server.missionDay, year, month, day
            )
            Log.info("Reloading server state | Miz File: %s", server.missionFile)
            local mizFile = server.missionFile
            local command = string.format("a_load_mission(\"%s\")", mizFile)
            Log.debug("Calling mission scripting command: " .. command)
            net.dostring_in('mission', command)
        end
    end

    local n = math.floor(os.time() % 100)
    Log.debug("Running %s iterations for random", n)
    for _ = 1, n do
        math.random()
    end

    env.setErrorMessageBoxEnabled(LSA.dev)

    LSA.disableBaseAutoCapture()
    LSA.silenceATC()

    if #env.mission.triggers.zones > 0 then
        TriggerZones = TriggerZoneExporter.export()
    end

    world.addEventHandler(LSA)

    LSA.oceanArea()
    LSA.loadState()
    LSA.initializeTasks()
    LSA.setFlag("lsa-end-mission", os.time() + LSA.settings.sessionLengthSeconds) -- save the end mission time for SSB

    if LSA.dev then
        Log.info("DEV mode is enabled")
        LSA.devTools()
    end

    local weather = env.mission.weather
    Log.info("Weather - Temperature: %s, Clouds: %s, Base: %s, Qnh: %s",
        weather.season.temperature, weather.clouds.preset or "none", weather.clouds.base, weather.qnh)

    CfxGroups.start()
    CfxSSBClient.start() -- we need to call the ssb client after all spawning from the state populating have occurred

    local finish = os.time()
    Log.info("Started in %s seconds", (finish - start))
end

function LSA.oceanArea()
    local allZones = {}
    local index = 1

    while true do
        local zoneName = Dashed("Ocean-Area", index)
        local zone = LSA.getZone(zoneName)
        if zone == nil then
            break
        end

        local center = zone.location
        table.insert(LSA.OceanPoly, center.x)
        table.insert(LSA.OceanPoly, center.y)

        table.insert(allZones, zone.location)

        index = index + 1
    end

    if #allZones < 3 then
        Log.debug("Not enough points to create a polygon, skipping.")
        LSA.OceanPoly = {}
        return
    end

    for i = 1, #allZones - 1 do
        local p1 = ToVec3(allZones[i])
        local p2 = ToVec3(allZones[i + 1])

        trigger.action.lineToAll(
            LSA.markups.coalitions.All,
            LSA.next(),
            p1,
            p2,
            LSA.markups.colors.opaque.Black,
            LSA.markups.lines.LongDash,
            true
        )
    end

    local p1 = ToVec3(allZones[#allZones])
    local p2 = ToVec3(allZones[1])
    trigger.action.lineToAll(
        LSA.markups.coalitions.All,
        LSA.next(),
        p1,
        p2,
        LSA.markups.colors.opaque.Black,
        LSA.markups.lines.LongDash,
        true
    )
end

function LSA.getQuad(zoneName)
    local zone = TriggerZones[zoneName]
    if LSA.dev and zone == nil then
        local tz = trigger.misc.getZone(zoneName)
        if tz ~= nil then
            zone = {
                name = zoneName,
                location = ToVec2(tz.point),
                radius = tz.radius,
                properties = tz.properties or {},
                vertices = tz.verticies or {}
            }
        end
    end

    if zone == nil then
        Log.trace("Could not find a zone by the name of '%s'", zoneName)
    end

    return zone
end

function LSA.getZone(zoneName)
    local zone = TriggerZones[zoneName]
    if LSA.dev and zone == nil then
        local tz = trigger.misc.getZone(zoneName)
        if tz ~= nil then
            zone = {
                name = zoneName,
                location = ToVec2(tz.point),
                radius = tz.radius,
                properties = tz.properties or {}
            }
        end
    end

    if zone == nil then
        Log.trace("Could not find a zone by the name of '%s'", zoneName)
    end

    return zone
end

function LSA.groupTasking()
    return {
        EWR = function(group)
            Log.debug("Assigning group %s with EWR task", group:getName())
            local controller = group:getController()
            controller:pushTask({
                id = "EWR",
                params = {}
            })

            -- prevent the "AWACS" calls in DCS
            controller:setCommand({
                id = 'SetFrequency',
                params = {
                    frequency = 0,
                    modulation = radio.modulation.AM,
                }
            })
        end,

        SAM = function(group)
            local controller = group:getController()
            local groupName = group:getName()
            Log.trace("Setting %s to open fire", groupName)
            controller:setOption(AI.Option.Ground.id.ROE, AI.Option.Ground.val.ROE.OPEN_FIRE)
            Log.trace("Setting %s to alarm state red", groupName)
            controller:setOption(AI.Option.Ground.id.ALARM_STATE, AI.Option.Ground.val.ALARM_STATE.RED)
            Log.trace("Setting %s to engage air weapons", groupName)
            controller:setOption(AI.Option.Ground.id.ENGAGE_AIR_WEAPONS, true)
            Log.trace("Setting %s to engage at 100% range", groupName)
            controller:setOption(AI.Option.Ground.id.AC_ENGAGEMENT_RANGE_RESTRICTION, 100)
            Log.trace("Setting %s to engage air targets only", groupName)
            controller:setOption(28, 1) -- does not have enumerators at the time of writing
        end
    }
end

function LSA.onPersonnelMenu(args)
    local personnel = args.personnel
    local player = args.player
    local playerPosition = Player.position(player)

    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, Text.LAND_FIRST)
        return
    end

    -- is the player close to a logistics center
    local center = LSA.findFriendlyLogistics(player.side, playerPosition)
    if center == nil then
        LSA.messagePlayer(player, Text.NOT_CLOSE_ENOUGH_LOGISTICS)
        return
    end

    Personnel.bringTo(player, personnel)
end

function LSA.onRepairsMenu(args)
    local player = args.player
    Repairs.bringTo(player)
end

function LSA.onSuppliesMenu(args)
    local player = args.player
    Supplies.bringTo(player)
end

function LSA.hasFactionEnoughSupplies(side, amount)
    if side == coalition.side.RED then
        return LSA.state.faction.supplies.red >= amount
    elseif side == coalition.side.BLUE then
        return LSA.state.faction.supplies.blue >= amount
    end
end

function LSA.decreaseFactionSupplies(side, amount)
    if side == coalition.side.RED then
        LSA.state.faction.supplies.red = LSA.state.faction.supplies.red - amount
    elseif side == coalition.side.BLUE then
        LSA.state.faction.supplies.blue = LSA.state.faction.supplies.blue - amount
    end
end

function LSA.increaseFactionSupplies(side, amount)
    if side == coalition.side.RED then
        LSA.state.faction.supplies.red = LSA.state.faction.supplies.red + amount
    elseif side == coalition.side.BLUE then
        LSA.state.faction.supplies.blue = LSA.state.faction.supplies.blue + amount
    end
end

function LSA.onUnpackCargoMenu(args)
    local player = args.player
    local playerPosition = Player.position(player)

    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, Text.LAND_FIRST)
        return
    end

    local container = LSA.findFriendlyCrateAt(player.side, playerPosition)
    if container == nil then
        Log.debug("No container to unpack")
        LSA.messagePlayer(player, Text.NO_CARGO_NEARBY)
        return
    end

    if Repairs.isRepairs(container:getName()) then
        Repairs.unpack(player, container)
    end
end

function LSA.findBasePlayerLandedOn(player)
    local pos2d = Player.position(player)
    local bases = LSA.findBasesAt(pos2d.x, pos2d.y, 4000) -- [TODO] move to settings
    if #bases == 0 then return nil end
    return bases[1]:getName()
end

function LSA.onReturnCargoMenu(args)
    local player = args.player
    local playerPosition = Player.position(player)

    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, Text.LAND_FIRST)
        return
    end

    local logisticsCenter = LSA.findFriendlyLogistics(player.side, playerPosition)
    if logisticsCenter == nil then
        Log.debug("No logistic center nearby")
        LSA.messagePlayer(player, Text.NEED_LOGISTICS_CENTER)
        return
    end

    local container = LSA.findFriendlyCrateAt(player.side, playerPosition)
    if container == nil then
        Log.debug("No container to discard")
        LSA.messagePlayer(player, Text.NO_CARGO_NEARBY)
        return
    end

    local containerName = container:getName()
    if Supplies.isSupplies(containerName) then
        Supplies.restore(containerName)
        return
    end

    if Repairs.isRepairs(containerName) then
        Repairs.restore(container)
        return
    end
end

function LSA.onDisbandPersonnelMenu(args)
    local player = args.player
    local playerPosition = Player.position(player)

    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, Text.LAND_FIRST)
        return
    end

    Personnel.disband(player)
end

function LSA.canLogistics(player)
    return LSA.transports[player.unitType] ~= nil
end

function LSA.onPayloadWeightMenu(args)
    local player = args.player
    local message = ""

    local unitWrp = RefUnits.get(player.unitName)
    local total = UnitWrp.getWeight(unitWrp)
    message = string.format("Total on-board: %s KG", total)
    LSA.messagePlayer(player, message)

    -- [TODO] more detailed summary of weight
end

function LSA.onUnloadCargoMenu(args)
    local player = args.player
    local playerPosition = Player.position(player)

    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, Text.LAND_FIRST)
        return
    end

    if Supplies.hasSupplies(player.unitName) then
        Supplies.unload(player)
        return
    end

    if Repairs.hasRepairs(player.unitName) then
        Repairs.unload(player)
        return
    end
end

function LSA.onUnloadPersonnelMenu(args)
    local player = args.player
    local playerPosition = Player.position(player)

    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, Text.LAND_FIRST)
        return
    end

    Personnel.unload(player)
end

function LSA.findFriendlyLogistics(side, location)
    local staticObjects = LSA.findStatics(location, LSA.settings.maxSearchRadiusMeters)
    for _, staticObj in ipairs(staticObjects) do
        local staticName = staticObj:getName()
        local static = RefStatics.get(staticName)
        if static ~= nil and StaticWrp.isLogistics(static) and StaticWrp.getSide(static) == side then
            return RefStatics.get(staticName)
        end
    end

    return nil
end

function LSA.findFriendlyCrateAt(side, location)
    local statics = LSA.findCargosAt(location.x, location.y, LSA.settings.maxSearchRadiusMeters)
    for _, static in ipairs(statics) do
        local type = static:getTypeName()
        if static:getCoalition() == side and type == LSA.settings.crateType then
            return static
        end
    end

    return nil
end

---Finds personnel belonging to the given side.
---@param player table
---@param location table
---@return string|nil
function LSA.findFriendlyPersonnelAt(player, location)
    local unitObjects = LSA.findUnits(location, LSA.settings.maxSearchRadiusMeters)
    for _, obj in ipairs(unitObjects) do
        if obj:getName() ~= player.name and obj:getCoalition() == player.side then
            local groupName = obj:getGroup():getName()
            if Personnel.isPersonnel(groupName) then
                return groupName
            end
        end
    end
    return nil
end

function LSA.onLoadPersonnelMenu(args)
    local player = args.player
    local playerPosition = Player.position(player)

    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, Text.LAND_FIRST)
        return
    end

    local personnelName = LSA.findFriendlyPersonnelAt(player, playerPosition)
    if personnelName == nil then return end

    Personnel.load(personnelName, player)
end

function LSA.onLoadCargoMenu(args)
    local player = args.player
    local playerPosition = Player.position(player)

    -- is player on the ground
    if playerPosition.airborne then
        LSA.messagePlayer(player, Text.LAND_FIRST)
        return
    end

    local container = LSA.findFriendlyCrateAt(player.side, playerPosition)
    if container == nil then
        Log.debug("Could not find a friendly crate nearby")
        return
    end

    local containerName = container:getName()
    if Supplies.isSupplies(containerName) then
        Supplies.load(player, container)
        return
    end

    if Repairs.isRepairs(containerName) then
        Repairs.load(player, container)
        return
    end
end

function LSA.heading(pos3d)
    return math.deg(math.atan2(pos3d.x.z, pos3d.x.x))
end

---Converts kilometers per hour to meters per second.
---@param kmh number
---@return integer
function LSA.kmhToMps(kmh)
    return math.ceil((kmh * 1000) / 3600)
end

function LSA.hzToMhz(hz)
    return hz / 1000000
end

function LSA.onPlayerLivesMenu(args)
    local player = args.player
    local playerState = Player.state(player.ucid)

    LSA.messagePlayer(player,
        string.format("You have %s lives.", playerState.lives)
    )

    for i, nextLifeDate in ipairs(playerState.queue) do
        local current = LSA.getDateUTC()
        local diff = nextLifeDate - current

        local minutes = math.ceil(diff / 60)
        LSA.messagePlayer(player,
            string.format("Recovering life %s in %s minutes", i, minutes), 10, false
        )
    end
end

LSA.PlayerSides = {
    Neutral = 0,
    Red = 1,
    Blue = 2,
}

function LSA:onEvent(event)
    if event == nil then return end

    -- if LSA.dev and event.id ~= world.event.S_EVENT_BIRTH then
    --     local initiator = event.initiator
    --     local initiatorName = "unknown name"
    --     local initiatorType = "unknown type"
    --     if initiator ~= nil then
    --         local desc = initiator:getDesc()
    --         initiatorName = initiator:getName() or initiatorName
    --         initiatorType = initiator:getTypeName() or desc.typeName or initiatorType
    --     end

    --     local eventId = event.id
    --     local eventName = LSA.misc.events[event.id]
    --     local evtMsg = string.format(
    --         "\n\nEvent id: %s\nEvent: %s\nName: %s\nType: %s\n\n",
    --         eventId, eventName, initiatorName, initiatorType)
    --     Log.debug(evtMsg)
    -- end

    if event.id == world.event.S_EVENT_LAND then
        LSA.onLandEvent(event)
        return
    end

    if event.id == world.event.S_EVENT_TAKEOFF then
        LSA.onTakeoffEvent(event)
        return
    end

    if event.id == world.event.S_EVENT_EJECTION then
        LSA.onEjectEvent(event)
        return
    end

    if event.id == world.event.S_EVENT_UNIT_LOST then
        LSA.onUnitLostEvent(event)
        return
    end

    if event.id == world.event.S_EVENT_PLAYER_LEAVE_UNIT then
        LSA.onPlayerLeaveUnitEvent(event)
        return
    end

    if event.id == world.event.S_EVENT_BIRTH then
        LSA.onBirthEvent(event)
        return
    end

    if event.id == world.event.S_EVENT_HIT then
        LSA.onHitEvent(event)
        return
    end

    if event.id == world.event.S_EVENT_MARK_CHANGE then
        LSA.onMarkChanged(event)
        return
    end

    if event.id == world.event.S_EVENT_LANDING_AFTER_EJECTION then
        LSA.onLandingAfterEjection(event)
        return
    end

    if event.id == world.event.S_EVENT_ENGINE_STARTUP then
        LSA.onEngineStartupEvent(event)
        return
    end

    if event.id == world.event.S_EVENT_ENGINE_SHUTDOWN then
        LSA.onEngineShutdownEvent(event)
        return
    end
end

function LSA.onEngineShutdownEvent(event)
    if LSA.isPlayerEvent(event) then
        local unit = event.initiator
        local unitName = unit:getName()
        local player = Player.operating(unitName)
        if player == nil then return end

        player.engines = false

        local place = event.place
        if place == nil then return end

        local baseSide = place:getCoalition()
        if player.side ~= baseSide then return end

        local isAtApron = false
        if place:getDesc().category == Airbase.Category.SHIP then
            isAtApron = true
        else
            local position = ToVec2(unit:getPoint())
            local base = Base.find(place:getName())
            isAtApron = Base.isApronArea(base, position)
        end

        if isAtApron then
            Player.winLife(player.ucid)
            LSA.messagePlayer(player,
                string.format("Welcome back %s. You now have %s lives.", player.playerName,
                    Player.lives(player))
            )
        end
    end
end

function LSA.onEngineStartupEvent(event)
    if LSA.isPlayerEvent(event) then
        local unit = event.initiator
        if unit:inAir() then return end

        local unitName = unit:getName()
        local player = Player.operating(unitName)
        if player == nil then return end

        player.engines = true

        if event.place == nil then return end

        local baseSide = event.place:getCoalition()
        if player.side ~= baseSide then return end

        Player.loseLife(player.ucid)
        LSA.messagePlayer(player,
            string.format("You now have %s lives", Player.lives(player))
        )
    end
end

function LSA.onBirthEvent(event)
    if event.initiator == nil then return end

    if event.initiator:getCategory() == Object.Category.UNIT then
        LSA.onUnitBirthEvent(event)
    end
end

function LSA.onUnitBirthEvent(event)
    local initiator = event.initiator
    local unitName = initiator:getName()
    if event.initiator.getPlayerName == nil then return end
    if event.initiator:getPlayerName() == nil then return end

    local unitCategory = initiator:getDesc().category
    if unitCategory == Unit.Category.AIRPLANE or unitCategory == Unit.Category.HELICOPTER then
        local player = Player.onUnitBirth(unitName)
        LSA.addPlayerMenu(player)
        GCI.onUnitBirth(event)
        FAC.onUnitBirth(event)
        local unitWrp = UnitWrp.new(
            unitName,
            initiator:getTypeName(),
            ToVec2(initiator:getPoint()),
            0,
            nil,
            initiator:getCoalition())
        RefUnits.new(unitName, unitWrp)
    end
end

function LSA.onLandingAfterEjection(event)
    EjectedPilot.onGround(event)
end

function LSA.onMarkChanged(event)
    if MarkCommands.isCommand(event) then
        MarkCommands.run(event)
    end
end

function LSA.onHitEvent(event)
    if event.target == nil then return end

    local targetCategory = event.target:getCategory()

    if targetCategory == Object.Category.STATIC then
        StaticWrp.onHit(event)
    end

    if targetCategory == Object.Category.UNIT then
        UnitWrp.onHit(event)
    end
end

function LSA.onEjectEvent(event)
    if event.initiator == nil then return end

    if LSA.isPlayerEvent(event) then
        local unit = event.initiator
        local unitName = unit:getName()
        local player = Player.operating(unitName)
        if player ~= nil and not unit:inAir() then
            Player.loseLife(player.ucid)
            Player.loseLife(player.ucid)
            Player.loseLife(player.ucid)
        end
    end

    EjectedPilot.onEject(event)
end

function LSA.onUnitLostEvent(event)
    if event.initiator == nil then
        return
    end

    local category = event.initiator:getCategory()

    if category == Object.Category.UNIT then
        LSA.onLostUnit(event)
        return
    end

    if category == Object.Category.STATIC then
        LSA.onLostStatic(event)
        return
    end
end

LSA.lastEvt = nil
function LSA.onPlayerLeaveUnitEvent(event)
    if event.initiator == nil then return end

    -- at the time of writing DCS fires the same event twice
    -- this stops us from processing it twice
    if LSA.lastEvt ~= nil and
        event.id == LSA.lastEvt.id and
        event.initiator == LSA.lastEvt.initiator and
        event.time == LSA.lastEvt.time then
        return
    end
    LSA.lastEvt = event
    -- end of duplicate event handling

    local initiator = event.initiator
    local unitName = initiator:getName()

    Log.debug("Unit %s has been vacated at %s", unitName, event.time)

    local unitCategory = initiator:getDesc().category

    if unitCategory == Unit.Category.AIRPLANE then
        LSA.onPlayerLeaveAircraft(unitName)
        return
    end
    if unitCategory == Unit.Category.HELICOPTER then
        LSA.onPlayerLeaveHelicopter(unitName)
        return
    end
    if unitCategory == Unit.Category.GROUND_UNIT then
        LSA.onPlayerLeaveGroundUnit(initiator)
    end
end

function LSA.onPlayerLeaveAircraft(unitName)
    local unit = Unit.getByName(unitName)
    if unit ~= nil and unit:inAir() and unit:getLife() > 0 and Player.isPlayer(unitName) then
        Log.debug("You left your plane while in the air")
    end
end

function LSA.onPlayerLeaveHelicopter(unitName)
    local unit = Unit.getByName(unitName)
    if unit ~= nil and unit:inAir() and unit:getLife() > 0 and Player.isPlayer(unitName) then
        Log.debug("You left your helo while in the air")
    end
    local unitType = unit:getTypeName()
    if Transport.isTransport(unitType) then
        Log.debug("Clearing transport %s", unitName)
        Transport.leave(unitName)
    end
end

function LSA.onPlayerLeaveGroundUnit(initiator)
    local unitName = initiator:getName()
    local unitType = initiator:getTypeName()
    if Transport.isTransport(unitType) then
        Transport.leave(unitName)
    end
end

function LSA.onEnableText(args)
    local player = args.player
    local settings = Player.settings(player.ucid)
    settings.text = true
    Log.debug("Text-on-screen enabled for %s", player.ucid)
end

function LSA.onDisableText(args)
    local player = args.player
    local settings = Player.settings(player.ucid)
    settings.text = false
    Log.debug("Text-on-screen disabled for %s", player.ucid)
end

function LSA.addPlayerMenu(player)
    local playerMenu = {
        {
            path = "Settings.Text-on-screen.Enable",
            handler = LSA.onEnableText,
            args = { player = player }
        },
        {
            path = "Settings.Text-on-screen.Disable",
            handler = LSA.onDisableText,
            args = { player = player }
        },
        {
            path = "Lives",
            handler = LSA.onPlayerLivesMenu,
            args = { player = player }
        },
        {
            path = "ATIS.Listen",
            handler = LSA.onATIS,
            args = { player = player }
        }

    }

    if LSA.canLogistics(player) then
        LSA.appendTo(LSA.logisticsMenuEntries(player), playerMenu)
    end

    if CSAR.canCSAR(player) then
        table.insert(playerMenu, {
            path = "Combat Search and Rescue.Status",
            handler = CSAR.onStatusMenu,
            args = { player = player }
        })
        table.insert(playerMenu, {
            path = "Combat Search and Rescue.Rescue",
            handler = CSAR.onRescueMenu,
            args = { player = player }
        })
        table.insert(playerMenu, {
            path = "Combat Search and Rescue.Return",
            handler = CSAR.onReturnMenu,
            args = { player = player }
        })
    end

    table.insert(playerMenu, {
        path = "Forward Air Controller.Overview",
        handler = LSA.onFacOverview,
        args = { player = player }
    })

    LSA.addMenuTree(playerMenu, nil, "group", player.groupId)
end

function LSA.onATIS(args)
    local player = args.player

    local unit = LSA.getUnit(player.unitName)
    if unit ~= nil then
        local unitPoint = unit:getPoint()
        local groundLevel = land.getHeight(ToVec2(unitPoint))
        unitPoint.y = groundLevel + 10
        local wind = atmosphere.getWind(unitPoint)
        local temperatureK, pressureP = atmosphere.getTemperatureAndPressure(unitPoint)
        local windSpeed = Round(math.sqrt(wind.x ^ 2 + wind.y ^ 2 + wind.z ^ 2))
        local windDir = Round(math.deg(math.atan2(wind.z, wind.x)))
        local temperatureC = Round(temperatureK / 274.15)
        local pressureHp = Round(pressureP * 0.01)

        if windDir < 0 then
            windDir = 360 + windDir
        end

        local message = string.format(
            "Weather information Zulu, winds %s degrees at %s meters per second, few clouds at 4000 meters, temperature %s degrees Celsius, Q N H %s Hectopascal, all aircraft announce intention on common frequency.",
            windDir, windSpeed, temperatureC, pressureHp
        )
        STTS.TextToSpeech(
            message,
            "251", "AM", "1.0", "ATIS", player.side)
        Log.debug(message)
    end
end

function LSA.onFacOverview(args)

end

function LSA.onRecoverCargoMenu(args)
    local player = args.player
    Supplies.recover(player)
end

---Returns the nearest friendly DCS unit.
---@param player table
---@return unknown|nil
function LSA.findNearestUnit(player)
    local playerPosition = Player.position(player)
    local unitObjects = LSA.findUnits(playerPosition, LSA.settings.maxSearchRadiusMeters)

    local units = {}
    for _, unitObject in ipairs(unitObjects) do
        if unitObject:getName() ~= player.unitName and unitObject:getCoalition() == player.side then
            local distance = Distance(playerPosition, ToVec2(unitObject:getPoint()))
            table.insert(units, { unit = unitObject, distance = distance })
        end
    end

    table.sort(units, function(a, b)
        return a.distance < b.distance
    end)

    if #units == 0 then return nil end
    return units[1].unit
end

function LSA.logisticsMenuEntries(player)
    local menus = {
        {
            path = "Logistics.Current Payload Weight",
            handler = LSA.onPayloadWeightMenu,
            args = { player = player }
        },
        {
            path = "Logistics.Cargo.Supplies",
            handler = LSA.onSuppliesMenu,
            args = { player = player }
        },
        {
            path = "Logistics.Cargo.Repairs",
            handler = LSA.onRepairsMenu,
            args = { player = player }
        },
        {
            path = "Logistics.Cargo.Unpack",
            handler = LSA.onUnpackCargoMenu,
            args = { player = player }
        },
        {
            path = "Logistics.Cargo.Load",
            handler = LSA.onLoadCargoMenu,
            args = { player = player }
        },
        {
            path = "Logistics.Cargo.Unload",
            handler = LSA.onUnloadCargoMenu,
            args = { player = player }
        },
        {
            path = "Logistics.Cargo.Return",
            handler = LSA.onReturnCargoMenu,
            args = { player = player }
        },
        {
            path = "Logistics.Cargo.Recover",
            handler = LSA.onRecoverCargoMenu,
            args = { player = player }
        },
    }

    local personnels = LSA.byCoalition(player.side, LSA.logistics.personnel.red, LSA.logistics.personnel.blue)
    for _, personnel in ipairs(personnels) do
        local menuEntry = {
            path = "Logistics.Personnel." .. personnel.name,
            handler = LSA.onPersonnelMenu,
            args = {
                player = player,
                personnel = personnel
            }
        }

        table.insert(menus, menuEntry)
    end

    table.insert(menus,
        {
            path = "Logistics.Personnel.Load",
            handler = LSA.onLoadPersonnelMenu,
            args = { player = player }
        })
    table.insert(menus,
        {
            path = "Logistics.Personnel.Unload",
            handler = LSA.onUnloadPersonnelMenu,
            args = { player = player }
        })
    table.insert(menus,
        {
            path = "Logistics.Personnel.Disband",
            handler = LSA.onDisbandPersonnelMenu,
            args = { player = player }
        })

    local assets = LSA.byCoalition(player.side, DeployableTemplates.red, DeployableTemplates.blue)
    for _, deployable in ipairs(assets) do
        local category = deployable.category
        for _, item in ipairs(deployable.items) do
            local menuEntry = {
                path = "Logistics.Deploy." .. category .. "." .. item.name,
                handler = LSA.onAssetsMenu,
                args = {
                    player = player,
                    deployable = item,
                    category = category
                }
            }

            table.insert(menus, menuEntry)
        end
    end

    return menus
end

function LSA.onAssetsMenu(args)
    local deployable = args.deployable
    local player = args.player
    local category = args.category
    Asset.deploy(player, deployable, category)
end

function LSA.onLostStatic(event)
    local static = event.initiator
    local staticName = static:getName()
    Log.trace("Building %s is dead", staticName)

    Bomber.onLostStatic(event)
    Tanker.onLostStatic(event)
    Awacs.onLostStatic(event)
    StaticWrp.onLostStatic(event)
    Base.onLostStatic(event)
end

function LSA.onLostUnit(event)
    local unit = event.initiator
    local unitName = unit:getName()
    Log.trace("Unit %s is dead", unitName)

    Player.onLostUnit(event)
    FAC.onLostUnit(event)
    Bomber.onLostUnit(event)
    Tanker.onLostUnit(event)
    Awacs.onLostUnit(event)
    UnitWrp.onUnitLost(event)
    Base.onLostUnit(event)
    Vessel.onLostUnit(event)
end

---Returns mission today.
---@return integer
function LSA.getToday()
    local year = env.mission.date.Year
    local month = env.mission.date.Month
    local day = env.mission.date.Day
    return os.time { year = year, month = month, day = day }
end

---Returns mission now.
---@return integer
function LSA.getNow()
    local year = env.mission.date.Year
    local month = env.mission.date.Month
    local day = env.mission.date.Day
    local missionTime = math.ceil(timer.getAbsTime())
    local missionDate = os.time { year = year, month = month, day = day, hour = 0, min = 0, sec = 0 }

    local missionNow = missionDate + missionTime
    return missionNow
end

function LSA.onTakeoffEvent(event)
    if LSA.isPlayerEvent(event) then
        Player.onTakeoffEvent(event)
    end
end

function LSA.isPlayerEvent(event)
    local unit = event.initiator
    if unit.getPlayerName ~= nil and unit:getPlayerName() ~= nil then
        return true
    end
    return false
end

function LSA.onLandEvent(event)
    if LSA.isPlayerEvent(event) then
        -- player landed
        Player.onLandEvent(event)
    else
        -- ai landed
        local unit = event.initiator
        local unitName = unit:getName()
        Log.debug("Unit %s just landed", unitName)
        Bomber.onLandEvent(unitName)
        Tanker.onLandEvent(unitName)
    end
end

function LSA.devTools()
    local menus = {
        { path = "Tools.Save Mission State",             handler = LSA.saveState,                        args = {} },
        { path = "Tools.Scheduled Tasks",                handler = LSA.onScheduledTasksMenu,             args = {} },
        { path = "Tools.Indexed Objects",                handler = LSA.onIndexedObjectsMenu,             args = {} },
        { path = "Tools.Export.Pattern",                 handler = LSA.onExportPatternMenu,              args = {} },
        { path = "Tools.Export.Mission Spawns",          handler = LSA.onExportMissionSpawnsMenu,        args = {} },
        { path = "Tools.Export.Aircraft Blueprints",     handler = LSA.onExportAircraftBlueprintsMenu,   args = {} },
        { path = "Tools.Export.Player Spawns Templates", handler = LSA.onExportPlayerSpawnTemplatesMenu, args = {} },
        { path = "Tools.Export.FC3 Bulls",               handler = LSA.onExportBullsMenu,                args = {} },
        { path = "Tools.Export.Map Center",              handler = LSA.onExportMapCenterMenu,            args = {} },
        { path = "Tools.Export.Brief",                   handler = LSA.onExportBriefMenu,                args = {} },
        { path = "Tools.Export.Zones",                   handler = LSA.onExportZonesMenu,                args = {} },
        { path = "Tools.Compile Mission",                handler = LSA.onCompileMissionMenu,             args = {} },
        { path = "Tools.Remove Trigger Zones",           handler = LSA.onRemoveTriggerZonesMenu,         args = {} },
    }

    LSA.addMenuTree(menus)
end

function LSA.onRemoveTriggerZonesMenu()
    TriggerZoneExporter.removeTriggerZonesFromMission()
end

function LSA.onExportZonesMenu()
    local exportedZones = TriggerZoneExporter.export()
    TriggerZoneExporter.addHeadingProperty(exportedZones)
    TriggerZoneExporter.removeHeadingZones(exportedZones)
    TriggerZoneExporter.exportToFile(exportedZones)
end

function LSA.onCompileMissionMenu()
    BullsGenerator.generate()
    BullsGenerator.centerMapNeutralBulls()
end

function LSA.onExportBriefMenu()
    BriefGenerator.generate()
end

function LSA.onExportMapCenterMenu()
    BullsGenerator.centerMapNeutralBulls()
end

function LSA.onExportBullsMenu()
    BullsGenerator.generate()
end

function LSA.onExportPlayerSpawnTemplatesMenu()
    PlayerSpawnsGenerator.generate()
end

function LSA.onExportAircraftBlueprintsMenu()
    AircraftBluePrintGenerator.generate()
end

function LSA.onExportMissionSpawnsMenu()
    SlotGenerator.generate()
end

function LSA.onExportPatternMenu()
    PatternExporter.export()
end

function LSA.onIndexedObjectsMenu()
    local message = string.format("There are %s units and %s statics currently indexed", RefUnits.count(),
        RefStatics.count())
    trigger.action.outText(message, 10, true)
end

function LSA.onScheduledTasksMenu()
    TS.show()
end

function LSA.initializeTasks()
    TS.task("players", LSA.players, {})
    TS.task("garrison", LSA.garrison, {})
    TS.task("supplies", LSA.supplies, {})
    TS.task("siege check", LSA.baseSiege, {})
    TS.task("repair check", LSA.baseRepair, {})
    TS.task("patrol", LSA.patrol, {})
    TS.task("carriers", LSA.carriers, {})
    TS.task("bombers", LSA.bombers, {})
    TS.task("tankers", LSA.tankers, {})
    TS.task("remove debris", LSA.removeDebris, {}, (60 * 60)) -- [TODO] move to settings
    TS.task("save mission", LSA.saveMissionTask, {}, LSA.settings.saveMissionInterval)
    TS.task("next session", LSA.nextMission, {}, LSA.settings.sessionLengthSeconds)
end

function LSA.carriers(_, time)
    for _, carrierGroup in pairs(LSA.state.carriers) do
        -- a carrier group is eligible to "repair" if it is dead
        -- but there is a new carrier available
        if CarrierGroup.isDead(carrierGroup) and CarrierGroup.isAvailable(carrierGroup) then
            CarrierGroup.repair(carrierGroup)
        end
    end
    return time + (60 * 60) -- [TODO] move to settings
end

function LSA.bombers(_, time)
    for _, base in pairs(LSA.state.bases) do
        for _, bomber in ipairs(base.bombers) do
            if Bomber.isDead(bomber) and Bomber.isAvailable(bomber) then
                Bomber.repair(bomber)
            end
        end
    end
    return time + (60 * 60) -- [TODO] move to settings
end

function LSA.tankers(_, time)
    for _, base in pairs(LSA.state.bases) do
        for _, tanker in ipairs(base.tankers) do
            if Tanker.isDead(tanker) and Tanker.isAvailable(tanker) then
                Tanker.repair(tanker)
            end
        end
    end
    return time + (60 * 60) -- [TODO] move to settings
end

function LSA.saveMissionTask(_, time)
    LSA.saveState()
    return time + LSA.settings.saveMissionInterval
end

function LSA.garrison(_, time)
    for _, base in pairs(LSA.state.bases) do
        for _, groups in ipairs(base.groups) do
            for _, unit in ipairs(groups.units) do
                LSA.monitorUnit(base, unit)
            end
        end
    end

    return time + 10
end

function LSA.patrol(_, time)
    local function __patrol(base)
        local route = {}
        local n = 1

        while true do
            local zone = LSA.getZone(Dashed(base.patrol.name, n))
            if zone == nil then break end

            table.insert(route, zone.location)
            n = n + 1
        end

        if #route == 0 then return end

        local sentries = 5 -- [TODO] move to settings (this is the max number of units that go on patrol)
        for i = 1, sentries do
            if base.groups[i] == nil then break end
            local groupName = base.groups[i].name
            local unit = LSA.getFirstUnit(groupName)

            if unit ~= nil then
                local origin = ToVec2(unit:getPoint())

                local closest = LSA.getClosestPointIndex(origin, route)
                local path = LSA.rotateTable(route, #route - (closest - 1))

                table.insert(path, path[1]) -- to make a full "circle" the last route point is also the first

                if i % 2 == 0 then
                    -- for diversity make even units take the reverse path
                    path = LSA.reverseTable(path)
                end

                table.insert(path, origin) -- return the unit to its original location

                Log.trace("Sending %s on patrol, %s points", groupName, #path)
                LSA.moveArmorRoute(groupName, path, 8)
            end
        end
    end

    for _, base in pairs(LSA.state.bases) do
        __patrol(base)
    end

    return time + (60 * 60) -- [TODO] move to settings
end

function LSA.getFirstUnit(groupName)
    local group = LSA.getGroup(groupName)
    if group == nil then return nil end

    local unit = group:getUnit(1)
    if unit == nil then return nil end

    return unit
end

function LSA.reverseTable(t)
    local reverse = {}
    for i = #t, 1, -1 do
        table.insert(reverse, t[i])
    end
    return reverse
end

function LSA.getClosestPointIndex(p, points)
    local closest = math.abs(Distance(p, points[1]))
    local n = 1

    for i = 2, #points do
        local distance = Distance(p, points[i])
        if distance < closest then
            closest = distance
            n = i
        end
    end

    return n
end

---Rotates the value in the table.
---Source: https://stackoverflow.com/questions/72102367/shift-the-array-as-loop
---@param t table The table to rotate.
---@param shift number The number of position to rotate.
---@return table The rotated table.
function LSA.rotateTable(t, shift)
    local len = #t
    local shifted = {}
    for i = 1, len do
        shifted[i] = t[(i - 1 - shift) % len + 1] -- mod to make it wrap
    end
    return shifted
end

function LSA.supplies(_, time)
    local max = LSA.settings.maxSupplies

    local current = LSA.state.faction.supplies.red
    local deployed = 0

    for _, group in pairs(LSA.state.faction.groups.red) do
        deployed = deployed + group._template.cost
    end

    local remaining = max - deployed
    if current < remaining then
        LSA.state.faction.supplies.red = LSA.state.faction.supplies.red + LSA.settings.regeneratedSupplyQuantity
    end

    return time + LSA.settings.timeToSupplyRegeneration
end

function LSA.players(_, time)
    local playerIds = net.get_player_list()

    for _, playerId in ipairs(playerIds) do
        local ucid = net.get_player_info(playerId, 'ucid')

        -- check if can regenerate a life
        if Player.canWinLife(ucid) then
            Player.winLife(ucid)
        end

        -- work with the SSB to block player if lives are out
        local state = Player.state(ucid)
        LSA.setUserFlag(ucid, "lsa-lives", state.lives)

        -- work with the SSB to block players to the chosen side
        if state.side ~= LSA.PlayerSides.Neutral then
            LSA.setUserFlag(ucid, "lsa-side", state.side)
        else
            local side = LSA.getUserFlag(ucid, "lsa-side")
            if side ~= nil then
                state.side = tonumber(side)
                LSA.setUserFlag(ucid, "lsa-side", state.side)
            end
        end
    end

    return time + 3
end

function LSA.setFlag(key, value)
    trigger.action.setUserFlag(key, value)
end

function LSA.setUserFlag(ucid, key, value)
    local name = string.format("%s-%s", key, ucid)
    trigger.action.setUserFlag(name, value)
end

function LSA.getUserFlag(ucid, key)
    local name = string.format("%s-%s", key, ucid)
    return trigger.misc.getUserFlag(name)
end

function LSA.getDateUTC()
    ---@diagnostic disable-next-line: param-type-mismatch
    return os.time(os.date("!*t"))
end

function LSA.nextMission()
    NextMissionGenerator.generate()
end

function LSA.removeDebris(_, time)
    for _, base in pairs(LSA.state.bases) do
        Log.trace("Removing debris at " .. base.name)
        local perimeter = LSA.getZone(base.perimeter.name)
        if perimeter ~= nil then
            local location = perimeter.location
            LSA.removeJunkAt(location.x, location.y, perimeter.radius)
        end
    end

    return time + (60 * 60)
end

function LSA.baseRepair(_, time)
    for _, base in pairs(LSA.state.bases) do
        LSA.initRepairBase(base)
    end

    return time + 1
end

function LSA.baseSiege(_, time)
    for _, base in pairs(LSA.state.bases) do
        LSA.captureZoneBaseStatus(base)
    end

    return time + 10
end

LSA.BaseRepairsFunctionIds = {}
function LSA.initRepairBase(base)
    Log.trace("Checking if base %s can be repaired", base.name)

    local canRepair = Base.canRepair(base)
    if canRepair and LSA.BaseRepairsFunctionIds[base.name] == nil then
        Log.debug("%s can now initiate repairs", base.name)
        Base.repair(base)
    end


    if not canRepair and LSA.BaseRepairsFunctionIds[base.name] ~= nil then
        TS.stop(LSA.BaseRepairsFunctionIds[base.name])
        LSA.BaseRepairsFunctionIds[base.name] = nil
    end
end

---Plays the given sound file for the given coalition.
---@param side number
---@param fileName string
function LSA.outSoundForCoalition(side, fileName)
    local filePath = fileName
    if not LSA.dev then
        filePath = string.format("%s\\%s", LSA.settings.soundFilesPath, fileName)
    end
    Log.trace("Playing sound file %s", filePath)
    trigger.action.outSoundForCoalition(side, filePath)
end

---Plays the given sound file for the given unit.
---@param unitId any
---@param fileName any
function LSA.outSoundForUnit(unitId, fileName)
    local filePath = fileName
    if not LSA.dev then
        filePath = string.format("%s\\%s", LSA.settings.soundFilesPath, fileName)
    end
    Log.trace("Playing sound file %s", filePath)
    trigger.action.outSoundForUnit(unitId, filePath)
end

LSA.BaseCaptureFunctionIds = {}
function LSA.captureZoneBaseStatus(base)
    Log.trace("Checking if capture zone is under attack")
    -- check if inside zone there is an enemy special forces group
    local capturable = Base.isCapturable(base)
    if capturable and LSA.BaseCaptureFunctionIds[base.name] == nil then
        -- schedule the capture of the base in the configured time
        local delay = LSA.settings.baseCaptureTimeDelay
        local args = { base = base }
        local id = TS.task("capture base", LSA.scheduleBaseCapture, args, delay)
        LSA.BaseCaptureFunctionIds[base.name] = id

        local defender = base.side
        local defenderMessage = string.format(Text.BASE_CAPTURE_IMMINENT, base.name, delay)
        trigger.action.outTextForCoalition(defender, defenderMessage, 10, true)
        LSA.outSoundForCoalition(defender, "beep.ogg")

        local attacker = LSA.theOtherSide(base.side)
        local attackerMessage = string.format(Text.BASE_CAPTURE_IN_PROGRESS, base.name, delay)
        trigger.action.outTextForCoalition(attacker, attackerMessage, 10, true)
        LSA.outSoundForCoalition(attacker, "beep.ogg")
    end

    -- should the enemy group die and the capture is scheduled
    if not capturable and LSA.BaseCaptureFunctionIds[base.name] ~= nil then
        -- cancel the capture of the base
        TS.stop(LSA.BaseCaptureFunctionIds[base.name])
        LSA.BaseCaptureFunctionIds[base.name] = nil

        local message = string.format(Text.BASE_SAFE, base.name)
        trigger.action.outTextForCoalition(base.side, message, 10, true)
        LSA.outSoundForCoalition(base.side, "beep.ogg")
    end
end

---Returns the opposite side of the given side.
---@param side number
---@return number
function LSA.theOtherSide(side)
    if side == coalition.side.RED then
        return coalition.side.BLUE
    end

    return coalition.side.RED
end

function LSA.scheduleBaseCapture(args, _)
    local base = args.base

    local newOwner, previousOwner = Base.capture(base)

    -- inform previous owner that they lost the base
    local lostBaseMessage = string.format(Text.BASE_LOST, base.name)
    trigger.action.outTextForCoalition(previousOwner, lostBaseMessage, 10, true)

    -- inform new owner that they captured the base
    local capturedBaseMessage = string.format(Text.BASE_CAPTURED, base.name)
    trigger.action.outTextForCoalition(newOwner, capturedBaseMessage, 10, true)

    return nil
end

function LSA.appendTo(from, to)
    for _, v in ipairs(from) do
        table.insert(to, v)
    end
end

LSA.UnitDetonation = {}
function LSA.monitorUnit(base, unitWrp)
    local unit = LSA.getUnit(unitWrp.name)
    if unit == nil then return end
    if not unit:isExist() then return end
    if unit:getLife() == 0 then return end
    if unit:getPlayerName() == nil then return end

    local outside = not LSA.isUnitInsideZone(unit, base.perimeter.name)
    local unitName = unitWrp.name
    local unitId = unit:getID()
    local unitDetonation = LSA.UnitDetonation[unitName]

    -- if a unit is outside the perimeter of the base
    -- and has not been scheduled for destruction yet
    -- schedule it for destruction
    if outside and unitDetonation == nil then
        local destroyArgs = { base = base, unit = unitWrp }
        local delay = LSA.settings.outsidePerimeterDelay
        local id = TS.task("destroy traitor", LSA.destroyTraitorUnit, destroyArgs, delay)
        LSA.UnitDetonation[unitName] = id

        local message = string.format(Text.GARRISON_LEAVING_PERIMETER, LSA.settings.outsidePerimeterDelay)
        trigger.action.outTextForUnit(unitId, message, 10, true)
        LSA.outSoundForUnit(unitId, "beep.ogg")
    end

    -- if a unit is no longer outside the base perimeter (returned)
    -- and there is a scheduled destruction of it
    -- abort the destruction of the unit
    if not outside and unitDetonation ~= nil then
        TS.stop(unitDetonation)
        LSA.UnitDetonation[unitName] = nil

        local message = Text.GARRISON_RETURNING_PERIMETER
        trigger.action.outTextForUnit(unitId, message, 10, true)
        LSA.outSoundForUnit(unitId, "beep.ogg")
    end
end

function LSA.messagePlayer(player, message, delay, clearView)
    if delay == nil then delay = 10 end
    if clearView == nil then clearView = true end

    local settings = Player.settings(player.ucid)
    if settings.text then
        trigger.action.outTextForUnit(player.unitId, message, delay, clearView)
    end
end

function LSA.messageAll(message, delay, clearView)
    if delay == nil then delay = 10 end
    if clearView == nil then clearView = true end

    trigger.action.outText(message, delay, clearView)
end

function LSA.loadState()
    local theatre = env.mission.theatre
    local path = string.format("%s\\%s", LSA.settings.path, theatre .. ".state.json")
    -- check if there is a state to load or defaults
    if FileExists(path) then
        Log.debug("State file exists")
        -- load the existing state into the scenario
        LSA.loadSavedState()
    else
        Log.debug("State file does not exist")
        -- load the default state into the scenario
        LSA.loadDefaultState()
    end

    LSA.populateMissionFromState()
end

function LSA.loadSavedState()
    local theatre = env.mission.theatre
    local path = string.format("%s\\%s", LSA.settings.path, theatre .. ".state.json")
    local content = ReadFile(path)
    local state = net.json2lua(content)

    if LSA.version ~= state.version then
        Log.debug("Save file version is %s and mission version is %s, loading default state instead.", state.version,
            LSA.version)
        LSA.loadDefaultState()
        return
    end

    if theatre ~= state.theatre then
        Log.debug("Save file theatre is %s and mission theatre is %s, loading default state instead.", state.version,
            LSA.version)
        LSA.loadDefaultState()
        return
    end

    LSA.state = state
end

function LSA.getRadioModulation(modulation)
    return radio.modulation[modulation]
end

function LSA.carrierCommands()
    return {
        RADIO = function(unitName, radio)
            local unit = Unit.getByName(unitName)
            if unit == nil then return end
            local group = unit:getGroup()
            if group == nil then return end
            local ctrl = group:getController()
            Log.debug("Setting carrier %s RADIO to %s%s", unitName, radio.frequency, radio.modulation)

            local cmd = {
                id = 'SetFrequency',
                params = {
                    frequency = radio.frequency,
                    modulation = LSA.getRadioModulation(radio.modulation)
                }
            }
            ctrl:setCommand(cmd)
        end,
        TACAN = function(unitName, tacan)
            local unit = Unit.getByName(unitName)
            if unit == nil then return end
            local group = unit:getGroup()
            if group == nil then return end
            local ctrl = group:getController()
            Log.debug("Setting carrier %s TACAN to %s%s", unitName, tacan.channel, tacan.modeChannel)
            ctrl:setCommand({
                id = 'ActivateBeacon',
                params = {
                    type = LSA.misc.BeaconTypes.BEACON_TYPE_TACAN,
                    system = LSA.misc.SystemNames.TACAN,
                    AA = false,
                    bearing = true,
                    channel = tacan.channel,
                    modeChannel = tacan.modeChannel,
                    frequency = tacan.frequency,
                    callsign = tacan.callsign,
                    unitId = unit:getID()
                }
            })
        end
    }
end

function LSA.populateLandBases()
    for _, base in pairs(LSA.state.bases) do
        Log.trace("Populating base " .. base.name .. " from state")
        Base.spawn(base)

        LSA.paintBaseCaptureZone(base)
        LSA.paintBaseApron(base)
    end
end

function LSA.getYearLengthInSeconds(year)
    local startYear = os.time { year = year, month = 1, day = 1 }
    local endYear = os.time { year = year, month = 12, day = 31 }

    return endYear - startYear
end

function LSA.populateShips()
    for _, carrier in pairs(LSA.state.carriers) do
        CarrierGroup.spawn(carrier)
    end
end

function LSA.populateAssets()
    for _, asset in pairs(LSA.state.assets) do
        Asset.spawn(asset)
    end

    for _, fac in pairs(LSA.state.facs) do
        FAC.spawn(fac)
    end

    for _, personnel in pairs(LSA.state.personnel) do
        Personnel.spawn(personnel, personnel.units[1].location, personnel.units[1].heading)
    end
end

function LSA.populateMissionFromState()
    -- populate land bases
    LSA.populateLandBases()

    -- populate ships
    LSA.populateShips()

    -- populate ground units (non-base)
    LSA.populateAssets()
end

function LSA.setBaseCoalition(base)
    Airbase.getByName(base.name):setCoalition(base.side)
end

function LSA.paintBaseZones(base)
    Log.trace("Setting base perimeter for " .. base.name)

    LSA.paintBasePerimeter(base)
end

function LSA.paintBaseApron(base)
    local apronIndex = 0
    repeat
        apronIndex = apronIndex + 1

        local zone = LSA.getQuad(Dashed(base.apron.name, apronIndex))
        if zone ~= nil then
            local color = LSA.markups.colors.opaque.Black
            local fill = LSA.markups.colors.faint.Black

            LSA.paintQuad(zone, color, fill)
        end
    until zone == nil
end

function LSA.paintBasePerimeter(base)
    local zone = LSA.getZone(base.perimeter.name)
    if zone == nil then
        Log.error("Perimeter Zone " .. base.perimeter.name .. " is not defined")
        return
    end

    local color = LSA.markups.colors.opaque.Red
    local fill = LSA.markups.colors.faint.Red
    if base.side == coalition.side.BLUE then
        color = LSA.markups.colors.opaque.Blue
        fill = LSA.markups.colors.faint.Blue
    end

    -- remove previous paint
    if base.perimeter.markupId ~= nil then
        trigger.action.removeMark(base.perimeter.markupId)
    end

    base.perimeter.markupId = LSA.paintCircle(zone, color, fill)
end

function LSA.paintBaseCaptureZone(base)
    local zone = LSA.getZone(base.capture.name)
    if zone == nil then
        Log.error("Capture Zone " .. base.capture.name .. " is not defined")
        return
    end
    local color = LSA.markups.colors.opaque.Gray
    local fill = LSA.markups.colors.faint.Gray

    LSA.paintCircle(zone, color, fill)
end

function LSA.findBase(name)
    local base = LSA.state.bases[name]
    if base == nil then
        Log.debug("No base found by the name " .. name)
    end

    return base
end

function LSA.loadDefaultState()
    LSA.mapTemplateTriggerZones()

    for _, airbase in pairs(world.getAirbases()) do
        if airbase:getCoalition() ~= coalition.side.NEUTRAL then
            LSA.loadDefaultBaseState(airbase)
        end
    end

    LSA.state.faction.supplies.red = LSA.settings.maxSupplies
    LSA.state.faction.supplies.blue = LSA.settings.maxSupplies
end

function LSA.getLongestRunway(airbase)
    local byLength = function(a, b)
        return a.length > b.length
    end

    local runways = airbase:getRunways()
    table.sort(runways, byLength)

    local longest = runways[1]
    return longest
end

function LSA.getAirbaseOrientation(airbase, airbaseType)
    if airbaseType == Airbase.Category.AIRDROME then
        -- for airfields we use the course of the longest runway
        local longest = LSA.getLongestRunway(airbase)
        local course = math.floor(math.deg(longest.course * -1))

        if course < 0 then
            course = 360 + course
        end
        return course
    end

    if airbaseType == Airbase.Category.HELIPAD then
        -- use the FARP heading
        local position = airbase:getPosition()
        local heading = math.floor(math.deg(math.atan2(position.x.z, position.x.x)))
        if heading < 0 then
            heading = 360 + heading
        end
        return heading
    end

    return 0
end

function LSA.loadDefaultBaseState(airbase)
    local airbaseName = airbase:getName()
    local airbaseDesc = airbase:getDesc()
    local airbaseType = airbaseDesc.category

    if airbaseType == Airbase.Category.SHIP then
        CarrierGroup.generate(airbaseName)
        return
    end

    local base = Base.new(airbase)

    base.groups = GroupGenerator.generate(base)
    base.statics, base.repairs, base.logistics = StaticsGenerator.generate(base)

    base.bombers = BomberGenerator.generate(base)
    base.tankers = TankerGenerator.generate(base)
    base.awacs = AwacsGenerator.generate(base)

    -- store the new base in the state
    LSA.state.bases[base.name] = base
end

function LSA.getApronPolygons(airbaseName)
    -- collect all apron polygons at the base
    local apronIndex = 0
    local apronPolygons = {}
    repeat
        apronIndex = apronIndex + 1

        local zone = LSA.getQuad(Dashed(airbaseName, "Apron", apronIndex))
        if zone ~= nil then
            local apronPolygon = {}
            for _, vertex in ipairs(zone.vertices) do
                table.insert(apronPolygon, vertex.x)
                table.insert(apronPolygon, vertex.y)
            end
            table.insert(apronPolygons, apronPolygon)
        end
    until zone == nil

    return apronPolygons
end

LSA.airbaseTemplateTypes = {}
function LSA.mapTemplateTriggerZones()
    for _, triggerZone in ipairs(env.mission.triggers.zones) do
        local startIndex, endIndex = string.find(triggerZone.name, "%-Template%-")
        if startIndex ~= nil then
            local baseName = string.sub(triggerZone.name, 1, startIndex - 1)
            local templateType = string.sub(triggerZone.name, endIndex + 1)
            Log.debug("Airbase %s uses template %s", baseName, templateType)
            LSA.airbaseTemplateTypes[baseName] = templateType
        end
    end
end

function LSA.countNamedSpawnZones(name)
    local count = 0
    local index = 1
    while LSA.getZone(name .. "-" .. index) ~= nil do
        count = count + 1
        index = index + 1
    end

    if LSA.getZone(name) ~= nil then
        count = count + 1
    end

    return count
end

--- Determine a position that is offset from the given center.
--- @param center2d table
--- @param offset table
--- @param rotation number|nil
--- @return table
function LSA.newPos(center2d, offset, rotation)
    rotation = rotation or 360

    local x = center2d.x + (offset.distance * math.cos(math.rad(offset.angle - (360 - rotation))))
    local y = center2d.y + (offset.distance * math.sin(math.rad(offset.angle - (360 - rotation))))

    return { x = x, y = y }
end

function LSA.groupScheme(name)
    LSA.notNilOrEmpty(name)

    return {
        ["visible"] = false,
        ["hidden"] = true,
        ["hiddenOnMFD"] = true,
        ["tasks"] = {},
        ["units"] = {},
        ["uncontrollable"] = true,
        ["task"] = "Ground Nothing",
        ["name"] = name,
        ["start_time"] = 0 -- spawn immediately
    }
end

function LSA.unitScheme(name, location, type, heading)
    LSA.notNilOrEmpty(name)
    LSA.notNilOrEmpty(type)
    LSA.notNil(location)

    return {
        ["skill"] = LSA.settings.defaultUnitSkillLevel,
        ["coldAtStart"] = false,
        ["type"] = type,
        ["y"] = location.y,
        ["x"] = location.x,
        ["name"] = name,
        ["heading"] = math.rad(heading),
        ["playerCanDrive"] = true
    }
end

---Generates a static scheme.
---@param name string
---@param type string
---@param location table
---@param heading number
---@return table
function LSA.schemeStatic2(name, type, location, heading)
    LSA.notNilOrEmpty(name)
    LSA.notNilOrEmpty(type)
    LSA.notNil(location)

    local static = {
        ["type"] = type,
        ["y"] = location.y,
        ["x"] = location.x,
        ["name"] = name,
        ["heading"] = math.rad(heading)
    }

    -- DCS won't recognize these types without the additional information
    if type == ".Ammunition depot" then
        static.shape_name = "SkladC"
        static.category = "Warehouses"
    end

    if type == ".Command Center" then
        static.shape_name = "ComCenter"
        static.category = "Fortifications"
    end

    if type == "Tower Crane" then
        static.shape_name = "TowerCrane_01"
        static.category = "Fortifications"
    end

    if type == "345 Excavator" then
        static.category = "Fortifications"
        static.shape_name = "cat_345l"
    end
    -- end
    return static
end

---Generates a static scheme.
---@param name string
---@param type string
---@param location table
---@param heading number
---@return table
function LSA.schemeStatic(name, type, location, heading)
    LSA.notNilOrEmpty(name)
    LSA.notNilOrEmpty(type)
    LSA.notNil(location)

    local hdg = heading or 0

    local static = {
        ["type"] = type,
        ["y"] = location.y,
        ["x"] = location.x,
        ["name"] = Dashed(name, LSA.next()),
        ["heading"] = math.rad(hdg)
    }

    -- DCS won't recognize these types without the additional information
    if type == ".Ammunition depot" then
        static.shape_name = "SkladC"
        static.category = "Warehouses"
    end

    if type == ".Command Center" then
        static.shape_name = "ComCenter"
        static.category = "Fortifications"
    end

    if type == "Tower Crane" then
        static.shape_name = "TowerCrane_01"
        static.category = "Fortifications"
    end

    if type == "345 Excavator" then
        static.category = "Fortifications"
        static.shape_name = "cat_345l"
    end
    -- end
    return static
end

function LSA.pickRandomZones(spawns)
    if spawns.count == 0 then
        Log.debug("There are no spawn zones for " .. spawns.name)
        return {}
    end
    local shuffle = LSA.shuffle(1, spawns.count)

    local randomZones = {}
    for i = 1, spawns.count do
        local zoneNr = shuffle[i]
        local name = Dashed(spawns.name, zoneNr)
        local headingName = Dashed(spawns.name, "Heading", zoneNr)
        local zone = LSA.getZone(name)
        local headingZone = LSA.getZone(headingName)
        if zone == nil then
            Log.debug("Attempted to get zone %s but it does not exist", name)
            return {}
        end
        if headingZone == nil then
            Log.trace("Could not find a heading for zone %s", name)
        end

        local location = zone.location
        local radius = zone.radius
        local heading = 0
        if headingZone ~= nil then
            local headingLocation = headingZone.location
            heading = Angle(location, headingLocation)
        end
        table.insert(randomZones, { name = name, radius = radius, location = location, heading = heading })
    end

    return randomZones
end

function LSA.saveState()
    local snapshot = DeepCopy(LSA.state)

    for _, base in pairs(snapshot.bases) do
        base.capture.scheduled = nil
        base.repairs.scheduled = {}
    end

    -- save FAC
    FAC.updateLocations()
    snapshot.facs = FAC.state()

    Asset.updateLocations()
    snapshot.assets = Asset.state()

    Personnel.updateLocations()
    snapshot.personnel = Personnel.state()

    CarrierGroup.updateLocations()

    snapshot.theatre = env.mission.theatre
    snapshot.createdOn = os.date("!%c")
    snapshot.version = LSA.version

    local contents = net.lua2json(snapshot)

    local path = LSA.settings.path .. "\\" .. snapshot.theatre .. ".state.json"
    WriteFile(path, contents)

    Log.debug("Save file written at %s", snapshot.createdOn)
end

function LSA.destroyTraitorUnit(args)
    local unit = args.unit

    local dcsUnit = LSA.getUnit(unit.name)
    if dcsUnit == nil then return end

    local playerName = dcsUnit:getPlayerName()
    local info = Player.getInfoByName(playerName)
    if info ~= nil then
        Player.loseLife(info.ucid)
    end

    LSA.explodeUnit(unit.name)

    LSA.UnitDetonation[unit.name] = nil
end

function LSA.explodeUnit(unitName)
    local unit = LSA.getUnit(unitName)
    if unit == nil then
        return nil
    end

    if not unit:isExist() or unit:getLife() <= 0 then
        Log.debug("Unit %s has no life left", unitName)
        return nil
    end

    local position = unit:getPoint()
    trigger.action.explosion(position, unit:getLife() + 1)
    Log.trace("Unit destroyed %s", unitName)
    return nil
end

function LSA.explodeStatic(staticName)
    local static = LSA.getStatic(staticName)
    if static == nil then
        return
    end
    if not static:isExist() then
        return
    end

    local desc = static:getDesc()
    local life = desc.life
    local position = static:getPosition()
    local unitName = static:getName()

    if desc.typeName == ".Command Center" or desc.typeName == ".Ammunition depot" then
        life = 4000
        trigger.action.explosion(position.p, life + 1)
    else
        trigger.action.explosion(position.p, life + 1)
    end

    Log.trace("Static destroyed " .. unitName)
end

--- Returns a value depending on the coalition
--- @param side any The coalition
--- @param red any The value to return if the coalition is red
--- @param blue any The value to return if the coalition is blue
function LSA.byCoalition(side, red, blue)
    if side == coalition.side.BLUE then
        return blue
    end
    return red
end

function LSA.isUnitInsideZone(unit, zoneName)
    local zone = LSA.getZone(zoneName)
    if zone == nil then
        return false
    end

    local center = zone.location
    local radius = zone.radius

    local point = ToVec2(unit:getPoint())
    local circle = { x = center.x, y = center.y, radius = radius }

    return IsPointInCircle(point, circle)
end

function LSA.next()
    LSA.state.counter = LSA.state.counter + 1
    return LSA.state.counter
end

LSA.markups = {}
LSA.markups.colors = {}
LSA.markups.colors.opaque = {
    Red = { 1, 0, 0, 1 },
    Green = { 0, 1, 0, 1 },
    Blue = { 0, 0, 1, 1 },
    White = { 1, 1, 1, 1 },
    Black = { 0, 0, 0, 1 },
    Gray = { 0.5, 0.5, 0.5, 1 },
    Orange = { 1, 0.31, 0, 1 }
}
LSA.markups.colors.transparent = {
    Red = { 1, 0, 0, 0.5 },
    Green = { 0, 1, 0, 0.5 },
    Blue = { 0, 0, 1, 0.5 },
    White = { 1, 1, 1, 0.5 },
    Black = { 0, 0, 0, 0.5 },
    Gray = { 0.5, 0.5, 0.5, 0.5 },
    Orange = { 1, 0.31, 0, 0.5 }
}
LSA.markups.colors.faint = {
    Red = { 1, 0, 0, 0.2 },
    Green = { 0, 1, 0, 0.2 },
    Blue = { 0, 0, 1, 0.2 },
    White = { 1, 1, 1, 0.2 },
    Black = { 0, 0, 0, 0.2 },
    Gray = { 0.5, 0.5, 0.5, 0.2 },
    Orange = { 1, 0.31, 0, 0.2 }
}

LSA.markups.coalitions = {
    All = -1,
    Neutral = 0,
    Red = 1,
    Blue = 2
}
LSA.markups.lines = {
    NoLine = 0,
    Solid = 1,
    Dashed = 2,
    Dotted = 3,
    DotDash = 4,
    LongDash = 5,
    TwoDash = 6
}

function LSA.clearAndSpawnGroup(group, side)
    for _, unit in ipairs(group.units) do
        LSA.removeJunkAt(unit.x, unit.y)
        LSA.cleanObstructionsAt(unit.x, unit.y)
    end

    TS.task("spawn group", function()
        LSA.spawnGroup2(group, side)
    end)
end

function LSA.spawnAircraft(scheme, side)
    assert(scheme ~= nil, "group can't be nil")
    assert(side ~= nil, "side can't be nil")
    assert(side ~= coalition.side.NEUTRAL, "side can't be neutral")

    local country = LSA.byCoalition(side, country.id.CJTF_RED, country.id.CJTF_BLUE)
    coalition.addGroup(country, Group.Category.AIRPLANE, scheme)
    local group = LSA.getGroup(scheme.name)

    return group
end

function LSA.spawnGroup2(scheme, side)
    assert(side ~= nil, "side can't be nil")
    assert(side ~= coalition.side.NEUTRAL, "side can't be neutral")

    local country = LSA.byCoalition(side, country.id.CJTF_RED, country.id.CJTF_BLUE)
    coalition.addGroup(country, Group.Category.GROUND, scheme)
    local group = LSA.getGroup(scheme.name)
    assert(group ~= nil)
    return group
end

function LSA.spawnShip2(scheme, side)
    assert(side ~= nil, "side can't be nil")
    assert(side ~= coalition.side.NEUTRAL, "side can't be neutral")

    local country = LSA.byCoalition(side, country.id.CJTF_RED, country.id.CJTF_BLUE)
    coalition.addGroup(country, Group.Category.SHIP, scheme)
    local group = LSA.getGroup(scheme.name)
    assert(group ~= nil)
    return group
end

function LSA.clearAndSpawnStatic(building, side)
    LSA.cleanObstructionsAt(building.x, building.y)
    LSA.removeJunkAt(building.x, building.y)

    -- when spawning right after cleaning there is a chance that the object
    -- will still be in the sim thus creating stacked objects
    -- to avoid this we schedule the spawning to a second later
    TS.task("spawn static", function()
        LSA.spawnStatic2(building, side)
    end)
end

function LSA.spawnStatic2(static, side)
    local country = LSA.byCoalition(side, country.id.CJTF_RED, coalition.side.BLUE)

    coalition.addStaticObject(country, static)

    return LSA.getStatic(static.name)
end

function LSA.getStatic(staticName)
    local static = StaticObject.getByName(staticName)
    if static == nil then
        Log.debug("Could not find a static by the name " .. staticName)
        return nil
    end

    return static
end

---Wraps around the Group.getByName function,
---but logs the group name if the group is not found.
---@param groupName string The name of the group.
---@return any Returns the DCS group by that name or nil.
function LSA.getGroup(groupName)
    local group = Group.getByName(groupName)
    if group == nil then
        Log.debug("Could not find a group by the name " .. groupName)
        return nil
    end

    return group
end

---Returns the DCS group by that name or nil.
---@param unitName string The name of the unit.
---@returns any|nil
function LSA.getUnit(unitName)
    local unit = Unit.getByName(unitName)
    if unit ~= nil then return unit end

    Log.trace("Could not find a unit by the name %s", unitName)
    return nil
end

function LSA.moveShip(shipGroupName, destination, speed)
    speed = speed or LSA.settings.shipSpeedMetersPerSecond

    local group = LSA.getGroup(shipGroupName)
    if group == nil then return end
    local controller = group:getController()
    if controller == nil then
        Log.debug("Could not retrieve the controller for group %s", shipGroupName)
        return
    end

    local origin = ToVec2(group:getUnit(1):getPoint())

    controller:setTask({
        id = 'Mission',
        params = {
            airborne = false,
            route = {
                points = {
                    {
                        type = AI.Task.WaypointType.TURNING_POINT,
                        x = origin.x,
                        y = origin.y,
                        speed = speed, -- mps
                    },
                    {
                        type = AI.Task.WaypointType.TURNING_POINT,
                        x = destination.x,
                        y = destination.y,
                        speed = speed, -- mps
                    },
                }
            }
        }
    })

    Log.trace("Unit " .. shipGroupName .. " ordered to move")
end

function LSA.moveArmor(groupName, destination, speed)
    speed = speed or 8 -- [TODO] move to setting

    local group = LSA.getGroup(groupName)
    if group == nil then return end
    local controller = group:getController()
    if controller == nil then
        Log.debug("Could not retrieve the controller for group " .. groupName)
        return
    end

    local origin = ToVec2(group:getUnit(1):getPoint())

    controller:pushTask({
        id = 'Mission',
        params = {
            airborne = false,
            route = {
                points = {
                    {
                        type = AI.Task.WaypointType.TURNING_POINT,
                        action = AI.Task.VehicleFormation.OFF_ROAD,
                        x = origin.x,
                        y = origin.y,
                        speed = speed, -- mps
                        speed_locked = true
                    },
                    {
                        type = AI.Task.WaypointType.TURNING_POINT,
                        action = AI.Task.VehicleFormation.OFF_ROAD,
                        x = destination.x,
                        y = destination.y,
                        speed = speed, -- mps
                        speed_locked = true
                    },
                }
            }
        }
    })

    Log.trace("Unit " .. groupName .. " ordered to move")
end

---Makes an armored group move along a given route.
---@param groupName string The group name.
---@param route table An array of 2d points representing the route.
---@param speed any The speed in meters per seconds.
function LSA.moveArmorRoute(groupName, route, speed)
    speed = speed or 8 -- [TODO] move to setting

    local group = LSA.getGroup(groupName)
    if group == nil then return end
    local controller = group:getController()
    if controller == nil then
        Log.debug("Could not retrieve the controller for group " .. groupName)
        return
    end

    local newWaypoint = function(point)
        return {
            type = AI.Task.WaypointType.TURNING_POINT,
            action = AI.Task.VehicleFormation.OFF_ROAD,
            x = point.x,
            y = point.y,
            speed = speed, -- mps
            speed_locked = true
        }
    end

    local origin = ToVec2(group:getUnit(1):getPoint())
    local waypoints = {}
    table.insert(waypoints, newWaypoint(origin))

    for _, point in ipairs(route) do
        table.insert(waypoints, newWaypoint(point))
    end

    controller:setTask({
        id = 'Mission',
        params = {
            airborne = false,
            route = {
                points = waypoints
            }
        }
    })

    Log.trace("Unit " .. groupName .. " ordered to move")
end

function LSA.findObjAt(x, y, radius, height)
    local area = LSA.sphereVolume(x, y, radius, height)
    local found = {}
    local collect = function(obj, _)
        table.insert(found, obj)
    end

    local categories = {
        Object.Category.UNIT,
        Object.Category.WEAPON,
        Object.Category.STATIC,
        Object.Category.SCENERY,
        Object.Category.CARGO
    }

    world.searchObjects(categories, area, collect)

    return found
end

function LSA.findBasesAt(x, y, radius, height)
    local area = LSA.sphereVolume(x, y, radius, height)
    local found = {}
    local collect = function(obj, _)
        table.insert(found, Airbase.getByName(obj:getName()))
    end

    local categories = {
        Object.Category.BASE
    }

    world.searchObjects(categories, area, collect)

    return found
end

function LSA.findAirbases(location, radius)
    local area = LSA.sphereVolume(location.x, location.y, radius)
    local found = {}
    local collect = function(obj, _)
        table.insert(found, obj)
    end

    local categories = {
        Object.Category.BASE
    }

    world.searchObjects(categories, area, collect)

    return found
end

function LSA.removeJunkAt(x, y, radius, height)
    local area = LSA.sphereVolume(x, y, radius, height)
    world.removeJunk(area)
end

function LSA.removeJunk(location, radius, height)
    local area = LSA.sphereVolume(location.x, location.y, radius, height)
    world.removeJunk(area)
end

function LSA.removeObj(location, radius, height)
    local obj = LSA.findObjAt(location.x, location.y, radius, height)
    for _, o in ipairs(obj) do
        Log.trace("Clearing debris %s (%s)", o:getTypeName(), o:getName())
        o:destroy()
    end
end

function LSA.cleanObstructionsAt(x, y, radius, height)
    local obstructions = LSA.findObjAt(x, y, radius, height)
    for _, o in pairs(obstructions) do
        if o:getLife() <= 0 then
            Log.debug("Clearing debris %s (%s)", o:getTypeName(), o:getName())
            o:destroy()
        else
            Log.debug("Cannot clear %s (%s), it's still alive", o:getTypeName(), o:getName())
        end
    end
end

-- Finds a unit whose name starts with (but may not be entirely equal to) the given name within the given area
function LSA.searchNamedUnit(unitName, x, y, radius, height)
    local area = LSA.sphereVolume(x, y, radius, height)
    local found = nil

    local collect = function(obj, _)
        local name = obj:getName()
        local unit = LSA.getUnit(name)
        if unit == nil then return end

        local life = unit:getLife() or 0
        if life > 0 and StartsWith(name, unitName) then
            found = unit
        end
    end

    world.searchObjects(Object.Category.UNIT, area, collect)

    return found
end

function LSA.findStatics(location, radius, height)
    local area = LSA.sphereVolume(location.x, location.y, radius, height)
    local found = {}

    local collect = function(obj, _)
        if obj:getLife() > 0 then
            table.insert(found, obj)
        end
    end

    world.searchObjects(Object.Category.STATIC, area, collect)

    return found
end

function LSA.findStaticsAt(x, y, radius, height)
    local area = LSA.sphereVolume(x, y, radius, height)
    local found = {}

    local collect = function(obj, _)
        local name = obj:getName()
        local static = StaticObject.getByName(name)
        local life = static:getLife() or 0

        if life > 0 then
            table.insert(found, static)
        end
    end

    world.searchObjects(Object.Category.STATIC, area, collect)

    return found
end

function LSA.findCargosAt(x, y, radius, height)
    local area = LSA.sphereVolume(x, y, radius, height)
    local found = {}

    local collect = function(obj, _)
        local life = obj:getLife() or 0

        if life > 0 then
            table.insert(found, obj)
        end
    end

    world.searchObjects(Object.Category.CARGO, area, collect)

    return found
end

function LSA.findCargo(location, radius, height)
    local area = LSA.sphereVolume(location.x, location.y, radius, height)
    local found = {}

    local collect = function(obj, _)
        local life = obj:getLife() or 0

        if life > 0 then
            table.insert(found, obj)
        end
    end

    world.searchObjects(Object.Category.CARGO, area, collect)

    return found
end

function LSA.findGroupsAt(x, y, radius, height)
    local area = LSA.sphereVolume(x, y, radius, height)
    local found = {}
    local distinct = {}

    local collect = function(obj, _)
        local unitName = obj:getName()
        local unit = LSA.getUnit(unitName)
        if unit == nil then return end

        local group = unit:getGroup()
        if group == nil then return end

        local groupName = group:getName()
        if distinct[groupName] == nil then
            found[#found + 1] = group
            distinct[groupName] = true
        end
    end

    world.searchObjects(Object.Category.UNIT, area, collect)

    return found
end

function LSA.findUnits(location, radius, height)
    local area = LSA.sphereVolume(location.x, location.y, radius, height)
    local found = {}

    local collect = function(obj, _)
        if obj:isExist() and obj:getLife() > 0 then
            table.insert(found, obj)
        end
    end

    world.searchObjects(Object.Category.UNIT, area, collect)

    return found
end

function LSA.findUnitsAt(x, y, radius, height)
    local area = LSA.sphereVolume(x, y, radius, height)
    local found = {}

    local collect = function(obj, _)
        table.insert(found, obj:getName())
    end

    world.searchObjects(Object.Category.UNIT, area, collect)

    return found
end

---Paints a circle in DCS.
---@param zone table
---@param color table
---@param fill table
---@param scope number|nil
---@return integer
function LSA.paintCircle(zone, color, fill, scope)
    scope = scope or LSA.markups.coalitions.All
    local id = LSA.next()

    local args = {
        scope,                    -- coalition
        id,                       -- id
        ToVec3(zone.location),    -- center
        zone.radius,              -- radius
        color,                    -- color
        fill,                     -- fill
        LSA.markups.lines.Dashed, -- line type
        true                      -- readonly
    }

    trigger.action.circleToAll(unpack(args))
    return id
end

---Paints a quad in DCS.
---@param zone table
---@param color table
---@param fill table
---@param scope number|nil
---@return integer
function LSA.paintQuad(zone, color, fill, scope)
    scope = scope or LSA.markups.coalitions.All
    local id = LSA.next()

    local args = {
        scope, -- coalition
        id,    -- id
        ToVec3(zone.vertices[1]),
        ToVec3(zone.vertices[2]),
        ToVec3(zone.vertices[3]),
        ToVec3(zone.vertices[4]),
        color,                    -- color
        fill,                     -- fill
        LSA.markups.lines.Dashed, -- line type
        true                      -- readonly
    }

    trigger.action.quadToAll(unpack(args))
    return id
end

function LSA.disableBaseAutoCapture()
    local airbases = world.getAirbases()
    for i, airbase in ipairs(airbases) do
        local callsign = airbase:getName()
        Log.trace("Disabling auto-capture for base " .. callsign)
        airbase:autoCapture(false)
        Log.trace("Auto-capture for " .. callsign .. " is now " .. (airbase:autoCaptureIsOn() and "on" or "off"))
    end
end

function LSA.sphereVolume(x, y, radius, height)
    local hgt = height or land.getHeight({ x = x, y = y })
    local rds = radius or 1
    return {
        id = world.VolumeType.SPHERE,
        params = {
            point = { x = x, y = hgt, z = y },
            radius = rds
        }
    }
end

function LSA.notNilOrEmpty(value)
    assert(value ~= nil and #value > 0, "Cannot be nil or empty")
end

function LSA.notNil(value)
    assert(value ~= nil, "Cannot be nil")
end

-- as seen in https://stackoverflow.com/questions/42183222/how-do-i-randomly-select-unique-numbers-from-a-given-range
function LSA.shuffle(from, to)
    local set = {}

    if from == 1 and to == 1 then
        return { 1 }
    end

    for index = from, to do
        local place = math.random(index)

        if place ~= index then
            set[index] = set[place]
        end

        set[place] = index
    end

    return set
end

function LSA.sideToNumber(side)
    if string.lower(side) == "red" then
        return coalition.side.RED
    end
    if string.lower(side) == "blue" then
        return coalition.side.BLUE
    end
    if string.lower(side) == "neutral" then
        return coalition.side.NEUTRAL
    end
end

---Return plain english (lowercase) word for the given side.
---@param side number
---@return string
function LSA.side(side)
    if side == coalition.side.RED then
        return "red"
    end
    if side == coalition.side.BLUE then
        return "blue"
    end

    return "neutral"
end

-- Returns the a table except the values in b also.
-- Source: https://stackoverflow.com/questions/24621346/differences-between-two-tables-in-lua
function LSA.except(a, b)
    local aa = {}
    for k, v in pairs(a) do
        aa[v] = true
    end
    for k, v in pairs(b) do
        aa[v] = nil
    end
    local ret = {}
    local n = 0
    for k, v in pairs(a) do
        if aa[v] then
            n = n + 1
            ret[n] = v
        end
    end
    return ret
end

-- Project a table into another table.
-- @valFn The getter function for the value in the projected table.
-- @valFn The getter function for the key in the projected table.
function LSA.project(t, valFn, keyFn)
    local projection = {}
    for _, value in pairs(t) do
        if keyFn then
            local key = keyFn(value)
            if valFn then
                projection[key] = valFn(value)
            else
                projection[key] = value
            end
        else
            if valFn then
                table.insert(projection, valFn(value))
            else
                table.insert(projection, value)
            end
        end
    end
    return projection
end

function LSA.where(t, predicate)
    local a = {}
    for _, value in ipairs(t) do
        if predicate(value) then
            table.insert(a, value)
        end
    end
    return a
end

---Returns the value that matches the predicate.
---@param t table
---@param predicate function
---@return table|nil
function LSA.single(t, predicate)
    for _, value in ipairs(t) do
        if predicate(value) then
            return value
        end
    end
    return nil
end

---Adds a menu tree to DCS F10 menu, using a dot separated string for path and a handler function.
---@param tree table The menu tree to add; format { { path = "Root.Submenu.Command", handler = _handler } }
---@param parent table|nil The root menu to which the tree will be attached. If nil, the root menu is used.
---@param scope string|nil The scope of the menu ('all', 'coalition', 'group')
---@param groupId string|nil The group id when the scope is group.
function LSA.addMenuTree(tree, parent, scope, groupId)
    scope = scope or "all"
    groupId = groupId or ""

    local menus = LSA.__createExpandedTree(tree)
    return LSA.__menusToDCS(menus, parent, scope, groupId)
end

function LSA.__createExpandedTree(tree)
    local menus = { id = "", menus = {}, handler = nil, args = nil }
    local menuMap = {}

    -- creates a table with the expanded menu entries
    for _, entry in ipairs(tree) do
        local parent = menus
        for token in string.gmatch(entry.path, "[^\\.]+") do
            local id = token
            if (parent.id ~= "") then
                id = string.format("%s.%s", parent.id, token)
            end
            if (menuMap[id] == nil) then
                local submenu = { id = id, caption = token, menus = {} }
                if (entry.path == id and entry.handler) then
                    submenu.handler = entry.handler
                    submenu.args = entry.args
                end
                table.insert(parent.menus, submenu)
                menuMap[id] = submenu
            end

            parent = menuMap[id]
        end
    end

    return menus
end

function LSA.__menusToDCS(entries, parent, scope, groupId)
    local submenus = {}

    for _, value in ipairs(entries.menus) do
        if (#value.menus > 0) then
            local submenu = LSA.__submenu(parent, value, scope, groupId)
            LSA.__menusToDCS(value, submenu, scope, groupId)
            submenus[value.id] = submenu
        else
            LSA.__command(parent, value, scope, groupId)
        end
    end

    return submenus
end

function LSA.__command(parent, value, scope, groupId)
    local commandArgs = { id = value.id }
    if type(value.args) == "table" then
        for key, arg in pairs(value.args) do
            commandArgs[key] = arg
        end
    else
        commandArgs.args = value.args
    end

    if scope == "all" then
        missionCommands.removeItem({ value.caption })
        return missionCommands.addCommand(value.caption, parent, value.handler, commandArgs)
    end
    if scope == "coalition" then
        missionCommands.removeItemForCoalition(groupId, { value.caption })
        return missionCommands.addCommandForCoalition(groupId, value.caption, parent, value.handler, commandArgs)
    end
    if scope == "group" then
        missionCommands.removeItemForGroup(groupId, { value.caption })
        return missionCommands.addCommandForGroup(groupId, value.caption, parent, value.handler, commandArgs)
    end
end

function LSA.__submenu(parent, value, scope, groupId)
    if scope == "all" then
        missionCommands.removeItem({ value.caption })
        return missionCommands.addSubMenu(value.caption, parent)
    end
    if scope == "coalition" then
        missionCommands.removeItemForCoalition(groupId, { value.caption })
        return missionCommands.addSubMenuForCoalition(groupId, value.caption, parent)
    end
    if scope == "group" then
        missionCommands.removeItemForGroup(groupId, { value.caption })
        return missionCommands.addSubMenuForGroup(groupId, value.caption, parent)
    end
end

function LSA.silenceATC()
    local airbases = world.getAirbases()
    for i, airbase in ipairs(airbases) do
        local callsign = airbase:getName()
        Log.trace("Disabling ATC for base " .. callsign)
        airbase:setRadioSilentMode(true)
        Log.trace("ATC for " .. callsign .. " is now " .. (airbase:getRadioSilentMode() and "on" or "off"))
    end
end

-- Converts the table so that the values now point at the keys
function LSA.invertTable(t)
    local s = {}
    for k, v in pairs(t) do
        s[v] = k
    end
    return s
end

Log = {}

Log.prefix = "[ *** MP LSA *** ] "

Log.settings = {}
Log.settings.debug = os.getenv("LSA_DEBUG") == "true"
Log.settings.trace = os.getenv("LSA_TRACE") == "true"

function Log.error(message, ...)
    message = message or "nil"
    local a = {}
    for _, value in ipairs({ ... } or {}) do
        table.insert(a, tostring(value))
    end
    local text = ""
    if #a == 0 then
        text = Log.prefix .. message
        env.error(text, false)
    else
        text = Log.prefix .. string.format(message, unpack(a))
        env.error(text, false)
    end
    if LSA.dev then
        trigger.action.outText(text, 10, true)
    end
end

function Log.debug(message, ...)
    message = message or "nil"
    if not Log.settings.debug then
        return
    end
    local a = {}
    for _, value in ipairs({ ... } or {}) do
        table.insert(a, tostring(value))
    end
    local text = ""
    if #a == 0 then
        text = Log.prefix .. message
        env.info(text, false)
    else
        text = Log.prefix .. string.format(message, unpack(a))
        env.info(text, false)
    end
    if LSA.dev then
        trigger.action.outText(text, 10, true)
    end
end

function Log.trace(message, ...)
    message = message or "nil"
    if not Log.settings.trace then
        return
    end
    local a = {}
    for _, value in ipairs({ ... } or {}) do
        table.insert(a, tostring(value))
    end
    local text = ""
    if #a == 0 then
        text = Log.prefix .. message
        env.info(text, false)
    else
        text = Log.prefix .. string.format(message, unpack(a))
        env.info(text, false)
    end
    if LSA.dev then
        trigger.action.outText(text, 10, true)
    end
end

function Log.info(message, ...)
    message = message or "nil"
    local a = {}
    for _, value in ipairs({ ... } or {}) do
        table.insert(a, tostring(value))
    end
    if #a == 0 then
        env.info(Log.prefix .. message, false)
    else
        env.info(Log.prefix .. string.format(message, unpack(a)), false)
    end
end

CSAR = {}

function CSAR.onReturnMenu(args)
    local player = args.player

    EjectedPilot.returnPilot(player)
end

function CSAR.onRescueMenu(args)
    local player = args.player

    EjectedPilot.rescue(player)
end

function CSAR.canCSAR(player)
    return LSA.transports[player.unitType] ~= nil
end

function CSAR.onStatusMenu(args)
    local player = args.player

    EjectedPilot.status(player)
end

Player = {
    units = {},  -- maps a unit name to a player
    ejected = {} -- stores information on ejections
}

function Player.canWinLife(ucid)
    local state = Player.state(ucid)
    if #state.queue > 0 then
        local nextLifeDate = state.queue[1]
        local currentDate = LSA.getDateUTC()
        if currentDate > nextLifeDate then
            return true
        end
    end

    return false
end

function LSA.getClosestAirbase(location, radius)
    local airbases = LSA.findAirbases(location, radius)
    local ordered = {}
    for _, airbaseObj in ipairs(airbases) do
        local airbaseLocation = ToVec2(airbaseObj:getPoint())
        local distance = Distance(location, airbaseLocation)
        table.insert(ordered, { airbaseName = airbaseObj:getName(), distance = distance })
    end

    table.sort(ordered, function(a, b)
        return a.distance < b.distance
    end)

    if #ordered < 1 then return nil end
    return ordered[1].airbaseName
end

LSA.Takeoffs = {}
LSA.Landings = {}
function Player.onTakeoffEvent(event)
    if LSA.isPlayerEvent(event) then
        local unit = event.initiator
        local objId = unit["id_"]
        if not unit:inAir() then return end

        if LSA.Landings[objId] ~= nil then
            TS.stop(LSA.Landings[objId])
            LSA.Landings[objId] = nil
            Log.debug("Cancelled landing check")
        end

        if LSA.Takeoffs[objId] == nil then
            LSA.Takeoffs[objId] = objId
        end
    end
end

LSA.settings.returnToApronDelay = 5 * 60
function Player.onLandEvent(event)
    if event.place == nil then return end

    -- player landed
    local unit = event.initiator
    local objId = unit["id_"]
    local place = event.place
    local placeCoalition = place:getCoalition()
    local unitType = unit:getDesc().category
    local unitName = unit:getName()
    local player = Player.operating(unitName)
    if player == nil then return end

    local isDamaged = unit:getLife() < unit:getLife0()

    if isDamaged then
        TS.task("reminder", function(_, _)
            if not unit:isExist() then return end
            if unit:getLife() <= 0 then return end
            if unit:inAir() then return end
            if player.side ~= placeCoalition then return end

            if unitType == Unit.Category.AIRPLANE then
                LSA.messagePlayer(player,
                    string.format("%s, emergency vehicles are on the way.", player.playerName)
                )
            end
        end, {}, 5)

        LSA.Landings[objId] = TS.task("return life " .. player.playerName, function(_, _)
            if not unit:isExist() then return end
            if unit:getLife() <= 0 then return end
            if unit:inAir() then return end
            if player.side ~= placeCoalition then return end

            LSA.Takeoffs[objId] = nil
        end, {}, 30) -- [TODO] move to settings
        return
    end

    TS.task("reminder", function(_, _)
        if not unit:isExist() then return end
        if unit:getLife() <= 0 then return end
        if unit:inAir() then return end
        if player.side ~= placeCoalition then return end

        if unitType == Unit.Category.AIRPLANE then
            LSA.messagePlayer(player,
                string.format("%s, exit runway when able and return to the apron.", player.playerName)
            )
        end
    end, {}, 5)

    LSA.Landings[objId] = TS.task("vacated runway " .. player.playerName, function(_, _)
        if not unit:isExist() then return end
        if unit:getLife() <= 0 then return end
        if unit:inAir() then return end
        if player.side ~= placeCoalition then return end

        if unitType == Unit.Category.AIRPLANE then
            local position = ToVec2(unit:getPoint())

            local baseName = nil
            if event.place ~= nil then
                baseName = event.place:getName()
            else
                Log.debug("Place was nil on landing")
                local unitLocation = ToVec2(unit:getPoint())
                baseName = LSA.getClosestAirbase(unitLocation, 1000) -- [TODO] settings and review
            end
            local base = Base.find(baseName)

            if not Base.isApronArea(base, position) then
                LSA.explodeUnit(unit:getName()) -- [REVIEW] perhaps just move the player back to spectators (explosions may hurt other players)
                LSA.messagePlayer(player,
                    string.format("%s, next time report back to the apron within %s seconds from landing.",
                        player.playerName, LSA.settings.returnToApronDelay)
                )
                return
            end
        end

        LSA.Takeoffs[objId] = nil
    end, {}, LSA.settings.returnToApronDelay) -- [TODO] move to settings
end

---Returns the player info of the given player name.
---@param playerName string
---@return table|nil
function Player.getInfoByName(playerName)
    local info = Player.__getInfo(function(player)
        return player.name == playerName
    end)
    if info ~= nil then return info end

    Log.debug("Could not find a player by the name of '%s'", playerName)
    return nil
end

---Returns the player info of the given ucid.
---@param ucid string
---@return table|nil
function Player.getInfoByUcid(ucid)
    local info = Player.__getInfo(function(player)
        return player.ucid == ucid
    end)
    if info ~= nil then return info end

    Log.debug("Could not find a player with UCID '%s'", ucid)
    return nil
end

---Get the player info by the given predicate.
---@param predicate function
---@return table|nil
function Player.__getInfo(predicate)
    local playerList = net.get_player_list()
    for _, playerId in ipairs(playerList) do
        local info = net.get_player_info(playerId)
        if predicate(info) then
            return info
        end
    end

    return nil
end

function Player.onUnitBirth(unitName)
    assert(unitName ~= nil, "unitName cannot be nil")

    local playerUnit = Unit.getByName(unitName)
    assert(playerUnit ~= nil, "Player must have a unit")

    local playerId = ""
    local playerUcid = ""
    local playerName = playerUnit:getPlayerName()

    local info = Player.getInfoByName(playerName)
    assert(info ~= nil)

    playerId = info.id
    playerName = info.name
    playerUcid = info.ucid

    local playerGroup = playerUnit:getGroup()
    local playerGroupId = playerGroup:getID()
    local playerGroupName = playerGroup:getName()
    local playerUnitId = playerUnit:getID()
    local playerUnitName = playerUnit:getName()
    local playerUnitType = playerUnit:getTypeName()
    local playerCoalition = playerUnit:getCoalition()

    Player.units[unitName] = {
        unitId = playerUnitId,
        unitName = playerUnitName,
        unitType = playerUnitType,
        groupId = playerGroupId,
        groupName = playerGroupName,
        playerName = playerName,
        playerId = playerId,
        side = playerCoalition,
        ucid = playerUcid
    }

    Log.debug("Unit %s has been entered by %s", unitName, playerName)
    return Player.units[unitName]
end

---Returns the settings of the player associated with the given ucid.
---@param ucid string|nil The ucid of the player, if nil the current player ucid is used.
---@return table The settings associated with the player.
function Player.settings(ucid)
    local state = Player.state(ucid)

    if state.settings == nil then
        state.settings = {
            text = true
        }
    end

    return state.settings
end

---Returns the state of the player associated with the given ucid.
---@param ucid string|nil The ucid of the player, if nil the current player ucid is used.
---@return table The state associated with the player.
function Player.state(ucid)
    if ucid == nil then
        local id = net.get_my_player_id()
        ucid = net.get_player_info(id, "ucid")
    end

    if LSA.state.players[ucid] == nil then
        local info = Player.getInfoByUcid(ucid)
        assert(info ~= nil)

        Log.debug("No state found for %s, creating one", info.name)

        LSA.state.players[ucid] = {
            name = info.name,
            lives = LSA.settings.maxPlayerLives,
            side = LSA.PlayerSides.Neutral,
            queue = {},
        }
    end

    return LSA.state.players[ucid]
end

function Player.lives(player)
    local state = Player.state(player.ucid)
    return state.lives
end

function Player.loseLife(ucid)
    local state = Player.state(ucid)
    if state.lives - 1 >= 0 then
        state.lives = state.lives - 1
    end

    -- calculate next life regeneration time
    local deathUTC = LSA.getDateUTC() + LSA.settings.timeToNewLife
    table.insert(state.queue, deathUTC)

    Log.debug("Player %s now has %s lives.", ucid, state.lives)
end

function Player.winLife(ucid)
    local state = Player.state(ucid)
    if state.lives + 1 <= LSA.settings.maxPlayerLives then
        state.lives = state.lives + 1
    end

    if #state.queue > 0 then
        table.remove(state.queue, 1)
    end

    Log.debug("Player %s now has %s lives.", ucid, state.lives)
end

function Player.onLostUnit(event)
    local unit = event.initiator
    local unitName = unit:getName()
    local unitCategory = unit:getDesc().category
    if unitCategory == Unit.Category.GROUND and Player.isPlayer(unitName) then
        local player = Player.operating(unitName)
        assert(player ~= nil)

        Player.loseLife(player.ucid)
    end
end

---Returns true when a unit is being operated by a player.
---@param unitName string
---@return boolean
function Player.isPlayer(unitName)
    return Player.units[unitName] ~= nil
end

---Returns the player operating the unit.
---@param unitName string
---@return table|nil
function Player.operating(unitName)
    local operator = Player.units[unitName]
    if operator == nil then
        Log.debug("Could not find a player operating unit %s", unitName)
    end

    return operator
end

function Player.position(player)
    local unit = LSA.getUnit(player.unitName)
    assert(unit ~= nil)

    local unitPosition = unit:getPosition()
    local position = ToVec2(unitPosition.p)
    position.heading = LSA.heading(unitPosition)
    position.airborne = unit:inAir()

    return position
end

---Returns the operator (player) of a unit by the player ucid.
---@param ucid string
---@return table|nil
function Player.operatingByUcid(ucid)
    for _, operator in pairs(Player.units) do
        if operator.ucid == ucid then
            return operator
        end
    end
    return nil
end

---Returns the operator (player) of a unit by the player id.
---@param playerId number
---@return table|nil
function Player.operatingById(playerId)
    for _, operator in pairs(Player.units) do
        if operator.playerId == playerId then
            return operator
        end
    end
    return nil
end

--#region Transport
Transport = {
    types = LSA.transports
}

---Checks if the unit type is a transport.
---@param unitType string
---@return boolean
function Transport.isTransport(unitType)
    return Transport.types[unitType] ~= nil
end

---Clears supplies, repairs and CSAR associated with the transport.
---@param unitName any
function Transport.leave(unitName)
    Supplies.clear(unitName)
    Repairs.clear(unitName)
    EjectedPilot.clear(unitName)
end

--#endregion

--#region LogiCenter
LogiCenter = {}

---Returns the logistic center near the player.
---@param player table
---@return table|nil
function LogiCenter.near(player)
    local playerPosition = Player.position(player)
    local logisticsCenter = LSA.findFriendlyLogistics(player.side, playerPosition)
    if logisticsCenter ~= nil then
        return logisticsCenter
    end

    Log.debug("No logistic center nearby")
    LSA.messagePlayer(player, Text.NEED_LOGISTICS_CENTER)
    return nil
end

--#endregion

---Creates a bombers route from an airdrome to a target point.
---@param airdrome table
---@param parkingLocation table
---@param target table
---@param speed number
---@param altitude number
---@return table
function LSA.schemeBomberRoute(airdrome, parkingLocation, target, speed, altitude)
    local route = {
        points = {}
    }

    speed = LSA.kmhToMps(speed)
    local departureSpeed = LSA.kmhToMps(400)
    local departureAlt = 2000
    local approachSpeed = LSA.kmhToMps(300)
    local approachAlt = 2000

    local takeOffPoint = LSA.getTakeoffPoint(airdrome.id, parkingLocation)
    local departurePoint = LSA.getDeparturePoint(airdrome.location, departureSpeed, departureAlt)
    local attackPoint = LSA.getAttackPoint(target, speed, altitude)
    local ingressPoint = LSA.getIngressPoint(target, speed, altitude)
    local egressPoint = LSA.getEgressPoint(target, speed, altitude)
    local approachPoint = LSA.getApproachPoint(airdrome.location, approachSpeed, approachAlt)
    local descentPoint = LSA.getDescentPoint(approachPoint, speed, altitude)
    local landPoint = LSA.getLandRunwayPoint(airdrome.id, airdrome.location, approachSpeed, approachAlt)

    table.insert(route.points, takeOffPoint)
    table.insert(route.points, departurePoint)
    table.insert(route.points, ingressPoint)
    table.insert(route.points, attackPoint)
    table.insert(route.points, egressPoint)
    table.insert(route.points, descentPoint)
    table.insert(route.points, approachPoint)
    table.insert(route.points, landPoint)

    return route
end

function LSA.getIngressPoint(target, speed, altitude)
    local offset = { distance = 40000, angle = 285 }
    local point = LSA.newPos(target, offset)

    return LSA.getWaypoint(point, speed, altitude)
end

function LSA.getEgressPoint(target, speed, altitude)
    local offset = { distance = 40000, angle = 075 }
    local point = LSA.newPos(target, offset)

    return LSA.getWaypoint(point, speed, altitude)
end

function LSA.getAttackPoint(target, speed, altitude)
    return LSA.getWaypoint(target, speed, altitude)
end

function LSA.getLandRunwayPoint(airdromeId, airdromeLocation, speed, altitude)
    return {
        ["alt"] = altitude,
        ["action"] = "Landing",
        ["alt_type"] = "BARO",
        ["speed"] = speed,
        ["task"] =
        {
            ["id"] = "ComboTask",
            ["params"] =
            {
                ["tasks"] =
                {
                },
            },
        },
        ["type"] = "Land",
        ["ETA"] = 0,
        ["ETA_locked"] = false,
        ["y"] = airdromeLocation.y,
        ["x"] = airdromeLocation.x,
        ["formation_template"] = "",
        ["airdromeId"] = airdromeId,
        ["speed_locked"] = true,
    }
end

function LSA.getDeparturePoint(airdromeLocation, speed, altitude)
    local offset = { distance = 30000, angle = 270 }
    local point = LSA.newPos(airdromeLocation, offset)

    return LSA.getWaypoint(point, speed, altitude)
end

function LSA.getApproachPoint(airdromeLocation, speed, altitude)
    local offset = { distance = 30000, angle = 090 }
    local point = LSA.newPos(airdromeLocation, offset)

    return LSA.getWaypoint(point, speed, altitude)
end

function LSA.getDescentPoint(approachPoint, speed, altitude)
    local offset = { distance = 50000, angle = 180 }
    local point = LSA.newPos(approachPoint, offset)

    return LSA.getWaypoint(point, speed, altitude)
end

function LSA.getWaypoint(point, speed, altitude)
    return {
        ["alt"] = altitude,
        ["action"] = "Turning Point",
        ["alt_type"] = "BARO",
        ["speed"] = LSA.kmhToMps(speed),
        ["task"] =
        {
            ["id"] = "ComboTask",
            ["params"] =
            {
                ["tasks"] =
                {
                },
            },
        },
        ["type"] = "Turning Point",
        ["ETA"] = 0,
        ["ETA_locked"] = false,
        ["y"] = point.y,
        ["x"] = point.x,
        ["formation_template"] = "",
        ["speed_locked"] = true,
    }
end

function LSA.getTakeoffPoint(airdromeId, parkingLocation)
    return {
        ["alt"] = land.getHeight(parkingLocation),
        ["action"] = "From Parking Area",
        ["alt_type"] = "BARO",
        ["speed"] = 0,
        ["task"] = {
            ["id"] = "ComboTask",
            ["params"] =
            {
                ["tasks"] =
                {
                },
            },
        },
        ["type"] = "TakeOffParking",
        ["ETA"] = 0,
        ["ETA_locked"] = true,
        ["y"] = parkingLocation.y,
        ["x"] = parkingLocation.x,
        ["formation_template"] = "",
        ["airdromeId"] = airdromeId,
        ["speed_locked"] = true,
    }
end

function LSA.getComboTask(tasks)
    tasks = tasks or {}
    return {
        ["id"] = "ComboTask",
        ["params"] =
        {
            ["tasks"] = tasks,
        },
    }
end

function LSA.getTankerTask()
    return {
        ["id"] = "Tanker",
        ["enabled"] = true,
        ["params"] =
        {
        },
    }
end

function LSA.getAwacsTask()
    return
    {
        ["enabled"] = true,
        ["id"] = "AWACS",
        ["params"] =
        {
        },
    }
end

---Checks if there is line of sight between two points.
---@param position1 table
---@param position2 table
---@return boolean
function LSA.hasLOS(position1, position2)
    -- to calculate line of sight we will offset the positions given
    -- to be slightly higher than the ground level
    -- this is to compensate for the height of the vehicles themselves
    local height1 = land.getHeight(position1)
    local height2 = land.getHeight(position2)
    local offset1 = { x = position1.x, y = height1 + 2, z = position1.y }
    local offset2 = { x = position2.x, y = height2 + 2, z = position2.y }

    return land.isVisible(offset1, offset2)
end

function LSA.getTacanTask(callsign, mode, channel, freq)
    return {
        ["id"] = "WrappedAction",
        ["enabled"] = true,
        ["params"] =
        {
            ["action"] =
            {
                ["id"] = "ActivateBeacon",
                ["params"] =
                {
                    ["type"] = 4,
                    ["AA"] = mode == "Y",
                    ["callsign"] = callsign,
                    ["modeChannel"] = mode,
                    ["channel"] = channel,
                    ["system"] = 5,
                    ["bearing"] = true,
                    ["frequency"] = freq,
                },
            },
        },
    }
end

---Returns a tanker orbit point.
---@param initialPoint table
---@param speed number
---@param altitude number
---@param duration number
---@param track number
---@return table
function LSA.getOrbitPoint(initialPoint, speed, altitude, duration, track)
    local raceTrackPoint = LSA.newPos(initialPoint, { distance = 80000, angle = track })

    return {
        ["alt"] = altitude,
        ["action"] = "Turning Point",
        ["alt_type"] = "BARO",
        ["speed"] = speed,
        ["task"] =
        {
            ["id"] = "ComboTask",
            ["params"] =
            {
                ["tasks"] =
                {
                    [1] =
                    {
                        ["number"] = 1,
                        ["auto"] = false,
                        ["id"] = "ControlledTask",
                        ["enabled"] = true,
                        ["params"] =
                        {
                            ["task"] =
                            {
                                ["id"] = "Orbit",
                                ["params"] =
                                {
                                    ["speedEdited"] = true,
                                    ["pattern"] = "Race-Track",
                                    ["speed"] = speed,
                                    ["altitude"] = altitude,
                                    ["altitudeEdited"] = true,
                                    ["point"] = initialPoint,
                                    ["point2"] = raceTrackPoint
                                },
                            },
                            ["stopCondition"] =
                            {
                                ["duration"] = duration,
                            },
                        },
                    },
                },
            },
        },
        ["type"] = "Turning Point",
        ["ETA"] = 0,
        ["ETA_locked"] = false,
        ["y"] = initialPoint.y,
        ["x"] = initialPoint.x,
        ["formation_template"] = "",
        ["speed_locked"] = true,
    }
end

LSA.misc.events = LSA.invertTable(world.event)

LSA.misc.BeaconTypes = {
    BEACON_TYPE_NULL = 0,
    BEACON_TYPE_VOR = 1,
    BEACON_TYPE_DME = 2,
    BEACON_TYPE_VOR_DME = 3,
    BEACON_TYPE_TACAN = 4,
    BEACON_TYPE_VORTAC = 5,
    BEACON_TYPE_RSBN = 32,
    BEACON_TYPE_BROADCAST_STATION = 1024,
    BEACON_TYPE_HOMER = 8,
    BEACON_TYPE_AIRPORT_HOMER = 4104,
    BEACON_TYPE_AIRPORT_HOMER_WITH_MARKER = 4136,
    BEACON_TYPE_ILS_FAR_HOMER = 16408,
    BEACON_TYPE_ILS_NEAR_HOMER = 16456,
    BEACON_TYPE_ILS_LOCALIZER = 16640,
    BEACON_TYPE_ILS_GLIDESLOPE = 16896,
    BEACON_TYPE_NAUTICAL_HOMER = 32776,
}

LSA.misc.SystemNames = {
    PAR_10 = 1,
    RSBN_5 = 2,
    TACAN = 3,
    TACAN_TANKER = 4,
    ILS_LOCALIZER = 5,
    ILS_GLIDESLOPE = 6,
    BROADCAST_STATION = 7
}