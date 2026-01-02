ButtonStyle = {}
ButtonStyle.__index = ButtonStyle

local Color = require("titanic.color.color")

--properties shadow
local shadow_width = 5
local shadow_height = 5
local shadow_color = {0, 0, 0, 0.2}
local shadow_offset_x = 2.5
local shadow_offset_y = 2.5

--properties style
local style_background_color
local style_stroke_color
local style_stroke_width
local style_corners_radius

function ButtonStyle:new(attrs)
    if not attrs then
        error("No attributes provided for ButtonStyle")
    end

    if not attrs.shadow then
        attrs.shadow = {}
    end

    if not attrs.shape then
        attrs.shape = {}
    end

    local obj = setmetatable({}, ButtonStyle)

    --properties shadow
    obj.width = attrs.shadow.width or 4
    obj.height = attrs.shadow.height or 4
    obj.color = attrs.shadow.color or {0,0,0,0.2}
    obj.offset_x = attrs.shadow.offset_x or 2
    obj.offset_y = attrs.shadow.offset_y or 2

    --properties style
    obj.style_background_color = attrs.shape.color or Color.gray
    obj.style_stroke_color = attrs.shape.stroke_color or Color.transparent
    obj.style_stroke_width = attrs.shape.stroke_width or 0
    obj.style_corners_radius = attrs.shape.corners_radius or 0

    return obj
end
return ButtonStyle