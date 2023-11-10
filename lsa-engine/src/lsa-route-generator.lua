RouteGenerator = {}

function RouteGenerator.getIngressPoint(target, speed, altitude)
    local offset = { distance = 40000, angle = 285 }
    local point = LSA.newPos(target, offset)

    return LSA.getWaypoint(point, speed, altitude)
end

function RouteGenerator.getEgressPoint(target, speed, altitude)
    local offset = { distance = 40000, angle = 075 }
    local point = LSA.newPos(target, offset)

    return RouteGenerator.getWaypoint(point, speed, altitude)
end

function RouteGenerator.getAttackPoint(target, speed, altitude)
    return LSA.getWaypoint(target, speed, altitude)
end

function RouteGenerator.getLandRunwayPoint(airdromeId, airdromeLocation, speed, altitude)
    return {
        ["alt"] = altitude,
        ["action"] = "Landing",
        ["alt_type"] = "BARO",
        ["speed"] = speed,
        ["task"] =
        {
            ["id"] = "ComboTask",
            ["params"] =
            {
                ["tasks"] =
                {
                },
            },
        },
        ["type"] = "Land",
        ["ETA"] = 0,
        ["ETA_locked"] = false,
        ["y"] = airdromeLocation.y,
        ["x"] = airdromeLocation.x,
        ["formation_template"] = "",
        ["airdromeId"] = airdromeId,
        ["speed_locked"] = true,
    }
end

function RouteGenerator.getDeparturePoint(airdromeLocation, speed, altitude)
    local offset = { distance = 30000, angle = 270 }
    local point = LSA.newPos(airdromeLocation, offset)

    return LSA.getWaypoint(point, speed, altitude)
end

function RouteGenerator.getApproachPoint(airdromeLocation, speed, altitude)
    local offset = { distance = 30000, angle = 090 }
    local point = LSA.newPos(airdromeLocation, offset)

    return LSA.getWaypoint(point, speed, altitude)
end

function RouteGenerator.getDescentPoint(approachPoint, speed, altitude)
    local offset = { distance = 50000, angle = 180 }
    local point = LSA.newPos(approachPoint, offset)

    return LSA.getWaypoint(point, speed, altitude)
end

function RouteGenerator.getWaypoint(point, speed, altitude)
    return {
        ["alt"] = altitude,
        ["action"] = "Turning Point",
        ["alt_type"] = "BARO",
        ["speed"] = LSA.kmhToMps(speed),
        ["task"] =
        {
            ["id"] = "ComboTask",
            ["params"] =
            {
                ["tasks"] =
                {
                },
            },
        },
        ["type"] = "Turning Point",
        ["ETA"] = 0,
        ["ETA_locked"] = false,
        ["y"] = point.y,
        ["x"] = point.x,
        ["formation_template"] = "",
        ["speed_locked"] = true,
    }
end

function RouteGenerator.getTakeoffPoint(airdromeId, parkingLocation)
    return {
        ["alt"] = land.getHeight(parkingLocation),
        ["action"] = "From Parking Area",
        ["alt_type"] = "BARO",
        ["speed"] = 0,
        ["task"] = {
            ["id"] = "ComboTask",
            ["params"] =
            {
                ["tasks"] =
                {
                },
            },
        },
        ["type"] = "TakeOffParking",
        ["ETA"] = 0,
        ["ETA_locked"] = true,
        ["y"] = parkingLocation.y,
        ["x"] = parkingLocation.x,
        ["formation_template"] = "",
        ["airdromeId"] = airdromeId,
        ["speed_locked"] = true,
    }
end

function RouteGenerator.getComboTask(tasks)
    tasks = tasks or {}
    return {
        ["id"] = "ComboTask",
        ["params"] =
        {
            ["tasks"] = tasks,
        },
    }
end

function RouteGenerator.getTankerTask()
    return {
        ["id"] = "Tanker",
        ["enabled"] = true,
        ["params"] =
        {
        },
    }
end

function RouteGenerator.getAwacsTask()
    return
    {
        ["enabled"] = true,
        ["id"] = "AWACS",
        ["params"] =
        {
        },
    }
end