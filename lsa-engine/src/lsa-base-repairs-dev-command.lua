BaseRepairsDevCommand = {
    name = "base-repairs",
    ---Handles base repairs command.
    ---@param _ any
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function(_, parts)
        local baseName = parts[3]
        if baseName == nil then return false, "Invalid base name." end

        Base.rebuildRepairs(baseName)
        
        return true, ""
    end
}