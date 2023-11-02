RemovePilotDevCommand = {
    name = "remove-pilot",
    ---Handles remove pilot command.
    ---@param _ any
    ---@param parts table
    handler = function(_, parts)
        local pilotName = parts[3]
        if pilotName == nil then return false, "Invalid pilot name." end

        local unit = LSA.getUnit(pilotName)
        if unit == nil then return false, "Invalid pilot." end

        EjectedPilot.removePilot(unit)
        return true, ""
    end
}