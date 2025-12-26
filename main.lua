local Text = require("titanic.components.text.widget.text")
local Button = require("titanic.components.button.widget.button")
local Color = require("titanic.color.color")
local Screenport = require("titanic.screenport.screenport")

local text
local button
local screen

function love.load()
    print("okay")
    love.graphics.setColor(1, 1, 1)
    width = love.graphics.getWidth()
    height = love.graphics.getHeight()

    screen = Screenport:new(width, height)
end

function love.update(dt)
    text = Text:new(screen)
    text:value("Hello, Titanic")
    --text:align("center_horizontal")
    text:coordinate(20, 50)
    text:color(Color.black)
    text:size(34)
    
    button = Button:new(screen)
    button:size(200, 100)
    button:coordinate(400, 300)
    button:text("Click Me!")

end

function love.draw()
    love.graphics.setBackgroundColor(0.8, 0.8, 1)
    text:draw()
    button:draw()

    print("okay")

    --love.graphics.setColor(1, 0, 0)
    --love.graphics.rectangle("fill", 400, 400, 200, 100)
    --love.graphics.setColor(0,0,0)
end