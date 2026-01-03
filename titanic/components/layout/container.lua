Container = {}
Container.__index = Container

local resolution = {}
local width, height
local widgets = {}
local model = "layout"


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

function Container:add(key, widget)
    if type(key) == "string" then
       self.widgets[key] = widget
        return
    end

    widget = key --widget value
    self.widgets[#self.widgets + 1] = widget

end

function Container:get(key)
    return self.widgets[key] or nil
end

function Container:draw()
    for _, widget in pairs(self.widgets) do
        widget:draw(self)
    end
end

function Container:actionClick(x, y)
    -- Not implemented yet
    for _, widget in pairs(self.widgets) do
        --if widget.model == "component" then
            widget:actionClick(x, y)
        --end
    end
end

return Container