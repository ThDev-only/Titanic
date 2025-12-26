local Text = {}
Text.__index = Text

local Font = require("components.text.font")
local text
local _size
local _font
local width, height = 0, 0
local color_rgb
local background
local x,y

function Text:new(width, height, x, y)
    if not width or not height then
        error("Width and Height are required parameters")
    end

    local obj = setmetatable({}, Text)
    obj.width = width
    obj.height = height
    obj.color_rgb = {1,1,1}
    obj._size = 12
    obj._font = tostring(Font.inter)
    love.graphics.setFont(love.graphics.newFont(obj._font, obj._size))

    if x and y then
        obj.x = x
        obj.y = y
    else
        obj.x = 0
        obj.y = 0
    end

    return obj
end

function Text:value(t)
    self.text = tostring(t)
end

function Text:size(sz)
    self._size = sz
    love.graphics.setFont(love.graphics.newFont(self._font, sz))
end

function Text:font(font)
    self._font = tostring(font)
    love.graphics.setFont(love.graphics.newFont(self._font, self._size))
end


function Text:color_rgbb(r, g, b)
    self.color_rgb = {r, g, b}
end

function Text:color(arr)
    self.color_rgb = arr
end

function Text:coordinate(xPos, yPos)
    if xPos then
        self.x = xPos
    end
    if yPos then
        self.y = yPos
    end
end

function Text:align(orientation)
    if orientation == "center" then
        self:center()
    elseif orientation == "center_horizontal" then
        self:center_horizontal()
    elseif orientation == "right" then
        self:right()
    end
end

function Text:draw()
    love.graphics.setColor(self.color_rgb[1], self.color_rgb[2], self.color_rgb[3])
    love.graphics.print(self.text, self.x, self.y)
    love.graphics.setColor(1,1,1)
end

--local methods
function Text:center()
    self.x = (self.width / 2) - (self.text and love.graphics.getFont():getWidth(self.text) or 0) / 2
    self.y = (self.height / 2) - (self.text and love.graphics.getFont():getHeight() or 0) / 2
end

function Text:center_horizontal()
    self.x = (self.width / 2) - (self.text and love.graphics.getFont():getWidth(self.text) or 0) / 2
    end

function Text:right()
    self.x = self.width - (self.text and love.graphics.getFont():getWidth(self.text) or 0)
end

return Text