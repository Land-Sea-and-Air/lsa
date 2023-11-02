CarrierWaypointCommand = {
    name = "carrier-wp",

    ---Handles carrier waypoint command.
    ---@param event unknown
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function (event, parts)
        local markPosition = ToVec2(event.pos)
        local markCoalition = event.coalition

        local groupName = parts[3]
        if groupName == nil then return false, "Invalid group name." end
        local destination = markPosition

        local group = LSA.getGroup(groupName)
        if group == nil then return false, "Group does not exist." end

        local groupCoalition = group:getCoalition()
        if groupCoalition ~= markCoalition then
            local message = string.format("The group %s (%s) belongs to a different coalition than the mark (%s).",
                groupName, LSA.side(groupCoalition), LSA.side(markCoalition))
            Log.debug(message)
            return false, message
        end

        -- check if there is an ocean area defined
        if #LSA.OceanPoly == 0 then
            local message = "Carrier movement is not allowed when the ocean area is not defined."
            Log.debug(message)

            return false, message
        end

        -- check if destination is inside ocean area
        local inside = InPolygon(destination.x, destination.y, LSA.OceanPoly)
        if not inside then
            local message = "Destination point is outside the ocean area allowed."
            Log.debug(message)

            return false, message
        end

        LSA.moveShip(groupName, destination)
        Log.debug("%s moving to location.", groupName)
        return true, string.format("%s moving to location.", groupName)
    end
}