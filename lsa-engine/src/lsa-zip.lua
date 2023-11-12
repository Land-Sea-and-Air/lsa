Zip = {}

function Zip.extract(archive, fileName)
    local cmd = string.format("cd %s & 7za.exe x %s %s", LSA.settings.path, archive, fileName)
    Log.debug("Executing command: %s", cmd)
    os.execute(cmd)
end

function Zip.archive(archive, fileName)
    local cmd = string.format("cd %s & 7za.exe a %s %s", LSA.settings.path, archive, fileName)
    Log.debug("Executing command: %s", cmd)
    os.execute(cmd)
end