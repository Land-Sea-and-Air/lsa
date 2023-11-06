EjectedPilot = {
    pilots = {}
}
function EjectedPilot.new()
    return {
        playerName = "",
        aircraftId = 0,
        pilotUnit = nil, -- we need to store the instance so we can call destroy on it later
        side = 0,
        location = nil,
        mass = 100, -- [TODO] move to settings
    }
end

---Sends message to player with ejected pilot grid location.
---@param player table
---@param pilot table
function EjectedPilot.__print(player, pilot)
    local lat, lon, _ = coord.LOtoLL(ToVec3(pilot.location))
    local mgrs = coord.LLtoMGRS(lat, lon)

    local grid = string.format("%s %s %s %s", mgrs.UTMZone, mgrs.MGRSDigraph, mgrs.Easting, mgrs.Northing)
    local m = string.format("Pilot: %s, Grid: %s", pilot.playerName, grid)
    LSA.messagePlayer(player, m, 10, false)
end

---Returns the index of the pilot being transported by the given name.
---@param transportName string
---@return integer|nil
function EjectedPilot.__findByTransport(transportName)
    for i, pilot in ipairs(EjectedPilot.pilots) do
        if pilot.transportName == transportName then
            return i
        end
    end
    return nil
end

---Removes the pilot that is being transported by the given name.
---@param transportName string
function EjectedPilot.__removeByTransport(transportName)
    local i = EjectedPilot.__findByTransport(transportName)
    if i ~= nil then
        table.remove(EjectedPilot.pilots, i)
    end
end

---Removes the pilots being transported by the given name.
---@param transportName any
function EjectedPilot.clear(transportName)
    local i = EjectedPilot.__findByTransport(transportName)
    table.remove(EjectedPilot.pilots, i)
end

---Removes an ejected pilot by its id.
---@param pilotUnit table
function EjectedPilot.removePilot(pilotUnit)
    local index = 0
    for i, pilot in ipairs(EjectedPilot.pilots) do
        if pilot.pilotUnit["id_"] == pilotUnit["id_"] then
            index = i
            break
        end
    end

    if index > 0 then
        table.remove(EjectedPilot.pilots, index)
    end
    pilotUnit:destroy()
end

---Sends message to player with all friendly ejected pilots locations.
---@param player table
function EjectedPilot.status(player)
    local n = 0
    for _, pilot in pairs(EjectedPilot.pilots) do
        if pilot.side == player.side then
            EjectedPilot.__print(player, pilot)
            n = n + 1
        end
    end

    if n == 0 then
        local m = string.format("Nothing to report")
        LSA.messagePlayer(player, m)
    end
end

---Returns the pilot being transported by the given name.
---@param transportName string
---@return table|nil
function EjectedPilot.byTransport(transportName)
    local i = EjectedPilot.__findByTransport(transportName)
    if i ~= nil then
        return EjectedPilot.pilots[i]
    end
    return nil
end

---Returns the pilot and regenerates the player life.
---@param player table
function EjectedPilot.returnPilot(player)
    local playerPosition = Player.position(player)

    -- check if near a friendly logistics center
    local center = LSA.findFriendlyLogistics(player.side, playerPosition)
    if center == nil then
        LSA.messagePlayer(player, Text.NOT_CLOSE_ENOUGH_LOGISTICS)
        return
    end

    local pilot = EjectedPilot.byTransport(player.unitName)
    assert(pilot ~= nil)

    local rescuedPlayer = Player.getInfoByName(pilot.playerName)
    assert(rescuedPlayer ~= nil)

    Player.winLife(rescuedPlayer.ucid)

    local unitWrp = RefUnits.get(player.unitName)
    UnitWrp.removeWeight(unitWrp, pilot.mass)
    EjectedPilot.__removeByTransport(player.unitName)

    local m = string.format(Text.PILOT_RETURNED, pilot.playerName)
    LSA.messagePlayer(player, m)
    LSA.outSoundForUnit(player.unitId, "beep.ogg")
end

---Returns the ejected pilot belonging to the given side, near the given position.
---@param player table
---@return table|nil
function EjectedPilot.findNear(player)
    local position = Player.position(player)
    for _, pilot in pairs(EjectedPilot.pilots) do
        if pilot.side == player.side then
            local distance = Distance(position, pilot.location)
            if distance < LSA.settings.maxSearchRadiusMeters then
                return pilot
            end
        end
    end
    return nil
end

---Rescues the pilot into the transport.
---@param player table
function EjectedPilot.rescue(player)
    -- find the downed pilot
    local pilot = EjectedPilot.findNear(player)
    if pilot == nil then
        Log.debug("Could not find any friendly downed pilots near the player")
        local m = string.format(Text.NO_FRIENDLY_PILOT_FOUND, LSA.settings.maxSearchRadiusMeters)
        LSA.messagePlayer(player, m)
        return
    end

    Log.debug("Found pilot %s", pilot.playerName)
    -- load the pilot onto the helicopter
    -- check if there is room (seats)
    -- add weight
    -- add to csar transit
    local unitWrp = RefUnits.get(player.unitName)
    UnitWrp.addWeight(unitWrp, pilot.mass)

    pilot.transportName = player.unitName
    pilot.pilotUnit:destroy() -- removes the pilot instance from DCS
    pilot.pilotUnit = nil

    local m = string.format(Text.PILOT_RESCUED, pilot.playerName)
    LSA.messagePlayer(player, m)
    LSA.outSoundForUnit(player.unitId, "beep.ogg")
end

function EjectedPilot.onEject(event)
    local playerName = event.initiator:getPlayerName()
    if playerName == nil then
        -- ignore AI ejections
        return
    end

    local aircraftId = event.initiator["id_"] -- the id of the aircraft is stored for comparison later
    local unitName = event.initiator:getName()
    local player = Player.operating(unitName)
    assert(player ~= nil)

    local pilot = EjectedPilot.new()
    pilot.playerName = player.playerName
    pilot.side = player.side
    pilot.aircraftId = aircraftId

    table.insert(EjectedPilot.pilots, pilot)
end

---Finds an ejected pilot by its aircraft id.
---@param aircraftId number
---@return table|nil
function EjectedPilot.__findByAircraftId(aircraftId)
    for _, pilot in ipairs(EjectedPilot.pilots) do
        if pilot.aircraftId == aircraftId then
            return pilot
        end
    end
    return nil
end

---Makes the pilot available for pickup.
---@param event table
function EjectedPilot.onGround(event)
    local pilotUnit = event.initiator
    local aircraftId = event.place["id_"]

    local pilot = EjectedPilot.__findByAircraftId(aircraftId)
    local human = pilot ~= nil
    -- determine if the ejection is of a human player
    if human then
        pilot.pilotUnit = pilotUnit
        pilot.location = ToVec2(pilotUnit:getPoint())
    else
        Log.debug("AI ejected pilot, removing")
        pilotUnit:destroy()
        return
    end
end