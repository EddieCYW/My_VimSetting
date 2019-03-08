" =====================================================================
"
"  search.vim - configure search group plugins
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


" --- LeaderF {

    "let g:Lf_PythonVersion = 3
    let g:Lf_UseVersionControlTool = 0
    "let g:Lf_WindowPosition ='top'
    let g:Lf_WindowHeight = 0.2
    let g:Lf_PreviewCode = 0
    let g:Lf_ShowRelativePath = 1
    "let g:Lf_DefaultMode = 'FullPath'
    let g:Lf_FollowLinks = 1

    let g:Lf_DefaultExternalTool = 'rg'
    "let g:Lf_ExternalCommand = 'rg --files --hidden --no-ignore "%s"'
    let g:Lf_ExternalCommand = 'rg --files --no-ignore --hidden -g !.git "%s"'

    "let g:Lf_CacheDirectory = g:leaderf_cache_dir

    " 如何识别项目目录，从当前文件目录向父目录递归知道碰到下面的文件/目录
    let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
    "let g:Lf_WorkingDirectoryMode = 'Ac'

    " fuzzy search ignore folder name and filename extension
    let g:Lf_WildIgnore = {
        \ 'dir' : ['.svn','.git','.hg'],
        \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]']
    \ }

    " mru ignore filename extension
    let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']

    " 禁用 function/buftag 的预览功能，可以手动用 p 预览
    let g:Lf_PreviewResult = {
        \ 'File'        : 0,
        \ 'Buffer'      : 0,
        \ 'Mru'         : 0,
        \ 'Tag'         : 0,
        \ 'BufTag'      : 0,
        \ 'Function'    : 0,
        \ 'Line'        : 0,
        \ 'Colorscheme' : 1
    \ }

    let g:Lf_StlColorscheme = 'powerline'
    let g:Lf_StlSeparator = {'left':'', 'right':''}

    "highlight Lf_hl_match gui=bold guifg=Blue cterm=bold ctermfg=21
    "highlight Lf_hl_matchRefine  gui=bold guifg=Magenta cterm=bold ctermfg=201
    let g:Lf_CommandMap = {'<C-K>': ['<Up>'], '<C-J>': ['<Down>']}

    " let g:Lf_RgConfig = [
    "    \ "--no-ignore",
    "   \ "-g *.{c,h,s,S,asm,dec,dsc,fdf,vfr,hfv,sdl,sd,py,xml,asl,asli,tpl,bat,sh,vim,mak,equ}",
    "    \ "--heading -C3",
    "    \ "--glob=!git/*",
    "    \ "--hidden"
    "    \ ]

    let g:Lf_RgConfig = [
        \ "--no-ignore",
        \ "--heading -C3",
        \ "--glob=!git/*",
        \ "--hidden",
        \ "-g *.{c,h,s,S,asm,dec,dsc,fdf,vfr,hfv,sdl,sd,py,xml,asl,asli,tpl,bat,sh,vim,mak,equ,inf,uni,hfr,ASL,aslc,txt,cbin,asi,cif}"
    \ ]

    function! g:Lf_RgOptions(args)
        " let g:rg_ctrlsf_command_h = '--vimgrep --type-add "fexts:*.{'
        " let g:rg_ctrlsf_command_t = '}" -tfexts'
        if a:args == 'all'
            let g:extension_file = 'c,h,s,S,asm,dec,dsc,fdf,vfr,hfv,sdl,sd,py,xml,asl,asli,tpl,bat,sh,vim,mak,equ,inf,uni,hfr,ASL,aslc,txt,cbin,asi,cif'
        else
            let g:extension_file = a:args
        endif

        " override rg command to leaderf
        let g:Lf_RgConfig[len(g:Lf_RgConfig) - 1] = substitute(g:Lf_RgConfig[len(g:Lf_RgConfig) - 1], '-g \*\.{.*}', '-g \*\.{'.g:extension_file.'}', '')

        echo g:Lf_RgConfig[len(g:Lf_RgConfig) - 1]
    endfunc
    command! -nargs=1 LFRGOPTS call g:Lf_RgOptions('<args>')

     " map <leader>fs <Plug>LeaderfRgCwordLiteralNoBoundary --right<cr>
     "map <leader>fs :Leaderf rg --heading -C3 --smart-case -e <c-r>=expand("<cword>")<cr> --fullScreen --match-path<cr>
     map <leader>fs :Leaderf rg --heading -C3 --smart-case --fullScreen --match-path -e 
     map <leader>fg :LFRGOPTS
     map <leader>rt :Leaderf rg --recall --left<cr>
"  }

" --- ctrlsf {

    let g:ctrlsf_search_mode      = 'async'
    let g:ctrlsf_ackprg           = 'rg'
    let g:ctrlsf_winsize          = '40%'
    let g:ctrlsf_position         = 'left'
    let g:ctrlsf_debug_mode       = 0
    let g:ctrlsf_selected_line_hl = 'op'

    let g:ctrlsf_extra_backend_args = {
        \ 'pt': '--home-ptignore',
        \ 'rg': '--pretty',
    \ }

"ctrl sf prevent windows from close
let g:ctrlsf_auto_close = {
            \ "normal" : 0,
            \ "compact": 0
            \ }
            
"=======================================
" CtrlSF backend args plus
"=======================================
let g:rg_args_map = {
            \ 'c'      : '*.c',
            \ 'h'      : '*.h',
            \ 'dsc'    : '*.dsc',
            \ 'dec'    : '*.dec',
            \ 'fdf'    : '*.fdf',
            \ 'uni'    : '*.uni',
            \ 'vfr'    : '*.vfr',
            \ 'hfr'    : '*.hfr',
            \ 'inf'    : '*.inf',
            \ 'asl'    : '*.asl',
            \ 'asi'    : '*.asi',
            \ 'ASL'    : '*.ASL',
            \ 'uefi'   : '*.c,*.h,*.dec,*.dsc,*.fdf,*.inf,*.uni,*.vfr,*.hfr,*.asl,*.ASL,*.asm,*.bat,*.aslc',
            \ 'sdl'    : '*.sdl',
            \ 'sd'     : '*.sd',
            \ 'txt'    : '*.txt',
            \ 'mak'    : '*.mak',
            \ 'equ'    : '*.equ',
            \ 'cbin'   : '*.cbin',
            \ 'cif'    : '*.cif',
            \ 'ami'    : '*.sdl,*.sd,*.txt,*.mak,*.equ,*.cbin,*.asi,*.cif',
            \ 'asm'    : '*.asm,*.s,*.S',
            \ 'xml'    : '*.xml',
            \ 'py'     : '*.py',
            \ 'cfg'    : '*.cfg',
            \ 'ld'     : '*.ld',
            \ 'qcom'   : '*.xml,*.py,*.cfg,*.inc,*.ld',
            \ 'report' : '*.report',
            \ 'inc'    : '*.inc',
            \ 'bat'    : '*.bat',
            \ 'aslc'   : '*.aslc'
            \ }

let g:rg_cmd_list = {
    \ 'def' : ['--pretty'],
    \ 'inc' : ['--pretty --type-add "fexts:{', '}" -tfexts'],
    \ 'exc' : ['--pretty --type-add "fexts:{', '}" --type-not fexts']
\ }

function! s:CtrlSFBackEndArgsOptions(...)
    let filter       = ''
    let filter_flag  = 0
    let exclude_flag = 0

    for args in a:000
        if args == '!'
            let exclude_flag = 1
        else
            let filter_flag = 1
            let args_list = split(args, ',')
            for key in args_list
                if has_key(g:rg_args_map, key)
                    let filter = !strlen(filter) ? filter.g:rg_args_map[key] : filter.','.g:rg_args_map[key]
                endif
            endfor
        endif
    endfor

        if filter_flag
            if exclude_flag
                if has_key(g:rg_cmd_list, 'exc')
                    let cmd_format = g:rg_cmd_list['exc']
                endif
            else
                if has_key(g:rg_cmd_list, 'inc')
                    let cmd_format = g:rg_cmd_list['inc']
                endif
            endif

            let cmd_package = join(cmd_format, filter)
        else
            if has_key(g:rg_cmd_list, 'def')
                let cmd_format = g:rg_cmd_list['def'][0]
            endif

            let cmd_package = cmd_format
        endif

        " override rg command to ctrlsf
        if has_key(g:ctrlsf_extra_backend_args, 'rg')
            let g:ctrlsf_extra_backend_args['rg'] = cmd_package
        endif
    echo g:ctrlsf_extra_backend_args['rg']
endfunc
command! -nargs=* CtrlSFOptions call s:CtrlSFBackEndArgsOptions(<f-args>)

"  }

" --- fzf {

    " fzf drop down
    let g:fzf_layout         = { 'down': '~30%' }
    let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --no-ignore'
    "let g:fzf_tags_command   = 'ctags --extra=+f -R'

    " Customize fzf colors to match your color scheme
    " let g:fzf_colors = {
    "     \ "fg"      : ["fg", "Normal"],
    "     \ "bg"      : ["bg", "Normal"],
    "     \ "hl"      : ["fg", "IncSearch"],
    "     \ "fg+"     : ["fg", "CursorLine", "CursorColumn", "Normal"],
    "     \ "bg+"     : ["bg", "CursorLine", "CursorColumn"],
    "     \ "hl+"     : ["fg", "IncSearch"],
    "     \ "info"    : ["fg", "IncSearch"],
    "     \ "border"  : ["fg", "Ignore"],
    "     \ "prompt"  : ["fg", "Comment"],
    "     \ "pointer" : ["fg", "IncSearch"],
    "     \ "marker"  : ["fg", "IncSearch"],
    "     \ "spinner" : ["fg", "IncSearch"],
    "     \ "header"  : ["fg", "WildMenu"]
    " \ }

    let g:rg_fuzzy_command_h = '
        \ rg --line-number --no-heading --ignore-case --no-ignore --hidden --follow --color "always"
        \ '

    let g:rg_fuzzy_command_t = '
        \ -g "!{.git,node_modules,vendor,Build}/*"
        \ '

    command! -nargs=1 XFN let g:rg_ext_fname = '-g "*.{' . '<args>' . '}"'

    let g:rg_ext_fname = '
        \ -g "*.{c,h,dec,dsc,fdf,vfr,hfv,sdl,sd,py,xml,asl,asli,tpl,bat,vim,mak,equ}"
        \ '

    command! -bang -nargs=* FRG
        \ call fzf#vim#grep(
        \   g:rg_fuzzy_command_h . g:rg_ext_fname . g:rg_fuzzy_command_t . shellescape(<q-args>), 1,
        \   <bang>0 ? fzf#vim#with_preview({'options': '--prompt="FRG$ " --header=""'}, 'up:50%:hidden')
        \           : fzf#vim#with_preview({'options': '--prompt="FRG$ " --header=""'}, 'right:50%:hidden', '?'),
        \   <bang>0
        \ )
"  }

