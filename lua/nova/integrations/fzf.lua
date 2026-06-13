local highlight = require("nova.highlight").highlight

local colors = {
  bg       = "#556873",
  bg_light = "#3C4C55",
}

local function setup()
  highlight("fzf1", colors.bg_light, colors.bg)
  highlight("fzf2", colors.bg_light, colors.bg)
  highlight("fzf3", colors.bg_light, colors.bg)
end

return { setup = setup }
