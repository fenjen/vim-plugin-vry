" =============================================================================
" Filename: plugin/vry.vim
" Author: Steffen Brüntjen
" License: MIT License
" Last Change: 2025/11/11 19:47:00
" Purpose: setup autocommands for visual-selection highlighting
" =============================================================================

if exists('g:loaded_vry') || v:version < 703
  finish
endif
let g:loaded_vry = 1

let s:save_cpo = &cpo
set cpo&vim

augroup vry
  autocmd!
  autocmd ColorScheme * call vry#highlight()
  autocmd CursorMoved,CursorMovedI * call vry#cursormoved()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
