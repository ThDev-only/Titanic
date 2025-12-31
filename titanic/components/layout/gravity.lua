Gravity = {}
Gravity.__index = Gravity

local orientation = {}
local obj

function Gravity:right()
    if not self.obj then
        obj = setmetatable({}, Gravity)
    end

    obj.orientation[#obj.orientation+1] = "right"

    return obj
end

function Gravity:bottom()
    if not self.obj then
        obj = setmetatable({}, Gravity)
    end

    obj.orientation[#obj.orientation+1] = "bottom"

    return obj
end

function Gravity:center()
    if not self.obj then
        obj = setmetatable({}, Gravity)
    end

    obj.orientation[#obj.orientation+1] = "center"

    return obj
end

function Gravity:left()
    if not self.obj then
        obj = setmetatable({}, Gravity)
    end

    obj.orientation[#obj.orientation+1] = "left"

    return obj
end

function Gravity:top()
    if not self.obj then
        obj = setmetatable({}, Gravity)
    end

    obj.orientation[#obj.orientation+1] = "top"

    return obj
end
return Gravity