Button = {}
Button.__index = Button

local ButtonStyle = require("titanic.styles.button_style")
local Text = require("titanic.widgets.text")
local Gravity = require("titanic.layouts.gravity")
local Widget = require("titanic.core.widget")

setmetatable(Button, {
    __index = Widget
})

function Button:new(attrs)
    assert(attrs, "No attributes provided for Button widget")

    local obj = Widget.new(self, attrs)

    obj.button_style = ButtonStyle:new(attrs.style or {
        shadow = {},
        shape = {}
    })

    obj.text = Text:new({
        text = tostring(attrs.text.text),
        color = attrs.text.color,
        background = attrs.text.background,
        font = tostring(attrs.text.font),
        orientation = attrs.text.orientation or Gravity:center()
    })

    obj:add(obj.text)

    return obj
end

function Button:draw_shadow()
    local style = self.button_style

    love.graphics.setColor(style.color)

    love.graphics.rectangle(
        "fill",
        math.floor(self.x - style.offset_x),
        math.floor(self.y - style.offset_y),
        math.floor(self.width + style.width),
        math.floor(self.height + style.height),
        math.floor(style.style_corners_radius),
        math.floor(style.style_corners_radius)
    )

    love.graphics.setColor(1, 1, 1, 1)
end

function Button:draw_background()
    local style = self.button_style

    love.graphics.setColor(style.style_background_color)

    love.graphics.rectangle(
        "fill",
        self.x,
        self.y,
        self.width,
        self.height,
        style.style_corners_radius,
        style.style_corners_radius
    )

    love.graphics.setColor(1, 1, 1, 1)
end

function Button:draw_border()
    local style = self.button_style

    love.graphics.setColor(style.style_stroke_color)
    love.graphics.setLineWidth(style.style_stroke_width)

    love.graphics.rectangle(
        "line",
        self.x,
        self.y,
        self.width,
        self.height,
        style.style_corners_radius,
        style.style_corners_radius
    )

    love.graphics.setColor(1, 1, 1, 1)
end

function Button:draw(container)
    
    print("Button:", self.width, self.height)
    self:set_container(container)
    self:set_align(container)

    self:draw_shadow()
    self:draw_background()
    self:draw_border()

    love.graphics.push()

    love.graphics.translate(self.x, self.y)

    self:draw_children()

    love.graphics.pop()
end

return Button