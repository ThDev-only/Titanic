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
     for key, widget in pairs(self.widgets) do
    print("KEY:", key)
        print("TYPE:", type(widget))

        for k, v in pairs(widget) do
            print(" ", k, v)
        end

        print("width =", widget.width)
        print("height =", widget.height)
 --if widget.model == "component" then
        if widget.clicked then
            if widget.x <= x and x <= widget.x + widget.width and
          widget.y <= y and y <= widget.y + widget.height then
               widget.clicked()
           end
       end
        --end
    end
end

return Container