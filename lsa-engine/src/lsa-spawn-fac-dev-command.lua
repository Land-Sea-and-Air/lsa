SpawnFacDevCommand = {
    name = "spawn-fac",
    ---Handles spawn fac command.
    ---@param event unknown
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function(event, parts)
        local markPosition = ToVec2(event.pos)

        local type = parts[3]
        local side = parts[4]
        if type == nil or side == nil then return false, "Invalid command parameters." end
        
        local fac = FAC.new(
            "FacDevGroup",
            type,
            tonumber(side) or 1,
            0,
            133000000,
            "AM",
            markPosition,
            0)

        FAC.spawn(fac)

        local group = LSA.getGroup(fac.name)
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