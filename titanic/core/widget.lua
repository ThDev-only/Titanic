Widget = {}
Widget.__index = Widget

local Color = require("titanic.graphics.color")

function Widget:new(attrs)
    local obj = setmetatable({}, self)
    obj.attrs = attrs or {}
    obj.width = attrs.width or 100
    obj.height = attrs.height or 100
    obj.background = attrs.background or Color.black
    obj.x = attrs.x or 0
    obj.y = attrs.y or 0
    obj.model = attrs.model or "widget"
    
    return obj
end

function Widget:setWidth(width)
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