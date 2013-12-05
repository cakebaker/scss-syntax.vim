" Vim syntax file
" Language: SCSS (Sassy CSS)
" Author: Daniel Hofstetter (daniel.hofstetter@42dh.com)
" Inspired by the syntax files for sass and css. Thanks to the authors of
" those files!

if !exists("main_syntax")
  if exists("b:current_syntax")
    finish
  endif
  let main_syntax = 'scss'
endif

runtime! syntax/css.vim
runtime! syntax/css/*.vim

syn case ignore

" XXX fix for #20, can be removed once the patch is in vim's css.vim
syn match cssSpecialCharQQ +\\\\\|\\"+ contained
syn match cssSpecialCharQ +\\\\\|\\'+ contained

" XXX redefining font keyword to avoid it being displayed as deprecated
syn keyword cssFontProp font

syn region scssDefinition matchgroup=cssBraces start='{' end='}' contains=TOP

syn match scssProperty "\%([[:alnum:]-]\)\+\s*:" contains=css.*Prop,cssVendor containedin=cssMediaBlock,scssDefinition nextgroup=scssAttribute
syn match scssAttribute ":.*;" contains=css.*Attr,cssValue.*,cssColor,cssFunction,cssString.*,cssUrl,scssDefault,scssFn,scssInterpolation,scssNull,scssVariable containedin=scssProperty

syn region scssInterpolation start="#{" end="}" contains=cssValue.*,cssColor,cssString.*,scssFn,scssOperator,scssVariable containedin=cssString.*,cssUrl,scssFn

" functions from http://sass-lang.com/documentation/Sass/Script/Functions.html
syn region scssFn contained matchgroup=scssFunctionName start="\<\(rgb\|rgba\|red\|green\|blue\|mix\)\s*(" end=")" oneline keepend
syn region scssFn contained matchgroup=scssFunctionName start="\<\(hsl\|hsla\|hue\|saturation\|lightness\|adjust-hue\)\s*(" end=")" oneline keepend
syn region scssFn contained matchgroup=scssFunctionName start="\<\(lighten\|darken\|saturate\|desaturate\|grayscale\|complement\|invert\)\s*(" end=")" oneline keepend
syn region scssFn contained matchgroup=scssFunctionName start="\<\(alpha\|opacity\|opacify\|fade-in\|transparentize\|fade-out\)\s*(" end=")" oneline keepend
syn region scssFn contained matchgroup=scssFunctionName start="\<\(adjust-color\|scale-color\|change-color\|ie-hex-str\)\s*(" end=")" oneline keepend
syn region scssFn contained matchgroup=scssFunctionName start="\<\(unquote\|quote\)\s*(" end=")" oneline keepend
syn region scssFn contained matchgroup=scssFunctionName start="\<\(percentage\|round\|ceil\|floor\|abs\|min\|max\)\s*(" end=")" oneline keepend
syn region scssFn contained matchgroup=scssFunctionName start="\<\(length\|nth\|join\|append\|zip\|index\)\s*(" end=")" oneline keepend
syn region scssFn contained matchgroup=scssFunctionName start="\<\(type-of\|unit\|unitless\|comparable\)\s*(" end=")" oneline keepend
syn region scssFn contained matchgroup=scssFunctionName start="\<\(if\)\s*(" end=")" oneline keepend
" custom functions
syn region scssFn contained matchgroup=scssFunctionName start="\<\([[:alnum:]-]\)\+\s*(" end=")" oneline keepend

syn match scssVariable "$[[:alnum:]_-]\+" containedin=cssFunction,scssFn
syn match scssVariableAssignment "($[[:alnum:]_-]\+\s*)\@<=:" nextgroup=scssAttribute
syn keyword scssNull null contained;

syn match scssMixin "^@mixin" nextgroup=scssMixinName
syn match scssMixinName " [[:alnum:]_-]\+[^{;]*" contained contains=scssMixinParams nextgroup=scssDefinition
syn region scssMixinParams contained contains=cssColor,cssValue.*,cssString.*,scssVariable,scssFn start="(" end=")" oneline extend
syn match scssInclude "@include\s\+[[:alnum:]_-]\+" contains=scssMixinName nextgroup=scssMixinParams
syn match scssContent "@content" contained containedin=scssDefinition

syn match scssFunction "^@function" nextgroup=scssFunctionName
syn match scssFunctionName " [[:alnum:]_-]\+" contained nextgroup=scssDefinition
syn match scssReturn "@return" containedin=scssFunction
syn match scssExtend "@extend .*[;}]"me=e-1 contains=cssTagName,scssIdChar,scssClassChar,scssPlaceholderChar,scssOptional
syn match scssOptional "!optional" contained
syn match scssImport "@import" nextgroup=scssImportList
syn match scssImportList "[^;]\+" contained contains=cssString.*,cssMediaType,cssUrl

syn match scssColor "#[0-9A-Fa-f]\{3\}\>" contained
syn match scssColor "#[0-9A-Fa-f]\{6\}\>" contained

syn match scssIdChar "#[[:alnum:]_-]\@=" nextgroup=scssSelectorName contains=scssColor
syn match scssClassChar "\.[[:alnum:]_-]\@=" nextgroup=scssSelectorName
syn match scssPlaceholderChar "%[[:alnum:]_-]\@=" nextgroup=scssSelectorName
syn match scssSelectorName "[[:alnum:]_-]\+" contained

syn match scssAmpersand "&" nextgroup=cssPseudoClass

syn match scssOperator "+" contained
syn match scssOperator "-" contained
syn match scssOperator "/" contained
syn match scssOperator "*" contained

syn match scssDebug "@debug"
syn match scssWarn "@warn"
syn match scssDefault "!default" contained

syn match scssIf "@\(else \)\=if" nextgroup=scssCondition
syn match scssCondition "[^{]\+" contained contains=cssValue.*,cssString.*,scssFn,scssNull,scssVariable
syn match scssElse "@else\(\s*\({\|$\)\)\@="
syn match scssWhile "@while" nextgroup=scssCondition
syn match scssFor "@for\s\+.*from\s\+.*\(to\|through\)\s\+[^{ ]\+" contains=cssValueNumber,scssFn,scssVariable
syn match scssEach "@each\s\+\$[[:alnum:]_-]\+\s\+in" contains=scssVariable nextgroup=scssList
syn match scssList "[^{]\+" contained contains=scssFn,scssVariable
syn cluster scssControl contains=scssIf,scssElse,scssWhile,scssFor,scssEach

syn match scssComment "//.*$" contains=@Spell
syn keyword scssTodo TODO FIXME NOTE OPTIMIZE XXX contained containedin=cssComment,scssComment

hi def link scssVariable  Identifier
hi def link scssNull      Constant
hi def link scssMixin     PreProc
hi def link scssMixinName Function
hi def link scssContent   PreProc
hi def link scssFunction  PreProc
hi def link scssFunctionName Function
hi def link scssFn        Constant
hi def link scssReturn    Statement
hi def link scssInclude   PreProc
hi def link scssExtend    PreProc
hi def link scssOptional  Special
hi def link scssComment   Comment
hi def link scssColor     Constant
hi def link scssIdChar    Special
hi def link scssClassChar Special
hi def link scssPlaceholderChar Special
hi def link scssSelectorName Identifier
hi def link scssAmpersand Character
hi def link scssDebug     Debug
hi def link scssWarn      Debug
hi def link scssDefault   Special
hi def link scssIf        Conditional
hi def link scssElse      Conditional
hi def link scssWhile     Repeat
hi def link scssFor       Repeat
hi def link scssEach      Repeat
hi def link scssInterpolation Delimiter
hi def link scssImport    Include
hi def link scssTodo      Todo

let b:current_syntax = "scss"
if main_syntax == 'scss'
  unlet main_syntax
endif
