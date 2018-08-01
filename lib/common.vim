" =====================================================================
"
"  common.vim - include common function and command 
"
" =====================================================================
"  EDIT HISTORY
"
"  when         who        what, where, why
"  ----------   --------   -------------------------------------------
"  2018/06/23   T.H lin    Created
"
"
" =====================================================================


" prevent reloading
if get(s:, 'loaded', 0)
    finish
else
    let s:loaded = 1
endif



function! common#get_script_list(dir, filter)
    let script_list = map(glob(fnameescape(a:dir).'/{,.}*/', 1, 1), 'fnamemodify(v:val, a:filter)')
    return script_list
endfunc



function! common#load_script(script)
    if fnamemodify(a:script, ':e') == 'vim'
        if filereadable(a:script)
            exec 'source ' . a:script
        endif
    endif
endfunc



function! common#strip_trailing_white_space()
    " Preparation: save last search, and cursor position.
    let _s=@/
    let l = line(".")
    let c = col(".")
    " do the business:
    %s/\s\+$//e
    " clean up: restore previous search history, and cursor position
    let @/=_s
    call cursor(l, c)
endfunc



" function! s:SearchReplace(mode, search, replace)
"     if a:mode == '-w'
"         exec ':%s/' . '\<' . a:search . '\>' . '/' . a:replace . '/gc'
"     elseif a:mode == '-n'
"         exec ':%s/' . a:search . '/' . a:replace . '/gc'
"     else
"         echo 'Command format :'
"         echo '    Replace <mode> <search-word> <replace-word>'
"         echo ' '
"         echo 'mode :'
"         echo '    -w   whole words exactly matching'
"         echo '    -n   non whole words exactly matching'
"     endif
" endfunc
" command! -nargs=+ Replace call s:SearchReplace(<f-args>)
