BaseCaptureDevCommand = {
    name = "base-capture",
    ---Handles base capture command.
    ---@param _ any
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function(_, parts)
        local baseName = parts[3]
        if baseName == nil then return false, "Invalid base name." end

        local base = LSA.findBase(baseName)
        if base == nil then return false, "Invalid base." end

        local newOwner, previousOwner = Base.capture(base)

        -- inform previous owner that they lost the base
        local lostBaseMessage = string.format(LSA.text.BASE_LOST, base.name)
        trigger.action.outTextForCoalition(previousOwner, lostBaseMessage, 10, true)

        -- inform new owner that they captured the base
        local capturedBaseMessage = string.format(LSA.text.BASE_CAPTURED, base.name)
        trigger.action.outTextForCoalition(newOwner, capturedBaseMessage, 10, true)

        return true, ""
    end
}