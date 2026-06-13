local M = {}

M.transparent_bg = false

-- Color palette definition
local colors = {
  bg_dark = "#1E272C",
  bg = "#556873",
  bg_light = "#3C4C55",
  fg = "#C5D4DD",
  fg_muted = "#899BA6",
  fg_dim = "#6A7D89",
  cyan = "#7FC1CA",
  blue = "#83AFE5",
  yellow = "#DADA93",
  green = "#A8CE93",
  purple = "#9A93E1",
  pink = "#D18EC2",
  orange = "#F2C38F",
  red = "#DF8C8C",
  gray = "#899BA6",
}

local hl = require("nova.highlight")
local highlight = hl.highlight
local highlight_group = hl.highlight_group

local function setup(options)
  options = options or {}

  if options.transparent_bg ~= nil and type(options.transparent_bg) ~= "boolean" then
    error("transparent_bg must be a boolean")
  end

  M.transparent_bg = options.transparent_bg or (vim.g.nova_transparent_bg == true) or false

  hl.setup({ transparent_bg = M.transparent_bg })

  vim.opt.background = "dark"
  vim.opt.termguicolors = true
  vim.cmd("highlight clear")
  vim.cmd("syntax on")

  vim.g.colors_name = "nova"
end

local function setup_terminal_colors()
  local terminal_colors = {
    colors.bg_light,
    colors.red,
    colors.green,
    colors.yellow,
    colors.blue,
    colors.purple,
    colors.cyan,
    colors.fg,
    colors.gray,
    colors.orange,
    colors.green,
    colors.yellow,
    colors.blue,
    colors.pink,
    colors.cyan,
    "#E6EEF3"
  }

  for i, color in ipairs(terminal_colors) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

local function ui_groups()
  highlight_group(colors.red, {
    "Error", "ErrorMsg", "WarningMsg", "SpellBad", "SpellCap", "Todo",
    "NeomakeErrorSign", "NeomakeWarningSign"
  })
  highlight("Normal", colors.fg, colors.bg)
  highlight("NormalFloat", colors.fg, colors.bg)
  highlight("MatchParen", colors.cyan)
  highlight("CursorLineNr", colors.cyan)
  highlight("Visual", colors.bg_light, colors.cyan)
  highlight("VisualNOS", colors.bg_light, colors.cyan)
  highlight("Folded", colors.cyan)
  highlight("FoldColumn", colors.cyan)
  highlight("IncSearch", colors.cyan, colors.bg_dark)
  highlight("Search", colors.cyan, colors.bg_dark)
  highlight("WildMenu", colors.bg, colors.cyan)
  highlight("Question", colors.cyan)
  highlight("MoreMsg", colors.cyan)
  highlight("ModeMsg", colors.cyan)
  highlight("StatusLine", colors.cyan, colors.bg)
  highlight("PmenuSel", colors.bg, colors.cyan)
  highlight("PmenuThumb", colors.cyan, colors.cyan)
  highlight("CtrlPMatch", colors.bg_light, colors.cyan)
  highlight("DiffAdd", colors.bg_light, colors.green)
  highlight("DiffChange", colors.bg_light, colors.orange)
  highlight("DiffDelete", colors.red)
  highlight("DiffText", colors.bg_light, colors.orange, "BOLD")
  highlight("SignColumn", "NONE")
  highlight("LineNr", colors.fg_dim)
  highlight("CursorLine", "NONE", colors.bg)
  highlight("CursorColumn", "NONE", colors.bg)
  highlight("EndOfBuffer", "NONE", colors.bg)
  highlight("VertSplit", colors.bg, colors.bg)
  highlight("StatusLineNC", colors.bg_light, colors.bg)
  highlight("Pmenu", colors.fg, colors.bg)
  highlight("PmenuSbar", colors.fg_muted, colors.fg_muted)
  highlight("ColorColumn", "NONE", colors.bg)
end

local function syntax_groups()
  highlight_group(colors.cyan, {
    "Constant", "Directory",
    "jsObjectBraces", "jsBrackets", "jsObjectValue", "jsParen",
    "jsParenSwitch", "jsParenIfElse", "jsBracket", "jsTernaryIf",
    "jsTemplateString", "jsTemplateVar",
    "cssAttr", "cssAttrRegion", "cssAttributeSelector",
    "htmlTitle", "htmlH1", "htmlH2", "htmlH3", "htmlH4", "htmlH5", "htmlH6", "htmlLink",
    "markdownCode", "markdownCodeBlock",
    "xmlString", "netrwPlain", "netrwDir", "shDerefSimple"
  })

  highlight_group(colors.blue, {
    "Identifier", "jsVariableDef", "jsObject", "jsObjectKey",
    "jsObjectStringKey", "jsFuncArgs", "jsDestructuringBlock",
    "jsDestructuringArray", "jsDestructuringPropertyValue",
    "jsSpreadExpression", "jsImportContainer", "jsExportContainer",
    "jsModuleGroup",
    "cssClassName", "cssIdentifier",
    "htmlTagName", "htmlSpecialTagName", "htmlTag", "htmlEndTag",
    "jsonKeyword", "xmlAttrib",
    "netrwExe", "shFunction",
    "typescriptVariableDeclaration", "typescriptCall"
  })

  highlight_group(colors.yellow, {
    "Statement", "jsFuncCall", "jsOperator", "jsSpreadOperator",
    "cssFunctionName", "cssProp",
    "htmlArg", "jsxRegion",
    "xmlTag", "xmlEndTag", "xmlTagName", "xmlEqual",
    "shCmdSubRegion",
    "typescriptOperator", "typescriptOpSymbols", "typescriptProp"
  })

  highlight_group(colors.green, {
    "Type", "jsFunction", "jsStorageClass", "jsNan",
    "shFunctionKey",
    "typescriptEnumKeyword", "typescriptVariable",
    "typescriptFuncKeyword", "typescriptDefault"
  })

  highlight_group(colors.purple, {
    "PreProc", "jsGlobalObjects", "jsThis",
    "cssTagName", "jsGlobalNodeObjects", "cssFontDescriptor",
    "typescriptGlobal", "typescriptExport", "typescriptImport"
  })

  highlight_group(colors.pink, {
    "Underlined", "markdownItalic", "markdownBold", "markdownBoldItalic"
  })

  highlight_group(colors.orange, {
    "Special", "SpecialKey", "NonText", "Title",
    "jsBraces", "jsFuncBraces", "jsDestructuringBraces",
    "jsClassBraces", "jsParens", "jsFuncParens",
    "jsArrowFunction", "jsModuleAsterisk",
    "cssBraces",
    "markdownHeadingDelimiter", "markdownH1", "markdownH2",
    "markdownH3", "markdownH4", "markdownH5", "markdownH6",
    "markdownRule", "markdownListMarker", "markdownOrderedListMarker",
    "markdownLinkText", "markdownCodeDelimiter",
    "netrwClassify", "netrwVersion", "CtrlPStats",
    "typescriptParens", "typescriptBraces", "typescriptArrowFunc"
  })

  highlight_group(colors.gray, {
    "Comment", "Ignore", "Conceal", "Noise", "jsNoise",
    "cssClassNameDot",
    "jsonQuote", "shQuote",
    "typescriptEndColons", "typescriptTemplateSB"
  })
end

local function init(options)
  setup(options)

  if M.transparent_bg then
    vim.opt.pumblend = 100
    vim.opt.winblend = 10
  end

  ui_groups()
  syntax_groups()
  require("nova.integrations").load()

  setup_terminal_colors()
end

return { init = init }
