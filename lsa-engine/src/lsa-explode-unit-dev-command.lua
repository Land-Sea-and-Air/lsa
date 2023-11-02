ExplodeUnitDevCommand = {
    name = "explode-unit",
    ---Handles explode unit command.
    ---@param _ any
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function(_, parts)
        local unitName = parts[3]
        if unitName == nil then return false, "Invalid unit name." end

        local unit = LSA.getUnit(unitName)
        if unit == nil then return false, "Invalid unit." end

        LSA.explodeUnit(unitName)

        Log.debug("Unit %s blown up", unitName)
        return true, ""
    end
}

