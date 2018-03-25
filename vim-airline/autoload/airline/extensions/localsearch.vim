" MIT License. Copyright (c) 2018-2018 mox

scriptencoding utf-8

let s:enabled = get(g:, 'airline#extensions#localsearch#enabled', 1)
if !get(g:, 'loaded_localsearch', 0) || !s:enabled
	finish
endif
let g:loaded_airline_localsearch = 001

let s:spc = g:airline_symbols.space

"function! airline#extensions#localsearch#get_status()
"	return exists('#localsearch#WinEnter') ? s:spc."LS".s:spc : ""
"endfunction


function! airline#extensions#localsearch#load_theme(palette)
	call airline#highlighter#exec('localsearch_dark', [ '#ffffff' , '#000000' , 15  , 1 , ''])
endfunction


function! airline#extensions#localsearch#init(ext)
	"call airline#parts#define('localsearch', {'raw': '%{airline#extensions#localsearch#get_status()}'})
	call a:ext.add_theme_func('airline#extensions#localsearch#load_theme')
	call a:ext.add_statusline_func('airline#extensions#localsearch#apply')
	"call a:ext.add_inactive_statusline_func('airline#extensions#localsearch#apply')
	"let s:ext = a:ext
endfunction


function! airline#extensions#localsearch#apply(...)
    " first variable is the statusline builder
    let builder = a:1
	let w:airline_section_ls = airline#section#create('LS')
	"let w:airline_section_a  = get(w:, 'airline_section_a', g:airline_section_a)
	"let w:airline_section_b  = get(w:, 'airline_section_b', g:airline_section_b)
	"let w:airline_section_c  = get(w:, 'airline_section_c', g:airline_section_c)
	"let w:airline_section_x  = get(w:, 'airline_section_x', g:airline_section_x)
	"let w:airline_section_y  = get(w:, 'airline_section_y', g:airline_section_y)
	"let w:airline_section_z  = get(w:, 'airline_section_z', g:airline_section_z)

    """"" WARNING: the API for the builder is not finalized and may change
    "call builder.add_section('airline_a',                     w:airline_section_a)
    "call builder.add_section('airline_b',                     w:airline_section_b)
	if exists('#localsearch#WinEnter')
		call builder.add_section('localsearch_dark',              s:spc.w:airline_section_ls.s:spc)
	endif
    "call builder.add_section('airline_c',               s:spc.w:airline_section_c)
    "call builder.split()
    "call builder.add_section('airline_x',                     w:airline_section_x)
    "call builder.add_section('airline_y',                     w:airline_section_y)
    "call builder.add_section('airline_z',                     w:airline_section_z)
    return 0
endfunction
