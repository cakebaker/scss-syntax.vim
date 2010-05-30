" Vim syntax file
" Language: SCSS (Sassy CSS)
" Author: Daniel Hofstetter (daniel.hofstetter@42dh.com)
" Inspired by Tim Pope's sass syntax file

if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

syn case ignore

syn region scssDefinition transparent matchgroup=cssBraces start='{' end='}' contains=css.*Attr,css.*Prop,cssComment,cssValue.*,cssColor,cssUrl,cssImportant,cssError,cssStringQ,cssStringQQ,cssFunction,cssUnicodeEscape,scssVariable,scssMixing,scssAmpersand

syn match scssVariable "$[[:alnum:]_-]\+"
syn match scssMixin "^@mixin.*"
syn match scssMixing "@include.*"

syn match scssIdChar "#[[:alnum:]_-]\@=" nextgroup=scssId
syn match scssId "[[:alnum:]_-]\+" contained
syn match scssClassChar "\.[[:alnum:]_-]\@=" nextgroup=scssClass
syn match scssClass "[[:alnum:]_-]\+" contained
syn match scssAmpersand "&"

syn region scssComment	start="^\z(\s*\)//" end="^\%(\z1 \)\@!"

hi def link scssVariable  Identifier
hi def link scssMixin	  PreProc
hi def link scssMixing	  PreProc
hi def link scssComment	  Comment
hi def link scssIdChar	  Special
hi def link scssClassChar Special
hi def link scssId	  Identifier
hi def link scssClass	  Type
hi def link scssAmpersand Character

let b:current_syntax = "scss"
