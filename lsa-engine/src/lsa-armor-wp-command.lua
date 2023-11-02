ArmorWaypointCommand = {
    name = "armor-wp",
    ---Handles armor waypoint command.
    ---@param event unknown
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function (event, parts)
        local markPosition = ToVec2(event.pos)
        local markCoalition = event.coalition

        local groupName = parts[3]
        local speed = parts[4]
        if groupName == nil then return false, "Invalid group name." end
        local destination = markPosition

        local group = LSA.getGroup(groupName)
        if group == nil then return false, "Invalid group." end

        local groupCoalition = group:getCoalition()
        if groupCoalition ~= markCoalition then
            local message = string.format(
                "The group %s (%s) belongs to a different coalition than the mark (%s).",
                groupName, LSA.side(groupCoalition), LSA.side(markCoalition)
            )
            Log.debug(message)
            return false, message
        end

        speed = speed or 25 -- [TODO] move to settings
        LSA.moveArmor(groupName, destination, LSA.kmhToMps(speed))
        Log.debug("%s moving to location.", groupName)
        return true, string.format("%s moving to location.", groupName)
    end
}