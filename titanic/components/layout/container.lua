Container = {}
Container.__index = Container

local resolution = {}
local width, height
local widgets = {}

function Container:new(w, h)
    local obj = setmetatable({}, Container)
    obj.width = w
    obj.height = h
    obj.resolution = {width = w, height = h}
    obj.widgets = {}
    return obj
end

function Container.getResolution()
    return resolution
end

function Container:getWidth()
    return self.width
end

function Container:getHeight()
    return self.height
end

function Container:clear()
    self.widgets = {}
end

function Container:add(widget)
    self.widgets[#self.widgets + 1] = widget

end

function Container:draw()
    for _, widget in pairs(self.widgets) do
        widget:draw(self)
    end
end

return Container