Button = {}
Button.__index = Button

local ButtonStyle = require("titanic.components.button.button_style")
local Text = require("titanic.components.text.widget.text")
local Font = require("titanic.components.text.font")
local Color = require("titanic.color.color")
local Container = require("titanic.components.layout.container")
local Gravity = require("titanic.components.layout.gravity")

local text
local width, height
local x, y
local orientation
local button_style

local container_main
local container_button
local model = "component"
local clicked


function Button:new(attrs)
    if not attrs then
        error("No attributes provided for Button widget")
    end
    local obj = setmetatable({}, Button)

    obj.width = attrs.width or 100
    obj.height = attrs.height or 50
    obj.x = attrs.x or 0
    obj.y = attrs.y or 0
    obj.orientation = attrs.orientation or Gravity:center()
    obj.container_button = Container:new(obj.width, obj.height)
    obj.clicked = attrs.clicked or nil

    obj.text = Text:new({
        text = tostring(attrs.text.text or ""),
        color = attrs.text.color or Color.white,
        background = attrs.text.background or Color.black,
        font = tostring(attrs.text.font or Font.inter),
        orientation = attrs.text.orientation or Gravity:center(),
        x = math.floor(attrs.text.x or 0),
        y = math.floor(attrs.text.y or 0)
    })
    obj.container_button:add(obj.text)
    
    obj.button_style = ButtonStyle:new(attrs.style or {
        shadow = {},
        shape = {}
    })

    return obj
end

function Button:align(gravity)
    for i,v in ipairs(gravity.orientation) do
        if v == "center" then
            self.x = math.floor((self.container_main:getWidth() - self.width) / 2)
            self.y = math.floor((self.container_main:getHeight() - self.height) / 2)

        elseif v == "center-horizontal" then
            self.x = math.floor((self.container_main:getWidth() - self.width) / 2)
        elseif v == "center-vertical" then
            self.y = math.floor((self.container_main:getHeight() - self.height) / 2)
        elseif v == "top" then
            self.y = math.floor(0)
        elseif v == "bottom" then
            self.y = math.floor(self.container_main:getHeight() - self.height)
        elseif v == "left" then
            self.x = math.floor(0)
        elseif v == "right" then
            self.x = math.floor(self.container_main:getWidth() - self.width)
        end
    end
end

function Button:set_shadow()
    love.graphics.setColor(self.button_style.color[1], self.button_style.color[2], self.button_style.color[3], self.button_style.color[4])
    --love.graphics.setLineWidth(1)
    love.graphics.rectangle(
    "fill",
    math.floor(self.x - self.button_style.offset_x),
    math.floor(self.y - self.button_style.offset_y), 
    math.floor(self.width + self.button_style.width), 
    math.floor(self.height + self.button_style.height),
    math.floor(self.button_style.style_corners_radius),
    math.floor(self.button_style.style_corners_radius)
    )
    --love.graphics.rectangle("fill", 5, 5, love.graphics.getWidth() - 10, love.graphics.getHeight() - 10, 10, 10)
    love.graphics.setColor(1, 1, 1, 1)
end

function Button:set_shape()
    love.graphics.setColor(self.button_style.style_stroke_color[1], self.button_style.style_stroke_color[2], self.button_style.style_stroke_color[3], self.button_style.style_stroke_color[4])
    love.graphics.setLineWidth(self.button_style.style_stroke_width)
    love.graphics.rectangle(
    "line",
    self.x,
    self.y, 
    self.width, 
    self.height,
    self.button_style.style_corners_radius,
    self.button_style.style_corners_radius
    )
    love.graphics.setColor(1, 1, 1, 1)
end

function Button:draw_button()
    love.graphics.setColor(self.button_style.style_background_color[1], self.button_style.style_background_color[2], self.button_style.style_background_color[3], self.button_style.style_background_color[4])
    love.graphics.rectangle(
       "fill",
       self.x,
       self.y,
       self.width,
       self.height,
       self.button_style.style_corners_radius,
       self.button_style.style_corners_radius
    )

    love.graphics.setColor(1, 1, 1, 1)
end
function Button:draw(container)
    self.container_main = container
    -- Draw button background
    self:align(self.orientation)
    self:set_shadow()
    self:draw_button()
    self:set_shape()
    love.graphics.push()
    love.graphics.translate(self.x, self.y)
    self.container_button:draw()
    love.graphics.pop()
end

function Button:actionClick(x, y)
    -- Not implemented yet
       if self.x <= x and x <= self.x + self.width and
          self.y <= y and y <= self.y + self.height then
           if self.clicked then
               self.clicked()
           end
       end
    end
return Button