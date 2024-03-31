M = {}

local c = require("curry.palette")

local highlight_groups = {

	-- `:h highlight-groups` {{{
	ColorColumn = { fg = "NONE", bg = c.cursor },
	Conceal = { fg = c.mono_4, bg = "NONE" },
	Cursor = { fg = "NONE", bg = c.accent },
	CursorColumn = { fg = "NONE", bg = c.cursor },
	CursorIM = { fg = "NONE", bg = "NONE" },
	CursorLineNr = { fg = c.fg, bg = "NONE", bold = true },
	Directory = { fg = c.blue, bg = "NONE" },
	DiffAdd = { fg = "NONE", bg = c.added_bg },
	DiffAdded = { fg = "NONE", bg = c.added_bg },
	DiffChange = { fg = "NONE", bg = c.modified_bg },
	DiffText = { fg = c.bg, bg = c.red },
	DiffDelete = { fg = "NONE", bg = c.removed_bg },
	DiffRemoved = { fg = "NONE", bg = c.removed_bg },
	ErrorMsg = { fg = c.red, bg = "NONE" },
	WinSeparator = { fg = c.mono_3, bg = "NONE" },
	Folded = { fg = "NONE", bg = c.tinted_bg },
	FoldColumn = { fg = c.mono_3, bg = c.cursor },
	SignColumn = { fg = "NONE", bg = "NONE" },
	IncSearch = { fg = c.bg, bg = c.accent },
	LineNr = { fg = c.mono_4, bg = "NONE" },
	CursorLine = { fg = "NONE", bg = c.cursor },
	MatchParen = { fg = c.red, bg = c.cursor, underline = true, bold = true },
	ModeMsg = { fg = c.fg, bg = "NONE" },
	MoreMsg = { fg = c.fg, bg = "NONE" },
	NonText = { fg = c.mono_3, bg = "NONE" },
	Normal = { fg = c.fg, bg = c.bg },
	NormalFloat = { fg = c.fg, bg = c.tinted_bg },
	FloatBorder = { fg = c.fg, bg = c.tinted_bg },
	FloatTitle = { fg = "NONE", bg = "NONE", reverse = true },
	Pmenu = { fg = "NONE", bg = c.pmenu },
	PmenuSel = { fg = "NONE", bg = c.mono_4 },
	PmenuSbar = { fg = "NONE", bg = c.mono_3 },
	PmenuThumb = { fg = "NONE", bg = c.mono_2 },
	Question = { fg = c.blue, bg = "NONE" },
	Search = { fg = c.bg, bg = c.accent },
	SpecialKey = { fg = "NONE", bg = "NONE", bold = true },
	StatusLine = { fg = c.fg, bg = c.cursor },
	StatusLineNC = { fg = c.mono_3, bg = "NONE" },
	TabLine = { fg = "NONE", bg = c.tinted_bg },
	TabLineFill = { fg = "NONE", bg = c.tinted_bg },
	TabLineSel = { fg = c.bg, bg = c.accent },
	Title = { fg = c.fg, bg = "NONE", bold = true },
	Visual = { fg = "NONE", bg = c.visual },
	VisualNOS = { fg = "NONE", bg = c.visual, italic = true },
	WarningMsg = { fg = c.orange, bg = "NONE" },
	Whitespace = { fg = c.mono_4, bg = "NONE" },
	WildMenu = { fg = c.fg, bg = c.mono_3 },
	-- }}}

	-- `Bufferline` {{{
	BufferCurrent = { fg = c.accent, bg = c.white },
	BufferCurrentIndex = { fg = c.accent, bg = c.white },
	BufferCurrentSign = { fg = c.accent, bg = c.white },
	BufferCurrentMod = { fg = c.modified, bg = c.white },
	BufferCurrentTarget = { fg = c.red, bg = c.white },
	BufferInactive = { fg = c.mono_3, bg = c.tinted_bg },
	BufferInactiveIndex = { fg = c.mono3, bg = c.tinted_bg },
	BufferInactiveMod = { fg = c.modified, bg = c.tinted_bg },
	BufferInactiveSign = { fg = c.mono_3, bg = c.tinted_bg },
	BufferInactiveTarget = { fg = c.red, bg = c.tinted_bg },
	-- }}}

	-- `:h group-name` {{{
	Comment = { fg = c.mono_3, bg = "NONE" },
	Constant = { fg = c.green, bg = "NONE" },
	String = { fg = c.green, bg = "NONE" },
	Character = { fg = c.green, bg = "NONE" },
	Number = { fg = c.brown, bg = "NONE" },
	Boolean = { fg = c.brown, bg = "NONE" },
	Float = { fg = c.brown, bg = "NONE" },
	Identifier = { fg = c.orange, bg = "NONE" },
	Function = { fg = c.blue, bg = "NONE" },
	Statement = { fg = c.purple, bg = "NONE" },
	Conditional = { fg = c.purple, bg = "NONE" },
	Repeat = { fg = c.purple, bg = "NONE" },
	Label = { fg = c.purple, bg = "NONE" },
	Operator = { fg = c.accent, bg = "NONE" },
	Keyword = { fg = c.purple, bg = "NONE" },
	Exception = { fg = c.purple, bg = "NONE" },
	PreProc = { fg = c.gold, bg = "NONE" },
	Include = { fg = c.purple, bg = "NONE" },
	Define = { fg = c.purple, bg = "NONE" },
	Macro = { fg = c.purple, bg = "NONE" },
	PreCondit = { fg = c.gold, bg = "NONE" },
	Type = { fg = c.gold, bg = "NONE" },
	StorageClass = { fg = c.gold, bg = "NONE" },
	Structure = { fg = c.gold, bg = "NONE" },
	Typedef = { fg = c.gold, bg = "NONE" },
	Special = { fg = c.purple, bg = "NONE" },
	SpecialChar = { fg = "NONE", bg = "NONE" },
	Tag = { fg = "NONE", bg = "NONE" },
	Delimiter = { fg = "NONE", bg = "NONE" },
	SpecialComment = { fg = "NONE", bg = "NONE", italic = true },
	Debug = { fg = "NONE", bg = "NONE" },
	Underlined = { fg = "NONE", bg = "NONE", underline = true },
	Ignore = { fg = c.mono_4, bg = "NONE" },
	Error = { fg = c.orange, bg = "NONE", bold = true },
	Todo = { fg = c.accent, bg = "NONE" },
	-- }}}

	-- `:h treesitter-highlight-group` {{{

	-- Default groups are respected.
	-- Here's a list of overrides
	-- To get a list of all possible groups
	-- `rg --no-filename -o -g '**/highlights.scm' '^\s*?[^;].*? (@[^\s_)"]+?)[\s)]*$' -r '$1' | sort | uniq`

	["@keyword.gitcommit"] = { link = "Function" },
	["@field"] = { fg = c.cyan, bg = "NONE" },
	["@parameter"] = { fg = c.red, bg = "NONE" },
	["@property"] = { fg = c.cyan, bg = "NONE" },
	["@type.qualifier"] = { fg = c.orange, bg = "NONE" },
	["@type.qualifier.rust"] = { fg = c.orange, bg = "NONE", bold = true },

	-- Treesitter markdown
	["@text.title.1.marker.markdown"] = { fg = c.cyan, bg = "NONE" },
	["@text.title.2.marker.markdown"] = { fg = c.cyan, bg = "NONE" },
	["@text.title.3.marker.markdown"] = { fg = c.cyan, bg = "NONE" },
	["@text.title.4.marker.markdown"] = { fg = c.cyan, bg = "NONE" },
	["@text.title.5.marker.markdown"] = { fg = c.cyan, bg = "NONE" },
	["@text.title.6.marker.markdown"] = { fg = c.cyan, bg = "NONE" },
	["@text.title.1.markdown"] = { fg = c.blue },
	["@text.title.2.markdown"] = { fg = c.blue },
	["@text.title.3.markdown"] = { fg = c.blue },
	["@text.title.4.markdown"] = { fg = c.blue },
	["@text.title.5.markdown"] = { fg = c.blue },
	["@text.title.6.markdown"] = { fg = c.blue },

	["@text.literal.block.markdown"] = { fg = c.fg },
	["@text.literal.markdown_inline"] = { fg = c.purple },

	["@punctuation.special.markdown"] = { fg = c.brown },

	-- }}}

	-- LSP Semantic tokens  {{{
	--  https://code.visualstudio.com/api/language-extensions/semantic-highlight-guide
	["@lsp.type.class"] = { link = "Structure" },
	["@lsp.type.comment"] = { link = "Comment" },
	["@lsp.type.decorator"] = { fg = "NONE", bg = "NONE", italic = true },
	["@lsp.type.enum"] = { link = "Structure" },
	["@lsp.type.enumMember"] = { link = "Constant" },
	["@lsp.type.event"] = { fg = "NONE", bg = "NONE" },
	["@lsp.type.function"] = { link = "Function" },
	["@lsp.type.interface"] = { link = "Structure" },
	["@lsp.type.keyword"] = { link = "Keyword" },
	["@lsp.type.label"] = { link = "Label" },
	["@lsp.type.macro"] = { link = "Macro" },
	["@lsp.type.method"] = { link = "Function" },
	["@lsp.type.modifier"] = { link = "@type.qualifier" },
	["@lsp.type.modifier.rust"] = { link = "@type.qualifier.rust" },
	["@lsp.type.namespace"] = { link = "Structure" },
	["@lsp.type.number"] = { link = "Number" },
	["@lsp.type.operator"] = { link = "Operator" },
	["@lsp.type.parameter"] = { link = "@parameter" },
	["@lsp.type.property"] = { link = "@property" },
	["@lsp.type.regexp"] = { fg = "NONE", bg = "NONE", bold = true },
	["@lsp.type.string"] = { link = "String" },
	["@lsp.type.struct"] = { link = "Structure" },
	["@lsp.type.type"] = { link = "Structure" },
	["@lsp.type.typeParameter"] = { link = "@parameter" },
	["@lsp.type.variable"] = { link = "Identifier" },
	["@lsp.typemod.variable.defaultLibrary"] = { fg = c.accent, bg = "NONE" },
	-- }}}

	-- `:h spell` {{{
	SpellBad = { fg = "NONE", bg = "NONE", italic = true, undercurl = true },
	SpellLocal = { fg = "NONE", bg = "NONE", italic = true, undercurl = true },
	SpellCap = { fg = "NONE", bg = "NONE", italic = true, undercurl = true },
	SpellRare = { fg = "NONE", bg = "NONE", italic = true, undercurl = true },
	-- }}}

	-- treesitter-context {{{
	TreesitterContextBottom = { fg = "NONE", bg = c.tinted_bg, underline = true },
	-- }}}

	-- LSP {{{
	LspCodeLens = { fg = c.mono_3, bg = "NONE", italic = true },
	LspCodeLensSeparator = { fg = c.fg, bg = "NONE" },
	-- }}}

	-- Diagnostics {{{
	DiagnosticError = { fg = c.red, bg = "NONE" },
	DiagnosticWarn = { fg = c.orange, bg = "NONE" },
	DiagnosticInfo = { fg = c.accent, bg = "NONE" },
	DiagnosticHint = { fg = c.mono_2, bg = "NONE" },
	DiagnosticUnnecessary = { fg = "NONE", bg = "NONE", italic = true },
	DiagnosticDeprecated = { fg = "NONE", bg = "NONE", italic = true },
	-- }}}

	-- Telescope {{{
	TelescopeNormal = { link = "NormalFloat" },
	TelescopeBorder = { link = "FloatBorder" },
	TelescopeSelection = { fg = "NONE", bg = c.visual, bold = true },
	TelescopeSelectionCaret = { fg = c.accent, bg = "NONE" },
	TelescopeMatching = { fg = c.red, bg = "NONE" },
	TelescopePromptTitle = { link = "FloatTitle" },
	TelescopeResultsTitle = { link = "FloatTitle" },
	TelescopePreviewTitle = { link = "FloatTitle" },
	-- }}}

	-- cmp {{{
	-- `:h cmp-highlight`
	CmpItemAbbr = { fg = "NONE", bg = "NONE" },
	CmpItemAbbrDeprecated = { fg = c.mono_3, bg = "NONE" },
	CmpItemAbbrMatch = { fg = c.fg, bg = "NONE", bold = true },
	CmpItemAbbrMatchFuzzy = { fg = c.fg, bg = "NONE", underline = true },
	CmpItemKind = { fg = "NONE", bg = "NONE" },
	CmpItemKindKeyword = { link = "Keyword" },
	CmpItemKindVariable = { link = "Identifier" },
	CmpItemKindConstant = { link = "Constant" },
	CmpItemKindReference = { link = "Identifier" },
	CmpItemKindValue = { link = "Number" },
	CmpItemKindFunction = { link = "Function" },
	CmpItemKindMethod = { link = "Function" },
	CmpItemKindConstructor = { link = "@constructor" },
	CmpItemKindClass = { link = "Structure" },
	CmpItemKindInterface = { link = "Structure" },
	CmpItemKindStruct = { link = "Structure" },
	CmpItemKindEvent = { link = "Structure" },
	CmpItemKindEnum = { link = "Structure" },
	CmpItemKindUnit = { link = "Structure" },
	CmpItemKindModule = { link = "Structure" },
	CmpItemKindProperty = { link = "@property" },
	CmpItemKindField = { link = "@field" },
	CmpItemKindTypeParameter = { link = "@parameter" },
	CmpItemKindEnumMember = { link = "Constant" },
	CmpItemKindOperator = { link = "Operator" },
	CmpItemKindSnippet = { fg = "NONE", bg = "NONE", italic = true },
	CmpItemKindText = { fg = c.mono_3, bg = "NONE" },
	CmpItemMenu = { fg = "NONE", bg = "NONE" },
	-- }}}

	-- {{{
	GitSignsUntracked = { fg = c.mono_3, bg = "NONE" },
	GitSignsAdd = { fg = c.added, bg = "NONE" },
	GitSignsChange = { fg = c.modified, bg = "NONE" },
	GitSignsDelete = { fg = c.removed, bg = "NONE" },
	GitSignsCurrentLineBlame = { fg = c.mono_2, bg = "NONE", italic = true },
	-- }}}

	---------------------------
	-- Filetype Highlighting --
	---------------------------
	-- Not really maintained
	-- {{{
	asciidocListingBlock = { fg = c.mono_2, bg = "NONE" },
	-- }}}

	-- {{{
	cInclude = { fg = c.purple, bg = "NONE" },
	cPreCondit = { fg = c.purple, bg = "NONE" },
	cPreConditMatch = { fg = c.purple, bg = "NONE" },
	cType = { fg = c.purple, bg = "NONE" },
	cStorageClass = { fg = c.purple, bg = "NONE" },
	cStructure = { fg = c.purple, bg = "NONE" },
	cOperator = { fg = c.purple, bg = "NONE" },
	cStatement = { fg = c.purple, bg = "NONE" },
	cTODO = { fg = c.purple, bg = "NONE" },
	cConstant = { fg = c.brown, bg = "NONE" },
	cSpecial = { fg = c.cyan, bg = "NONE" },
	cSpecialCharacter = { fg = c.cyan, bg = "NONE" },
	cString = { fg = c.green, bg = "NONE" },
	cppType = { fg = c.purple, bg = "NONE" },
	cppStorageClass = { fg = c.purple, bg = "NONE" },
	cppStructure = { fg = c.purple, bg = "NONE" },
	cppModifier = { fg = c.purple, bg = "NONE" },
	cppOperator = { fg = c.purple, bg = "NONE" },
	cppAccess = { fg = c.purple, bg = "NONE" },
	cppStatement = { fg = c.purple, bg = "NONE" },
	cppConstant = { fg = c.orange, bg = "NONE" },
	cCppString = { fg = c.green, bg = "NONE" },
	-- }}}

	-- {{{
	cucumberGiven = { fg = c.blue, bg = "NONE" },
	cucumberWhen = { fg = c.blue, bg = "NONE" },
	cucumberWhenAnd = { fg = c.blue, bg = "NONE" },
	cucumberThen = { fg = c.blue, bg = "NONE" },
	cucumberThenAnd = { fg = c.blue, bg = "NONE" },
	cucumberUnparsed = { fg = c.brown, bg = "NONE" },
	cucumberFeature = { fg = c.orange, bg = "NONE", bold = true },
	cucumberBackground = { fg = c.purple, bg = "NONE", bold = true },
	cucumberScenario = { fg = c.purple, bg = "NONE", bold = true },
	cucumberScenarioOutline = { fg = c.purple, bg = "NONE", bold = true },
	cucumberTags = { fg = c.mono_3, bg = "NONE", bold = true },
	cucumberDelimiter = { fg = c.mono_3, bg = "NONE", bold = true },
	-- }}}

	-- {{{
	cssAttrComma = { fg = c.purple, bg = "NONE" },
	cssAttributeSelector = { fg = c.green, bg = "NONE" },
	cssBraces = { fg = c.mono_2, bg = "NONE" },
	cssClassName = { fg = c.brown, bg = "NONE" },
	cssClassNameDot = { fg = c.brown, bg = "NONE" },
	cssDefinition = { fg = c.purple, bg = "NONE" },
	cssFontAttr = { fg = c.brown, bg = "NONE" },
	cssFontDescriptor = { fg = c.purple, bg = "NONE" },
	cssFunctionName = { fg = c.blue, bg = "NONE" },
	cssIdentifier = { fg = c.blue, bg = "NONE" },
	cssImportant = { fg = c.purple, bg = "NONE" },
	cssInclude = { fg = c.mono_1, bg = "NONE" },
	cssIncludeKeyword = { fg = c.purple, bg = "NONE" },
	cssMediaType = { fg = c.brown, bg = "NONE" },
	cssProp = { fg = c.cyan, bg = "NONE" },
	cssPseudoClassId = { fg = c.brown, bg = "NONE" },
	cssSelectorOp = { fg = c.purple, bg = "NONE" },
	cssSelectorOp2 = { fg = c.purple, bg = "NONE" },
	cssStringQ = { fg = c.green, bg = "NONE" },
	cssStringQQ = { fg = c.green, bg = "NONE" },
	cssTagName = { fg = c.orange, bg = "NONE" },
	cssAttr = { fg = c.brown, bg = "NONE" },
	sassAmpersand = { fg = c.orange, bg = "NONE" },
	sassClass = { fg = c.gold, bg = "NONE" },
	sassControl = { fg = c.purple, bg = "NONE" },
	sassExtend = { fg = c.purple, bg = "NONE" },
	sassFor = { fg = c.mono_1, bg = "NONE" },
	sassProperty = { fg = c.cyan, bg = "NONE" },
	sassFunction = { fg = c.cyan, bg = "NONE" },
	sassId = { fg = c.blue, bg = "NONE" },
	sassInclude = { fg = c.purple, bg = "NONE" },
	sassMedia = { fg = c.purple, bg = "NONE" },
	sassMediaOperators = { fg = c.mono_1, bg = "NONE" },
	sassMixin = { fg = c.purple, bg = "NONE" },
	sassMixinName = { fg = c.blue, bg = "NONE" },
	sassMixing = { fg = c.purple, bg = "NONE" },
	scssSelectorName = { fg = c.gold, bg = "NONE" },
	-- }}}

	-- {{{
	elixirModuleDefine = { link = "Define" },
	elixirAlias = { fg = c.gold, bg = "NONE" },
	elixirAtom = { fg = c.cyan, bg = "NONE" },
	elixirBlockDefinition = { fg = c.purple, bg = "NONE" },
	elixirModuleDeclaration = { fg = c.brown, bg = "NONE" },
	elixirInclude = { fg = c.orange, bg = "NONE" },
	elixirOperator = { fg = c.brown, bg = "NONE" },
	-- }}}

	-- {{{
	goDeclaration = { fg = c.purple, bg = "NONE" },
	goField = { link = "Field" },
	goMethod = { fg = c.cyan, bg = "NONE" },
	goType = { fg = c.purple, bg = "NONE" },
	goUnsignedInts = { fg = c.cyan, bg = "NONE" },
	-- }}}

	-- {{{
	haskellDeclKeyword = { fg = c.blue, bg = "NONE" },
	haskellType = { fg = c.green, bg = "NONE" },
	haskellWhere = { fg = c.orange, bg = "NONE" },
	haskellImportKeywords = { fg = c.blue, bg = "NONE" },
	haskellOperators = { fg = c.orange, bg = "NONE" },
	haskellDelimiter = { fg = c.blue, bg = "NONE" },
	haskellIdentifier = { fg = c.brown, bg = "NONE" },
	haskellKeyword = { fg = c.orange, bg = "NONE" },
	haskellNumber = { fg = c.cyan, bg = "NONE" },
	haskellString = { fg = c.cyan, bg = "NONE" },
	-- }}}

	-- {{{
	htmlArg = { fg = c.brown, bg = "NONE" },
	htmlTagName = { fg = c.orange, bg = "NONE" },
	htmlTagN = { fg = c.orange, bg = "NONE" },
	htmlSpecialTagName = { fg = c.orange, bg = "NONE" },
	htmlTag = { fg = c.mono_2, bg = "NONE" },
	htmlEndTag = { fg = c.mono_2, bg = "NONE" },
	MatchTag = { fg = c.orange, bg = c.cursor, bold = true, underline = true },
	-- }}}

	-- {{{
	coffeeString = { fg = c.green, bg = "NONE" },
	javaScriptBraces = { fg = c.mono_2, bg = "NONE" },
	javaScriptFunction = { fg = c.purple, bg = "NONE" },
	javaScriptIdentifier = { fg = c.purple, bg = "NONE" },
	javaScriptNull = { fg = c.brown, bg = "NONE" },
	javaScriptNumber = { fg = c.brown, bg = "NONE" },
	javaScriptRequire = { fg = c.cyan, bg = "NONE" },
	javaScriptReserved = { fg = c.purple, bg = "NONE" },
	jsArrowFunction = { fg = c.purple, bg = "NONE" },
	jsBraces = { fg = c.mono_2, bg = "NONE" },
	jsClassBraces = { fg = c.mono_2, bg = "NONE" },
	jsClassKeywords = { fg = c.purple, bg = "NONE" },
	jsDocParam = { fg = c.blue, bg = "NONE" },
	jsDocTags = { fg = c.purple, bg = "NONE" },
	jsFuncBraces = { fg = c.mono_2, bg = "NONE" },
	jsFuncCall = { fg = c.blue, bg = "NONE" },
	jsFuncParens = { fg = c.mono_2, bg = "NONE" },
	jsFunction = { fg = c.purple, bg = "NONE" },
	jsGlobalObjects = { fg = c.gold, bg = "NONE" },
	jsModuleWords = { fg = c.purple, bg = "NONE" },
	jsModules = { fg = c.purple, bg = "NONE" },
	jsNoise = { fg = c.mono_2, bg = "NONE" },
	jsNull = { fg = c.brown, bg = "NONE" },
	jsOperator = { fg = c.purple, bg = "NONE" },
	jsParens = { fg = c.mono_2, bg = "NONE" },
	jsStorageClass = { fg = c.purple, bg = "NONE" },
	jsTemplateBraces = { fg = c.red, bg = "NONE" },
	jsTemplateVar = { fg = c.green, bg = "NONE" },
	jsThis = { fg = c.orange, bg = "NONE" },
	jsUndefined = { fg = c.brown, bg = "NONE" },
	jsObjectValue = { fg = c.blue, bg = "NONE" },
	jsObjectKey = { fg = c.cyan, bg = "NONE" },
	jsReturn = { fg = c.purple, bg = "NONE" },
	javascriptArrowFunc = { fg = c.purple, bg = "NONE" },
	javascriptClassExtends = { fg = c.purple, bg = "NONE" },
	javascriptClassKeyword = { fg = c.purple, bg = "NONE" },
	javascriptDocNotation = { fg = c.purple, bg = "NONE" },
	javascriptDocParamName = { fg = c.blue, bg = "NONE" },
	javascriptDocTags = { fg = c.purple, bg = "NONE" },
	javascriptEndColons = { fg = c.mono_3, bg = "NONE" },
	javascriptExport = { fg = c.purple, bg = "NONE" },
	javascriptFuncArg = { fg = c.mono_1, bg = "NONE" },
	javascriptFuncKeyword = { fg = c.purple, bg = "NONE" },
	javascriptIdentifier = { fg = c.orange, bg = "NONE" },
	javascriptImport = { fg = c.purple, bg = "NONE" },
	javascriptObjectLabel = { fg = c.mono_1, bg = "NONE" },
	javascriptOpSymbol = { fg = c.cyan, bg = "NONE" },
	javascriptOpSymbols = { fg = c.cyan, bg = "NONE" },
	javascriptPropertyName = { fg = c.green, bg = "NONE" },
	javascriptTemplateSB = { fg = c.red, bg = "NONE" },
	javascriptVariable = { fg = c.purple, bg = "NONE" },
	-- }}}

	-- {{{
	jsonCommentError = { fg = c.mono_1, bg = "NONE" },
	jsonKeyword = { fg = c.orange, bg = "NONE" },
	jsonQuote = { fg = c.mono_3, bg = "NONE" },
	jsonTrailingCommaError = { fg = c.orange, bg = "NONE", reverse = true },
	jsonMissingCommaError = { fg = c.orange, bg = "NONE", reverse = true },
	jsonNoQuotesError = { fg = c.orange, bg = "NONE", reverse = true },
	jsonNumError = { fg = c.orange, bg = "NONE", reverse = true },
	jsonString = { fg = c.green, bg = "NONE" },
	jsonBoolean = { fg = c.purple, bg = "NONE" },
	jsonNumber = { fg = c.brown, bg = "NONE" },
	jsonStringSQError = { fg = c.orange, bg = "NONE", reverse = true },
	jsonSemicolonError = { fg = c.orange, bg = "NONE", reverse = true },
	-- }}}

	-- {{{
	markdownItalic = { fg = c.fg, italic = true },
	markdownBold = { fg = c.fg, bold = true },

	markdownCode = { fg = c.purple, bg = "NONE" },
	markdownCodeBlock = { fg = c.fg },
	markdownCodeDelimiter = { fg = c.purple},

	markdownLinkText = { link = "Identifier" },
	markdownUrl = { fg = c.fg, underline = true },

	markdownHeadingDelimiter = { fg = c.cyan, bg = "NONE" },
	markdownH1 = { fg = c.blue, bg = "NONE" },
	markdownH2 = { fg = c.blue, bg = "NONE" },
	markdownH3 = { fg = c.blue, bg = "NONE" },
	markdownH4 = { fg = c.blue, bg = "NONE" },
	markdownH5 = { fg = c.blue, bg = "NONE" },
	markdownH6 = { fg = c.blue, bg = "NONE" },

	markdownListMarker = { fg = c.brown, bg = "NONE" },
	-- }}}

	-- {{{
	phpClass = { fg = c.gold, bg = "NONE" },
	phpFunction = { fg = c.blue, bg = "NONE" },
	phpFunctions = { fg = c.blue, bg = "NONE" },
	phpInclude = { fg = c.purple, bg = "NONE" },
	phpKeyword = { fg = c.purple, bg = "NONE" },
	phpParent = { fg = c.mono_3, bg = "NONE" },
	phpType = { fg = c.purple, bg = "NONE" },
	phpSuperGlobals = { fg = c.orange, bg = "NONE" },
	-- }}}

	-- {{{
	pugAttributesDelimiter = { fg = c.brown, bg = "NONE" },
	pugClass = { fg = c.brown, bg = "NONE" },
	pugDocType = { fg = c.mono_3, bg = "NONE", italic = true },
	pugTag = { fg = c.orange, bg = "NONE" },
	-- }}}

	-- {{{
	purescriptKeyword = { fg = c.purple, bg = "NONE" },
	purescriptModuleName = { fg = c.mono_1, bg = "NONE" },
	purescriptIdentifier = { fg = c.mono_1, bg = "NONE" },
	purescriptType = { fg = c.gold, bg = "NONE" },
	purescriptTypeVar = { fg = c.orange, bg = "NONE" },
	purescriptConstructor = { fg = c.orange, bg = "NONE" },
	purescriptOperator = { fg = c.mono_1, bg = "NONE" },
	-- }}}

	-- {{{
	pythonImport = { fg = c.purple, bg = "NONE" },
	pythonBuiltin = { fg = c.cyan, bg = "NONE" },
	pythonStatement = { fg = c.purple, bg = "NONE" },
	pythonParam = { fg = c.brown, bg = "NONE" },
	pythonSelf = { fg = c.mono_2, bg = "NONE", italic = true },
	pythonClass = { fg = c.blue, bg = "NONE" },
	pythonOperator = { fg = c.purple, bg = "NONE" },
	pythonEscape = { fg = c.orange, bg = "NONE" },
	pythonFunction = { fg = c.blue, bg = "NONE" },
	pythonKeyword = { fg = c.blue, bg = "NONE" },
	pythonModule = { fg = c.purple, bg = "NONE" },
	pythonStringDelimiter = { fg = c.green, bg = "NONE" },
	pythonSymbol = { fg = c.cyan, bg = "NONE" },
	-- }}}

	-- {{{
	rubyBlock = { fg = c.purple, bg = "NONE" },
	rubyBlockParameter = { fg = c.orange, bg = "NONE" },
	rubyBlockParameterList = { fg = c.orange, bg = "NONE" },
	rubyCapitalizedMethod = { fg = c.purple, bg = "NONE" },
	rubyClass = { fg = c.purple, bg = "NONE" },
	rubyConstant = { fg = c.gold, bg = "NONE" },
	rubyControl = { fg = c.purple, bg = "NONE" },
	rubyDefine = { fg = c.purple, bg = "NONE" },
	rubyEscape = { fg = c.orange, bg = "NONE" },
	rubyFunction = { fg = c.blue, bg = "NONE" },
	rubyGlobalVariable = { fg = c.orange, bg = "NONE" },
	rubyInclude = { fg = c.blue, bg = "NONE" },
	rubyIncluderubyGlobalVariable = { fg = c.orange, bg = "NONE" },
	rubyInstanceVariable = { fg = c.orange, bg = "NONE" },
	rubyInterpolation = { fg = c.cyan, bg = "NONE" },
	rubyInterpolationDelimiter = { fg = c.orange, bg = "NONE" },
	rubyKeyword = { fg = c.blue, bg = "NONE" },
	rubyModule = { fg = c.purple, bg = "NONE" },
	rubyPseudoVariable = { fg = c.orange, bg = "NONE" },
	rubyRegexp = { fg = c.cyan, bg = "NONE" },
	rubyRegexpDelimiter = { fg = c.cyan, bg = "NONE" },
	rubyStringDelimiter = { fg = c.green, bg = "NONE" },
	rubySymbol = { fg = c.cyan, bg = "NONE" },
	-- }}}

	-- {{{
	vimCommand = { fg = c.purple, bg = "NONE" },
	vimCommentTitle = { fg = c.mono_3, bg = "NONE", bold = true },
	vimFunction = { fg = c.cyan, bg = "NONE" },
	vimFuncName = { fg = c.purple, bg = "NONE" },
	vimHighlight = { fg = c.blue, bg = "NONE" },
	vimLineComment = { fg = c.mono_3, bg = "NONE", italic = true },
	vimParenSep = { fg = c.mono_2, bg = "NONE" },
	vimSep = { fg = c.mono_2, bg = "NONE" },
	vimUserFunc = { fg = c.cyan, bg = "NONE" },
	vimVar = { fg = c.orange, bg = "NONE" },
	-- }}}

	-- {{{
	xmlAttrib = { fg = c.gold, bg = "NONE" },
	xmlEndTag = { fg = c.orange, bg = "NONE" },
	xmlTag = { fg = c.orange, bg = "NONE" },
	xmlTagName = { fg = c.orange, bg = "NONE" },
	-- }}}

	-- {{{
	zshCommands = { fg = c.mono_1, bg = "NONE" },
	zshDeref = { fg = c.orange, bg = "NONE" },
	zshShortDeref = { fg = c.orange, bg = "NONE" },
	zshFunction = { fg = c.cyan, bg = "NONE" },
	zshKeyword = { fg = c.purple, bg = "NONE" },
	zshSubst = { fg = c.orange, bg = "NONE" },
	zshSubstDelim = { fg = c.mono_3, bg = "NONE" },
	zshTypes = { fg = c.purple, bg = "NONE" },
	zshVariableDef = { fg = c.brown, bg = "NONE" },
	-- }}}

	-- {{{
	rustExternCrate = { fg = c.orange, bg = "NONE", bold = true },
	rustIdentifier = { fg = c.blue, bg = "NONE" },
	rustDeriveTrait = { fg = c.green, bg = "NONE" },
	rustSpecialComment = { fg = c.mono_3, bg = "NONE" },
	rustCommentLine = { fg = c.mono_3, bg = "NONE" },
	rustCommentLineDoc = { fg = c.mono_3, bg = "NONE" },
	rustCommentLineDocError = { fg = c.mono_3, bg = "NONE" },
	rustCommentBlock = { fg = c.mono_3, bg = "NONE" },
	rustCommentBlockDoc = { fg = c.mono_3, bg = "NONE" },
	rustCommentBlockDocError = { fg = c.mono_3, bg = "NONE" },
	-- }}}

	-- {{{
	manTitle = { link = "String" },
	manFooter = { fg = c.mono_3, bg = "NONE" },
	-- }}}
}

M.set_highlights = function()
	for k, v in pairs(highlight_groups) do
		vim.api.nvim_set_hl(0, k, v)
	end
end

return M

-- vim:foldmethod=marker:foldlevel=0
