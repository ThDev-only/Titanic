local Text = {}
Text.__index = Text

local Font = require("titanic.components.text.font")
local Screenport = require("titanic.screenport.screenport")

local screen
local text
local orientation
local _size
local _font
local width, height = 0, 0
local _color_rgb
local _background
local x,y

function Text:new(screen)
    if not screen then
        error("Screen is a required parameter")
    end

    local obj = setmetatable({}, Text)
    obj._color_rgb = {1,1,1}
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
end

function Text:color_rgb(r, g, b)
    self._color_rgb = {r, g, b}
end

function Text:color(color)
    self._color_rgb = color
end

function Text:background(color)
    --to be implemented
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
    self.orientation = orientation
    if not self.text then
        error("No text set for centering")
    end
    if orientation == "center" then
        self:center()
    elseif orientation == "center_horizontal" then
        self:center_horizontal()
    elseif orientation == "right" then
        self:right()
    end
end

function Text:screenModified(screen)
    self.screen = screen
    self:resize()
end

function Text:resize()
    --to be implemented]
    self:align(self.orientation)
end
function Text:draw()
    love.graphics.setColor(self._color_rgb[1], self._color_rgb[2], self._color_rgb[3])
    love.graphics.setFont(love.graphics.newFont(self._font, self._size))
    love.graphics.print(self.text, self.x, self.y)
    love.graphics.setFont(love.graphics.newFont(12)) -- for a moment
    love.graphics.setColor(1,1,1)
end

--local methods
function Text:center()
    self.x = (self.screen.getWidth() / 2) - (self.text and love.graphics.getFont():getWidth(self.text) or 0) / 2
    self.y = (self.screen.getHeight() / 2) - (self.text and love.graphics.getFont():getHeight() or 0) / 2
end

function Text:center_horizontal()
    self.x = (self.screen.getWidth() / 2) - (self.text and love.graphics.getFont():getWidth(self.text) or 0) / 2
    end

function Text:right()
    self.x = self.screen.getWidth() - (self.text and love.graphics.getFont():getWidth(self.text) or 0)
end

return Text