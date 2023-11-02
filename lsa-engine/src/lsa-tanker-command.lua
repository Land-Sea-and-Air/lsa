TankerCommand = {
    name = "tanker",
    ---Handles tanker command.
    ---@param event unknown
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function (event, parts)
        local markPosition = ToVec2(event.pos)
        local markCoalition = event.coalition

        local from = parts[3]
        if from == nil then return false, "Invalid origin." end

        local method = parts[4]
        if method == nil or not In(method, {"basket", "boom"}) then return false, "Invalid refuel method." end

        local track = tonumber(parts[5])
        if track == nil or track < 0 or track > 360 then return false, "Invalid track." end

        local destination = markPosition
        return Tanker.dispatch(markCoalition, from, destination, method, track)
    end
}
