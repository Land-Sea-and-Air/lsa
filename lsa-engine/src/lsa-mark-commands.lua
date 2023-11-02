MarkCommands = {}

---Checks if the given text is a mark command.
---@param event unknown
---@return boolean
function MarkCommands.isCommand(event)
    local text = string.lower(event.text or "")
    return StartsWith(text, "-cmd")
end

---Sends a message to the player.
---@param event unknown
---@param message string
function MarkCommands.__send(event, message)
    if event.initiator ~= nil then
        local playerName = event.initiator:getPlayerName()
        if playerName == nil then return end

        local info = Player.getInfoByName(playerName)
        if info == nil then return end

        -- [REVIEW] switch to simple message? chat will probably be missed
        net.send_chat_to(message, info.id)
    end
end

---Runs the command
---@param event unknown
function MarkCommands.run(event)
    local idx = event.idx
    local text = event.text
    if text == nil or #text == 0 then return end

    local parts = LSA.tokens(text, "%S+")
    local commandName = parts[2]

    local command = MarkCommands.getCommand(commandName)
    if command == nil then return end

    local success, message = command(event, parts)
    if message ~= nil and #message > 0 then
        Log.debug(message)
        MarkCommands.__send(event, message)
    end
    if success then
        trigger.action.removeMark(idx)
    end
end

function MarkCommands.getCommand(commandName)
    if MarkCommands.commands == nil or MarkCommands.devCommands == nil then
        MarkCommands.__commands()
    end
    local command = MarkCommands.commands[commandName]
    if command == nil and LSA.dev then
        command = MarkCommands.devCommands[commandName]
    end
    return command
end

function MarkCommands.__commands()
    MarkCommands.commands = {
        [CarrierWaypointCommand.name] = CarrierWaypointCommand.handler,
        [ArmorWaypointCommand.name] = ArmorWaypointCommand.handler,
        [TankerCommand.name] = TankerCommand.handler,
        [TankerWaypointCommand.name] = TankerWaypointCommand.handler,
        [AwacsCommand.name] = AwacsCommand.handler,
        [AwacsWaypointCommand.name] = AwacsWaypointCommand.handler,
        [BomberCommand.name] = BomberCommand.handler,
        [SetLaserCodeCommand.name] = SetLaserCodeCommand.handler
    }
    MarkCommands.devCommands = {
        [RemovePilotDevCommand.name] = RemovePilotDevCommand.handler,
        [ExplodeGroupDevCommand.name] = ExplodeGroupDevCommand.handler,
        [ExplodeUnitDevCommand.name] = ExplodeUnitDevCommand.handler,
        [ExplodeStaticDevCommand.name] = ExplodeStaticDevCommand.handler,
        [SpawnDevCommand.name] = SpawnDevCommand.handler,
        [BaseStrengthDevCommand.name] = BaseStrengthDevCommand.handler,
        [BaseCaptureDevCommand.name] = BaseCaptureDevCommand.handler,
        [BaseRepairsDevCommand.name] = BaseRepairsDevCommand.handler
    }
end