local Text = require("titanic.components.text.widget.text")
local Color = require("titanic.color.color")

local text

local width, height = 0,0

function love.load()
    print("okay")
    love.graphics.setColor(1, 1, 1)
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()
end

function love.update(dt)
    text = Text:new(width,height)
    text:value("Hello, Titanic")
    --text:align("center_horizontal")
    text:coordinate(20, 50)
    text:color(Color.black)
    text:size(34)
    
end

function love.draw()
    love.graphics.setBackgroundColor(0.8, 0.8, 1)
    text:draw()

    print("okay")

    love.graphics.setColor(1, 0, 0)
    love.graphics.rectangle("fill", 400, 400, 200, 100)
    love.graphics.setColor(0,0,0)
end