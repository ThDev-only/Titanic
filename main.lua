local Text = require("titanic.components.text.widget.text")
local Button = require("titanic.components.button.widget.button")
local Color = require("titanic.color.color")
local Container = require("titanic.components.layout.container")

local text
local screen

function love.load()
    print("okay")
    love.graphics.setColor(1, 1, 1)
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    screen = Container:new(width, height)
end

function love.update(dt)
    text = Text:new({
        screen = screen,
        text = "Hello, World!",
        size = 18,
        color = Color.black,
        background = Color.black,
        font = Font.inter,
        orientation = "center"
    })
end

function love.draw()
    love.graphics.setBackgroundColor(0.8, 0.8, 1)
    text:draw()
end