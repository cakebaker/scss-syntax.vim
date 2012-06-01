" Vim syntax file
" Language: SCSS (Sassy CSS)
" Author: Daniel Hofstetter (daniel.hofstetter@42dh.com)
" Inspired by the syntax files for sass and css. Thanks to the authors of
" those files!

if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

syn case ignore

syn region scssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssUrl,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,scssDefinition,scssComment,scssIdChar,scssClassChar,scssAmpersand,scssVariable,scssInclude,scssExtend,scssDebug,scssWarn,@scssControl,scssInterpolation,scssNestedSelector,scssReturn

syn region scssInterpolation start="#{" end="}" contains=scssVariable

syn match scssVariable "$[[:alnum:]_-]\+" nextgroup=scssVariableAssignment
syn match scssVariableAssignment ":" contained nextgroup=scssVariableValue
syn match scssVariableValue ".*;"me=e-1 contained contains=scssVariable,scssOperator,scssDefault "me=e-1 means that the last char of the pattern is not highlighted
syn match scssMixin "^@mixin" nextgroup=scssMixinName
syn match scssMixinName " [[:alnum:]_-]\+" contained nextgroup=scssDefinition
syn match scssFunction "^@function" nextgroup=scssFunctionName
syn match scssFunctionName " [[:alnum:]_-]\+" contained nextgroup=scssDefinition
syn match scssReturn "@return" contained
syn match scssInclude "@include" nextgroup=scssMixinName
syn match scssExtend "@extend .*[;}]"me=e-1 contains=cssTagName,scssIdChar,scssClassChar

syn match scssColor "#[0-9A-Fa-f]\{3\}\>" contained
syn match scssColor "#[0-9A-Fa-f]\{6\}\>" contained

syn match scssIdChar "#[[:alnum:]_-]\@=" nextgroup=scssId contains=scssColor
syn match scssId "[[:alnum:]_-]\+" contained
syn match scssClassChar "\.[[:alnum:]_-]\@=" nextgroup=scssClass
syn match scssClass "[[:alnum:]_-]\+" contained
syn match scssAmpersand "&" nextgroup=cssPseudoClass

syn match scssOperator "+" contained
syn match scssOperator "-" contained
syn match scssOperator "/" contained
syn match scssOperator "*" contained

syn match scssNestedSelector "[^/]* {"me=e-1 contained contains=cssTagName,cssAttributeSelector,scssIdChar,scssClassChar,scssAmpersand,scssVariable,scssMixin,scssFunction,@scssControl,scssInterpolation,scssNestedProperty
syn match scssNestedProperty "[[:alnum:]]\+:"me=e-1 contained

syn match scssDebug "@debug"
syn match scssWarn "@warn"
syn match scssDefault "!default" contained

syn match scssIf "@if"
syn match scssElse "@else"
syn match scssElseIf "@else if"
syn match scssWhile "@while"
syn match scssFor "@for" nextgroup=scssVariable
syn match scssFrom " from "
syn match scssTo " to "
syn match scssThrough " through "
syn match scssEach "@each" nextgroup=scssVariable
syn match scssIn " in "
syn cluster scssControl contains=scssIf,scssElse,scssElseIf,scssWhile,scssFor,scssFrom,scssTo,scssThrough,scssEach,scssIn

syn match scssComment "//.*$" contains=@Spell
syn region scssImportStr start="\"" end="\""
syn region scssImport start="@import" end=";" contains=scssImportStr,scssComment,cssComment,cssUnicodeEscape,cssMediaType

hi def link scssVariable  Identifier
hi def link scssVariableValue Constant
hi def link scssMixin     PreProc
hi def link scssMixinName Function
hi def link scssFunction  PreProc
hi def link scssFunctionName Function
hi def link scssReturn    Statement
hi def link scssInclude   PreProc
hi def link scssExtend    PreProc
hi def link scssComment   Comment
hi def link scssColor     Constant
hi def link scssIdChar    Special
hi def link scssClassChar Special
hi def link scssId        Identifier
hi def link scssClass     Identifier
hi def link scssAmpersand Character
hi def link scssNestedProperty Type
hi def link scssDebug     Debug
hi def link scssWarn      Debug
hi def link scssDefault   Special
hi def link scssIf        Conditional
hi def link scssElse      Conditional
hi def link scssElseIf    Conditional
hi def link scssWhile     Repeat
hi def link scssFor       Repeat
hi def link scssFrom      Repeat
hi def link scssTo        Repeat
hi def link scssThrough   Repeat
hi def link scssEach      Repeat
hi def link scssIn        Repeat
hi def link scssInterpolation Delimiter
hi def link scssImport    Include
hi def link scssImportStr Include

let b:current_syntax = "scss"
