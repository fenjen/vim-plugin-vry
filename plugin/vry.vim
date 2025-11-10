" =============================================================================
" Filename: plugin/vry.vim
" Author: Steffen Brüntjen
" License: MIT License
" Last Change: 2025/11/11 21:40:00
" Purpose: setup autocommands for visual-selection highlighting
" =============================================================================

if exists('g:loaded_vry') || v:version < 703
  finish
endif
let g:loaded_vry = 1

let s:save_cpo = &cpo
set cpo&vim

call vry#link_color()

augroup vry
  autocmd!
  autocmd ColorScheme * call vry#link_color()
  if exists('##ModeChanged')
    autocmd ModeChanged [vV]:* call vry#clean() " clean must come first
    autocmd ModeChanged *:[vV] call vry#highlight()
  endif
  autocmd CursorMoved,CursorMovedI * call vry#highlight()
augroup END
let &cpo = s:save_cpo
unlet s:save_cpo
