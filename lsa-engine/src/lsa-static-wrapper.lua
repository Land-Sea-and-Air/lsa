StaticWrp = {}

---Creates a new instance of StaticWrp.
---@param name string
---@param type string
---@param location table
---@param heading number
---@param baseName string
---@param side number
---@param role string
---@return table
function StaticWrp.new(name, type, location, heading, baseName, side, role)
    local static = {
        name = name,
        type = type,
        location = location,
        heading = heading,
        baseName = baseName,
        side = side,
        role = role or "static",
        killedOn = nil
    }

    return static
end

function StaticWrp.__scheme(static)
    return LSA.schemeStatic2(static.name, static.type, static.location, static.heading)
end

function StaticWrp.isDead(static)
    if static == nil then return false end
    return static.killedOn ~= nil
end

function StaticWrp.isAlive(static)
    if static == nil then return false end
    return static.killedOn == nil
end

function StaticWrp.isRepairs(static)
    if static == nil then return false end
    return static.role == "repairs"
end

function StaticWrp.kill(static)
    static.killedOn = Now()
end

function StaticWrp.spawn(static)
    if StaticWrp.isDead(static) then return end

    local scheme = StaticWrp.__scheme(static)
    LSA.spawnStatic2(scheme, static.side)

    RefStatics.new(static.name, static)
end

function StaticWrp.repair(static)
    if static == nil then return end

    if StaticWrp.isDead(static) then
        local scheme = StaticWrp.__scheme(static)
        LSA.clearAndSpawnStatic(scheme, static.side)
        static.killedOn = nil
    end
end

function StaticWrp.onLostStatic(event)
    local staticName = event.initiator:getName()
    local static = RefStatics.get(staticName)
    if static ~= nil then
        StaticWrp.kill(static)
    end
end

function StaticWrp.onHit(event)
    local staticName = event.target:getName()
    local static = RefStatics.get(staticName)
    if static == nil then return end

    local base = Base.find(static.baseName)
    if base ~= nil then
        Base.attacked(base, event.time)
    end
end

---Returns true if the static is a logistics building.
---@param static table
---@return boolean
function StaticWrp.isLogistics(static)
    if static == nil then return false end
    return static.role == "logistics"
end

---Returns the side of the static.
---@param static table
---@return number|nil
function StaticWrp.getSide(static)
    if static == nil then return nil end
    return static.side
end