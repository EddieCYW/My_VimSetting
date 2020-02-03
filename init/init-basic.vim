"======================================================================
"
" init-basic.vim - ????,??????? vim tiny ??
"
" ??????????,????? keymap, ?????
"
" Created by EddieChen on 2018/07/30
"
"======================================================================


" not allow to use vi compatible mode
set nocompatible

" set backspace key mode
set bs=eol,start,indent

" highligh content
set hlsearch

" highligh content during search
set incsearch

" ignorecase
set ignorecase

" show menu in low side
set wildmenu

" make \ to /, comment it prevent from ctrsf fail now
"set shellslash

"----------------------------------------------------------------------
" copy-paste with other program
"----------------------------------------------------------------------
if has('clipboard')
    if has('unnamedplus')  " When possible use + register for copy-paste
        set clipboard=unnamed,unnamedplus
    else         " On mac and Windows, use * register for copy-paste
        set clipboard=unnamed
    endif
endif

" remove ^M
set ffs=dos

"set tab to 2 space
set tabstop=2 shiftwidth=2 expandtab

" move the visual block
vnoremap K :m '<-2<cr>gv=gv
vnoremap J :m '>+1<cr>gv=gv
