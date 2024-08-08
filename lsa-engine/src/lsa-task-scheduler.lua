--- Task Scheduler
TS = {}

TS.taskId = 1
TS.countTasks = 0
TS.tasksById = {}
TS.tasksByName = {}

---Schedules a new task.
---@param name string
---@param fn function
---@param args table|nil
---@param delay number|nil
---@return integer
function TS.task(name, fn, args, delay)
    delay = delay or 1

    local taskName = string.format("%s (%s)", name, TS.taskId)
    local m = string.format("Task '%s' will be scheduled to run every %s second(s)", taskName, delay)
    Log.debug(m)


    local function dispatcher(_a, _time)
        local _name, _fn, _args = unpack(_a)
        local startTime = os.clock()
        local r = _fn(_args, _time)
        local endTime = os.clock()
        Log.info("Task %s took %s", _name, (endTime - startTime))
        if r == nil then
            TS.countTasks = TS.countTasks - 1
            local taskId = TS.tasksByName[_name]
            TS.tasksById[taskId] = nil
            TS.tasksByName[_name] = nil
            Log.trace("Task '%s' is finished", _name)
        end
        return r
    end

    local timerArgs = { taskName, fn, args }
    local timerDelay = timer.getTime() + delay
    local id = timer.scheduleFunction(dispatcher, timerArgs, timerDelay)

    TS.countTasks = TS.countTasks + 1
    TS.taskId = TS.taskId + 1
    TS.tasksById[id] = taskName
    TS.tasksByName[taskName] = id
    return id
end

function TS.stop(taskId)
    pcall(timer.removeFunction, taskId)
    TS.countTasks = TS.countTasks - 1
    local taskName = TS.tasksById[taskId]
    if taskName == nil then return end
    TS.tasksById[taskId] = nil
    TS.tasksByName[taskName] = nil
    Log.debug(string.format("Task '%s' has been removed", taskName))
end

function TS.show()
    trigger.action.outText("Total Scheduled Tasks: " .. TS.countTasks, 10, true)
    for _, taskName in pairs(TS.tasksById) do
        trigger.action.outText("Task: " .. taskName, 10)
    end
end