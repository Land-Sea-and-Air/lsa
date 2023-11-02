AwacsWaypointCommand = {
    name = "awacs-wp",
    ---Handles awacs waypoint command.
    ---@param event unknown
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function(event, parts)
        local markPosition = ToVec2(event.pos)
        local markCoalition = event.coalition

        local callsign = parts[3]
        if callsign == nil then return false, "Invalid callsign." end

        local track = tonumber(parts[4])
        if track == nil or track < 0 or track > 360 then return false, "Invalid track." end

        local destination = markPosition
        return Awacs.relocate(callsign, markCoalition, destination, track)
    end
}