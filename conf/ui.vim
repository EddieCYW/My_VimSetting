" =====================================================================
"
"  ui.vim - configure ui group plugins
"
" =====================================================================
"  EDIT HISTORY
"
"  when         who        what, where, why
"  ----------   --------   -------------------------------------------
"  2018/07/10   T.H lin    Created
"
"
" =====================================================================

" --- space-vim-dark {

    colorscheme space-vim-dark

    hi CursorLine guifg=white guibg=purple
"}

" --- airline {

    let g:airline_theme ='deus'
    let g:airline_powerline_fonts = 1

    "let g:airline_section_b = '%{getcwd()}'
    "let g:airline_section_c = '%F'
    "let g:airline_section_error = airline#section#create_right(['[AsyncRun]:%{g:asyncrun_status}'])

    if !exists('g:airline_symbols')
        let g:airline_symbols = {}
    endif

    let g:airline#extensions#tabline#enabled =1

    " unicode symbols
    let g:airline_left_sep           = '▶'
    let g:airline_right_sep          = '◀'
    let g:airline_symbols.crypt      = '🔒'
    let g:airline_symbols.linenr     = '¶'
    let g:airline_symbols.branch     = '⎇'
    let g:airline_symbols.paste      = '∥'
    let g:airline_symbols.notexists  = '∄'
    let g:airline_symbols.whitespace = 'Ξ'

    " powerline symbols
    if get(g:, 'airline_powerline_fonts', 0)
        let g:airline_left_sep          = ''
        let g:airline_left_alt_sep      = ''
        "let g:airline_right_sep         = ''
        "let g:airline_right_alt_sep     = ''
        let g:airline_right_sep         = ''
        let g:airline_right_alt_sep     = ''
        let g:airline_symbols.branch    = ''
        let g:airline_symbols.readonly  = ''
        let g:airline_symbols.linenr    = ''
        let g:airline_symbols.maxlinenr = ''
    endif

    " Use the default set of separators with a few customizations
    "let g:airline#extensions#tabline#left_sep      = ''
    "let g:airline#extensions#tabline#left_alt_sep  = ''
    "let g:airline#extensions#tabline#right_sep     = ''
    "let g:airline#extensions#tabline#right_alt_sep = ''
    "let g:airline#extensions#tabline#left_sep      = "\ue0bc"
    "let g:airline#extensions#tabline#left_alt_sep  = "\ue0bd"
    "let g:airline#extensions#tabline#right_sep     = "\ue0be"
    "let g:airline#extensions#tabline#right_alt_sep = "\ue0bf"
    "let g:airline#extensions#tabline#left_sep      = ''
    "let g:airline#extensions#tabline#left_alt_sep  = ''
    let g:airline#extensions#tabline#right_sep      = ''
    let g:airline#extensions#tabline#right_alt_sep  = ''
    let g:airline#extensions#tabline#buffers_label  = ''
    let g:airline#extensions#tabline#tabs_label     = ''
    let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
    let g:airline#extensions#quickfix#location_text = 'Location'

    let g:airline#extensions#tabline#buffer_nr_show = 1
    let g:airline#extensions#tabline#formatter      = 'default'
    let g:airline#extensions#tabline#fnamemod       = ':t'
    " enable/disable bufferline integration >
    let g:airline#extensions#bufferline#enabled     = 1
    " enable/disable bufferline integration >
    let g:airline#extensions#fugitiveline#enabled   = 1
    " enable/disable vim-gutentags integration >
    let g:airline#extensions#gutentags#enabled      = 1
    " enable/disable vim-capslock integration >
    let g:airline#extensions#capslock#enabled       = 1

    " work around to fixed some airline's bug {

        " auto refresh air-line after executing the bufferdelete command
        autocmd BufDelete * call airline#extensions#tabline#buflist#invalidate()

    " }
    
    "----------------------------------------------------------------------
    " Dynamic update the AsyncRun start status to airline error section
    "----------------------------------------------------------------------
    function! AsyncRun_Start_Update_Airline()
        let g:airline_section_temp = g:airline_section_error
        let g:airline_section_error = airline#section#create_right([
                    \ '[AsyncRun]:%{g:asyncrun_status}',
                    \ g:airline_section_temp,
                    \ ])
    endfunc
    autocmd User AsyncRunStart  call AsyncRun_Start_Update_Airline()

    "----------------------------------------------------------------------
    " Dynamic update the AsyncRun stop status to airline error section
    "----------------------------------------------------------------------
    function! AsyncRun_Stop_Update_Airline()
        let g:airline_section_error = airline#section#create_right([
                    \ g:airline_section_temp
                    \ ])
    endfunc
    autocmd User AsyncRunStop   call AsyncRun_Stop_Update_Airline()    

" }

"---toggle relative line numer{
    let g:relative_number_enable = 0
    function! g:Relative_number_toggle()
        if !g:relative_number_enable
            set relativenumber
            let g:relative_number_enable = 1
        else
            set norelativenumber
            let g:relative_number_enable = 0
        endif
    endfunc
"}

"--interestingwords{
  "add one more color scheme, totally color number is 7"
  let g:interestingWordsGUIColors = ['#aeee00', '#ff0000', '#0000ff', '#b88823', '#ffa724', '#ff2c4b', '#cdf015']
"}
