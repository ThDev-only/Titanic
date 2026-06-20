  local Text = require("titanic.widgets.text")

  ...

  local text = Text:new({
        text = "Titanic Demo Text",
        size = 24,
        color = Color.black,
        background = Color.black,
        font = Font.inter,
        orientation = Gravity:center_horizontal()
    })