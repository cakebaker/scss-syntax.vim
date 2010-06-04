" Vim syntax file
" Language: SCSS (Sassy CSS)
" Author: Daniel Hofstetter (daniel.hofstetter@42dh.com)
" Inspired by Tim Pope's sass syntax file

if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

syn case ignore

syn region scssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssUrl,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,cssTagName,scssDefinition,scssComment,scssId,scssIdChar,scssClass,scssClassChar,scssAmpersand,scssVariable,scssInclude,scssExtend,scssDebug,scssWarn,scssIf,scssElse,scssElseIf,scssWhile,scssFor,scssFrom,scssTo,scssThrough,scssInterpolation

syn region scssInterpolation start="#{" end="}" contains=scssVariable

syn match scssVariable "$[[:alnum:]_-]\+" nextgroup=scssVariableAssignment
syn match scssVariableAssignment ":" nextgroup=scssVariableValue
syn match scssVariableValue ".*" contained
syn match scssMixin "^@mixin" nextgroup=scssMixinName
syn match scssMixinName " [[:alnum:]_-]\+" contained nextgroup=scssDefinition
syn match scssInclude "@include" nextgroup=scssMixinName
syn match scssExtend "@extend"

syn match scssIdChar "#[[:alnum:]_-]\@=" nextgroup=scssId
syn match scssId "[[:alnum:]_-]\+" contained
syn match scssClassChar "\.[[:alnum:]_-]\@=" nextgroup=scssClass
syn match scssClass "[[:alnum:]_-]\+" contained
syn match scssAmpersand "&" nextgroup=cssPseudoClass

syn match scssDebug "@debug"
syn match scssWarn "@warn"

syn match scssIf "@if"
syn match scssElse "@else"
syn match scssElseIf "@else if"
syn match scssWhile "@while"
syn match scssFor "@for" nextgroup=scssVariable
syn match scssFrom " from "
syn match scssTo " to "
syn match scssThrough " through "

syn region scssComment	start="^\z(\s*\)//" end="^\%(\z1 \)\@!"

hi def link scssVariable  Identifier
hi def link scssVariableValue Constant
hi def link scssMixin	  PreProc
hi def link scssMixinName Function
hi def link scssInclude	  PreProc
hi def link scssExtend	  PreProc
hi def link scssComment	  Comment
hi def link scssIdChar	  Special
hi def link scssClassChar Special
hi def link scssId	  Identifier
hi def link scssClass	  Type
hi def link scssAmpersand Character
hi def link scssDebug	  Debug
hi def link scssWarn	  Debug
hi def link scssIf	  Conditional
hi def link scssElse	  Conditional
hi def link scssElseIf	  Conditional
hi def link scssWhile	  Repeat
hi def link scssFor	  Repeat
hi def link scssFrom	  Repeat
hi def link scssTo	  Repeat
hi def link scssThrough	  Repeat
hi def link scssInterpolation Delimiter

let b:current_syntax = "scss"
