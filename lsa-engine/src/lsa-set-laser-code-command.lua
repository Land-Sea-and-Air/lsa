SetLaserCodeCommand = {
    name = "set-laser-code",
    ---Handles set laser code command.
    ---@param event unknown
    ---@param parts table
    ---@return boolean
    ---@return string
    handler = function(event, parts)
        --[[ -cmd set-laser-code Whiplash41 1688 ]]
        local callsign = parts[3]
        local laserCode = tonumber(parts[4])

        if callsign == nil or #callsign == 0 then return false, "Invalid callsign." end
        if laserCode == nil then return false, "Invalid laser code." end

        local markCoalition = event.coalition
        local fac = FAC.findByCallSign(callsign)
        if fac == nil or fac.side ~= markCoalition then
            Log.debug("Unable, invalid callsign %s", callsign)
            return false, string.format("Unable, invalid callsign %s.", callsign)
        end

        return FAC.setLaserCode(fac, laserCode)
    end
}