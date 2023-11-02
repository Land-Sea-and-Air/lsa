RefStatics = {
    index = {}
}
function RefStatics.new(staticName, obj)
    RefStatics.index[staticName] = obj
    return RefStatics.index[staticName]
end

---Returns the indexed static by the given name
---@param staticName string
---@return unknown|nil
function RefStatics.get(staticName)
    local static = RefStatics.index[staticName]
    if static == nil then
        Log.debug("Static %s not found in index", staticName)
    end
    
    return static
end

function RefStatics.remove(staticName)
    RefStatics.index[staticName] = nil
end

function RefStatics.count()
    return #RefStatics.index
end