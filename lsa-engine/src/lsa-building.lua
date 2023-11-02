Building = {
    suffix = "Buildings",
}

---Creates a new instance of Building.
---@param name string
---@param type string
---@param location table
---@param heading number
---@param baseName string
---@param side number
---@return table
function Building.new(name, type, location, heading, baseName, side)
    local building = {
        name = name,
        type = type,
        location = location,
        heading = heading,
        baseName = baseName,
        killedOn = nil,
        side = side
    }

    return building
end

function Building.__scheme(building)
    return LSA.schemeStatic2(building.name, building.type, building.location, building.heading)
end

function Building.isKilled(building)
    return building.killedOn ~= nil
end

function Building.spawn(building)
    if Building.isKilled(building) then return end

    local scheme = Building.__scheme(building)
    LSA.spawnStatic2(scheme, building.side)

    RefStatics.new(building.name, building)
end