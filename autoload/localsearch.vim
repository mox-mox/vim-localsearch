" Public Functions -------------------------------------------------------------

"{{{
function! localsearch#Toggle()
	" Turn local search mode on or off
	if exists('#localsearch#WinEnter')
		:call localsearch#Disable()
	else
		:call localsearch#Enable()
	endif
	if get(g:, 'loaded_airline_localsearch', 0)
		call airline#update_statusline()
	endif
endfunction
"}}}


" Private Functions ------------------------------------------------------------

"{{{
function! localsearch#Enable()
	augroup localsearch
		autocmd!
		autocmd WinEnter * :call localsearch#Set()
		autocmd WinLeave * :call localsearch#Unset()
	augroup END
	:call localsearch#Set()
endfunction
"}}}

"{{{
function! localsearch#Disable()
	:call localsearch#Unset()
	augroup localsearch
		autocmd!
	augroup END
endfunction
"}}}

"{{{
function! localsearch#Set()
	let g:last_search = @/
	let @/ = get(w:, 'last_search', '')
endfunction
"}}}

"{{{
function! localsearch#Unset()
	let w:last_search = @/
	let @/ = get(g:, 'last_search', '')
endfunction
"}}}
