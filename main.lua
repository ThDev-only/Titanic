local Text = require("titanic.components.text.widget.text")
local Button = require("titanic.components.button.widget.button")
local Color = require("titanic.color.color")
local Container = require("titanic.components.layout.container")
local Gravity = require("titanic.components.layout.gravity")


local screen

function love.load()
    print("okay")
    love.graphics.setColor(1, 1, 1)
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    screen = Container:new(width, height)
end

function love.update(dt)
    screen:clear()
    local text = Text:new({
        text = "Hello, World!",
        size = 18,
        color = Color.black,
        background = Color.black,
        font = Font.inter,
        orientation = "center"
    })

    local btn = Button:new({
        text = {
            text = "Click Me",
            color = Color.white,
            background = Color.black,
            font = Font.inter,
            orientation = "center"
        },
        background = Color.gray,
        width = 150,
        height = 50,
        x = (screen:getWidth() - 150) / 2,
        y = (screen:getHeight() - 50) / 2,
        orientation = "bottom"
    })

    screen:add(text)
    screen:add(btn)
end

function love.draw()
    love.graphics.setBackgroundColor(0.8, 0.8, 1)
    screen:draw()
end