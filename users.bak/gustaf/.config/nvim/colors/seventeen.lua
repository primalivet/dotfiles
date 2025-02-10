-- Reset highlights
vim.cmd("hi clear")
vim.cmd("syntax reset")

-- Set colorscheme name
vim.g.colors_name = "seventeen"
vim.opt.termguicolors = true

local ansi = {
	-- Base colors
	black = "#1A1D21",        -- color0: Main background
	red = "#E8525C",         -- color1: Error states, negative actions
	green = "#66C489",       -- color2: Success states, positive actions
	yellow = "#ECB222",      -- color3: Warnings, highlighted items
	blue = "#59A4F8",        -- color4: Links, primary actions
	magenta = "#DD7FE6",     -- color5: Special actions
	cyan = "#5DB0D7",        -- color6: Secondary information
	white = "#D1D3D6",       -- color7: Primary text

	-- Bright variants
	bright_black = "#616061", -- color8: Dimmed text, secondary text
	bright_red = "#F37067",   -- color9: Bright error states
	bright_green = "#85D394", -- color10: Bright success states
	bright_yellow = "#F6B73C", -- color11: Bright warnings
	bright_blue = "#6AB4F8",  -- color12: Bright links
	bright_magenta = "#E68FEF", -- color13: Bright special actions
	bright_cyan = "#67C7E2",  -- color14: Bright secondary info
	bright_white = "#FFFFFF", -- color15: Bright text, emphasized
	none = "NONE"
}

local diff = {
	-- Very dark backgrounds for diffs
	green_bg = "#1C2620",    -- Deep, dark green for additions
	red_bg = "#2C1F1F",      -- Deep, dark red for deletions
	blue_bg = "#1F2838",     -- Deep, dark blue for changes

	-- Bright foregrounds (using our ANSI colors)
	green_fg = ansi.bright_green,
	red_fg = ansi.bright_red,    
	blue_fg = ansi.bright_blue,
}

local elevation = {
	-- From darkest (lowest) to lightest (highest)
	base = "#1A1D21",       -- Darkest, main background
	surface = "#222529",    -- Slightly elevated (cards, subtle containers)
	low = "#2B2E33",        -- Low elevation (hover states, secondary containers)
	medium = "#363A3F",     -- Medium elevation (active elements, tertiary containers)
	high = "#424548",       -- Higher elevation (floating elements, popovers)
	highest = "#4E5256",    -- Highest elevation (modals, dropdowns)

	-- Divider and border colors
	border = "#303236",     -- Subtle borders
	border_strong = "#404246", -- Emphasized borders

	-- Text variations
	text_dimmed = "#616061",    -- Dimmed text
	text_muted = "#919293",     -- Secondary text
	text_normal = "#D1D3D6",    -- Primary text
	text_bright = "#FFFFFF",    -- Emphasized text
}

-- Semantic color assignments
local c = {
	-- UI Elements
	bg = elevation.base,
	fg = elevation.text_normal,
	sign_fg = elevation.text_dimmed,
	divider = elevation.text_dimmed,
	ui_gray = ansi.bright_black,
	ui_subtle = ansi.white,

	-- Syntax
	comment = ansi.cyan,
	string = ansi.green,
	keyword = ansi.bright_yellow,

	-- Diff colors
	diff_add = diff.green_fg,
	diff_add_bg = diff.green_bg,
	diff_delete = diff.red_fg,
	diff_delete_bg = diff.red_bg,
	diff_text = diff.blue_fg,
	diff_text_bg = diff.blue_bg,

	-- Selection/Search
	visual_bg = ansi.blue,
	visual_fg = ansi.bright_white,
	search_bg = ansi.yellow,
	search_fg = ansi.black,
	inc_search_bg = ansi.bright_yellow,

	-- Diagnostic
	error = ansi.red,
	warning = ansi.yellow,
	info = ansi.cyan,
	hint = ansi.blue,

	-- UI Highlights
	match_bg = ansi.green,
	pmenu_bg = elevation.low,
	status_bg = elevation.surface,
	status_fg = elevation.text_muted,
	tab_bg = ansi.bright_white,
	tab_fg = ansi.black
}

local highlights = {
	-- Base highlights
	Normal = { fg = c.fg, bg = c.bg },
	NormalNC = { link = "Normal" },
	NormalFloat = { link = "Normal" },
	FloatBorder = { link = "Normal" },
	FloatFooter = { link = "Normal" },
	FloatTitle = { link = "Normal" },

	Cursor = { link = "Normal" },
	CursorIM = { link = "Normal" },
	lCursor = { link = "Normal" },
	TermCursor = { link = "Normal" },
	TermCursorNC = { link = "Normal" },

	CursorLine = { link = "Normal" },
	CursorLineFold = { link = "Normal" },
	CursorLineSign = { link = "Normal" },

	ColorColumn = { bg = c.ui_gray },
	CursorColumn = { link = "Normal" },

	-- Messages
	ErrorMsg = { link = "Normal" },
	ModeMsg = { link = "Normal" },
	MoreMsg = { link = "Normal" },
	MsgArea = { link = "Normal" },
	MsgSeparator = { link = "Normal" },
	Question = { link = "Normal" },
	WarningMsg = { link = "Normal" },

	-- Folding
	FoldColumn = { link = "Normal" },
	Folded = { link = "Normal" },

	-- Whitespace
	Whitespace = { fg = c.ui_gray },
	NonText = { link = "Whitespace" },
	EndOfBuffer = { link = "Whitespace" },
	SpecialKey = { link = "Normal" },

	-- Sidebar
	LineNr = { fg = c.sign_fg },
	LineNrAbove = { link = "LineNr" },
	LineNrBelow = { link = "LineNr" },
	CursorLineNr = { link = "LineNr" },
	SignColumn = { link = "Normal" },

	-- Windows and Tabs
	VertSplit = { fg = c.divider },
	WinSeparator = { link = "VertSplit" },
	TabLine = { fg = c.tab_fg, bg = c.tab_bg },
	TabLineFill = { fg = c.tab_fg, bg = c.tab_bg },
	TabLineSel = { link = "Normal" },

	-- Search and Selection
	IncSearch = { fg = c.search_fg, bg = c.inc_search_bg },
	Search = { fg = c.search_fg, bg = c.search_bg },
	CurSearch = { link = "IncSearch" },
	Substitute = { link = "Search" },
	MatchParen = { fg = c.search_fg, bg = c.match_bg },
	Visual = { fg = c.visual_fg, bg = c.visual_bg },
	VisualNOS = { link = "Visual" },

	-- Popup Menu
	Pmenu = { bg = c.pmenu_bg },
	PmenuSbar = { bg = c.pmenu_bg },
	PmenuSel = { fg = c.search_fg, bg = c.search_bg },
	PmenuThumb = { bg = c.search_fg },

	-- Status Line
	StatusLine = { fg = c.status_fg, bg = c.status_bg },
	StatusLineNC = { fg = c.status_fg, bg = c.status_bg },
	StatusLineTerm = { link = "StatusLine" },
	StatusLineTermNC = { link = "StatusLine" },
	WildMenu = { fg = c.search_fg, bg = c.search_bg },
	WinBar = { link = "StatusLine" },
	WinBarNC = { link = "StatusLine" },

	-- Diffs
	DiffAdd = { fg = c.diff_add, bg = c.diff_add_bg },
	DiffChange = { fg = c.diff_add, bg = c.diff_add_bg },
	DiffDelete = { fg = c.diff_delete, bg = c.diff_delete_bg },
	DiffText = { fg = c.diff_text, bg = c.diff_text_bg},

	-- Spelling
	SpellBad = { fg = c.error, underline = true },
	SpellCap = { fg = c.error, underline = true },
	SpellLocal = { fg = c.error, underline = true },
	SpellRare = { fg = c.error, underline = true },

	-- Syntax
	Comment = { fg = c.comment, italic = true },
	Constant = {},
	String = { fg = c.string },
	Character = { fg = c.string },
	Number = { link = "Constant" },
	Boolean = { link = "Constant" },
	Float = { link = "Constant" },

	Identifier = {},
	Function = { fg = c.keyword, bold = true },

	Statement = { fg = c.keyword, bold = true },
	Conditional = { link = "Statement" },
	Repeat = { link = "Statement" },
	Label = { link = "Statement" },
	Operator = {},
	Keyword = { link = "Statement" },
	Exception = { link = "Statement" },

	PreProc = { fg = c.keyword, bold = true },
	Include = { link = "PreProc" },
	Define = { link = "PreProc" },
	Macro = { link = "PreProc" },
	PreCondit = { link = "PreProc" },

	Type = {},
	StorageClass = { link = "Normal" },
	Structure = { link = "Type" },
	Typedef = { link = "Type" },

	Special = {},
	SpecialChar = { link = "Special" },
	Tag = { link = "Special" },
	Delimiter = { link = "Special" },
	SpecialComment = { link = "Special" },
	Debug = { link = "Special" },

	Underlined = { underline = true },
	Ignore = {},
	Error = { fg = c.error },
	Todo = { fg = c.search_fg, bg = c.search_bg },

	-- Diagnostics
	DiagnosticError = { fg = c.error },
	DiagnosticWarn = { fg = c.warning },
	DiagnosticInfo = { fg = c.info },
	DiagnosticHint = { fg = c.hint },
	DiagnosticOk = { fg = c.string },
	DiagnosticDeprecated = { fg = c.error },
	DiagnosticUnnecessary = {},

	DiagnosticUnderlineError = { fg = c.error, underline = true },
	DiagnosticUnderlineWarn = { fg = c.warning, underline = true },
	DiagnosticUnderlineInfo = { fg = c.info, underline = true },
	DiagnosticUnderlineHint = { fg = c.hint, underline = true },
	DiagnosticUnderlineOk = { fg = c.string, underline = true },

	-- Treesitter
	["@variable"] = { link = "Identifier" },
	["@variable.builtin"] = { link = "Identifier" },
	["@variable.parameter"] = { link = "Identifier" },
	["@variable.parameter.builtin"] = { link = "Identifier" },
	["@variable.member"] = { link = "Identifier" },

	["@constant"] = { link = "Constant" },
	["@constant.builtin"] = { link = "Constant" },
	["@constant.macro"] = { link = "Constant" },

	["@module"] = { link = "PreProc" },
	["@module.builtin"] = { link = "PreProc" },
	["@label"] = { link = "Label" },

	["@string"] = { link = "String" },
	["@string.documentation"] = { link = "String" },
	["@string.regexp"] = { link = "Character" },
	["@string.escape"] = { link = "Character" },
	["@string.special"] = { link = "Character" },
	["@string.special.symbol"] = { link = "Character" },
	["@string.special.path"] = { link = "Character" },
	["@string.special.url"] = { link = "Character" },

	["@character"] = { link = "Character" },
	["@character.special"] = { link = "Character" },

	["@boolean"] = { link = "Constant" },
	["@number"] = { link = "Constant" },
	["@number.float"] = { link = "Constant" },

	["@type"] = { link = "Type" },
	["@type.builtin"] = { link = "Type" },
	["@type.definition"] = { link = "Type" },

	["@attribute"] = { link = "Constant" },
	["@attribute.builtin"] = { link = "Constant" },
	["@property"] = { link = "Identifier" },

	["@function"] = { link = "Identifier" },
	["@function.builtin"] = { link = "Identifier" },
	["@function.call"] = { link = "Identifier" },
	["@function.macro"] = { link = "Identifier" },
	["@function.method"] = { link = "Identifier" },
	["@function.method.call"] = { link = "Identifier" },

	["@constructor"] = { link = "Identifier" },
	["@operator"] = { link = "Operator" },

	["@keyword"] = { link = "Keyword" },
	["@keyword.coroutine"] = { link = "Keyword" },
	["@keyword.function"] = { link = "Function" },
	["@keyword.operator"] = { link = "Operator" },
	["@keyword.import"] = { link = "PreProc" },
	["@keyword.type"] = { link = "Type" },
	["@keyword.modifier"] = { link = "Keyword" },
	["@keyword.repeat"] = { link = "Repeat" },
	["@keyword.return"] = { link = "Keyword" },
	["@keyword.debug"] = { link = "Keyword" },
	["@keyword.exception"] = { link = "Exception" },
	["@keyword.conditional"] = { link = "Conditional" },
	["@keyword.conditional.ternary"] = { link = "Conditional" },
	["@keyword.directive"] = { link = "Keyword" },
	["@keyword.directive.define"] = { link = "Keyword" },

	["@punctuation.delimiter"] = { link = "Delimiter" },
	["@punctuation.bracket"] = { link = "Delimiter" },
	["@punctuation.special"] = { link = "Delimiter" },

	["@comment"] = { link = "Comment" },
	["@comment.documentation"] = { link = "Comment" },
	["@comment.error"] = { link = "Todo" },
	["@comment.warning"] = { link = "Todo" },
	["@comment.todo"] = { link = "Todo" },
	["@comment.note"] = { link = "Todo" },

	["@markup.strong"] = { bold = true },
	["@markup.italic"] = { italic = true },
	["@markup.strikethrough"] = { strikethrough = true },
	["@markup.underline"] = { underline = true },

	["@markup.heading"] = { link = "Normal" },
	["@markup.heading.1"] = { link = "Normal" },
	["@markup.heading.2"] = { link = "Normal" },
	["@markup.heading.3"] = { link = "Normal" },
	["@markup.heading.4"] = { link = "Normal" },
	["@markup.heading.5"] = { link = "Normal" },
	["@markup.heading.6"] = { link = "Normal" },
	["@markup.quote"] = { link = "Normal" },
	["@markup.math"] = { link = "Normal" },

	["@markup.link"] = { underline = true },
	["@markup.link.label"] = { link = "Normal" },
	["@markup.link.url"] = { link = "Normal" },

	["@markup.raw"] = { link = "Normal" },
	["@markup.raw.block"] = { link = "Normal" },
	["@markup.list"] = { link = "Normal" },
	["@markup.list.checked"] = { link = "Normal" },
	["@markup.list.unchecked"] = { link = "Normal" },

	["@diff.plus"] = { link = "Added" },
	["@diff.minus"] = { link = "Removed" },
	["@diff.delta"] = { link = "Changed" },

	["@tag"] = { link = "Tag" },
	["@tag.builtin"] = { link = "Tag" },
	["@tag.attribute"] = { link = "Tag" },
	["@tag.delimiter"] = { link = "Tag" },

	-- LSP semantic highlights
	["@lsp.type.class"] = {},
	["@lsp.type.comment"] = {},
	["@lsp.type.decorator"] = {},
	["@lsp.type.enum"] = {},
	["@lsp.type.enumMember"] = {},
	["@lsp.type.event"] = {},
	["@lsp.type.function"] = {},
	["@lsp.type.interface"] = {},
	["@lsp.type.keyword"] = {},
	["@lsp.type.macro"] = {},
	["@lsp.type.method"] = {},
	["@lsp.type.modifier"] = {},
	["@lsp.type.namespace"] = {},
	["@lsp.type.number"] = {},
	["@lsp.type.operator"] = {},
	["@lsp.type.parameter"] = {},
	["@lsp.type.property"] = {},
	["@lsp.type.regexp"] = {},
	["@lsp.type.string"] = {},
	["@lsp.type.struct"] = {},
	["@lsp.type.type"] = {},
	["@lsp.type.typeParameter"] = {},
	["@lsp.type.variable"] = {},

	["@lsp.mod.abstract"] = {},
	["@lsp.mod.async"] = {},
	["@lsp.mod.declaration"] = {},
	["@lsp.mod.defaultLibrary"] = {},
	["@lsp.mod.definition"] = {},
	["@lsp.mod.deprecated"] = { link = "DiagnosticDeprecated" },
	["@lsp.mod.documentation"] = {},
	["@lsp.mod.modification"] = {},
	["@lsp.mod.readonly"] = {},
	["@lsp.mod.static"] = {},

	-- LSP highlights
	LspReferenceText = { link = "Search" },
	LspReferenceRead = { link = "Search" },
	LspReferenceWrite = { link = "Search" },
	LspInlayHint = { link = "Comment" },
	LspCodeLens = { link = "NonText" },
	LspCodeLensSeparator = { link = "NonText" },
	LspSignatureActiveParameter = { link = "Search" },


	-- Git signs
	GitSignsAdd = { fg = c.diff_add },
	GitSignsChange = { fg = c.diff_add },
	GitSignsDelete = { fg = c.diff_delete },
}

-- Set all highlights
for group, settings in pairs(highlights) do
	vim.api.nvim_set_hl(0, group, settings)
end
