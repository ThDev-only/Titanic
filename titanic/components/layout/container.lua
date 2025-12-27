Container = {}
Container.__index = Container

local resolution = {}
local width, height

function Container:new(w, h)
    local obj = setmetatable({}, Container)
    obj.width = w
    obj.height = h
    obj.resolution = {width = w, height = h}
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

return Container