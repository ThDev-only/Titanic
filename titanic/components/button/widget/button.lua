Button = {}
Button.__index = Button

local ButtonStyle = require("titanic.components.button.button_style")
local Text = require("titanic.components.text.widget.text")
local Font = require("titanic.components.text.font")
local Color = require("titanic.color.color")
local Container = require("titanic.components.layout.container")
local Gravity = require("titanic.components.layout.gravity")

local text
local background
local width, height
local x, y
local orientation
local button_style

local container_main
local container_button

function Button:new(attrs)
    if not attrs then
        error("No attributes provided for Button widget")
    end
    local obj = setmetatable({}, Button)

    obj.background = attrs.background or {0.7, 0.7, 0.7}
    obj.width = attrs.width or 100
    obj.height = attrs.height or 50
    obj.x = attrs.x or 0
    obj.y = attrs.y or 0
    obj.orientation = attrs.orientation or Gravity:center()
    obj.container_button = Container:new(obj.width, obj.height)

    obj.text = Text:new({
        text = tostring(attrs.text.text or ""),
        color = attrs.text.color or Color.white,
        background = attrs.text.background or Color.black,
        font = tostring(attrs.text.font or Font.inter),
        orientation = attrs.text.orientation or Gravity:center(),
        x = attrs.text.x or 0,
        y = attrs.text.y or 0
    })
    obj.container_button:add(obj.text)

    obj.button_style = ButtonStyle:new(attrs.style or {
        shadow = {},
        style = {}
    })

    return obj
end

function Button:align(gravity)
    for i,v in ipairs(gravity.orientation) do
        if v == "center" then
            self.x = (self.container_main:getWidth() - self.width) / 2
            self.y = (self.container_main:getHeight() - self.height) / 2

        elseif v == "center-horizontal" then
            self.x = (self.container_main:getWidth() - self.width) / 2
        elseif v == "center-vertical" then
            self.y = (self.container_main:getHeight() - self.height) / 2
        elseif v == "top" then
            self.y = 0
        elseif v == "bottom" then
            self.y = self.container_main:getHeight() - self.height
        elseif v == "left" then
            self.x = 0
        elseif v == "right" then
            self.x = self.container_main:getWidth() - self.width
        end
    end
end

function Button:set_shadow()
    love.graphics.setColor(self.button_style.color[1], self.button_style.color[2], self.button_style.color[3], self.button_style.color[4])
    --love.graphics.setLineWidth(1)
    love.graphics.rectangle("fill", self.x - self.button_style.offset_x, self.y - self.button_style.offset_y, self.width + self.button_style.width, self.height + self.button_style.height)
    --love.graphics.rectangle("fill", 5, 5, love.graphics.getWidth() - 10, love.graphics.getHeight() - 10, 10, 10)
    love.graphics.setColor(1, 1, 1, 1)
end

function Button:draw(container)
    self.container_main = container
    -- Draw button background
    self:align(self.orientation)
    self:set_shadow()
    love.graphics.setColor(self.background[1], self.background[2], self.background[3])

    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(self.background[1], self.background[2], self.background[3])

    love.graphics.push()
    love.graphics.translate(self.x, self.y)
    self.container_button:draw()
    love.graphics.pop()

end
return Button