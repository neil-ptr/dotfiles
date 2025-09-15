-- lua/colors/xcodedark.lua

local M = {}

-- Base colors
-- normal dark
local colors = {
  base0 = '#292a30',
  base1 = '#2f3037',
  base2 = '#393b44',
  base3 = '#414453',
  base4 = '#53606e',
  base5 = '#7f8c98',
  base6 = '#a3b1bf',
  base7 = '#dfdfe0',
  deep_blue0 = '#0f5bca',
  deep_blue1 = '#4484d1',
  deep_yellow = '#fef937',
  green_wash = '#243330',
  orange_wash = '#382e27',
  red_wash = '#3b2d2b',
  blue = '#4eb0cc',
  light_blue = '#6bdfff',
  orange = '#ffa14f',
  pink = '#ff7ab2',
  red = '#ff8170',
  yellow = '#e8cc46',
  purple = '#b281eb',
  light_purple = '#dabaff',
  teal = '#78c2b3',
  light_teal = '#acf2e4',
  green = '#84b360',
  light_green = '#b0e687',
  -- custom
  error_red = '#f05154',
  modified = '#ddbd8a',
  deep_purple = '#58366b',
  deep_teal = '#3c5a63',
  deep_red = '#d7827e',
  border = '#050506',
  surface = '#2C2D2D',
  surface1 = '#1f1f1f',
}

-- hc dark
-- local colors = {
--   -- base0 = '#1f1f24',
--   surface = '#2C2D2D',
--   surface1 = '#1f1f1f',
--
--   base0 = '#26262b',
--   base1 = '#26262b',
--   base2 = '#34353b',
--   base3 = '#43454b',
--   base4 = '#52555c',
--   base5 = '#838991',
--   base6 = '#aeb7c0',
--   base7 = '#ffffff',
--   deep_blue0 = '#0f5bca',
--   deep_blue1 = '#4484d1',
--   deep_yellow = '#fef937',
--   green_wash = '#1e2a28',
--   orange_wash = '#2e2622',
--   red_wash = '#2f2625',
--   blue = '#4ec4e6',
--   light_blue = '#6bdfff',
--   orange = '#ffa14f',
--   pink = '#ff85b8',
--   red = '#ff8a7a',
--   yellow = '#d9c668',
--   purple = '#cda1ff',
--   light_purple = '#e5cfff',
--   teal = '#83c9bc',
--   light_teal = '#b1faeb',
--   green = '#8dbf67',
--   light_green = '#b8f08d',
--   -- custom
--   error_red = '#f05154',
--   modified = '#ddbd8a',
--   deep_purple = '#58366b',
--   deep_teal = '#3c5a63',
--   deep_red = '#d7827e',
--   border = '#050506',
-- }

M.colors = colors

function M.init()
  vim.o.background = 'dark'
  vim.cmd 'highlight clear'
  vim.cmd 'syntax reset'
  vim.g.colors_name = 'xcodedark'

  local hl = vim.api.nvim_set_hl
  local function set(group, opts)
    hl(0, group, opts)
  end

  local function hi(group, opts)
    local existing = vim.api.nvim_get_hl(0, { name = group, link = false })

    -- Do nothing if the group is already defined or linked
    if existing and next(existing) ~= nil then
      return
    end

    vim.api.nvim_set_hl(0, group, opts)
  end

  local g = vim.g

  g.xcodedarkhc_green_comments = g.xcodedarkhc_green_comments or 0
  g.xcodedarkhc_emph_types = g.xcodedarkhc_emph_types or 1
  g.xcodedarkhc_emph_funcs = g.xcodedarkhc_emph_funcs or 0
  g.xcodedarkhc_emph_idents = g.xcodedarkhc_emph_idents or 0
  g.xcodedarkhc_match_paren_style = g.xcodedarkhc_match_paren_style or 0
  g.xcodedarkhc_dim_punctuation = g.xcodedarkhc_dim_punctuation or 1

  -- Core highlights
  set('FlashLabel', { fg = colors.base0, bg = '#ff85b8', bold = true })
  set('Normal', { fg = '#ffffff', bg = colors.base0 })
  set('Cursor', { fg = colors.base0, bg = '#ffffff' })
  set('Empty', { fg = '#ffffff', bg = 'NONE' })
  set('CursorLineNr', { fg = '#ffffff', bg = '#26262b' })
  set('EndOfBuffer', { fg = colors.base0, bg = colors.base0 })
  set('FoldColumn', { fg = '#52555c', bg = 'NONE' })
  set('Folded', { fg = '#52555c', bg = colors.base2 })
  set('LineNr', { fg = '#52555c', bg = 'NONE' })
  set('MatchWord', { fg = '#ffffff', bg = colors.deep_blue0 })
  set('SignColumn', { fg = '#52555c', bg = 'NONE' })
  set('Signify', { fg = colors.deep_blue1, bg = 'NONE' })
  set('Ignore', { fg = '#52555c', bg = 'NONE' })
  set('Pmenu', { fg = '#ffffff', bg = colors.base2 })
  set('PmenuSbar', { fg = colors.base2, bg = colors.base2 })
  set('PmenuSel', { fg = '#ffffff', bg = colors.deep_blue0 })
  set('PmenuThumb', { fg = '#43454b', bg = '#43454b' })

  set('DiagnosticError', { fg = colors.error_red, bg = 'NONE' })
  set('ErrorMsg', { fg = colors.error_red, bg = 'NONE' })
  set('Error', { fg = colors.base0, bg = colors.error_red })

  set('DiagnosticHint', { fg = colors.yellow, bg = 'NONE' })

  set('ModeMsg', { fg = '#838991', bg = 'NONE' })
  set('MoreMsg', { fg = '#ff85b8', bg = 'NONE' })
  set('Question', { fg = '#ff85b8', bg = 'NONE' })
  set('WarningMsg', { fg = colors.orange, bg = 'NONE' })
  set('ColorColumn', { fg = 'NONE', bg = '#26262b' })
  set('CursorColumn', { fg = 'NONE', bg = '#26262b' })
  set('CursorLine', { fg = 'NONE', bg = colors.base1 })
  set('QuickFixLine', { fg = '#ffffff', bg = colors.deep_blue0 })
  set('StatusLine', { fg = '#ffffff', bg = '#43454b' })
  set('StatusLineNC', { fg = '#838991', bg = colors.base2 })
  set('VertSplit', { fg = colors.base2, bg = colors.base2 })
  set('WinSeparator', { fg = colors.base2, bg = colors.base0 })
  set('WildMenu', { fg = '#ffffff', bg = colors.deep_blue0 })
  set('IncSearch', { fg = colors.base0, bg = colors.deep_yellow })
  set('CurSearch', { link = 'IncSearch' })
  set('Search', { fg = '#ffffff', bg = '#43454b' })
  set('Visual', { fg = 'NONE', bg = '#43454b' })
  set('DiffAdd', { fg = colors.deep_blue1, bg = 'NONE' })
  set('DiffChange', { fg = colors.orange, bg = 'NONE' })
  set('DiffDelete', { fg = '#ff8a7a', bg = '#2f2625' })
  set('DiffText', { fg = colors.orange, bg = '#2e2622' })
  set('Comment', { fg = '#838991', bg = 'NONE' })
  set('PreProc', { fg = colors.orange, bg = 'NONE' })
  set('Special', { fg = '#83c9bc', bg = 'NONE' })
  set('Statement', { fg = '#ff85b8', bg = 'NONE', bold = true })
  set('Character', { fg = '#d9c668', bg = 'NONE' })
  set('Directory', { fg = colors.light_blue, bg = 'NONE' })
  set('Number', { fg = '#d9c668', bg = 'NONE' })
  set('SpecialComment', { fg = '#aeb7c0', bg = 'NONE' })
  set('String', { fg = '#ff8a7a', bg = 'NONE' })
  set('Title', { fg = '#ffffff', bg = 'NONE', bold = true })
  set('Todo', { fg = '#aeb7c0', bg = 'NONE', bold = true })
  set('Underlined', { fg = colors.light_blue, bg = 'NONE', underline = true })
  set('SpellBad', { fg = 'NONE', bg = 'NONE', undercurl = true })
  set('SpellCap', { fg = 'NONE', bg = 'NONE', undercurl = true })
  set('SpellLocal', { fg = 'NONE', bg = 'NONE', undercurl = true })
  set('SpellRare', { fg = 'NONE', bg = 'NONE', undercurl = true })
  set('Terminal', { link = 'Normal' })
  set('TabLine', { link = 'StatusLineNC' })
  set('TabLineFill', { link = 'StatusLineNC' })
  set('TabLineSel', { link = 'StatusLine' })
  set('StatusLineTerm', { link = 'StatusLine' })
  set('StatusLineTermNC', { link = 'StatusLineNC' })
  set('VisualNOS', { link = 'Visual' })
  set('MsgArea', { link = 'Title' })
  set('diffAdded', { link = 'DiffAdd' })
  set('diffBDiffer', { link = 'WarningMsg' })
  set('diffChanged', { link = 'DiffChange' })
  set('diffCommon', { link = 'WarningMsg' })
  set('diffDiffer', { link = 'WarningMsg' })
  set('diffFile', { link = 'Directory' })
  set('diffIdentical', { link = 'WarningMsg' })
  set('diffIndexLine', { link = 'Number' })
  set('diffIsA', { link = 'WarningMsg' })
  set('diffNoEOL', { link = 'WarningMsg' })
  set('diffOnly', { link = 'WarningMsg' })
  set('diffRemoved', { link = 'DiffDelete' })
  set('Constant', { link = 'LibraryIdent' })
  set('NormalFloat', { bg = colors.base2, fg = colors.base6 })
  set('FloatBorder', { link = 'NormalFloat' })
  set('Float', { link = 'Number' })
  set('StringDelimiter', { link = 'String' })
  set('Identifier', { link = 'LocalIdent' })
  set('Function', { link = 'LibraryFunc' })
  set('Boolean', { link = 'Statement' })
  set('Conditional', { link = 'Statement' })
  set('Exception', { link = 'Statement' })
  set('Include', { link = 'Statement' })
  set('Keyword', { link = 'Statement' })
  set('Label', { link = 'Statement' })
  set('Repeat', { link = 'Statement' })
  set('StorageClass', { link = 'Statement' })
  set('Structure', { link = 'Statement' })
  set('Define', { link = 'PreProc' })
  set('Macro', { link = 'PreProc' })
  set('PreCondit', { link = 'PreProc' })
  set('Type', { link = 'LibraryType' })
  set('Debug', { link = 'Special' })
  set('SpecialChar', { link = 'Special' })
  set('Tag', { link = 'Special' })
  set('Noise', { link = 'Delimiter' })
  set('Quote', { link = 'StringDelimiter' })
  set('Conceal', { link = 'Ignore' })
  set('NonText', { link = 'Ignore' })
  set('SpecialKey', { link = 'Ignore' })
  set('Whitespace', { link = 'Ignore' })
  set('ALEVirtualTextError', { link = 'ErrorMsg' })
  set('ALEVirtualTextWarning', { link = 'WarningMsg' })
  set('Searchlight', { link = 'IncSearch' })
  set('SignifySignAdd', { link = 'Signify' })
  set('SignifySignChange', { link = 'Signify' })
  set('SignifySignDelete', { link = 'Signify' })
  set('bibEntryKw', { link = 'LibraryIdent' })
  set('bibKey', { link = 'IdentifierDef' })
  set('bibType', { link = 'LibraryType' })
  set('cssAtRule', { link = 'Keyword' })
  set('cssAttr', { link = 'Keyword' })
  set('cssBraces', { link = 'cssNoise' })
  set('cssClassName', { link = 'LocalIdent' })
  set('cssColor', { link = 'cssAttr' })
  set('cssFunction', { link = 'Empty' })
  set('cssIdentifier', { link = 'LocalIdent' })
  set('cssProp', { link = 'LibraryType' })
  set('cssPseudoClassId', { link = 'LibraryIdent' })
  set('cssSelectorOp', { link = 'Operator' })
  set('gitcommitHeader', { link = 'Todo' })
  set('gitcommitOverflow', { link = 'Error' })
  set('gitcommitSummary', { link = 'Title' })
  set('goField', { link = 'LocalIdent' })
  set('goFunction', { link = 'FunctionDef' })
  set('goFunctionCall', { link = 'LibraryFunc' })
  set('goVarAssign', { link = 'LocalIdent' })
  set('goVarDefs', { link = 'IdentifierDef' })
  set('helpCommand', { link = 'helpExample' })
  set('helpExample', { link = 'markdownCode' })
  set('helpHeadline', { link = 'Title' })
  set('helpHyperTextEntry', { link = 'Comment' })
  set('helpHyperTextJump', { link = 'Underlined' })
  set('helpSectionDelim', { link = 'Ignore' })
  set('helpURL', { link = 'helpHyperTextJump' })
  set('helpVim', { link = 'Title' })
  set('htmlArg', { link = 'Special' })
  set('htmlEndTag', { link = 'Delimiter' })
  set('htmlLink', { link = 'Underlined' })
  set('htmlSpecialTagName', { link = 'htmlTagName' })
  set('htmlTag', { link = 'Delimiter' })
  set('htmlTagName', { link = 'Statement' })
  set('jinjaBlockName', { link = 'Typedef' })
  set('jinjaFilter', { link = 'LibraryFunc' })
  set('jinjaNumber', { link = 'Number' })
  set('jinjaOperator', { link = 'Operator' })
  set('jinjaRawDelim', { link = 'PreProc' })
  set('jinjaSpecial', { link = 'Keyword' })
  set('jinjaString', { link = 'String' })
  set('jinjaTagDelim', { link = 'Delimiter' })
  set('jinjaVarDelim', { link = 'Delimiter' })
  set('jsBuiltins', { link = 'LibraryFunc' })
  set('jsClassDefinition', { link = 'Typedef' })
  set('jsDomErrNo', { link = 'LibraryIdent' })
  set('jsDomNodeConsts', { link = 'LibraryIdent' })
  set('jsExceptions', { link = 'LibraryType' })
  set('jsFuncArgCommas', { link = 'jsNoise' })
  set('jsFuncName', { link = 'FunctionDef' })
  set('jsFunction', { link = 'jsStatement' })
  set('jsGlobalNodeObjects', { link = 'jsGlobalObjects' })
  set('jsGlobalObjects', { link = 'LibraryType' })
  set('jsObjectProp', { link = 'LocalIdent' })
  set('jsOperatorKeyword', { link = 'jsStatement' })
  set('jsThis', { link = 'jsStatement' })
  set('jsVariableDef', { link = 'IdentifierDef' })
  set('jsonKeyword', { link = 'jsonString' })
  set('jsonKeywordMatch', { link = 'Operator' })
  set('jsonQuote', { link = 'StringDelimiter' })
  set('lspdiagnosticssignerror', { link = 'ErrorMsg' })
  set('lspdiagnosticssignhint', { link = 'MoreMsg' })
  set('lspdiagnosticssigninformation', { link = 'ModeMsg' })
  set('lspdiagnosticssignwarning', { link = 'WarningMsg' })
  set('lspdiagnosticsunderlineerror', { undercurl = true, fg = '#d12f1b' })
  set('lspdiagnosticsunderlineinformation', { undercurl = true, fg = '#ad3da4' })
  set('lspdiagnosticsunderlinewarning', { undercurl = true, fg = '#78492a' })
  set('lspdiagnosticsvirtualtexterror', { link = 'ErrorMsg' })
  set('lspdiagnosticsvirtualtexthint', { link = 'MoreMsg' })
  set('lspdiagnosticsvirtualtextwarning', { link = 'WarningMsg' })
  set('lspdiagnosticsfloatingerror', { link = 'ErrorMsg' })
  set('lspdiagnosticsfloatingwarning', { link = 'WarningMsg' })
  set('lspdiagnosticsfloatinginformation', { link = 'ModeMsg' })
  set('lspdiagnosticsfloatinghint', { link = 'MoreMsg' })
  set('tsliteral', { link = 'Character' })
  set('tsannotation', { fg = '#b4d8fd' })
  set('tsboolean', { link = 'Boolean' })
  set('tscharacter', { link = 'Character' })
  set('tscomment', { link = 'Comment' })
  set('tsconditional', { link = 'Conditional' })
  set('tsconstant', { link = 'Constant' })
  set('tsconstbuiltin', { link = 'Constant' })
  set('tsconstmacro', { link = 'Macro' })
  set('tserror', { fg = '#262626', bg = '#ffffff', bold = true })
  set('tsexception', { link = 'Conditional' })
  set('tsfield', { link = 'Identifier' })
  set('tsfloat', { link = 'Float' })
  set('tsfunction', { link = 'Function' })
  set('tsfuncbuiltin', { link = 'Function' })
  set('tsfuncmacro', { link = 'Function' })
  set('tsinclude', { link = 'Include' })
  set('tskeyword', { link = 'Keyword' })
  set('tslabel', { link = 'Label' })
  set('tsmethod', { link = 'Function' })
  set('tsnamespace', { link = 'Conditional' })
  set('tsnumber', { link = 'Number' })
  set('tsoperator', { link = 'Operator' })
  set('tsparameterreference', { link = 'Constant' })
  set('tsproperty', { link = 'tsfield' })
  set('tspunctdelimiter', { link = 'Normal' })
  set('tspunctbracket', { link = 'Normal' })
  set('tspunctspecial', { link = 'Normal' })
  set('tsrepeat', { link = 'Conditional' })
  set('tsstring', { link = 'String' })
  set('tsstringregex', { link = 'Special' })
  set('tsstringescape', { link = 'Special' })
  set('tsstrong', { link = 'Normal' })
  set('tsconstructor', { link = 'Type' })
  set('tskeywordfunction', { link = 'Type' })
  set('tsparameter', { link = 'Label' })
  set('luaTSVariable', { link = 'Normal' })
  set('tsvariable', { link = 'Identifier' })
  set('tsvariablebuiltin', { link = 'Conditional' })
  set('tstag', { link = 'Label' })
  set('tstagdelimiter', { link = 'Label' })
  set('tstitle', { link = 'Special' })
  set('tstype', { link = 'Type' })
  set('tstypebuiltin', { link = 'Type' })
  set('tsemphasis', { link = 'Underlined' })
  set('rsForeignConst', { link = 'LibraryIdent' })
  set('rsForeignFunc', { link = 'LibraryFunc' })
  set('rsForeignType', { link = 'LibraryType' })
  set('rsFuncDef', { link = 'FunctionDef' })
  set('rsIdentDef', { link = 'IdentifierDef' })
  set('rsLibraryConst', { link = 'LibraryIdent' })
  set('rsLibraryFunc', { link = 'LibraryFunc' })
  set('rsLibraryType', { link = 'LibraryType' })
  set('rsLifetimeDef', { link = 'IdentifierDef' })
  set('rsSpecialLifetime', { link = 'LibraryIdent' })
  set('rsUserConst', { link = 'LocalIdent' })
  set('rsUserFunc', { link = 'LocalFunc' })
  set('rsUserLifetime', { link = 'LocalIdent' })
  set('rsUserMethod', { link = 'LibraryFunc' })
  set('rsUserType', { link = 'LocalType' })
  set('scssAttribute', { link = 'cssNoise' })
  set('scssInclude', { link = 'Keyword' })
  set('scssMixin', { link = 'Keyword' })
  set('scssMixinName', { link = 'LocalFunc' })
  set('scssMixinParams', { link = 'cssNoise' })
  set('scssSelectorName', { link = 'cssClassName' })
  set('scssVariableAssignment', { link = 'Operator' })
  set('scssVariableValue', { link = 'Operator' })
  set('swiftFuncDef', { link = 'FunctionDef' })
  set('swiftIdentDef', { link = 'IdentifierDef' })
  set('swiftLibraryFunc', { link = 'LibraryFunc' })
  set('swiftLibraryProp', { link = 'LibraryIdent' })
  set('swiftLibraryType', { link = 'LibraryType' })
  set('swiftUserFunc', { link = 'LocalFunc' })
  set('swiftUserProp', { link = 'LocalIdent' })
  set('swiftUserType', { link = 'LocalType' })
  set('typescriptArrayMethod', { link = 'LibraryFunc' })
  set('typescriptArrowFunc', { link = 'Operator' })
  set('typescriptAssign', { link = 'Operator' })
  set('typescriptBOM', { link = 'LibraryType' })
  set('typescriptBOMWindowCons', { link = 'LibraryType' })
  set('typescriptBOMWindowMethod', { link = 'LibraryFunc' })
  set('typescriptBOMWindowProp', { link = 'LibraryType' })
  set('typescriptBinaryOp', { link = 'Operator' })
  set('typescriptBraces', { link = 'Delimiter' })
  set('typescriptCall', { link = 'Empty' })
  set('typescriptClassHeritage', { link = 'Type' })
  set('typescriptClassName', { link = 'TypeDef' })
  set('typescriptDOMDocMethod', { link = 'LibraryFunc' })
  set('typescriptDOMDocProp', { link = 'LibraryIdent' })
  set('typescriptDOMEventCons', { link = 'LibraryType' })
  set('typescriptDOMEventMethod', { link = 'LibraryFunc' })
  set('typescriptDOMEventMethod', { link = 'LibraryFunc' })
  set('typescriptDOMEventProp', { link = 'LibraryIdent' })
  set('typescriptDOMEventTargetMethod', { link = 'LibraryFunc' })
  set('typescriptDOMNodeMethod', { link = 'LibraryFunc' })
  set('typescriptDOMStorageMethod', { link = 'LibraryIdent' })
  set('typescriptEndColons', { link = 'Delimiter' })
  set('typescriptExport', { link = 'Keyword' })
  set('typescriptFuncName', { link = 'FunctionDef' })
  set('typescriptFuncTypeArrow', { link = 'typescriptArrowFunc' })
  set('typescriptGlobal', { link = 'typescriptPredefinedType' })
  set('typescriptIdentifier', { link = 'Keyword' })
  set('typescriptInterfaceName', { link = 'Typedef' })
  set('typescriptMember', { link = 'LocalFunc' })
  set('typescriptObjectLabel', { link = 'LocalIdent' })
  set('typescriptOperator', { link = 'Keyword' })
  set('typescriptParens', { link = 'Delimiter' })
  set('typescriptPredefinedType', { link = 'LibraryType' })
  set('typescriptTypeAnnotation', { link = 'Delimiter' })
  set('typescriptTypeReference', { link = 'typescriptUserDefinedType' })
  set('typescriptUserDefinedType', { link = 'LocalType' })
  set('typescriptVariable', { link = 'Keyword' })
  set('typescriptVariableDeclaration', { link = 'IdentifierDef' })
  set('vimAutoCmdSfxList', { link = 'LibraryType' })
  set('vimAutoEventList', { link = 'LocalIdent' })
  set('vimCmdSep', { link = 'Special' })
  set('vimCommentTitle', { link = 'SpecialComment' })
  set('vimContinue', { link = 'Delimiter' })
  set('vimFuncName', { link = 'LibraryFunc' })
  set('vimFunction', { link = 'FunctionDef' })
  set('vimHighlight', { link = 'Statement' })
  set('vimMapModKey', { link = 'vimNotation' })
  set('vimNotation', { link = 'LibraryType' })
  set('vimOption', { link = 'LibraryIdent' })
  set('vimUserFunc', { link = 'LocalFunc' })
  set('markdownBoldDelimiter', { link = 'markdownDelimiter' })
  set('markdownBoldItalicDelimiter', { link = 'markdownDelimiter' })
  set('markdownCodeBlock', { link = 'markdownCode' })
  set('markdownCodeDelimiter', { link = 'markdownDelimiter' })
  set('markdownHeadingDelimiter', { link = 'markdownDelimiter' })
  set('markdownItalicDelimiter', { link = 'markdownDelimiter' })
  set('markdownLinkDelimiter', { link = 'markdownDelimiter' })
  set('markdownLinkText', { link = 'Empty' })
  set('markdownLinkTextDelimiter', { link = 'markdownDelimiter' })
  set('markdownListMarker', { link = 'markdownDelimiter' })
  set('markdownRule', { link = 'markdownDelimiter' })
  set('markdownUrl', { link = 'Underlined' })
  set('markdownDelimiter', { fg = '#83c9bc', bg = 'NONE' })
  set('markdownCode', { fg = '#e5cfff', bg = colors.base2 })
  -- set('Comment', { fg = '#8dbf67', bg = 'NONE' })
  set('SpecialComment', { fg = '#b8f08d', bg = 'NONE' })
  set('Todo', { fg = '#b8f08d', bg = 'NONE', bold = true })
  set('Typedef', { fg = colors.light_blue, bg = 'NONE' })
  set('LocalType', { fg = '#b1faeb', bg = 'NONE' })
  set('LibraryType', { fg = '#e5cfff', bg = 'NONE' })
  set('Typedef', { fg = '#4ec4e6', bg = 'NONE' })
  set('LocalType', { fg = '#83c9bc', bg = 'NONE' })
  set('LibraryType', { fg = '#cda1ff', bg = 'NONE' })
  set('FunctionDef', { fg = colors.light_blue, bg = 'NONE' })
  set('LocalFunc', { fg = '#b1faeb', bg = 'NONE' })
  set('LibraryFunc', { fg = '#e5cfff', bg = 'NONE' })
  set('FunctionDef', { fg = '#4ec4e6', bg = 'NONE' })
  set('LocalFunc', { fg = '#83c9bc', bg = 'NONE' })
  set('LibraryFunc', { fg = '#cda1ff', bg = 'NONE' })
  set('IdentifierDef', { fg = colors.light_blue, bg = 'NONE' })
  set('LocalIdent', { fg = '#b1faeb', bg = 'NONE' })
  set('LibraryIdent', { fg = '#e5cfff', bg = 'NONE' })
  set('IdentifierDef', { fg = '#4ec4e6', bg = 'NONE' })
  set('LocalIdent', { fg = '#83c9bc', bg = 'NONE' })
  set('LibraryIdent', { fg = '#cda1ff', bg = 'NONE' })
  set('MatchParen', { fg = colors.base0, bg = colors.deep_yellow })
  set('MatchParen', { fg = '#ffffff', bg = colors.deep_blue0 })
  set('Delimiter', { fg = '#aeb7c0', bg = 'NONE' })
  set('Operator', { fg = '#aeb7c0', bg = 'NONE' })
  set('Delimiter', { fg = '#ffffff', bg = 'NONE' })
  set('Operator', { fg = '#ffffff', bg = 'NONE' })

  -- telescope
  set('TelescopeNormal', { bg = colors.base1, fg = '#8D8E8D' })
  set('TelescopePromptNormal', { bg = colors.base1, fg = '#ffffff' })
  set('TelescopeBorder', { bg = colors.base1, fg = colors.base4 })
  set('TelescopeMatching', { fg = colors.base7, bg = 'NONE', bold = true })
  set('TelescopePreviewMatch', { fg = colors.deep_yellow, bg = 'NONE', bold = true })
  set('TelescopePromptTitle', { fg = colors.base7, bg = 'NONE', bold = true })
  set('TelescopeResultsTitle', { link = 'TelescopePromptTitle' })
  set('TelescopePreviewTitle', { link = 'TelescopePromptTitle' })

  -- neotree
  set('NeoTreeNormal', { bg = colors.surface })
  set('NeoTreeNormalNC', { bg = colors.surface })
  set('NeoTreeEndOfBuffer', { fg = colors.surface, bg = colors.surface })
  set('NeoTreeDirectoryName', { fg = colors.base7 })
  set('NeoTreeDirectoryIcon', { fg = colors.base5 })
  set('NeoTreeWinSeparator', { fg = colors.border, bg = colors.surface })
  set('NeoTreeFileName', { fg = colors.base7 })
  set('NeoTreeFileNameOpened', { fg = '#f9e2af', italic = true })
  set('NeoTreeCursorLine', { bg = '#404242' })
  set('NeoTreeGitModified', { fg = colors.modified })
  set('NeoTreeGitUntracked', { fg = colors.modified })
  set('NeoTreeIndentMarker', { fg = colors.base4 })

  -- StatusLine highlights
  set('StatusLineNormal', { fg = colors.base0, bg = colors.green, bold = true })
  set('StatusLineInsert', { fg = colors.base0, bg = colors.blue, bold = true })
  set('StatusLineVisual', { fg = colors.base0, bg = colors.purple, bold = true })
  set('StatusLineCommand', { fg = colors.base0, bg = colors.orange, bold = true })

  -- idk what this stuff is
  if g.xcodedarkhc_green_comments == 1 then
    hi('Comment', { fg = colors.green })
    hi('SpecialComment', { fg = colors.light_green })
    hi('Todo', { fg = colors.light_green, bold = true })
  end

  if g.xcodedarkhc_emph_types == 1 then
    hi('Typedef', { fg = colors.light_blue })
    hi('LocalType', { fg = colors.light_teal })
    hi('LibraryType', { fg = colors.light_purple })
  else
    hi('Typedef', { fg = colors.blue })
    hi('LocalType', { fg = colors.teal })
    hi('LibraryType', { fg = colors.purple })
  end

  if g.xcodedarkhc_emph_funcs == 1 then
    hi('FunctionDef', { fg = colors.light_blue })
    hi('LocalFunc', { fg = colors.light_teal })
    hi('LibraryFunc', { fg = colors.light_purple })
  else
    hi('FunctionDef', { fg = colors.blue })
    hi('LocalFunc', { fg = colors.teal })
    hi('LibraryFunc', { fg = colors.purple })
  end

  if g.xcodedarkhc_emph_idents == 1 then
    hi('IdentifierDef', { fg = colors.light_blue })
    hi('LocalIdent', { fg = colors.light_teal })
    hi('LibraryIdent', { fg = colors.light_purple })
  else
    hi('IdentifierDef', { fg = colors.blue })
    hi('LocalIdent', { fg = colors.teal })
    hi('LibraryIdent', { fg = colors.purple })
  end

  if g.xcodedarkhc_match_paren_style == 1 then
    hi('MatchParen', { fg = colors.base0, bg = colors.deep_yellow })
  else
    hi('MatchParen', { fg = colors.base7, bg = colors.deep_blue0 })
  end

  if g.xcodedarkhc_dim_punctuation == 1 then
    hi('Delimiter', { fg = colors.base6 })
    hi('Operator', { fg = colors.base6 })
  else
    hi('Delimiter', { fg = colors.base7 })
    hi('Operator', { fg = colors.base7 })
  end
end

return M
