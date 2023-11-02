BomberCommand = {
    name = "bomber",
    ---Handles bomber command.
    ---@param event unknown
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function (event, parts)
        local markCoalition = event.coalition

        local from = parts[3]
        local to = parts[4]

        if from == nil or to == nil then return false, "Invalid mission parameters." end

        return Bomber.dispatch(markCoalition, from, to)
    end
}