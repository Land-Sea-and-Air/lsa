ExplodeStaticDevCommand = {
    name = "explode-static",
    ---Handles explode static command.
    ---@param _ any
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function(_, parts)
        local staticName = parts[3]
        if staticName == nil then return false, "Invalid static name." end

        LSA.explodeStatic(staticName)

        Log.debug("%s blown up", staticName)
        return true, ""
    end
}