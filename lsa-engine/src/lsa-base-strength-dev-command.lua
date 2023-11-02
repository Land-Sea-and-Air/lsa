BaseStrengthDevCommand = {
    name = "base-strength",
    ---Handles base strength command.
    ---@param _ any
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function(_, parts)
        local baseName = parts[3]
        if baseName == nil then return false, "Invalid base name." end

        local base = LSA.findBase(baseName)
        if base == nil then return false, "Invalid base." end

        local strength = Round(Base.strength(base))
        LSA.messageAll(
            string.format("%s is at %s%%", baseName, strength)
        )

        return true, ""
    end
}