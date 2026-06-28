Widget = {}
Widget.__index = Widget

local Color = require("titanic.graphics.color")
local Gravity = require("titanic.layouts.gravity")

function Widget:new(attrs)
    local obj = setmetatable({}, self)
    obj.attrs = attrs or {}
    obj.width = attrs.width or 100
    obj.height = attrs.height or 100
    obj.background = attrs.background or Color.gray
    obj.x = attrs.x or 0
    obj.y = attrs.y or 0
    obj.model = attrs.model or "widget"
    obj.clicked = attrs.clicked or function() end
    obj.orientation = attrs.orientation or Gravity:left()
    obj.children = Container:new(obj.width, obj.height)
    return obj
end

--size
function Widget:set_width(w)
    self.width = w
end

function Widget:set_height(h)
    self.height = h
end

function Widget:get_width()
    return self.width
end

function Widget:get_height()
    return self.height
end

--colors
function Widget:set_background(color)
    -- Not implemented yet
    --self.background = color
end

--orientations
function Widget:left(screen)
    self.x = 0
end

function Widget:center_horizontal(screen)
    self.x = math.floor(screen:getWidth() / 2) - (self.width / 2)
end

function Widget:right(screen)
    self.x = math.floor(screen:getWidth() - self.width)
end

function Widget:top(screen)
    self.y = 0
end

function Widget:center_vertical(screen)
    self.y = math.floor(screen:getHeight() / 2) - (self.height / 2)
end

function Widget:bottom(screen)
    self.y = math.floor(screen:getHeight() - self.height)
end

function Widget:center(screen)
    self:center_horizontal(screen)
    self:center_vertical(screen)
end

function Widget:apply_alignment(screen, orientation)
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

function Widget:set_align(screen)
    
    for _, v in ipairs(self.orientation.orientation) do
        print("Orientation:", v)
        self:apply_alignment(screen, v)
    end
end


--layout functions

function Widget:set_container(container)
    self.container = container
end

-- layout functions (children)
function Widget:add(widget)
    widget.parent = self
    self.children:add(widget)
end

function Widget:get(key)
    return self.children:get(key)
end

function Widget:draw_children()
    self.children.width = self.width
    self.children.height = self.height

    self.children:draw()
end


return Widget