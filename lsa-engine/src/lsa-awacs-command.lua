AwacsCommand = {
    name = "awacs",
    ---Handles awacs command.
    ---@param event unknown
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function (event, parts)
        local markPosition = ToVec2(event.pos)
        local markCoalition = event.coalition

        local from = parts[3]
        if from == nil then return false, "Invalid origin." end

        local track = tonumber(parts[4])
        if track == nil or track < 0 or track > 360 then return false, "Invalid track." end

        local destination = markPosition
        return Awacs.dispatch(markCoalition, from, destination, track)
    end
}
