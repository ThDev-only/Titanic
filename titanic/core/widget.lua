Widget = {}
Widget.__index = Widget

function Widget:new(attrs)
    local obj = setmetatable({}, self)
    obj.attrs = attrs or {}
    obj.width = attrs.width or 100
    obj.height = attrs.height or 100
    return obj
end

function WIdget:setWidth(width)
    self.width = width
end

function Widget:setHeight(height)
    self.height = height
end

function Widget:getWidth()
    return self.width
end

function Widget:getHeight()
    return self.height
end

return Widget