local ssb = {}

ssb.controlNonAircraftSlots = false -- if true, only unique DCS Player ids will be allowed for the Commander / GCI / Observer Slots
ssb.checkPlayerLivesFeature = true  -- check if the player has remaining lives to enter the slot
ssb.checkPlayerSideFeature = true   -- check if the player belongs to the same coalition of the slot he is trying to select
ssb.checkClanSlotFeature = false    -- check if a slot belongs to a clan
ssb.kickPlayers = true              -- Change to false if you want to disable to kick players.
ssb.kickTimeInterval = 1            -- Change the amount of seconds if you want to shorten the interval time or make the interval time longer.
ssb.kickReset = true                -- The slot will be automatically reset to open, after kicking the player.
ssb.kickTimePrev = 0                -- leave this untouched!


-- The key of the user flag that contains the value to check.
-- Note that to the key a -<ucid> will be added, since this value is per player.
ssb.playerSideKey = "lsa-side"

-- The key of the user flag that contains the value to check.
-- Note that to the key a -<ucid> will be added, since this value is per player.
ssb.playerLivesKey = "lsa-lives"

-- If you set this to 0, all slots are ENABLED
-- by default as every flag starts at 0.
-- If you set this to anything other than 0 all slots
-- will be DISABLED BY DEFAULT!!!
-- Each slot will then have to be manually enabled via
-- trigger.action.setUserFlag("GROUP_NAME",100)
-- where GROUP_NAME is the group name (not pilot name) and 100 is the value you're setting the flag too which must
-- match the enabledFlagValue
ssb.enabledFlagValue = 0 -- what value to look for to enable a slot.


-- any aircraft slot controlled by the GROUP Name (not pilot name!)
-- that contains a prefix below will only allow players with that prefix
-- to join the slot
--
-- NOTE: the player prefix must match exactly including case
-- The examples below can be turned on by removing the -- in front
-- ssb.prefixes = {
--   -- "-=104th=-",
--   -- "-=VSAAF=-",
--   -- "ciribob", -- you could also add in an actual player name instead
--   "some_clan_tag",
--   "-=AnotherClan=-",
-- }
ssb.prefixes = {}


-- any NON aircraft slot eg JTAC / GCI / GAME COMMANDER
-- will only allow certain PLAYER IDS
-- PLAYER IDS are unique DCS ids that can't be changed or spoofed
-- This script will output them when a player changes slots so you can copy them out easily :)
-- This will only take effect if: ssb.controlNonAircraftSlots = true
-- ssb.commanderPlayerUCID = {
--   "292d911c1b6f631476795cb80fd93b1f",
--   "some_unique_player_ucid",
-- }
ssb.commanderPlayerUCID = {}


-- add UCID of Players to this list that you want to permanently block from all slots (slot flags do not matter)
-- ssb.blockedList = {
--   "a_unique_player_ucid",
--   "another_unique_player_ucid"
-- }
ssb.blockedList = {}

ssb.version = "1.4"


function ssb.isBlocked(_ucid, _playerName, _slotID)
    for _, _value in pairs(ssb.blockedList) do -- added check for blocked player UCIDs (added by mobettameta)
        if _value == _ucid then
            ssb.log("Player blocked - Name: %s, Ucid: %s, Slot: %s", _playerName, _ucid, _slotID)
            return true
        end
    end
    return false
end

-- Logic for determining if player is allowed in a slot
function ssb.shouldAllowAircraftSlot(_playerID, _slotID) -- _slotID == Unit ID unless its multi aircraft in which case slotID is unitId_seatID
    local _playerName = net.get_player_info(_playerID, 'name')
    local _ucid = net.get_player_info(_playerID, 'ucid')

    if ssb.isBlocked(_ucid, _playerName, _slotID) then
        return false, "You are blocked."
    end

    local _groupName = ssb.getGroupName(_slotID)
    if _groupName == nil then return true end

    -- check if it is a clan slot
    if ssb.checkClanSlotFeature and not ssb.checkClanSlot(_playerID, _groupName) then
        return false, "You don't belong to this clan."
    end

    if ssb.checkPlayerSideFeature then
        local success, message = ssb.checkPlayerSide(_ucid, _slotID)
        if not success then
            return false, message
        end
    end

    -- check if a player still has lives
    if ssb.checkPlayerLivesFeature and not ssb.checkPlayerLives(_ucid) then
        return false, "You don't have enough lives."
    end

    -- check flag value
    local _flag = ssb.getFlagValue(_groupName)

    if _flag == ssb.enabledFlagValue then
        return true, ""
    end

    return false, "Base is not under your coalition control."
end

function ssb.onPlayerTrySendChat(playerId, message, all)
    local ucid = net.get_player_info(playerId, 'ucid')

    if string.lower(message) == "-red" then
        local key = string.format("%s-%s", ssb.playerSideKey, ucid)
        local currentSide = ssb.getUserFlagValue(key)
        if currentSide == ssb.PlayerSides.red then
            net.send_chat_to("You have already selected a side.", playerId)
            return ""
        end
        if currentSide == ssb.PlayerSides.blue then
            net.send_chat_to("You cannot change sides.", playerId)
            return ""
        end

        ssb.setUserFlagValue(key, ssb.PlayerSides.red)
        net.send_chat_to("You are now able to select red slots.", playerId)
        return ""
    end

    if string.lower(message) == "-blue" then
        local key = string.format("%s-%s", ssb.playerSideKey, ucid)
        local currentSide = ssb.getUserFlagValue(key)
        if currentSide == ssb.PlayerSides.blue then
            net.send_chat_to("You have already selected a side.", playerId)
            return ""
        end
        if currentSide == ssb.PlayerSides.red then
            net.send_chat_to("You cannot change sides.", playerId)
            return ""
        end

        ssb.setUserFlagValue(key, ssb.PlayerSides.blue)
        net.send_chat_to("You are now able to select blue slots.", playerId)
        return ""
    end

    if string.lower(message) == "-lives" then
        local key = string.format("%s-%s", ssb.playerLivesKey, ucid)
        local lives = ssb.getUserFlagValue(key)
        local text = string.format("You have %s lives.", lives)
        net.send_chat_to(text, playerId)
        return ""
    end

    if string.lower(message) == "-time" then
        local finish = ssb.getUserFlagValue("lsa-end-mission")
        local t = finish - os.time()
        local h, r1 = math.modf(t / 3600)
        local m, r2 = math.modf(r1 * 60)
        local s = math.floor(r2 * 60)
        local text = string.format("Mission will end in %02d:%02d:%02d", h, m, s)
        net.send_chat_to(text, playerId)
        return ""
    end
end

ssb.PlayerSides = {
    neutral = 0,
    red = 1,
    blue = 2,
}

function ssb.checkPlayerSide(_ucid, _slotID)
    local unitCoalition = DCS.getUnitProperty(_slotID, DCS.UNIT_COALITION)
    if unitCoalition == "unknown" then
        return false, "Could not determine the unit coalition."
    end

    local slotSide = ssb.PlayerSides.red
    if unitCoalition == "blue" then
        slotSide = ssb.PlayerSides.blue
    end

    local key = string.format("%s-%s", ssb.playerSideKey, _ucid)
    local playerSide = ssb.getUserFlagValue(key)

    if playerSide == ssb.PlayerSides.neutral then
        return false, "Please select a side by typing -red or -blue in the chat."
    end

    if slotSide ~= playerSide then
        return false, "You cannot select a slot that belongs to the other side."
    end

    return true
end

function ssb.checkPlayerLives(_ucid)
    local key = string.format("%s-%s", ssb.playerLivesKey, _ucid)
    local lives = ssb.getUserFlagValue(key) or 0

    if lives < 1 then
        return false
    end

    return true
end

function ssb.getUserFlagValue(key)
    local cmd = string.format(" return trigger.misc.getUserFlag(\"%s\"); ", key)
    local value, error = net.dostring_in('server', cmd)

    if not value and error then
        local msg = string.format("Unable to retrieve user flag '%s': %s", key, error)
        net.log(msg)
    end

    if value == nil then return nil end
    return tonumber(value)
end

function ssb.setUserFlagValue(key, value)
    local cmd = string.format(" return trigger.action.setUserFlag(\"%s\", %s); ", key, value)
    net.dostring_in('server', cmd)
end

-- Logic to allow a player in a slot
function ssb.allowAircraftSlot(_playerID, _slotID) -- _slotID == Unit ID unless its multi aircraft in which case slotID is unitId_seatID (added by FlightControl)
    local _groupName = ssb.getGroupName(_slotID)
    if _groupName == nil then return true end

    if ssb.checkClanSlotFeature and not ssb.checkClanSlot(_playerID, _groupName) then
        return false
    end

    -- check flag value
    return ssb.setFlagValue(_groupName, 0)
end

function ssb.checkClanSlot(_playerID, _unitName)
    for _, _value in pairs(ssb.prefixes) do
        if string.find(_unitName, _value, 1, true) ~= nil then
            net.log("SSB - " .. _unitName .. " is clan slot for " .. _value)

            local _playerName = net.get_player_info(_playerID, 'name')

            if _playerName ~= nil and string.find(_playerName, _value, 1, true) then
                net.log("SSB - " ..
                    _playerName .. " is clan member for " .. _value .. " for " .. _unitName .. " Allowing so far")
                --passed clan test, carry on!
                return true
            end

            if _playerName ~= nil then
                net.log("SSB - " ..
                    _playerName .. " is NOT clan member for " .. _value .. " for " .. _unitName .. " Rejecting")
            end

            -- clan tag didn't match, quit!
            return false
        end
    end

    return true
end

function ssb.getFlagValue(_flag)
    local _status, _error = net.dostring_in('server', " return trigger.misc.getUserFlag(\"" .. _flag .. "\"); ")

    if not _status and _error then
        net.log("SSB - error getting flag: " .. _error)
        return tonumber(ssb.enabledFlagValue)
    else
        --disabled
        return tonumber(_status)
    end
end

function ssb.setFlagValue(_flag, _number) -- Added by FlightControl
    local _status, _error = net.dostring_in('server',
        " return trigger.action.setUserFlag(\"" .. _flag .. "\", " .. _number .. "); ")

    if not _status and _error then
        net.log("SSB - error setting flag: " .. _error)
        return false
    end
    return true
end

function ssb.split(text, delimiter)
    local tokens = {}
    for token in string.gmatch(text, "[^" .. delimiter .. "]+") do
        table.insert(tokens, token)
    end
    return tokens
end

function ssb.getGroupName(_slotID)
    _slotID = string.gsub(_slotID, "%-%d$", "")
    local parts = ssb.split(_slotID, "_")
    local unitId = parts[1]
    local seatNr = parts[2]

    local _name = DCS.getUnitProperty(unitId, DCS.UNIT_GROUPNAME)

    if _name ~= nil and _name ~= "" then
        return ssb.trim(_name)
    end

    net.log("SSB - Unable to get group name for slot " .. _slotID)
    return nil
end

--- Reset the persistent variables when a new mission is loaded.
function ssb.onMissionLoadEnd()
    ssb.kickTimePrev = 0 -- Reset when a new mission has been loaded!
end

--- For each simulation frame, check if a player needs to be kicked.
function ssb.onSimulationFrame()
    if not DCS.isServer() or not DCS.isMultiplayer() then return end
    if DCS.getModelTime() <= 1 then return end -- must check this to prevent a possible CTD by using a_do_script before the game is ready to use a_do_script. -- Source GRIMES :)
    if not ssb.slotBlockEnabled() then return end

    if not ssb.kickPlayers then return end

    -- For each slot, check the flags...
    ssb.kickTimeNow = DCS.getModelTime()

    -- Check every 5 seconds if a player needs to be kicked.
    if ssb.kickTimePrev + ssb.kickTimeInterval <= ssb.kickTimeNow then
        ssb.kickTimePrev = ssb.kickTimeNow
        local Players = net.get_player_list()
        for _, playerID in pairs(Players) do
            -- is player still in a valid slot
            local _playerDetails = net.get_player_info(playerID)

            if ssb.isPlayerInValidSlot(_playerDetails) then
                local _unitRole = DCS.getUnitType(_playerDetails.slot)
                if ssb.isNonAircraftSlot(_unitRole) then
                    return true
                end

                local _allow = true
                local _reason = ""
                if ssb.isBlocked(_playerDetails.ucid, _playerDetails.name, _playerDetails.slot) then
                    _allow = false
                    _reason = "You are blocked."
                end

                if not _allow then
                    ssb.rejectPlayer(playerID, _reason)
                    if ssb.kickReset then
                        ssb.allowAircraftSlot(playerID, _playerDetails.slot)
                    end
                end
            end
        end
    end
end

function ssb.isPlayerInValidSlot(_playerDetails)
    return _playerDetails ~= nil and _playerDetails.side ~= 0 and _playerDetails.slot ~= "" and
        _playerDetails.slot ~= nil
end

function ssb.onPlayerTryChangeSlot(playerID, side, slotID)
    if not DCS.isServer() or not DCS.isMultiplayer() then return end
    if not ssb.slotBlockEnabled() then return end
    if side == 0 then return end
    if slotID == nil then return end
    if slotID == '' then return end

    local _ucid = net.get_player_info(playerID, 'ucid')
    local _playerName = net.get_player_info(playerID, 'name') or ""
    local _unitRole = DCS.getUnitType(slotID)

    local _allow = true
    local _reason = nil

    if ssb.isNonAircraftSlot(_unitRole) then
        _allow, _reason = ssb.onNonAircraftSlot(playerID, _playerName, side, slotID, _ucid, _unitRole)
    else
        _allow, _reason = ssb.onAircraftSlot(playerID, _playerName, side, slotID, _ucid)
    end

    if not _allow then
        ssb.rejectMessage(playerID, _reason)
        return false
    end

    -- do not return true if success
    -- returning nothing is the correct way to inform DCS that this passed
end

function ssb.isNonAircraftSlot(_unitRole)
    return _unitRole ~= nil and
        (_unitRole == "forward_observer"
            or _unitRole == "instructor"
            or _unitRole == "artillery_commander"
            or _unitRole == "observer")
end

function ssb.onAircraftSlot(playerID, _playerName, side, slotID, _ucid)
    ssb.log("Player selected slot - Player: %s, Side: %s, Slot: %s, Ucid: %s", _playerName, side, slotID, _ucid)
    local _allow, _reason = ssb.shouldAllowAircraftSlot(playerID, slotID)

    if _allow then
        ssb.log("Slot allowed - Player: %s, Side: %s, Slot: %s, Ucid: %s", _playerName, side, slotID, _ucid)
        return true
    end

    ssb.log(
        "Slot rejected - Player: %s, Side: %s, Slot: %s, Ucid: %s, Reason: %s",
        _playerName, side, slotID, _ucid, _reason)

    ssb.rejectMessage(playerID, _reason)
    return false
end

function ssb.onNonAircraftSlot(playerID, _playerName, side, slotID, _ucid, _unitRole)
    ssb.log(
        "Player selected non-aircraft slot - Player: %s, Side: %s, Slot: %s, Ucid: %s, Type: %s",
        _playerName, side, slotID, _ucid, _unitRole)

    local _allow = false

    if ssb.controlNonAircraftSlots then
        for _, _value in pairs(ssb.commanderPlayerUCID) do
            if _value == _ucid then
                _allow = true
                break
            end
        end

        if not _allow then
            ssb.log(
                "Rejecting non-aircraft slot - Player: %s, Side: %s, Slot: %s, Ucid: %s, Type: %s",
                _playerName, side, slotID, _ucid, _unitRole)

            return false, "You are not authorized to access this role"
        end
    end

    -- check if a player still has lives
    if ssb.checkPlayerLivesFeature and not ssb.checkPlayerLives(_ucid) then
        ssb.log(
            "Rejecting non-aircraft slot - Player: %s, Side: %s, Slot: %s, Ucid: %s, Type: %s, Reason: %s",
            _playerName, side, slotID, _ucid, _unitRole, "You don't have enough lives.")
        return false, "You don't have enough lives."
    end

    if ssb.checkPlayerSideFeature then
        local success, message = ssb.checkPlayerSide(_ucid, slotID)
        if not success then
            ssb.log(
                "Rejecting non-aircraft slot - Player: %s, Side: %s, Slot: %s, Ucid: %s, Type: %s, Reason: %s",
                _playerName, side, slotID, _ucid, _unitRole, message)
            return false, message
        end
    end

    ssb.log(
        "Allowed non-aircraft slot - Player: %s, Side: %s, Slot: %s, Ucid: %s, Type: %s",
        _playerName, side, slotID, _ucid, _unitRole)
    return true
end

function ssb.slotBlockEnabled()
    local _res = ssb.getFlagValue("SSB") --SSB disabled by Default

    return _res == 100
end

function ssb.rejectMessage(playerID, _reason)
    net.send_chat_to(_reason, playerID)
end

function ssb.rejectPlayer(playerID, _reason)
    net.log("SSB - REJECTING Slot - force spectators - " .. playerID)

    -- put to spectators
    net.force_player_slot(playerID, 0, '')

    ssb.rejectMessage(playerID, _reason)
end

function ssb.trim(_str)
    return string.format("%s", _str:match("^%s*(.-)%s*$"))
end

function ssb.log(s, ...)
    local args = { ... }
    local text = string.format(s, unpack(args))
    net.log(text)
end

DCS.setUserCallbacks(ssb)

net.log("Loaded - SIMPLE SLOT BLOCK v" .. ssb.version .. " by Ciribob")