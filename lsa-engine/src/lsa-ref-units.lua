RefUnits = {
    index = {}
}

function RefUnits.new(unitName, obj)
    RefUnits.index[unitName] = obj
    return RefUnits.index[unitName]
end

---Returns the indexed unit by the given name
---@param unitName string
---@return unknown|nil
function RefUnits.remove(unitName)
    RefUnits.index[unitName] = nil
end

function RefUnits.get(unitName)
    local unit = RefUnits.index[unitName]
    if unit == nil then
        Log.debug("Unit %s not found in index", unitName)
    end
    return RefUnits.index[unitName]
end

function RefUnits.count()
    return #RefUnits.index
end