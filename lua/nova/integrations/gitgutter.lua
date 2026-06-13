local highlight = require("nova.highlight").highlight

local colors = {
  green  = "#A8CE93",
  orange = "#F2C38F",
  red    = "#DF8C8C",
}

local function setup()
  highlight("GitGutterAdd", colors.green)
  highlight("GitGutterChange", colors.orange)
  highlight("GitGutterChangeDelete", colors.orange)
  highlight("GitGutterDelete", colors.red)
end

return { setup = setup }
