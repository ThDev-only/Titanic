Button = {}
Button.__index = Button

local Text = require("titanic.components.text.widget.text")
local Font = require("titanic.components.text.font")
local Color = require("titanic.color.color")
local Container = require("titanic.components.layout.container")

local text
local background
local width, height
local x, y
local orientation

local container_main
local container_button

function Button:new(attrs)
    if not attrs then
        error("No attributes provided for Button widget")
    end
    local obj = setmetatable({}, Button)
    obj.text = Text:new({
        text = tostring(attrs.text.text or ""),
        color = attrs.text.color or Color.white,
        background = attrs.text.background or Color.black,
        font = tostring(attrs.text.font or Font.inter),
        orientation = attrs.text.orientation or "center",
        x = attrs.text.x or 0,
        y = attrs.text.y or 0
    })
    obj.background = attrs.background or {0.7, 0.7, 0.7}
    obj.width = attrs.width or 100
    obj.height = attrs.height or 50
    obj.x = attrs.x or 0
    obj.y = attrs.y or 0
    obj.orientation = attrs.orientation or "center"
    obj.container_button = Container:new(obj.width, obj.height)

    obj.container_button:add(obj.text)

    return obj
end

function Button:align(orientation)
    self.orientation = orientation
    if orientation == "center" then
        self.x = (self.container_main:getWidth() - self.width) / 2
        self.y = (self.container_main:getHeight() - self.height) / 2
    elseif orientation == "center_horizontal" then
        self.x = (self.container_main:getWidth() - self.width) / 2
    elseif orientation == "left" then
        self.x = 0
    elseif orientation == "right" then
        self.x = self.container_main:getWidth() - self.width
    
    elseif orientation == "top" then
        self.y = 0
    elseif orientation == "bottom" then
        self.y = self.container_main:getHeight() - self.height
    end
end

function Button:draw(container)
    self.container_main = container
    -- Draw button background
    love.graphics.setColor(self.background[1], self.background[2], self.background[3])
    self:align(self.orientation)
    love.graphics.rectangle("fill", self.x, self.y, self.width, self.height)
    love.graphics.setColor(self.background[1], self.background[2], self.background[3])

    love.graphics.push()
    love.graphics.translate(self.x, self.y)
    self.container_button:draw()
    love.graphics.pop()

end
return Button