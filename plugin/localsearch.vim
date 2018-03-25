" ------------------------------------------------------------------------------
" Exit when your app has already been loaded (or "compatible" mode set)
if exists("g:loaded_localsearch") || &cp
  finish
endif
let g:loaded_localsearch= 001
let s:keepcpo           = &cpo
set cpo&vim




" Public Mappings --------------------------------------------------------------

" Toggle window-local searching
nnoremap <script> <Plug>localsearch_toggle <SID>localsearch_toggle
nnoremap <silent> <SID>localsearch_toggle :call localsearch#Toggle()<CR>

let &cpo= s:keepcpo
unlet s:keepcpo
