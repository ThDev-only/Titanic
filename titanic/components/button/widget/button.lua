Button = {}
Button.__index = Button

local Text = require("titanic.components.text.widget.text")
local Screenport = require("titanic.screenport.screenport")
local Color = require("titanic.color.color")

local screen
local container
local _text
local width, height
local _background
local _orientation

function Button:new(screen, text, width, height, x, y)
    if not screen then
        error("Screen is a required parameter")
    end

    local obj = setmetatable({}, Button)
    obj.screen = screen
    obj.width = width or 100
    obj.height = height or 50

    container = Screenport:new(obj.width, obj.height)
    obj._text = Text:new(container)
    obj._text:value(text or "Button")
    obj.x = x or 0
    obj.y = y or 0

    obj._text:coordinate(
        obj.x + (obj.width / 2) - (obj.text and love.graphics.getFont():getWidth(obj._text.text) or 0) / 2,
        obj.y + (obj.height / 2) - (obj.text and love.graphics.getFont():getHeight() or 0) / 2
    )

    return obj
end

function Button:size(w, h)
    self.width = w
    self.height = h
    self.container = Screenport:new(self.width, self.height)
    self._text:screenModified(self.container)
end

function Button:coordinate(x, y)
    self.x = x
    self.y = y
    self._text:coordinate(
        self.x + (self.width / 2) - (self._text and love.graphics.getFont():getWidth(self._text.text) or 0) / 2,
        self.y + (self.height / 2) - (self._text and love.graphics.getFont():getHeight() or 0) / 2
    )
end

function Button:align(orientation)
    if not orientation then
        error("No orientation specified for alignment")
    end
    self._orientation = orientation

    if orientation == "center_horizontal" then
        self:center_horizontal()
    elseif orientation == "center_vertical" then
        self:center_vertical()
    elseif orientation == "center" then
        self:center()
    end
end

function Button:text(value)
    self._text:value(value)
    self:ajust_text()
end

function Button:draw()
    --to be implemented
    love.graphics.setColor(Color.purple)
    love.graphics.rectangle("fill", self.x,  self.y, self.width, self.height)
    self._text:draw()
    love.graphics.setColor(0, 0, 0)
end

--local methods
function Button:center_horizontal()
    self.x = (self.screen:getWidth() / 2) - (self.width / 2)
    self:ajust_text()
end

function Button:center_vertical()
    self.y = (self.screen:getHeight() / 2) - (self.height / 2)
    self:ajust_text()
end

function Button:center()
    self.x = (self.screen:getWidth() / 2) - (self.width / 2)
    self.y = (self.screen:getHeight() / 2) - (self.height / 2)
    self:ajust_text()
end

function Button:ajust_text()
    self._text:coordinate(
        self.x + (self.width / 2) - (self._text and love.graphics.getFont():getWidth(self._text.text) or 0) / 2,
        self.y + (self.height / 2) - (self._text and love.graphics.getFont():getHeight() or 0) / 2
    )
end
return Button