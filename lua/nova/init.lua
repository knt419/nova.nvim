local highlight = function(group, fg, ...)
  local args = {...}
  local bg = #args >= 2 and args[1] or nil
  local gui = #args >= 3 and args[2] or nil
  
  local opts = { fg = fg }
  
  if bg then
    opts.bg = bg == "NONE" or bg == "None" and "" or bg
  end
  
  if gui then
    if gui:match("BOLD") then opts.bold = true end
    if gui:match("ITALIC") then opts.italic = true end
    if gui:match("UNDERLINE") then opts.underline = true end
  end
  
  vim.api.nvim_set_hl(0, group, opts)
end

local function setup()
  vim.opt.background = "dark"
  vim.opt.termguicolors = true
  vim.cmd("highlight clear")
  vim.cmd("syntax on")

  vim.g.colors_name = "nova"
end

local terminal_colors = {
  "#3C4C55",
  "#DF8C8C",
  "#A8CE93",
  "#DADA93",
  "#83AFE5",
  "#9A93E1",
  "#7FC1CA",
  "#C5D4DD",
  "#899BA6",
  "#F2C38F",
  "#A8CE93",
  "#DADA93",
  "#83AFE5",
  "#D18EC2",
  "#7FC1CA",
  "#E6EEF3"
}

local function setup_terminal_colors()
  for i, color in ipairs(terminal_colors) do
    vim.g["terminal_color_" .. (i - 1)] = color
  end
end

local ui_groups = function()
  highlight("Error", "#DF8C8C")
  highlight("ErrorMsg", "#DF8C8C")
  highlight("WarningMsg", "#DF8C8C")
  highlight("SpellBad", "#DF8C8C")
  highlight("SpellCap", "#DF8C8C")
  highlight("Todo", "#DF8C8C")
  highlight("NeomakeErrorSign", "#DF8C8C")
  highlight("NeomakeWarningSign", "#DF8C8C")

  highlight("MatchParen", "#7FC1CA", "NONE")
  highlight("CursorLineNr", "#7FC1CA")
  highlight("Visual", "#3C4C55", "#7FC1CA")
  highlight("VisualNOS", "#3C4C55", "#7FC1CA")
  highlight("Folded", "#7FC1CA")
  highlight("FoldColumn", "#7FC1CA")
  highlight("IncSearch", "#7FC1CA", "#1E272C")
  highlight("Search", "#7FC1CA", "#1E272C")
  highlight("WildMenu", "#556873", "#7FC1CA")
  highlight("Question", "#7FC1CA")
  highlight("MoreMsg", "#7FC1CA")
  highlight("ModeMsg", "#7FC1CA")
  highlight("StatusLine", "#7FC1CA", "#556873")
  highlight("PmenuSel", "#556873", "#7FC1CA")
  highlight("PmenuThumb", "#7FC1CA", "#7FC1CA")
  highlight("CtrlPMatch", "#3C4C55", "#7FC1CA")

  highlight("DiffAdd", "#3C4C55", "#A8CE93")
  highlight("DiffChange", "#3C4C55", "#F2C38F")
  highlight("DiffDelete", "#DF8C8C")
  highlight("DiffText", "#3C4C55", "#F2C38F", "BOLD")

  highlight("SignColumn", "NONE")
  highlight("LineNr", "#6A7D89")
  highlight("CursorLine", "NONE", "#556873")
  highlight("CursorColumn", "#556873")
  highlight("EndOfBuffer", "#556873")
  highlight("VertSplit", "#556873", "#556873")
  highlight("StatusLineNC", "#3C4C55", "#556873")
  highlight("Pmenu", "#C5D4DD", "#556873")
  highlight("PmenuSbar", "#899BA6", "#899BA6")
  highlight("ColorColumn", "#556873")
end

local syntax_groups = function()
  highlight("Constant", "#7FC1CA")
  highlight("Directory", "#7FC1CA")
  
  highlight("jsObjectBraces", "#7FC1CA")
  highlight("jsBrackets", "#7FC1CA")
  highlight("jsObjectValue", "#7FC1CA")
  highlight("jsParen", "#7FC1CA")
  highlight("jsParenSwitch", "#7FC1CA")
  highlight("jsParenIfElse", "#7FC1CA")
  highlight("jsBracket", "#7FC1CA")
  highlight("jsTernaryIf", "#7FC1CA")
  highlight("jsTemplateString", "#7FC1CA")
  highlight("jsTemplateVar", "#7FC1CA")

  highlight("cssAttr", "#7FC1CA")
  highlight("cssAttrRegion", "#7FC1CA")
  highlight("cssAttributeSelector", "#7FC1CA")

  highlight("htmlTitle", "#7FC1CA")
  highlight("htmlH1", "#7FC1CA")
  highlight("htmlH2", "#7FC1CA")
  highlight("htmlH3", "#7FC1CA")
  highlight("htmlH4", "#7FC1CA")
  highlight("htmlH5", "#7FC1CA")
  highlight("htmlH6", "#7FC1CA")
  highlight("htmlLink", "#7FC1CA")

  highlight("markdownCode", "#7FC1CA")
  highlight("markdownCodeBlock", "#7FC1CA")
  
  highlight("xmlString", "#7FC1CA")
  highlight("netrwPlain", "#7FC1CA")
  highlight("netrwDir", "#7FC1CA")
  highlight("shDerefSimple", "#7FC1CA")

  highlight("Identifier", "#83AFE5")
  highlight("jsVariableDef", "#83AFE5")
  highlight("jsObject", "#83AFE5")
  highlight("jsObjectKey", "#83AFE5")
  highlight("jsObjectStringKey", "#83AFE5")
  highlight("jsFuncArgs", "#83AFE5")
  highlight("jsDestructuringBlock", "#83AFE5")
  highlight("jsDestructuringArray", "#83AFE5")
  highlight("jsDestructuringPropertyValue", "#83AFE5")
  highlight("jsSpreadExpression", "#83AFE5")
  highlight("jsImportContainer", "#83AFE5")
  highlight("jsExportContainer", "#83AFE5")
  highlight("jsModuleGroup", "#83AFE5")

  highlight("cssClassName", "#83AFE5")
  highlight("cssIdentifier", "#83AFE5")

  highlight("htmlTagName", "#83AFE5")
  highlight("htmlSpecialTagName", "#83AFE5")
  highlight("htmlTag", "#83AFE5")
  highlight("htmlEndTag", "#83AFE5")
  
  highlight("jsonKeyword", "#83AFE5")
  highlight("xmlAttrib", "#83AFE5")

  highlight("netrwExe", "#83AFE5")
  highlight("shFunction", "#83AFE5")

  highlight("typescriptVariableDeclaration", "#83AFE5")
  highlight("typescriptCall", "#83AFE5")

  highlight("Statement", "#DADA93")
  highlight("jsFuncCall", "#DADA93")
  highlight("jsOperator", "#DADA93")
  highlight("jsSpreadOperator", "#DADA93")

  highlight("cssFunctionName", "#DADA93")
  highlight("cssProp", "#DADA93")

  highlight("htmlArg", "#DADA93")
  highlight("jsxRegion", "#DADA93")
  
  highlight("xmlTag", "#DADA93")
  highlight("xmlEndTag", "#DADA93")
  highlight("xmlTagName", "#DADA93")
  highlight("xmlEqual", "#DADA93")

  highlight("shCmdSubRegion", "#DADA93")

  highlight("typescriptOperator", "#DADA93")
  highlight("typescriptOpSymbols", "#DADA93")
  highlight("typescriptProp", "#DADA93")

  highlight("Type", "#A8CE93")
  highlight("jsFunction", "#A8CE93")
  highlight("jsStorageClass", "#A8CE93")
  highlight("jsNan", "#A8CE93")

  highlight("shFunctionKey", "#A8CE93")

  highlight("typescriptEnumKeyword", "#A8CE93")
  highlight("typescriptVariable", "#A8CE93")
  highlight("typescriptFuncKeyword", "#A8CE93")
  highlight("typescriptDefault", "#A8CE93")

  highlight("PreProc", "#9A93E1")
  highlight("jsGlobalObjects", "#9A93E1")
  highlight("jsThis", "#9A93E1")
  
  highlight("cssTagName", "#9A93E1")
  highlight("jsGlobalNodeObjects", "#9A93E1")
  highlight("cssFontDescriptor", "#9A93E1")

  highlight("typescriptGlobal", "#9A93E1")
  highlight("typescriptExport", "#9A93E1")
  highlight("typescriptImport", "#9A93E1")

  highlight("Underlined", "#D18EC2")
  highlight("markdownItalic", "#D18EC2")
  highlight("markdownBold", "#D18EC2")
  highlight("markdownBoldItalic", "#D18EC2")

  highlight("Special", "#F2C38F")
  highlight("SpecialKey", "#F2C38F")
  highlight("NonText", "#F2C38F")
  highlight("Title", "#F2C38F")
  
  highlight("jsBraces", "#F2C38F")
  highlight("jsFuncBraces", "#F2C38F")
  highlight("jsDestructuringBraces", "#F2C38F")
  highlight("jsClassBraces", "#F2C38F")
  highlight("jsParens", "#F2C38F")
  highlight("jsFuncParens", "#F2C38F")
  highlight("jsArrowFunction", "#F2C38F")
  highlight("jsModuleAsterisk", "#F2C38F")
  
  highlight("cssBraces", "#F2C38F")

  highlight("markdownHeadingDelimiter", "#F2C38F")
  highlight("markdownH1", "#F2C38F")
  highlight("markdownH2", "#F2C38F")
  highlight("markdownH3", "#F2C38F")
  highlight("markdownH4", "#F2C38F")
  highlight("markdownH5", "#F2C38F")
  highlight("markdownH6", "#F2C38F")
  highlight("markdownRule", "#F2C38F")
  highlight("markdownListMarker", "#F2C38F")
  highlight("markdownOrderedListMarker", "#F2C38F")
  highlight("markdownLinkText", "#F2C38F")
  highlight("markdownCodeDelimiter", "#F2C38F")

  highlight("netrwClassify", "#F2C38F")
  highlight("netrwVersion", "#F2C38F")
  highlight("CtrlPStats", "#F2C38F")

  highlight("typescriptParens", "#F2C38F")
  highlight("typescriptBraces", "#F2C38F")
  highlight("typescriptArrowFunc", "#F2C38F")

  highlight("Comment", "#899BA6")
  highlight("Ignore", "#899BA6")
  highlight("Conceal", "#899BA6")
  highlight("Noise", "#899BA6")
  highlight("jsNoise", "#899BA6")

  highlight("cssClassNameDot", "#899BA6")
  
  highlight("jsonQuote", "#899BA6")
  highlight("shQuote", "#899BA6")

  highlight("typescriptEndColons", "#899BA6")
  highlight("typescriptTemplateSB", "#899BA6")
end

local plugin_highlights = function()
  highlight("GitGutterAdd", "#A8CE93")
  highlight("GitGutterChange", "#F2C38F")
  highlight("GitGutterChangeDelete", "#F2C38F")
  highlight("GitGutterDelete", "#DF8C8C")

  highlight("EasyMotionTarget", "#DF8C8C", "", "BOLD")
  highlight("EasyMotionTarget2First", "#F2C38F")
  highlight("EasyMotionTarget2Second", "#DADA93")
  highlight("EasyMotionShade", "#899BA6")

  highlight("fzf1", "#3C4C55", "#556873")
  highlight("fzf2", "#3C4C55", "#556873")
  highlight("fzf3", "#3C4C55", "#556873")
end

local function init()
  setup()
  setup_terminal_colors()
  
  highlight("Normal", "#C5D4DD", "")
  
  ui_groups()
  syntax_groups()
  plugin_highlights()
end

return { init = init }
