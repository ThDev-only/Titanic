Button = {}
Button.__index = Button

local Text = require("titanic.components.text.widget.text")
local Screenport = require("titanic.screenport.screenport")

local screen
local container
local _text
local width, height
local _background

function Button:new(screen, text, width, height, x, y)
    if not screen then
        error("Screen is a required parameter")
    end

    local obj = setmetatable({}, Button)
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

function Button:text(value)
    self._text:value(value)
    self._text:coordinate(
        self.x + (self.width / 2) - (self._text and love.graphics.getFont():getWidth(self._text.text) or 0) / 2,
        self.y + (self.height / 2) - (self._text and love.graphics.getFont():getHeight() or 0) / 2
    )
end

function Button:draw()
    --to be implemented
    love.graphics.setColor(0.7, 0.7, 0.7)
    love.graphics.rectangle("fill", self.x,  self.y, self.width, self.height)
    self._text:draw()
    love.graphics.setColor(0, 0, 0)
end
return Button