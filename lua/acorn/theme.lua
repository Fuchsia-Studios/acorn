--
-- Built with,
--
--        ,gggg,
--       d8" "8I                         ,dPYb,
--       88  ,dP                         IP'`Yb
--    8888888P"                          I8  8I
--       88                              I8  8'
--       88        gg      gg    ,g,     I8 dPgg,
--  ,aa,_88        I8      8I   ,8'8,    I8dP" "8I
-- dP" "88P        I8,    ,8I  ,8'  Yb   I8P    I8
-- Yb,_,d88b,,_   ,d8b,  ,d8b,,8'_   8) ,d8     I8,
--  "Y8P"  "Y888888P'"Y88P"`Y8P' "YY8P8P88P     `Y8
--

-- This is a starter colorscheme for use with Lush,
-- for usage guides, see :h lush or :LushRunTutorial

--
-- Note: Because this is a lua file, vim will append it to the runtime,
--       which means you can require(...) it in other lua code (this is useful),
--       but you should also take care not to conflict with other libraries.
--
--       (This is a lua quirk, as it has somewhat poor support for namespacing.)
--
--       Basically, name your file,
--
--       "super_theme/lua/lush_theme/super_theme_dark.lua",
--
--       not,
--
--       "super_theme/lua/dark.lua".
--
--       With that caveat out of the way...
--

-- Enable lush.ify on this file, run:
--
--  `:Lushify`
--
--  or
--
--  `:lua require('lush').ify()`

local lush = require('lush')
local hsl = lush.hsl

local p = require('acorn.palette')
-- local p = {
--   base = hsl(37, 100, 91),
--   surface = hsl(37, 58, 84),
--   overlay = hsl(37, 64, 72),
--   muted = hsl(257, 11, 65),
--   subtle = hsl(248, 31, 74),
--   -- text = hsl(285, 13, 54),
--   -- text = hsl(300, 3, 64),
--   -- text = hsl(330, 59, 68),
--   -- text = hsl(330, 42, 68),
--   -- text = hsl(248, 20, 58),
--   text = hsl(290, 20, 66), -- mix
--   text_alt = hsl(307, 2, 78),
--   red = hsl(346, 87, 65),
--   -- orange = hsl(356, 76, 70),
--   orange = hsl(356, 70, 68), -- More pastel
--   yellow = hsl(35, 87, 67),
--   green = hsl(168, 42, 54),
--   blue = hsl(191, 52, 63),
--   purple = hsl(295, 52, 76),
-- 	highlight_low = hsl(168, 34, 81),
-- 	highlight_med = hsl(168, 44, 94), -- highl
-- 	highlight_high = hsl(168, 54, 75),
--   none = 'NONE',
--
--   border = hsl(185, 45, 43),
--
--   love = hsl(343, 76, 68),
-- 	gold = hsl(35, 88, 72),
-- 	rose = hsl(2, 66, 75),
-- 	pine = hsl(197, 48, 47),
-- 	foam = hsl(189, 43, 73),
-- 	iris = hsl(267, 57, 78),
-- }

local grps = {
	background = p.base,
	panel = p.surface,
	border = p.highlight_med,
	comment = p.muted,
	link = p.purple,
	punctuation = p.muted,

	error = p.red,
	hint = p.purple,
	info = p.blue,
	warn = p.yellow,

	git_add = p.green,
	git_change = p.red,
	git_delete = p.love,
	git_dirty = p.red,
	git_ignore = p.muted,
	git_merge = p.purple,
	git_rename = p.green,
	git_stage = p.purple,
	git_text = p.red,

	headings = {
		h1 = p.purple,
		h2 = p.blue,
		h3 = p.red,
		h4 = p.yellow,
		h5 = p.green,
		h6 = p.blue,
	},
}

-- local theme = {}
local config = {}
local groups = grps or {}
local styles = {
	italic = (config.disable_italics and p.none) or 'italic',
	vert_split = (config.bold_vert_split and groups.border) or p.none,
	background = (config.disable_background and p.none)
	or groups.background,
	float_background = (config.disable_float_background and p.none)
	or groups.panel,
}
styles.nc_background = (config.dim_nc_background and groups.panel)
or styles.background

-- LSP/Linters mistakenly show `undefined global` errors in the spec, they may
-- support an annotation like the following. Consult your server documentation.
---@diagnostic disable: undefined-global
local theme = lush(function(injected_functions)
  local sym = injected_functions.sym
  return {
    -- The following are the Neovim (as of 0.8.0-dev+100-g371dfb174) highlight
    -- groups, mostly used for styling UI elements.
    -- Comment them out and add your own properties to override the defaults.
    -- An empty definition `{}` will clear all styling, leaving elements looking
    -- like the 'Normal' group.
    -- To be able to link to a group, it must already be defined, so you may have
    -- to reorder items as you go.
    --
    -- See :h highlight-groups
    --
    ColorColumn  { bg = p.surface }, -- Columns set with 'colorcolumn'
    Conceal      { bg = p.none }, -- Placeholder characters substituted for concealed text (see 'conceallevel')
    Cursor       { bg = p.blue, fg = p.red }, -- Character under the cursor
    -- lCursor      { }, -- Character under the cursor when |language-mapping| is used (see 'guicursor')
    -- CursorIM     { }, -- Like Cursor, but used when in IME mode |CursorIM|
    CursorColumn { bg = p.highlight_low }, -- Screen-column at the cursor, when 'cursorcolumn' is set.
    CursorLine   { bg = p.highlight_low }, -- Screen-line at the cursor, when 'cursorline' is set. Low-priority if foreground (ctermfg OR guifg) is not set.
    Directory    { fg = p.blue, bg = p.none }, -- Directory names (and other special names in listings)
    DiffAdd      { bg = groups.git_add.mix(groups.background, 40) }, -- Diff mode: Added line |diff.txt|
    DiffChange   { bg = p.overlay }, -- Columns set with 'colorcolumn'
    DiffDelete   { bg = groups.git_delete.mix(groups.background, 50) }, -- Diff mode: Deleted line |diff.txt|
    DiffText     { bg = groups.git_text.mix(groups.background, 70)}, -- Diff mode: Changed text within a changed line |diff.txt|
    -- EndOfBuffer  { }, -- Filler lines (~) after the end of the buffer. By default, this is highlighted like |hl-NonText|.
    -- TermCursor   { bg = p.purple }, -- Cursor in a focused terminal
    -- TermCursorNC { }, -- Cursor in an unfocused terminal
    ErrorMsg     { fg = p.red, gui = styles.bold }, -- Error messages on the command line
    VertSplit    { bg = p.surface }, -- Column separating vertically split windows
    -- Folded       { }, -- Line used for closed folds
    -- FoldColumn   { }, -- 'foldcolumn'
    SignColumn   { bg = p.surface}, -- Column where |signs| are displayed
    -- IncSearch    { }, -- 'incsearch' highlighting; also used for the text replaced with ":s///c"
    -- Substitute   { }, -- |:substitute| replacement text highlighting
    LineNr       { fg = p.muted }, -- Line number for ":number" and ":#" commands, and when 'number' or 'relativenumber' option is set.
    CursorLineNr { fg = p.green }, -- Like LineNr when 'cursorline' or 'relativenumber' is set for the cursor line.
    MatchParen   { fg = p.none, bg = p.green.mix(p.base, 30) }, -- Character under the cursor or just before it, if it is a paired bracket, and its match. |pi_paren.txt|
    -- ModeMsg      { }, -- 'showmode' message (e.g., "-- INSERT -- ")
    -- MsgArea      { }, -- Area for messages and cmdline
    -- MsgSeparator { }, -- Separator for scrolled messages, `msgsep` flag of 'display'
    MoreMsg      { fg = p.green }, -- |more-prompt|
    NonText      { fg = p.blue }, -- '@' at the end of the window, characters from 'showbreak' and other characters that do not really exist in the text (e.g., ">" displayed when a double-wide character doesn't fit at the end of the line). See also |hl-EndOfBuffer|.
    Normal       { fg = p.text, bg=p.base }, -- Normal text
    NormalFloat  { fg = p.text, bg = styles.float_background }, -- Normal text in floating windows.
    -- NormalNC     { }, -- normal text in non-current windows
    Pmenu        { fg = p.subtle, bg = styles.float_background }, -- Popup menu: Normal item.
    PmenuSel     { fg = p.text, bg = p.overlay }, -- Popup menu: Selected item.
    PmenuSbar    { bg = styles.highlight_low }, -- Popup menu: Scrollbar.
    PmenuThumb   { bg = styles.highlight_med }, -- Popup menu: Thumb of the scrollbar.
    Question     { fg = p.yellow }, -- |hit-enter| prompt and yes/no questions
    -- QuickFixLine { }, -- Current |quickfix| item in the quickfix window. Combined with |hl-CursorLine| when the cursor is there.
    Search       { bg = p.highlight_med }, -- Last search pattern highlighting (see 'hlsearch'). Also used for similar items that need to stand out.
    -- SpecialKey   { }, -- Unprintable characters: text displayed differently from what it really is. But not 'listchars' whitespace. |hl-Whitespace|
    -- SpellBad     { }, -- Word that is not recognized by the spellchecker. |spell| Combined with the highlighting used otherwise.
    -- SpellCap     { }, -- Word that should start with a capital. |spell| Combined with the highlighting used otherwise.
    -- SpellLocal   { }, -- Word that is recognized by the spellchecker as one that is used in another region. |spell| Combined with the highlighting used otherwise.
    -- SpellRare    { }, -- Word that is recognized by the spellchecker as one that is hardly ever used. |spell| Combined with the highlighting used otherwise.
    StatusLine   { bg = p.surface }, -- Status line of current window
    -- StatusLineNC { }, -- Status lines of not-current windows. Note: If this is equal to "StatusLine" Vim will use "^^^" in the status line of the current window.
    -- TabLine      { }, -- Tab pages line, not active tab page label
    -- TabLineFill  { }, -- Tab pages line, where there are no labels
    TabLineSel   { fg = p.text, bg = p.overlay }, -- Tab pages line, active tab page label
    Title        { fg = p.orange }, -- Titles for output from ":set all", ":autocmd" etc.
    Visual       { bg = p.highlight_med }, -- Visual mode selection
    -- VisualNOS    { }, -- Visual mode selection when vim is "Not Owning the Selection".
    WarningMsg   { fg = p.red.darken(15) }, -- Warning messages
    Whitespace   { bg = p.surface}, -- "nbsp", "space", "tab" and "trail" in 'listchars'
    Winseparator { bg = p.surface }, -- Separator between window splits. Inherts from |hl-VertSplit| by default, which it will replace eventually.
    -- WildMenu     { }, -- Current match in 'wildmenu' completion

    -- Common vim syntax groups used for all kinds of code and markup.
    -- Commented-out groups should chain up to their preferred (*) group
    -- by default.
    --
    -- See :h group-name
    --
    -- Uncomment and edit if you want more specific syntax highlighting.

    Comment        { fg = p.text_alt, gui = styles.italic }, -- Any comment

    Constant       { fg = p.yellow }, -- (*) Any constant
    String         { fg = p.yellow }, --   A string constant: "this is a string"
    Character      { fg = p.yellow }, --   A character constant: 'c', '\n'
    Number         { fg = p.yellow }, --   A number constant: 234, 0xff
    Float          { fg = p.yellow }, --   A floating point constant: 2.3e10

    Boolean        { fg = p.orange }, --   A boolean constant: TRUE, false
    Identifier     { fg = p.orange }, -- (*) Any variable name
    Function       { fg = p.orange }, --   Function name (also: methods for classes)

    Statement      { fg = p.green }, -- (*) Any statement
    Conditional    { fg = p.green }, --   if, then, else, endif, switch, etc.
    Repeat         { fg = p.green }, --   for, do, while, etc.
    Keyword        { fg = p.green }, --   any other keyword
    Exception      { fg = p.green }, --   try, catch, throw
    Delimiter      { fg = p.subtle }, --   Character that needs attention
    Operator       { fg = p.subtle }, --   "sizeof", "+", "*", etc.

    PreProc        { fg = p.purple }, -- (*) Generic Preprocessor
    Include        { fg = p.purple }, --   Preprocessor #include
    Define         { fg = p.purple }, --   Preprocessor #define
    Macro          { fg = p.purple }, --   Same as Define
    PreCondit      { fg = p.purple }, --   Preprocessor #if, #else, #endif, etc.

    Type           { fg = p.blue }, -- (*) int, long, char, etc.
    StorageClass   { fg = p.blue }, --   static, register, volatile, etc.
    Structure      { fg = p.blue }, --   struct, union, enum, etc.
    Typedef        { fg = p.blue }, --   A typedef

    Special        { fg = p.orange }, -- (*) Any special symbol
    SpecialChar    { fg = p.orange }, --   Special character in a constant
    Tag            { fg = p.orange }, --   You can use CTRL-] on this
    Label          { fg = p.blue }, --   case, default, etc.
    SpecialComment { fg = p.purple }, --   Special things inside a comment (e.g. '\n')
    Debug          { fg = p.orange }, --   Debugging statements

    Underlined     { gui = "underline" }, -- Text that stands out, HTML links
    Ignore         { }, -- Left blank, hidden |hl-Ignore| (NOTE: May be invisible here in template)
    Error          { }, -- Any erroneous construct
    Todo           { fg = p.red }, -- Anything that needs extra attention; mostly the keywords TODO FIXME and XXX


    -- These groups are for the native LSP client and diagnostic system. Some
    -- other LSP clients may use these groups, or use their own. Consult your
    -- LSP client's documentation.

    -- See :h lsp-highlight, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- LspReferenceText            { } , -- Used for highlighting "text" references
    -- LspReferenceRead            { } , -- Used for highlighting "read" references
    -- LspReferenceWrite           { } , -- Used for highlighting "write" references
    -- LspCodeLens                 { } , -- Used to color the virtual text of the codelens. See |nvim_buf_set_extmark()|.
    -- LspCodeLensSeparator        { } , -- Used to color the seperator between two or more code lens.
    -- LspSignatureActiveParameter { } , -- Used to highlight the active parameter in the signature help. See |vim.lsp.handlers.signature_help()|.

    -- See :h diagnostic-highlights, some groups may not be listed, submit a PR fix to lush-template!
    --
    -- DiagnosticError            { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticWarn             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticInfo             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticHint             { } , -- Used as the base highlight group. Other Diagnostic highlights link to this by default (except Underline)
    -- DiagnosticVirtualTextError { } , -- Used for "Error" diagnostic virtual text.
    -- DiagnosticVirtualTextWarn  { } , -- Used for "Warn" diagnostic virtual text.
    -- DiagnosticVirtualTextInfo  { } , -- Used for "Info" diagnostic virtual text.
    -- DiagnosticVirtualTextHint  { } , -- Used for "Hint" diagnostic virtual text.
    -- DiagnosticUnderlineError   { } , -- Used to underline "Error" diagnostics.
    -- DiagnosticUnderlineWarn    { } , -- Used to underline "Warn" diagnostics.
    -- DiagnosticUnderlineInfo    { } , -- Used to underline "Info" diagnostics.
    -- DiagnosticUnderlineHint    { } , -- Used to underline "Hint" diagnostics.
    -- DiagnosticFloatingError    { } , -- Used to color "Error" diagnostic messages in diagnostics float. See |vim.diagnostic.open_float()|
    -- DiagnosticFloatingWarn     { } , -- Used to color "Warn" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingInfo     { } , -- Used to color "Info" diagnostic messages in diagnostics float.
    -- DiagnosticFloatingHint     { } , -- Used to color "Hint" diagnostic messages in diagnostics float.
    DiagnosticSignError        { bg = p.surface } , -- Used for "Error" signs in sign column.
    DiagnosticSignWarn         { bg = p.surface } , -- Used for "Warn" signs in sign column.
    DiagnosticSignInfo         { bg = p.surface } , -- Used for "Info" signs in sign column.
    DiagnosticSignHint         { bg = p.surface } , -- Used for "Hint" signs in sign column.

    -- Tree-Sitter syntax groups.
    --
    -- See :h treesitter-highlight-groups, some groups may not be listed,
    -- submit a PR fix to lush-template!
    --
    -- Tree-Sitter groups are defined with an "@" symbol, which must be
    -- specially handled to be valid lua code, we do this via the special
    -- sym function. The following are all valid ways to call the sym function,
    -- for more details see https://www.lua.org/pil/5.html
    --
    -- sym("@text.literal")
    -- sym('@text.literal')
    -- sym"@text.literal"
    -- sym'@text.literal'
    --
    -- For more information see https://github.com/rktjmp/lush.nvim/issues/109

    -- sym"@text.literal"      { }, -- Comment
    -- sym"@text.reference"    { }, -- Identifier
    -- sym"@text.title"        { }, -- Title
    -- sym"@text.uri"          { }, -- Underlined
    -- sym"@text.underline"    { }, -- Underlined
    sym"@text.todo"         { link = Todo }, -- Todo
    -- sym"@comment"           { }, -- Comment
    -- sym"@punctuation"       { }, -- Delimiter
    -- sym"@constant"          { }, -- Constant
    -- sym"@constant.builtin"  { }, -- Special
    -- sym"@constant.macro"    { }, -- Define
    -- sym"@define"            { }, -- Define
    -- sym"@macro"             { }, -- Macro
    -- sym"@string"            { }, -- String
    -- sym"@string.escape"     { }, -- SpecialChar
    -- sym"@string.special"    { }, -- SpecialChar
    -- sym"@character"         { }, -- Character
    -- sym"@character.special" { }, -- SpecialChar
    -- sym"@number"            { }, -- Number
    -- sym"@boolean"           { }, -- Boolean
    -- sym"@float"             { }, -- Float
    -- sym"@function"          { }, -- Function
    -- sym"@function.builtin"  { }, -- Special
    -- sym"@function.macro"    { }, -- Macro
    -- sym"@parameter"         { }, -- Identifier
    -- sym"@method"            { }, -- Function
    -- sym"@field"             { }, -- Identifier
    -- sym"@property"          { }, -- Identifier
    -- sym"@constructor"       { }, -- Special
    -- sym"@conditional"       { }, -- Conditional
    -- sym"@repeat"            { }, -- Repeat
    -- sym"@label"             { }, -- Label
    -- sym"@operator"          { }, -- Operator
    -- sym"@keyword"           { }, -- Keyword
    -- sym"@exception"         { }, -- Exception
    sym"@variable"          { fg = p.text, gui = styles.italic }, -- Identifier
    -- sym"@type"              { }, -- Type
    -- sym"@type.definition"   { }, -- Typedef
    -- sym"@storageclass"      { }, -- StorageClass
    -- sym"@structure"         { }, -- Structure
    -- sym"@namespace"         { }, -- Identifier
    -- sym"@include"           { }, -- Include
    -- sym"@preproc"           { }, -- PreProc
    -- sym"@debug"             { }, -- Debug
    -- sym"@tag"               { }, -- Tag

    ------------
    -- Telescope
  --   TelescopeBorder = { fg = p.blue, bg = p.overlay },
		-- TelescopeMatching = { fg = p.red },
		-- TelescopeNormal = { fg = p.subtle, bg = p.overlay },
		-- TelescopePromptNormal = { fg = p.text, bg = p.overlay },
		-- TelescopePromptPrefix = { fg = p.subtle },
		-- TelescopeSelection = { fg = p.text, bg = p.overlay },
		-- TelescopeSelectionCaret = { fg = p.red, bg = p.overlay },
		-- TelescopeTitle = { fg = p.subtle },
    TSVariable { fg = p.text, style = styles.italic },

}
end)

-- Return our parsed theme for extension or use elsewhere.
return theme

-- vi:nowrap
