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
        orientation = Gravity:center_horizontal()
    })

    local btn = Button:new({
        text = {
            text = "Click Me",
            color = Color.white,
            background = Color.black, -- not working, fix soon
            font = Font.inter,
            orientation = Gravity:center()
        },
        width = 100,
        height = 40,
        orientation = Gravity:center(),
        style = {
            shape = {
                color = Color.blue,
                stroke_color = Color.white,
                stroke_width = 0.5,
                corners_radius = 10
            }
        }
    })

    screen:add(text)
    screen:add(btn)
end

function love.draw()
    love.graphics.setBackgroundColor(0.4, 0.4, 1)
    screen:draw()
end