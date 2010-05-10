" Vim syntax file
" Language: SCSS (Sassy CSS)
" Author: Daniel Hofstetter (daniel.hofstetter@42dh.com)
" Inspired by Tim Pope's sass syntax file

if exists("b:current_syntax")
  finish
endif

runtime! syntax/css.vim

syn match scssVariable "$[[:alnum:]_-]\+"
syn match scssMixin "^@mixin.*"
syn match scssMixing "@include.*"

syn region scssComment	start="^\z(\s*\)//" end="^\%(\z1 \)\@!"

hi def link scssVariable  Identifier
hi def link scssMixin	  PreProc
hi def link scssMixing	  PreProc
hi def link scssComment	  Comment

let b:current_syntax = "scss"
