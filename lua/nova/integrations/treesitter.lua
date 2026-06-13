local highlight = require("nova.highlight").highlight

local colors = {
  cyan    = "#7FC1CA",
  blue    = "#83AFE5",
  green   = "#A8CE93",
  purple  = "#9A93E1",
  pink    = "#D18EC2",
  orange  = "#F2C38F",
  yellow  = "#DADA93",
  red     = "#DF8C8C",
  gray    = "#899BA6",
  bg      = "#556873",
  bg_light = "#3C4C55",
  fg      = "#C5D4DD",
}

local function setup()
  -- Core standard groups that @ groups link to
  -- (must be set for Vim syntax highlighting too)
  highlight("String", colors.cyan)
  highlight("Character", colors.cyan)
  highlight("Number", colors.cyan)
  highlight("Boolean", colors.cyan)
  highlight("Float", colors.cyan)
  highlight("Function", colors.green)
  highlight("Identifier", colors.blue)
  highlight("Structure", colors.green)
  highlight("StorageClass", colors.green)
  highlight("Typedef", colors.green)
  highlight("Keyword", colors.yellow)
  highlight("Conditional", colors.yellow)
  highlight("Repeat", colors.yellow)
  highlight("Label", colors.yellow)
  highlight("Operator", colors.yellow)
  highlight("Exception", colors.yellow)
  highlight("Include", colors.purple)
  highlight("Define", colors.purple)
  highlight("Macro", colors.purple)
  highlight("PreProc", colors.purple)
  highlight("Special", colors.orange)
  highlight("SpecialChar", colors.orange)
  highlight("Delimiter", colors.yellow)
  highlight("Tag", colors.orange)
  highlight("Debug", colors.yellow)

  -- Diff groups (no surviving links in @diff.* capture chain)
  highlight("Added", colors.bg, colors.green)
  highlight("Removed", colors.red)
  highlight("Changed", colors.bg_light, colors.orange)
  highlight("diffAdded", colors.bg, colors.green)
  highlight("diffRemoved", colors.red)
  highlight("diffChanged", colors.bg_light, colors.orange)
  highlight("diffLine", colors.purple)
  highlight("diffFile", colors.orange)

  -- @-prefixed treesitter groups
  -- Comment
  highlight("@comment", colors.gray)
  highlight("@comment.documentation", colors.gray)
  highlight("@comment.error", colors.red)
  highlight("@comment.note", colors.cyan)
  highlight("@comment.warning", colors.orange)
  highlight("@comment.todo", colors.orange)

  -- Constant/String/Character/Number
  highlight("@constant", colors.cyan)
  highlight("@constant.builtin", colors.orange)
  highlight("@constant.macro", colors.orange)
  highlight("@string", colors.cyan)
  highlight("@string.escape", colors.cyan)
  highlight("@string.regex", colors.cyan)
  highlight("@string.special", colors.cyan)
  highlight("@character", colors.cyan)
  highlight("@character.special", colors.cyan)
  highlight("@number", colors.cyan)
  highlight("@boolean", colors.cyan)
  highlight("@number.float", colors.cyan)

  -- Type
  highlight("@type", colors.green)
  highlight("@type.definition", colors.green)
  highlight("@type.qualifier", colors.green)

  -- Function
  highlight("@function", colors.green)
  highlight("@function.builtin", colors.green)
  highlight("@function.call", colors.green)
  highlight("@function.macro", colors.orange)
  highlight("@function.method", colors.green)
  highlight("@function.method.call", colors.green)

  -- Variable/Property/Field/Module
  highlight("@variable", colors.blue)
  highlight("@variable.builtin", colors.orange)
  highlight("@variable.member", colors.blue)
  highlight("@variable.parameter", colors.cyan)
  highlight("@variable.parameter.builtin", colors.cyan)
  highlight("@property", colors.blue)
  highlight("@field", colors.blue)
  highlight("@module", colors.blue)
  highlight("@symbol", colors.cyan)

  -- Keyword
  highlight("@keyword", colors.yellow)
  highlight("@keyword.conditional", colors.yellow)
  highlight("@keyword.repeat", colors.yellow)
  highlight("@keyword.debug", colors.yellow)
  highlight("@keyword.directive", colors.purple)
  highlight("@keyword.exception", colors.yellow)
  highlight("@keyword.import", colors.yellow)
  highlight("@keyword.storage", colors.green)
  highlight("@keyword.type", colors.green)

  -- Label/Operator/Punctuation
  highlight("@label", colors.yellow)
  highlight("@operator", colors.yellow)
  highlight("@punctuation.delimiter", colors.yellow)
  highlight("@punctuation.bracket", colors.yellow)
  highlight("@punctuation.special", colors.gray)

  -- PreProc/Include/Attribute
  highlight("@attribute", colors.purple)
  highlight("@attribute.builtin", colors.purple)

  -- Special/Constructor
  highlight("@constructor", colors.orange)
  highlight("@special", colors.orange)

  -- Tag
  highlight("@tag", colors.orange)
  highlight("@tag.builtin", colors.orange)
  highlight("@tag.delimiter", colors.orange)
  highlight("@tag.attribute", colors.blue)

  -- Error
  highlight("@error", colors.red)

  -- Markup
  highlight("@markup.heading", colors.orange)
  highlight("@markup.heading.1", colors.orange)
  highlight("@markup.heading.2", colors.orange)
  highlight("@markup.heading.3", colors.green)
  highlight("@markup.heading.4", colors.cyan)
  highlight("@markup.heading.5", colors.blue)
  highlight("@markup.heading.6", colors.purple)
  highlight("@markup.italic", colors.pink)
  highlight("@markup.bold", colors.orange, nil, "BOLD")
  highlight("@markup.strikethrough", colors.gray)
  highlight("@markup.underline", colors.pink)
  highlight("@markup.link", colors.cyan)
  highlight("@markup.link.label", colors.gray)
  highlight("@markup.link.url", colors.pink)
  highlight("@markup.raw", colors.gray)
  highlight("@markup.raw.block", colors.gray)
  highlight("@markup.list", colors.orange)
  highlight("@markup.list.checked", colors.green)
  highlight("@markup.list.unchecked", colors.orange)
  highlight("@markup.quote", colors.orange)
  highlight("@markup.math", colors.cyan)
  highlight("@markup.environment", colors.orange)

  -- Diff
  highlight("@diff.plus", colors.bg, colors.green)
  highlight("@diff.minus", colors.red)
  highlight("@diff.delta", colors.bg_light, colors.orange)

  -- Spell/Conceal
  highlight("@spell", colors.gray)
  highlight("@conceal", colors.gray)

  -- Non-standard but common treesitter groups
  highlight("@keyword.function", colors.yellow)
  highlight("@keyword.return", colors.yellow)
  highlight("@keyword.operator", colors.yellow)
  highlight("@text", colors.fg)

  -- Diagnostic groups
  highlight("DiagnosticError", colors.red)
  highlight("DiagnosticWarn", colors.orange)
  highlight("DiagnosticInfo", colors.blue)
  highlight("DiagnosticHint", colors.cyan)
  highlight("DiagnosticOk", colors.green)
  highlight("DiagnosticUnderlineError", colors.red, nil, "UNDERLINE")
  highlight("DiagnosticUnderlineWarn", colors.orange, nil, "UNDERLINE")
  highlight("DiagnosticUnderlineInfo", colors.blue, nil, "UNDERLINE")
  highlight("DiagnosticUnderlineHint", colors.cyan, nil, "UNDERLINE")

  -- LSP reference groups
  highlight("LspReferenceText", colors.bg_light, colors.fg)
  highlight("LspReferenceRead", colors.bg_light, colors.blue)
  highlight("LspReferenceWrite", colors.bg_light, colors.green)
end

return { setup = setup }
