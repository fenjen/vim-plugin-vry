" =============================================================================
" Filename: autoload/vry.vim
" Author: Steffen Brüntjen
" License: MIT License
" Last Change: 2025/11/11 21:40:00
" Purpose: highlight current visual selection
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! vry#link_color() abort
  if hlexists('Pmenu')
    hi! link VrySelection Pmenu
  else
    hi default VrySelection gui=underline cterm=underline
  endif
endfunction

function! vry#highlight() abort
  call vry#clean()
  if mode() ==# 'v'
    call vry#highlight_selection()
  elseif mode() ==# 'V'
    call vry#highlight_line()
  endif
endfunction

function! vry#highlight_selection() abort
  let [l1, c1] = getpos('v')[1:2]
  let [l2, c2] = getpos('.')[1:2]

  " only handle single-line selections
  if l1 != l2
    return
  endif

  let start = min([c1, c2])
  let end   = max([c1, c2])
  let sel   = getline('.')[start - 1 : end - 1]

  call vry#clean()

  if sel ==# ''
    return
  endif

  let pat = escape(sel, '~"\.^$[]*')
  let w:vry_id = matchadd('VrySelection', pat, -100)
  let w:vry_match = 1
endfunction

function! vry#highlight_line() abort
  let text = getline('.')
  if text ==# ''
    return
  endif

  " literal match of whole line
  let pat = '^\V' . escape(text, '\') . '\$'
  let w:vry_id = matchadd('VrySelection', pat, -100)
  let w:vry_match = 1
endfunction

function! vry#clean() abort
  " Remove previous match if any
  if get(w:, 'vry_match')
    silent! call matchdelete(w:vry_id)
    let w:vry_match = 0
  endif
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
