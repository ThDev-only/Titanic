local Text = {}
Text.__index = Text

local Font = require("titanic.components.text.font")
local Container = require("titanic.components.layout.container")

local screen
local text
local orientation
local size
local font
local color
local background
local x,y


function Text:new(attrs)
    --attrs = attrs or {}
    if not attrs then
        error("No attributes provided for Text widget")
    end

    local obj = setmetatable({}, Text)
    
    obj.text = tostring(attrs.text or "")
    obj.size = attrs.size or 12 --for a moment
    obj.color = attrs.color or Color.white --defalt value
    obj.background = attrs.background or Color.black --default value
    obj.font = tostring(attrs.font or Font.inter) --default font
    obj.orientation = attrs.orientation or "center" --default orientation

    obj.x = attrs.x or 0
    obj.y = attrs.y or 0

    return obj
end

function Text:set_value(t)
    self.text = tostring(t)
end

function Text:set_size(sz)
    self.size = sz
    love.graphics.setFont(love.graphics.newFont(self.font, sz))
end

function Text:set_font(font)
    love.graphics.setFont(love.graphics.newFont(font, self._size))
end

function Text:set_color(color)
    love.graphics.setColor(color[1], color[2], color[3])
end

function Text:set_background(color)
    -- Not implemented yet
    self.background = color
end

function Text:set_coordinate(xPos, yPos)
    if xPos then
        self.x = xPos
    end
    if yPos then
        self.y = yPos
    end
end

function Text:set_align(orientation)
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

function Text:center()
    self.x = (self.screen:getWidth() / 2) - (self.text and love.graphics.getFont():getWidth(self.text) or 0) / 2
    self.y = (self.screen:getHeight() / 2) - (self.text and love.graphics.getFont():getHeight() or 0) / 2
end

function Text:center_horizontal()
    self.x = (self.screen:getWidth() / 2) - (self.text and love.graphics.getFont():getWidth(self.text) or 0) / 2
    end

function Text:right()
    self.x = self.screen:getWidth() - (self.text and love.graphics.getFont():getWidth(self.text) or 0)
end

function Text:draw(screen)
    self.screen = screen
    self:set_color(self.color)
    self:set_font(self.font)
    self:set_size(self.size)
    self:set_background(self.background)
    self:set_align(self.orientation)
    love.graphics.print(self.text, self.x, self.y)
    love.graphics.setFont(love.graphics.newFont(12)) -- for a moment
    love.graphics.setColor(1,1,1) --clear
   
end

return Text