SpawnDevCommand = {
    name = "spawn",
    ---Handles spawn command.
    ---@param event unknown
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function(event, parts)
        local markPosition = ToVec2(event.pos)

        local type = parts[3]
        local side = parts[4]
        if type == nil or side == nil then return false, "Invalid command parameters." end

        local groupName = Dashed("DevGroup", LSA.next())
        local unitName = Dashed(groupName, 1)
        local unitWrp = UnitWrp.new(unitName, type, markPosition, 0, nil, side)
        local groupWrp = GroupWrp.new(groupName, { unitWrp }, nil, side)

        local group = GroupWrp.spawn(groupWrp)

        if group == nil then
            local message = string.format("Failed to spawn unit of type '%s' for coalition '%s'", type, side)
            Log.debug(message)
            return false, message
        else
            local message = string.format("Unit of type '%s' for coalition %s has been spawned", type, side)
            Log.debug(message)
            return true, message
        end
    end
}