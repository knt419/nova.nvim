local M = {}

local transparent_bg = false

M.setup = function(opts)
  transparent_bg = opts.transparent_bg or false
end

function M.highlight(group, fg, bg, gui)
  local opts = { fg = fg }

  if bg and bg ~= "" then
    opts.bg = transparent_bg and "NONE" or bg
  elseif bg == "" and not transparent_bg then
    opts.bg = "#556873"
  end

  if gui then
    local gui_map = { BOLD = "bold", ITALIC = "italic", UNDERLINE = "underline" }
    for key, opt in pairs(gui_map) do
      if gui:match(key) then opts[opt] = true end
    end
  end

  vim.api.nvim_set_hl(0, group, opts)
end

function M.highlight_group(color, groups)
  for _, group in ipairs(groups) do
    M.highlight(group, color)
  end
end

return M
