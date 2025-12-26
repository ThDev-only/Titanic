Button = {}
Button.__index = Button

local Text = require("titanic.components.text.widget.text")
local text
local width, height
local _background

function Button:new(text, width, height, x, y)
    local obj = setmetatable({}, Button)
    obj.width = width or 100
    obj.height = height or 50
    obj.text = Text:new(obj.width, obj.height, width/2 - 20, height/2 - 10) --for a moment
    obj.text:value(text or "Button")
    obj.x = x or 0
    obj.y = y or 0

    return obj
end

function Button:show()
    --to be implemented
end
return Button