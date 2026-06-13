local highlight = require("nova.highlight").highlight

local colors = {
  red    = "#DF8C8C",
  orange = "#F2C38F",
  yellow = "#DADA93",
  gray   = "#899BA6",
}

local function setup()
  highlight("EasyMotionTarget", colors.red, "NONE", "BOLD")
  highlight("EasyMotionTarget2First", colors.orange)
  highlight("EasyMotionTarget2Second", colors.yellow)
  highlight("EasyMotionShade", colors.gray)
end

return { setup = setup }
