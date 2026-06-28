if os.getenv("LOVE2D_TOOLS") then pcall(require, "_love2d_tools_bridge") end
local Text = require("titanic.widgets.text")
local Button = require("titanic.widgets.button")
local Color = require("titanic.graphics.color")
local Container = require("titanic.layouts.container")
local Gravity = require("titanic.layouts.gravity")

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
        color = Color.white,
        background = Color.transparent,
        font = Font.inter,
        orientation = Gravity:center_horizontal(),
        y = 50,
        clicked = function()
                screen:get("title").text = "OK, you clicked me!"
            end
    })

    local btn = Button:new({
        text = {
            text = "Click Me",
            color = Color.white,
            background = Color.black, -- not working, fix soon
            font = Font.inter,
            --orientation = Gravity:center()
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
            if not screen:get("text_clicked") then
                screen:add("text_clicked", Text:new{
                text = "Button Clicked: " .. count,
                size = 16,
                color = Color.white,
                background = Color.black,
                font = Font.inter,
                orientation = Gravity:center_horizontal():bottom(),
            })
            return
            end
            screen:get("text_clicked").text = "Button Clicked: " .. count
            
        end
    })

    screen:add("title", text)
    screen:add(btn)
end

function love.update(dt)
end

function love.draw()
    love.graphics.setBackgroundColor(0, 0, 0.2)
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