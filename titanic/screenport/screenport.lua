Screenport = {}
Screenport.__index = Screenport

local resolution = {}
local width, height

function Screenport:new(w, h)
    obj = setmetatable({}, Screenport)
    obj.width = w
    obj.height = h
    obj.resolution = {width = w, height = h}
    return obj
end

function Screenport.getResolution()
    return resolution
end

function Screenport:getWidth()
    return self.width
end

function Screenport:getHeight()
    return self.height
end

return Screenport