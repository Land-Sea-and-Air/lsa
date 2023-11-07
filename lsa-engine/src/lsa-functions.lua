-- Convert a Vec3 {x,y,z} into a Vec2 {x,y}
---@param vec3 table
---@return table
function ToVec2(vec3)
    assert(type(vec3.x) ~= "table" and type(vec3.y) ~= "table", "Vec3 is not a 3 dimensional table")
    return { x = vec3.x, y = vec3.z }
end

-- Convert a Vec2 {x,y} into a Vec3 {x,y,z}
---@param vec2 table
---@return table
function ToVec3(vec2)
    local height = land.getHeight({ x = vec2.x, y = vec2.y })
    return { x = vec2.x, y = height, z = vec2.y }
end

---Prints a table in the log.
---@param t table
---@return string|nil
function Dump(t)
    Serializer.block(t)
end

---Checks if the given file exists.
---@param filePath string
---@return boolean
function FileExists(filePath)
    local f = io.open(filePath, "rb")
    if f then
        f:close()
    end
    return f ~= nil
end

---Reads the file from the path.
---@param filePath any
---@return nil
function ReadFile(filePath)
    local file = io.open(filePath, "rb")
    -- r read mode and b binary mode
    if not file then
        return nil
    end
    local content = file:read "*a" -- *a or *all reads the whole file
    file:close()
    return content
end

---Writes the given contents to the file.
---@param filePath string
---@param contents string
function WriteFile(filePath, contents)
    local file = io.open(filePath, "w")
    if file then
        file:write(contents)
        file:close()
    end
end

---Determines if a point is inside a circle.
---Source: https://math.stackexchange.com/questions/198764/how-to-know-if-a-point-is-inside-a-circle
---@param point table
---@param circle table
---@return boolean
function IsPointInCircle(point, circle)
    return (point.x - circle.x) ^ 2 + (point.y - circle.y) ^ 2 < circle.radius ^ 2
end

---Returns the distance between two points (in meters).
---@param point1 table
---@param point2 table
---@return number
function Distance(point1, point2)
    return math.sqrt((point1.x - point2.x) ^ 2 + (point1.y - point2.y) ^ 2)
end

---Rounds a number to the nearest.
---Source: https://stackoverflow.com/questions/18313171/lua-rounding-numbers-and-then-truncate
---@param num number
---@return number
function Round(num)
    return num + (2 ^ 52 + 2 ^ 51) - (2 ^ 52 + 2 ^ 51)
end

---Returns how many digits are in a number.
---Source: https://devforum.roblox.com/t/best-way-to-find-how-many-digits-in-a-number/833942
---@param num number
---@return integer
function Digits(num)
    return math.ceil(math.log10(num))
end

---Checks if the text starts with the given token.
---@param text string
---@param token string
---@return boolean
function StartsWith(text, token)
    if text == nil or token == nil then return false end
    if #text == 0 or #token == 0 then return false end

    return string.sub(text, 1, #token) == token
end

---Check if a point is inside a polygon.
-- By Pedro Gimeno, donated to the public domain
---@param x number
---@param y number
---@param poly table
---@return boolean
function InPolygon(x, y, poly)
    -- poly is a Lua list of pairs like {x1, y1, x2, y2, ... xn, yn}
    local x1, y1, x2, y2
    local len = #poly
    x2, y2 = poly[len - 1], poly[len]
    local wn = 0
    for idx = 1, len, 2 do
        x1, y1 = x2, y2
        x2, y2 = poly[idx], poly[idx + 1]

        if y1 > y then
            if (y2 <= y) and (x1 - x) * (y2 - y) < (x2 - x) * (y1 - y) then
                wn = wn + 1
            end
        else
            if (y2 > y) and (x1 - x) * (y2 - y) > (x2 - x) * (y1 - y) then
                wn = wn - 1
            end
        end
    end
    return wn % 2 ~= 0 -- even/odd rule
end

---Checks if two strings are equal (case-insensitive).
---@param s1 string
---@param s2 string
---@return boolean
function AreEqual(s1, s2)
    return string.lower(s1 or "") == string.lower(s2 or "")
end

---Checks if a value is in a given list.
---@param token any
---@param list any
---@return boolean
function In(token, list)
    for _, value in pairs(list) do
        if string.lower(value or "") == string.lower(token or "") then
            return true
        end
    end
    return false
end

---Returns the arguments joined by a dash.
---@param ... any
---@return string
function Dashed(...)
    return table.concat({ ... }, "-")
end

-- Copies a lua table.
-- Source: https://stackoverflow.com/questions/53990332/how-to-get-an-actual-copy-of-a-table-in-lua
---@param orig table
---@return table
function DeepCopy(orig)
    local orig_type = type(orig)
    local copy
    if orig_type == "table" then
        copy = {}
        for orig_key, orig_value in next, orig, nil do
            copy[DeepCopy(orig_key)] = DeepCopy(orig_value)
        end
        setmetatable(copy, DeepCopy(getmetatable(orig)))
    else -- number, string, boolean, etc
        copy = orig
    end
    return copy
end

---Returns the index of the last given character.
---@param text string
---@param character string
---@return integer
function LastIndexOf(text, character)
    return string.match(text, "^.*()%" .. character)
end

---Returns the angle between two points.
---@param point1 table
---@param point2 table
---@return integer
function Angle(point1, point2)
    local dy = point2.y - point1.y
    local dx = point2.x - point1.x
    local theta = math.atan2(dy, dx)
    local degree = math.deg(theta)

    if degree < 0 then
        return math.floor(360 + degree)
    end

    return math.floor(degree)
end