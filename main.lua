local Text = require("titanic.components.text.widget.text")
local Button = require("titanic.components.button.widget.button")
local Color = require("titanic.color.color")
local Container = require("titanic.components.layout.container")
local Gravity = require("titanic.components.layout.gravity")

local screen
local count = 0

function love.load()
    print("okay")
    love.graphics.setColor(1, 1, 1)
    local width = love.graphics.getWidth()
    local height = love.graphics.getHeight()

    screen = Container:new(width, height)

    local text = Text:new({
        text = "Titanic Demo Layout",
        size = 24,
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
        },
        clicked = function()
            count = count + 1
            screen:add("text_clicked", Text:new{
                text = "Button Clicked: " .. count,
                size = 16,
                color = Color.red,
                background = Color.black,
                font = Font.inter,
                orientation = Gravity:center_horizontal():bottom()
            })
        end
    })

    screen:add(text)
    screen:add(btn)
end

function love.update(dt)
   -- screen:clear()
    
end

function love.draw()
    love.graphics.setBackgroundColor(0.4, 0.4, 1)
    screen:draw()
end

function love.mousepressed(x, y, button, istouch, presses)
    if button == 1 then
        screen:actionClick(x, y)
        --you can change the text value like this
        --screen:get("text_clicked").text = "Button Clicked: count"
        --it's not appropriate to put this here
        --it was only done as a presentation
    end
end