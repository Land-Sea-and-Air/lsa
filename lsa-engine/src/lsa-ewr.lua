GCI = {}
GCI.types = { "55G6 EWR", "1L13 EWR", "E-3A", "E-2C", "A-50", "FPS-117", "KJ-2000" }
GCI.refreshTime = 25
GCI.pictureLimit = 5
GCI.pictureRange = 150000    -- any contact outside this range is not shown
GCI.includeTypeInBraaCalls = false
GCI.heloFilterAltitude = 150 -- meters
GCI.heloFilterSpeed = 120    -- kmh

local function byDistance(a, b)
    return a.distance < b.distance
end

local function round(num, numDecimalPlaces)
    if num == 0 then
        return 0
    end

    local mult = 10 ^ (numDecimalPlaces or 0)
    return math.floor(num * mult + 0.5) / mult
end

GCI.hasCommands = {}
GCI.EWRs = {}
GCI.EWRs.blue = {}
GCI.EWRs.red = {}
GCI.EWRs.neutral = {}
GCI.detectedUnits = {}
GCI.autoDisplay = {}
GCI.detectedUnits.red = {}
GCI.detectedUnits.blue = {}
GCI.lastUpdateTime = 0

function GCI.unitHeading(unitName)
    local unit = Unit.getByName(unitName)
    local unitPos = unit:getPosition()
    return GCI.positionHeading(unitPos)
end

function GCI.positionHeading(pos3d)
    local headingRad = math.atan2(pos3d.x.z, pos3d.x.x)

    if headingRad < 0 then
        headingRad = headingRad + 2 * math.pi
    end

    return headingRad * 180 / math.pi
end

local function buildOutput(unitName, bearing, distance, altitude, aspect, targetTypeName, isFriendly)
    local unit = Unit.getByName(unitName)
    local unitGroupId = unit:getGroup():getID()
    local measure = GCI.hasCommands[unitGroupId]
    local kmToMi = 0.6213711922
    local mToFt = 3.28084

    if measure == nil then
        measure = "Imperial"
    end

    local bearingText = ""
    local distanceText = ""
    local altitudeText = ""
    local aspectText = ""
    local typeText = ""

    if measure == "Metric" then
        bearingText = string.format("%03.0f", bearing)
        distanceText = string.format("for %1.0f km", math.ceil(distance / 1000))
        altitudeText = string.format("at %1.0f meters", math.floor(altitude / 100) * 100)
        aspectText = string.format(", %s", aspect)
        typeText = string.format(", type %s", targetTypeName)
    end

    if measure == "Imperial" then
        bearingText = string.format("%03.0f", bearing)
        distanceText = string.format("for %1.0f miles", math.ceil((distance / 1000) * kmToMi))
        altitudeText = string.format("at %1.0f feet", math.floor((altitude * mToFt) / 100) * 100)
        aspectText = string.format(", %s", aspect)
        typeText = string.format(", type %s", targetTypeName)
    end

    if isFriendly then
        local callsignText = string.format(", callsign %s", targetTypeName or "unknown")
        return string.format("BRAA: %s %s %s %s %s", bearingText, distanceText, altitudeText, aspectText, callsignText)
    end

    if GCI.includeTypeInBraaCalls then
        return string.format("BRAA: %s %s %s %s %s", bearingText, distanceText, altitudeText, aspectText, typeText)
    else
        return string.format("BRAA: %s %s %s %s", bearingText, distanceText, altitudeText, aspectText)
    end
end

function GCI.getEWRs(side)
    local groundStations = coalition.getGroups(side, Group.Category.GROUND)
    local airborneStations = coalition.getGroups(side, Group.Category.AIRPLANE)
    local ewrs = {}

    for _, group in pairs(groundStations) do
        for _, unit in pairs(group:getUnits()) do
            if GCI.isSupportedEwrType(unit:getTypeName()) then
                table.insert(ewrs, unit:getName())
            end
        end
    end

    for _, group in next, airborneStations do
        for _, unit in pairs(group:getUnits()) do
            if GCI.isSupportedEwrType(unit:getTypeName()) then
                table.insert(ewrs, unit:getName())
            end
        end
    end

    return ewrs
end

function GCI.isSupportedEwrType(unitType)
    for _, ewrTypeName in ipairs(GCI.types) do
        if unitType == ewrTypeName then
            return true
        end
    end

    return false
end

function GCI.getDetectedObjects(ewrName)
    local ewr = Unit.getByName(ewrName)
    local group = ewr:getGroup()
    local controller = group:getController()

    GCI.lastUpdateTime = math.ceil(timer.getTime())
    return controller:getDetectedTargets()
end

function GCI.returnLastUpdateTime()
    local lastUpdateTime = math.abs(math.ceil(timer.getTime() - GCI.lastUpdateTime))
    if lastUpdateTime < 1 then
        return "CURRENT PICTURE\n"
    else
        return "Last Update: " .. tostring(lastUpdateTime) .. " seconds.\n"
    end
end

function GCI.compileDetectedUnits(ewrList)
    local detectedUnitList = {}

    for _, ewrName in next, ewrList do
        GCI.compileEwrDetectedUnits(ewrName, detectedUnitList)
    end

    return detectedUnitList
end

function GCI.compileEwrDetectedUnits(ewrName, detectedUnits)
    if Unit.getByName(ewrName) == nil then return end

    for _, detectedTarget in next, GCI.getDetectedObjects(ewrName) do
        GCI.trackEwrTarget(detectedTarget, detectedUnits)
    end
end

function GCI.trackEwrTarget(detectedTarget, detectedUnits)
    if detectedTarget.object == nil then return end

    local targetDesc = detectedTarget.object:getDesc()

    if targetDesc.category == Unit.Category.AIRPLANE then
        GCI.trackAirplane(detectedTarget, detectedUnits)
    end

    if targetDesc.category == Unit.Category.HELICOPTER then
        GCI.trackHelicopter(detectedTarget, detectedUnits)
    end
end

function GCI.trackAirplane(detectedTarget, detectedUnits)
    local target = detectedTarget.object
    if target == nil or not target:inAir() then return end

    detectedTarget["position"] = target:getPosition()
    detectedUnits[target:getName()] = detectedTarget
end

function GCI.trackHelicopter(detectedTarget, detectedUnits)
    local target = detectedTarget.object
    if target == nil or not target:inAir() then return end

    local speed = GCI.getObjectSpeedKmh(target)
    local altitude = GCI.getObjectAltitudeAgl(target)

    if altitude > GCI.heloFilterAltitude or speed > GCI.heloFilterSpeed then
        detectedTarget["position"] = target:getPosition()
        detectedUnits[target:getName()] = detectedTarget
    end
end

function GCI.getTargetListFromUnit(unitName)
    local playerUnit = Unit.getByName(unitName)
    local side = playerUnit:getCoalition()
    local targets, filtered = {}, {}

    if side == coalition.side.RED then
        targets = GCI.detectedUnits.red
    elseif side == coalition.side.BLUE then
        targets = GCI.detectedUnits.blue
    end

    for _, target in pairs(targets) do
        if target.object ~= nil and target.object:isExist() then
            local targetName = target.object:getName()
            local targetPosition = target.object:getPosition()
            local targetDistance = GCI.distance2(playerUnit:getPoint(), targetPosition.p)
            local targetHeading = GCI.positionHeading(targetPosition)
            local info = { name = targetName, distance = targetDistance, heading = targetHeading }

            table.insert(filtered, info)
        end
    end

    return filtered
end

function GCI.getFriendlies(playerUnitName)
    local playerUnit = Unit.getByName(playerUnitName)
    local side = playerUnit:getCoalition()
    local targetList, filtered, unitTable = {}, {}, {}


    for _, friendlyGroups in next, coalition.getGroups(side) do
        for _, friendlyUnit in next, friendlyGroups:getUnits() do
            local friendlyCategory = Unit.getCategoryEx(friendlyUnit)
            local friendlyUnitName = friendlyUnit:getName()

            if friendlyUnitName ~= playerUnitName and
                friendlyUnit:getLife() > 0 and
                friendlyUnit:isActive() and
                MatchAny(friendlyCategory, { Unit.Category.AIRPLANE, Unit.Category.HELICOPTER })
            then
                unitTable = {}
                unitTable.object = friendlyUnit
                unitTable.position = friendlyUnit:getPosition()
                targetList[friendlyUnitName] = unitTable
            end
        end
    end

    for _, target in pairs(targetList) do
        if target.object ~= nil and target.object:isExist() then
            local targetName = target.object:getName()
            local targetPosition = target.object:getPosition()
            local targetDistance = GCI.distance2(playerUnit:getPoint(), targetPosition.p)
            local targetHeading = GCI.positionHeading(targetPosition)
            local info = { name = targetName, distance = targetDistance, heading = targetHeading }

            table.insert(filtered, info)
        end
    end

    return filtered
end

function GCI.aspect(targetHeading, targetBearing)
    local d = (360 - targetBearing) + targetHeading

    local direction = ""
    if d > 0 and d < 180 then
        direction = "right"
    end
    if d > 180 and d < 360 then
        direction = "left"
    end

    local bearingReciprocal = math.abs(180 - targetBearing)
    local aspect = math.abs(targetHeading - bearingReciprocal)

    if aspect >= 0 and aspect <= 30 then
        return "hot"
    end
    if aspect > 30 and aspect <= 60 then
        return "flanking " .. direction
    end
    if aspect > 60 and aspect <= 120 then
        return "beaming " .. direction
    end
    if aspect > 120 and aspect < 360 then
        return "cold"
    end
end

function GCI.bogeyDope(unitName)
    local targets = GCI.getTargetListFromUnit(unitName)
    local unit = Unit.getByName(unitName)

    if #targets <= 0 then
        trigger.action.outTextForUnit(unit:getID(), "Picture clean", 10, true)
        return
    end

    table.sort(targets, byDistance)
    local closestBogey = targets[1]

    local target = Unit.getByName(closestBogey.name)
    local bearing = GCI.bearingUnit(unit, target)
    local altitude = target:getPoint().y
    local distance = closestBogey.distance
    local heading = GCI.unitHeading(target:getName())
    local aspect = GCI.aspect(heading, bearing)
    local output =
        GCI.returnLastUpdateTime() ..
        buildOutput(unitName, bearing, distance, altitude, aspect, target:getTypeName())
    trigger.action.outTextForUnit(unit:getID(), output, 10, true)
end

function GCI.picture(unitName)
    local output = ""
    local targets = GCI.getTargetListFromUnit(unitName)
    local unit = Unit.getByName(unitName)

    local counter = 0
    if #targets <= 0 then
        trigger.action.outTextForUnit(unit:getID(), "Picture clean", 10, true)
        return
    end

    table.sort(targets, byDistance)

    for _, target in pairs(targets) do
        if counter > GCI.pictureLimit then break end

        local distance = target.distance
        if distance <= GCI.pictureRange then
            local targetUnit = Unit.getByName(target.name)
            local bearing = GCI.bearingUnit(unit, targetUnit)
            local altitude = targetUnit:getPoint().y
            local heading = GCI.unitHeading(targetUnit:getName())
            local aspect = GCI.aspect(heading, bearing)
            output = output ..
                buildOutput(unitName, bearing, distance, altitude, aspect, targetUnit:getTypeName()) .. "\n"
            counter = counter + 1
        end
    end

    if output == "" then
        output = #targets .. " contacts, no factor"
    end

    local text = GCI.returnLastUpdateTime() .. "Picture:\n" .. output
    trigger.action.outTextForUnit(unit:getID(), text, 10, true)
end

function GCI.friendlyPicture(unitName)
    local output = "Friendly Picture:\n"
    local friendlies = GCI.getFriendlies(unitName)
    local unit = Unit.getByName(unitName)
    local counter = 0

    if #friendlies <= 0 then
        trigger.action.outTextForUnit(unit:getID(), "Picture clean", 10, true)
        return
    end

    table.sort(friendlies, byDistance)

    for _, friendly in pairs(friendlies) do
        if counter > GCI.pictureLimit then
            break
        end
        local friendlyUnit = Unit.getByName(friendly.name)
        local bearing = GCI.bearingUnit(unit, friendlyUnit)
        local altitude = friendlyUnit:getPoint().y
        local distance = friendly.distance
        local heading = GCI.unitHeading(friendlyUnit:getName())
        local aspect = GCI.aspect(heading, bearing)
        output = output ..
            buildOutput(unitName, bearing, distance, altitude, aspect, friendlyUnit:getCallsign(), true) .. "\n"

        counter = counter + 1
    end

    trigger.action.outTextForUnit(unit:getID(), output, 10, true)
end

function GCI.loop(args, time)
    GCI.EWRs.red = GCI.getEWRs(coalition.side.RED)
    GCI.EWRs.blue = GCI.getEWRs(coalition.side.BLUE)

    GCI.detectedUnits.red = GCI.compileDetectedUnits(GCI.EWRs.red)
    GCI.detectedUnits.blue = GCI.compileDetectedUnits(GCI.EWRs.blue)

    for unitName, isOn in next, GCI.autoDisplay do
        if isOn then
            local unit = Unit.getByName(unitName)
            if unit ~= nil and unit:isExist() then
                GCI.picture(unitName)
            end
        end
    end

    return time + GCI.refreshTime
end

timer.scheduleFunction(GCI.loop, "", timer.getTime() + 1)

function GCI.distance(unit1, unit2) --use z instead of y for getPoint()
    local x1 = unit1:getPoint().x
    local y1 = unit1:getPoint().z
    local x2 = unit2:getPoint().x
    local y2 = unit2:getPoint().z

    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function GCI.distance2(point1, point2) --use z instead of y for getPoint()
    local x1 = point1.x
    local y1 = point1.z
    local x2 = point2.x
    local y2 = point2.z

    return math.sqrt((x2 - x1) ^ 2 + (y2 - y1) ^ 2)
end

function GCI.swapDistanceUnits(unitName)
    local unit = Unit.getByName(unitName)
    local unitGroupId = unit:getGroup():getID()

    if GCI.hasCommands[unitGroupId] == "Metric" then
        GCI.hasCommands[unitGroupId] = "Imperial"
    elseif GCI.hasCommands[unitGroupId] == "Imperial" then
        GCI.hasCommands[unitGroupId] = "Metric"
    end

    local text = "Copy, reports will be made in " .. tostring(GCI.hasCommands[unitGroupId])
    trigger.action.outTextForUnit(unit:getID(), text, 5)
end

function GCI.bearing(vec3A, vec3B)
    local azimuth = math.atan2(vec3B.z - vec3A.z, vec3B.x - vec3A.x)
    return azimuth < 0 and math.deg(azimuth + 2 * math.pi) or math.deg(azimuth)
end

function GCI.bearingUnit(unitA, unitB)
    local bearing = GCI.bearing(unitA:getPoint(), unitB:getPoint())
    bearing = round((bearing / 10), 1) * 10

    return bearing
end

function GCI.toggleAutoDisplay(unitName)
    local unit = Unit.getByName(unitName)
    local text = ""
    if GCI.autoDisplay[unitName] ~= true then
        GCI.autoDisplay[unitName] = true
        text = "Copy, issue regular reports"
    else
        GCI.autoDisplay[unitName] = false
        text = "Copy, holding reports"
    end
    trigger.action.outTextForUnit(unit:getID(), text, 5)
end

function GCI.onUnitBirth(event)
    local groupId = event.initiator:getGroup():getID()
    local initiatorName = event.initiator:getName()
    GCI.autoDisplay[initiatorName] = false

    if GCI.hasCommands[groupId] == nil then
        local subMenu = missionCommands.addSubMenuForGroup(groupId, "Ground Controller")
        missionCommands.addCommandForGroup(groupId, "Bogey Dope", subMenu, GCI.bogeyDope, initiatorName)
        missionCommands.addCommandForGroup(groupId, "Picture", subMenu, GCI.picture, initiatorName)
        missionCommands.addCommandForGroup(
            groupId,
            "Friendly Picture",
            subMenu,
            GCI.friendlyPicture,
            initiatorName
        )
        missionCommands.addCommandForGroup(
            groupId,
            "Toogle Units",
            subMenu,
            GCI.swapDistanceUnits,
            initiatorName
        )
        missionCommands.addCommandForGroup(
            groupId,
            "Regular Reports",
            subMenu,
            GCI.toggleAutoDisplay,
            initiatorName
        )

        local units
        if event.initiator:getCoalition() == coalition.side.RED then
            units = "Metric"
        else
            units = "Imperial"
        end
        GCI.hasCommands[groupId] = units
    end
end

--- Vector magnitude
-- @tparam Vec3 vec vector
-- @treturn number magnitude of vector vec
-- source: MIST
function GCI.vectorMagnitude(vec)
    return math.sqrt(vec.x ^ 2 + vec.y ^ 2 + vec.z ^ 2)
end

function GCI.getObjectSpeedInMps(object)
    local v = object:getVelocity()
    local mag = GCI.vectorMagnitude(v)
    return math.ceil(mag)
end

function GCI.getObjectSpeedKmh(object)
    return GCI.getObjectSpeedInMps(object) * 3.6
end

function GCI.getObjectAltitudeAgl(object)
    local point = object:getPoint()
    local asl = point.y
    local landHeight = land.getHeight({ x = point.x, y = point.y })
    return math.ceil(asl - landHeight)
end