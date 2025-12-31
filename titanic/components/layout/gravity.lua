Gravity = {}
Gravity.__index = Gravity

local orientation = {}

local function make(list)
    return setmetatable(
        { orientation = list or {} }
    , Gravity)
end

function Gravity:_and(value)
    local new = {}
    for i, v in ipairs(self.orientation) do
        new[i] = v
    end
    new[#new + 1] = value

    return make(new)
end

function Gravity:top()
    if self == Gravity then
        return make({"top"})
    end
    return self:_and("top")
end

function Gravity:bottom()
    if self == Gravity then
        return make({"bottom"})
    end
    return self:_and("bottom")
end

function Gravity:left()
    if self == Gravity then
        return make({"left"})
    end
    return self:_and("left")
end

function Gravity:right()
    if self == Gravity then
        return make({"right"})
    end
    return self:_and("right")
end

function Gravity:center()
    if self == Gravity then
        return make({"center"})
    end
    return self:_and("center")
end

return Gravity