ExplodeGroupDevCommand = {
    name = "explode-group",
    ---Handles explode group command.
    ---@param _ any
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function(_, parts)
        local groupName = parts[3]
        if groupName == nil then return false, "Invalid group name." end

        local group = LSA.getGroup(groupName)
        if group == nil then return false, "Invalid group." end

        for _, unit in pairs(group:getUnits()) do
            LSA.explodeUnit(unit:getName())
        end

        Log.debug("Group %s blown up", groupName)
        return true, ""
    end
}