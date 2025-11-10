" =============================================================================
" Filename: plugin/vry.vim
" Author: Steffen Brüntjen
" License: MIT License
" Last Change: 2025/11/11 20:40:00
" Purpose: setup autocommands for visual-selection highlighting
" =============================================================================

if exists('g:loaded_vry') || v:version < 703
  finish
endif
let g:loaded_vry = 1

let s:save_cpo = &cpo
set cpo&vim

if exists('v:colors_name')
  hi default VrySelection gui=underline cterm=underline
else
  hi! link VrySelection Pmenu
endif

augroup vry
  autocmd!
  autocmd ColorScheme * call vry#highlight()
  autocmd CursorMoved,CursorMovedI * call vry#cursormoved()
augroup END

let &cpo = s:save_cpo
unlet s:save_cpo
