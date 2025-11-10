" =============================================================================
" Filename: autoload/vry.vim
" Author: Steffen Brüntjen
" License: MIT License
" Last Change: 2025/11/11 19:47:00
" Purpose: highlight current visual selection
" =============================================================================

let s:save_cpo = &cpo
set cpo&vim

function! vry#highlight() abort
  hi link VrySelection Pmenu
endfunction

function! vry#matchadd() abort
  " Only act in visual mode
  if mode() !~# 'v'
    return
  endif

  " Get selection bounds
  let [l1, c1] = getpos("v")[1:2]
  let [l2, c2] = getpos(".")[1:2]

  " For now only handle single-line selection
  if l1 != l2
    return
  endif

  let start = min([c1, c2])
  let end   = max([c1, c2])

  " Extract selected text
  let sel = getline('.')[start - 1 : end - 1]

  if sel ==# ''
    return
  endif

  " Remove previous match if any
  if get(w:, 'vry_match')
    silent! call matchdelete(w:vry_id)
  endif

  let pattern = escape(sel, '~"\.^$[]*')
  let w:vry_id = matchadd('VrySelection', pattern, -100)
  let w:vry_match = 1
endfunction

function! vry#cursormoved() abort
  " Remove previous match
  if get(w:, 'vry_match')
    silent! call matchdelete(w:vry_id)
    let w:vry_match = 0
  endif

  call vry#matchadd()
endfunction

let &cpo = s:save_cpo
unlet s:save_cpo
