CallsignGenerator = {}

---Generates an aircraft (helicopters too) callsign.
---@param type string
---@return table
function CallsignGenerator.fighterCallsign(type)
    -- at the time of writing, DCS only supports some callsigns
    -- namely flight nr from 1-0 and members from 1-9
    -- NATO callsigns are under the 'callsigns' enumerator
    -- Russian callsigns are 3 digits e.g.: 300, 301

    local callsigns = Callsigns.FighterCallsigns

    local min = 1
    local max = 8

    local specialKey = nil
    for key, _ in pairs(callsigns) do
        if string.find(type, key) ~= nil then
            specialKey = key
            min = 9
            max = #callsigns[specialKey] + 9 - 1
            break
        end
    end

    local callsignNr = math.random(min, max)
    local callsign = nil
    if specialKey == nil then
        callsign = callsigns["default"][callsignNr]
    else
        callsign = callsigns[specialKey][callsignNr]
    end

    local flight = math.random(1, 9)
    local member = math.random(1, 9)

    local name = string.format("%s%s%s", callsign, flight, member)
    return {
        ["name"] = name,
        [1] = callsignNr,
        [2] = flight,
        [3] = member,
    }
end

---Returns a tanker callsign.
---@return table
function CallsignGenerator.tankerCallsign()
    local callsigns = Callsigns.TankerCallsigns

    local callsignNr = math.random(1, #callsigns)
    local callsign = callsigns[callsignNr]
    local flight = math.random(1, 9)
    local member = math.random(1, 9)

    local name = string.format("%s%s%s", callsign, flight, member)
    return {
        ["name"] = name,
        [1] = callsignNr,
        [2] = flight,
        [3] = member,
    }
end

---Returns a bomber callsign.
---@return table
function CallsignGenerator.bomberCallsign(type)
    local callsigns = Callsigns.BomberCallsigns

    local min = 1
    local max = 8

    local specialKey = nil
    for key, _ in pairs(callsigns) do
        if string.find(type, key) ~= nil then
            specialKey = key
            min = 9
            max = #callsigns[specialKey] + 9 - 1
            break
        end
    end

    local callsignNr = math.random(min, max)
    local callsign = nil
    if specialKey == nil then
        callsign = callsigns["default"][callsignNr]
    else
        callsign = callsigns[specialKey][callsignNr]
    end

    local flight = math.random(1, 9)
    local member = math.random(1, 9)

    local name = string.format("%s%s%s", callsign, flight, member)
    return {
        ["name"] = name,
        [1] = callsignNr,
        [2] = flight,
        [3] = member,
    }
end

---Returns a forward air controller (FAC) callsign.
---@return table
function CallsignGenerator.forwardAirControllerCallsign()
    local callsigns = Callsigns.ForwardAirControllerCallsigns

    local callsignNr = math.random(1, #callsigns)
    local callsign = callsigns[callsignNr]
    local number = math.random(1, 9)

    -- for some reason all FAC callsigns in DCS will have a 1 attached at the end
    -- so a Darknight9 becomes Darknight 91
    -- to accomodate this the name will also have the attached 1
    local name = string.format("%s%s1", callsign, number)
    return {
        ["name"] = name,
        ["callsign"] = callsignNr,
        ["number"] = number,
    }
end

---Returns an AWACS callsign.
---@return table
function CallsignGenerator.awacsCallsign()
    local callsigns = Callsigns.AwacsCallsigns

    local callsignNr = math.random(1, #callsigns)
    local callsign = callsigns[callsignNr]
    local flight = math.random(1, 9)
    local member = math.random(1, 9)

    local name = string.format("%s%s%s", callsign, flight, member)
    return {
        ["name"] = name,
        [1] = callsignNr,
        [2] = flight,
        [3] = member,
    }
end