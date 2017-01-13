" WIP color scheme
" Inspired by https://github.com/SublimeHaskell/SublimeHaskell/blob/master/Themes/Cubicle.tmTheme
" Initial conversion done by http://github.com/sickill/coloration

highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "Cubicle"

hi Cursor ctermfg=15 ctermbg=0 cterm=NONE guifg=#ffffff guibg=#000000 gui=NONE
hi Visual ctermfg=NONE ctermbg=153 cterm=NONE guifg=NONE guibg=#add6ff gui=NONE
hi CursorLine ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=254 cterm=NONE guifg=NONE guibg=#e6e6e6 gui=NONE
hi LineNr ctermfg=244 ctermbg=254 cterm=NONE guifg=#808080 guibg=#e6e6e6 gui=NONE
hi VertSplit ctermfg=249 ctermbg=249 cterm=NONE guifg=#b5b5b5 guibg=#b5b5b5 gui=NONE
hi MatchParen ctermfg=21 ctermbg=NONE cterm=underline guifg=#0000ff guibg=NONE gui=underline
hi StatusLine ctermfg=0 ctermbg=249 cterm=bold guifg=#000000 guibg=#b5b5b5 gui=bold
hi StatusLineNC ctermfg=0 ctermbg=249 cterm=NONE guifg=#000000 guibg=#b5b5b5 gui=NONE
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=153 cterm=NONE guifg=NONE guibg=#add6ff gui=NONE
hi IncSearch ctermfg=15 ctermbg=124 cterm=NONE guifg=#ffffff guibg=#a31515 gui=NONE
hi Search ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi Directory ctermfg=31 ctermbg=NONE cterm=NONE guifg=#2b91af guibg=NONE gui=NONE
hi Folded ctermfg=28 ctermbg=15 cterm=NONE guifg=#008800 guibg=#ffffff gui=NONE

hi Normal ctermfg=0 ctermbg=15 cterm=NONE guifg=#000000 guibg=#ffffff gui=NONE
hi Boolean ctermfg=124 ctermbg=NONE cterm=NONE guifg=#a31515 guibg=NONE gui=NONE
hi Character ctermfg=31 ctermbg=NONE cterm=NONE guifg=#2b91af guibg=NONE gui=NONE
hi Comment ctermfg=28 ctermbg=NONE cterm=NONE guifg=#008800 guibg=NONE gui=NONE
hi Conditional ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi DiffAdd ctermfg=0 ctermbg=149 cterm=bold guifg=#000000 guibg=#a1e85d gui=bold
hi DiffDelete ctermfg=203 ctermbg=NONE cterm=NONE guifg=#f25454 guibg=NONE gui=NONE
hi DiffChange ctermfg=0 ctermbg=152 cterm=NONE guifg=#000000 guibg=#b9cfe7 gui=NONE
hi DiffText ctermfg=0 ctermbg=74 cterm=bold guifg=#000000 guibg=#729fcf gui=bold
hi ErrorMsg ctermfg=0 ctermbg=196 cterm=NONE guifg=#000000 guibg=#ff0000 gui=NONE
hi WarningMsg ctermfg=0 ctermbg=196 cterm=NONE guifg=#000000 guibg=#ff0000 gui=NONE
hi Float ctermfg=124 ctermbg=NONE cterm=NONE guifg=#a31515 guibg=NONE gui=NONE
hi Function ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi Identifier ctermfg=31 ctermbg=NONE cterm=NONE guifg=#2b91af guibg=NONE gui=NONE
hi Keyword ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi Label ctermfg=124 ctermbg=NONE cterm=NONE guifg=#a31515 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=231 cterm=NONE guifg=#3b3a32 guibg=#f2f2f2 gui=NONE
hi Number ctermfg=124 ctermbg=NONE cterm=NONE guifg=#a31515 guibg=NONE gui=NONE
hi Operator ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi PreProc ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi Special ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=254 cterm=NONE guifg=#3b3a32 guibg=#e6e6e6 gui=NONE
hi Statement ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi StorageClass ctermfg=31 ctermbg=NONE cterm=NONE guifg=#2b91af guibg=NONE gui=NONE
hi String ctermfg=124 ctermbg=NONE cterm=NONE guifg=#a31515 guibg=NONE gui=NONE
hi Tag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Title ctermfg=0 ctermbg=NONE cterm=bold guifg=#000000 guibg=NONE gui=bold
hi Todo ctermfg=28 ctermbg=NONE cterm=inverse,bold guifg=#008800 guibg=NONE gui=inverse,bold
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline

" CSS
hi cssURL ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi cssFunctionName ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi cssColor ctermfg=31 ctermbg=NONE cterm=NONE guifg=#2b91af guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssClassName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi cssValueLength ctermfg=124 ctermbg=NONE cterm=NONE guifg=#a31515 guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=124 ctermbg=NONE cterm=NONE guifg=#a31515 guibg=NONE gui=NONE
hi cssBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

" Elixir
hi link elixirStringDelimiter String "

" HTML
hi htmlTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlEndTag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlTagName ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlArg ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=31 ctermbg=NONE cterm=NONE guifg=#2b91af guibg=NONE gui=NONE

" JavaScript
hi javaScriptFunction ctermfg=31 ctermbg=NONE cterm=NONE guifg=#2b91af guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

" Ruby
hi link rubyStringDelimiter String "

hi rubyClass ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi rubyFunction ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=31 ctermbg=NONE cterm=NONE guifg=#2b91af guibg=NONE gui=NONE
hi rubyConstant ctermfg=31 ctermbg=NONE cterm=NONE guifg=#2b91af guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=124 ctermbg=NONE cterm=NONE guifg=#a31515 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInclude ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp ctermfg=124 ctermbg=NONE cterm=NONE guifg=#a31515 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=124 ctermbg=NONE cterm=NONE guifg=#a31515 guibg=NONE gui=NONE
hi rubyEscape ctermfg=31 ctermbg=NONE cterm=NONE guifg=#2b91af guibg=NONE gui=NONE
hi rubyControl ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi rubyException ctermfg=21 ctermbg=NONE cterm=NONE guifg=#0000ff guibg=NONE gui=NONE
hi rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

hi rubyRailsUserClass ctermfg=31 ctermbg=NONE cterm=NONE guifg=#2b91af guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE

hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=28 ctermbg=NONE cterm=NONE guifg=#008800 guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=0 ctermbg=NONE cterm=NONE guifg=#000000 guibg=NONE gui=NONE

" YAML
hi yamlKey ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=124 ctermbg=NONE cterm=NONE guifg=#a31515 guibg=NONE gui=NONE


