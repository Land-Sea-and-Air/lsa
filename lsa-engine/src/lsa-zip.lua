Zip = {}

---Extracts a file from an archive.
---Must be in the LSA_MISSION_PATH.
---@param archive string
---@param fileName string
function Zip.extract(archive, fileName)
    local cmd = string.format("cd %s & 7za.exe x %s %s -y", LSA.settings.path, archive, fileName)
    Log.debug("Executing command: %s", cmd)
    os.execute(cmd)
end

---Adds the file to the given archive.
---Must be in the LSA_MISSION_PATH.
---@param archive string
---@param fileName string
function Zip.archive(archive, fileName)
    local cmd = string.format("cd %s & 7za.exe a %s %s -y", LSA.settings.path, archive, fileName)
    Log.debug("Executing command: %s", cmd)
    os.execute(cmd)
end