Loader = {}
Loader.path = os.getenv("LSA_MISSION_PATH")

---Loads a file by the name (must be in the LSA_MISSION_PATH).
---@param fileName string
---@return function
function Loader.loadFile(fileName)
    local filePath = string.format("%s\\%s", Loader.path, fileName)
    return Loader.loadFilePath(filePath)
end

---Loads a file from the path given.
---@param filePath string
---@return function
function Loader.loadFilePath(filePath)
    return assert(loadfile(filePath))
end

---Loads a string.
---@param text string
---@return function
function Loader.loadString(text)
    return assert(loadstring(text))
end

---Loads all lua files in the src directory.
function Loader.__loadAll()
    local src = string.format("%s\\%s", Loader.path, "src")
    local ignore = { ["."] = true, [".."] = true, ["lsa-loader.lua"] = true, ["ssb-server.lua"] = true }
    for file in lfs.dir(src) do
        if ignore[file] == nil then
            local filePath = string.format("%s\\%s", src, file)
            if lfs.attributes(filePath, "mode") == "file" then
                Loader.loadFilePath(filePath)()
            end
        end
    end
end

Loader.__loadAll()
LSA.start()