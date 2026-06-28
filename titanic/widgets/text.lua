local Text = {}
Text.__index = Text

local Font = require("titanic.graphics.font")
local Widget = require("titanic.core.widget")
local Gravity = require("titanic.layouts.gravity")

setmetatable(Text, {
    __index = Widget
})

function Text:new(attrs)
    --attrs = attrs or {}
    if not attrs then
        error("No attributes provided for Text widget")
    end

    local obj = Widget.new(self, attrs)
    
    obj.text = tostring(attrs.text or "")
    obj.size = attrs.size or 12 --for a moment
    obj.color = attrs.color or Color.white --defalt value
    obj.background = attrs.background or Color.transparent --default value
    obj.font = tostring(attrs.font or Font.inter) --default font
    obj.orientation = attrs.orientation or Gravity:left() --default orientation

    obj.width = (self.text and love.graphics.getFont():getWidth(self.text)) or 100
    obj.height = (self.text and love.graphics.getFont():getHeight() or 100)
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

function Text:set_width(w)
    self.width = w
end

function Text:set_height(h)
    self.height = h
end

function Text:set_align(screen, gravity)
      if not self.text then
        error("No text set for centering")
    end

    for _, v in ipairs(gravity.orientation) do
        self:apply_alignment(screen, v)
    end
end

function Text:left(screen)
    self.x = math.floor(0)
end

function Text:center_horizontal(screen)
    self.x = math.floor(screen:getWidth() / 2) - (self.text and love.graphics.getFont():getWidth(self.text) or 0) / 2
    end

function Text:right(screen)
    self.x = math.floor(screen:getWidth() - (self.text and love.graphics.getFont():getWidth(self.text) or 0))
end

function Text:top(screen)
    self.y = math.floor(0)
end

function Text:center_vertical(screen)
    self.y = math.floor(screen:getHeight() / 2) - (self.text and love.graphics.getFont():getHeight() or 0) / 2
end

function Text:bottom(screen)
    self.y = math.floor(screen:getHeight() - (self.text and love.graphics.getFont():getHeight() or 0))
end

function Text:center(screen)
    self:center_horizontal(screen)
    self:center_vertical(screen)
end

function Text:apply_alignment(screen, orientation)
    if orientation == "center" then
        self:center(screen)
    elseif orientation == "center-horizontal" then
        self:center_horizontal(screen)
    elseif orientation == "center-vertical" then
        self:center_vertical(screen)
    elseif orientation == "right" then
        self:right(screen)
    elseif orientation == "left" then
        self:left(screen)
    elseif orientation == "top" then
        self:top(screen)
    elseif orientation == "bottom" then
        self:bottom(screen)
        end    
end

function Text:draw(screen)

    print("Container:", screen:getWidth(), screen:getHeight())
    self:set_color(self.color)
    self:set_font(self.font)
    self:set_size(self.size)
    self:set_background(self.background)
    self:set_width(self.text and love.graphics.getFont():getWidth(self.text) or nil)
    self:set_height(self.text and love.graphics.getFont():getHeight() or nil)
 
    self:set_align(screen, self.orientation)
    love.graphics.print(self.text, math.floor(self.x), math.floor(self.y))
    love.graphics.setFont(love.graphics.newFont(12)) -- for a moment
    love.graphics.setColor(1,1,1) --clear
   
end

function Text:actionClick(x, y)
    -- Not implemented yet
    if self.x <= x and x <= self.x + (self.text and love.graphics.getFont():getWidth(self.text) or 0) and
       self.y <= y and y <= self.y + (self.text and love.graphics.getFont():getHeight() or 0) then
        if self.clicked then
            self.clicked()
        end
    end
end

return Text