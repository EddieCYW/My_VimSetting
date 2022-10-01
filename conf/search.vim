
let g:Lf_CacheDirectory = 'd:\.cache\'

" set root folder
let g:Lf_RootMarkers = []
" let g:Lf_RootMarkers = ['.project', '.root', '.svn', '.git']
let g:Lf_WorkingDirectory = getcwd()

" fuzzy search ignore folder name and filename extension
let g:Lf_WildIgnore = {
    \ 'dir' : ['.repo', '.svn','.git','.hg'],
    \ 'file': ['*.sw?','~$*','*.bak','*.exe','*.o','*.so','*.py[co]','*.lib','*.dll','.git']
\ }

" mru ignore filename extension
let g:Lf_MruFileExclude = ['*.so', '*.exe', '*.py[co]', '*.sw?', '~$*', '*.bak', '*.tmp', '*.dll']

let g:Lf_StlColorscheme = 'powerline'
let g:Lf_StlSeparator = {'left':'', 'right':''}

let g:Lf_DefaultExternalTool = 'fd'
let g:Lf_ExternalCommand = 'fd --hidden --type file -E .repo -E .git -E "*.{dll,lib,Lib,pyd,pyo,so,o}" "%s"'
" let g:Lf_ExternalCommand = 'fd --hidden --type file -E .git "%s"'
" let g:Lf_DefaultExternalTool = 'rg'
" let g:Lf_ExternalCommand = 'rg --files -g !.git "%s"'

let g:Lf_RecurseSubmodules = 1
let g:Lf_ShowDevIcons      = 0
let g:Lf_HideHelp          = 1
let g:Lf_UseCache          = 0
let g:Lf_ShowRelativePath  = 1
let g:Lf_ReverseOrder      = 0

let g:Lf_WindowHeight      = 0.3
" The value can be 'fullScreen', 'top', 'bottom', 'left', 'right' and 'popup'.
let g:Lf_WindowPosition    = 'top'

let g:Lf_PopupHeight       = 0.3
let g:Lf_PopupWidth        = 0.999

if has('nvim')
    let g:Lf_PopupPosition     = [1, 1]
else
    let g:Lf_PopupPosition     = [2, 1]
endif
let g:Lf_PopupColorscheme  = 'default'

let g:Lf_PreviewInPopup    = 1

" The value can be one of the following:
"  'top': the preview window is on the top of the main LeaderF window.
"  'bottom': the preview window is at the bottom of the main LeaderF window.
"  'cursor': the preview window is at the cursor position in the main LeaderF window.
let g:Lf_PopupPreviewPosition = 'bottom'

" The value can be one of the following:
"  'left': the preview window is on the left side of the screen.
"  'center': the preview window is in the center of the screen.
"  'right': the preview window is on the right side of the screen.
"  'cursor': the preview window is at the cursor position.
let g:Lf_PreviewHorizontalPosition = 'center'

" If the value is 0, the width is half of the screen's width.
let g:Lf_PreviewPopupWidth = 90

let g:Lf_RgHighlightInPreview = 1

let g:Lf_PreviewResult = {
    \ 'File': 0,
    \ 'Buffer': 0,
    \ 'Mru': 0,
    \ 'Tag': 0,
    \ 'BufTag': 0,
    \ 'Function': 1,
    \ 'Line': 0,
    \ 'Colorscheme': 0,
    \ 'Rg': 0,
    \ 'Gtags': 1
    \ }

" default keymaps
map <c-f> :Leaderf file --fullPath --bottom <cr>
map <c-b> :Leaderf buffer<cr>

let g:Lf_RgConfig = [
    \ "--no-ignore",
    \ "--no-heading",
    \ "--hidden",
    \ "--ignore-case",
    \ "--glob=!git/*",
    \ "--glob=!.repo/*",
    \ "--glob=!Build/*"
    \ ]

let s:rg_file_extension = ''
let s:rg_no_file_extension = ''

func! g:Set_inc_ft(bang, types) abort
    if a:types == ''
        let s:rg_no_file_extension = ''
        let s:rg_file_extension = ''
        return
    endif
    if a:bang
        let s:rg_no_file_extension = a:types
    else
        let s:rg_file_extension = a:types
    endif
endf
command! -bang -nargs=? LFinc call g:Set_inc_ft(<bang>0, <q-args>)

func! g:Ggrep(bang, args) abort
    let inc_ft = ''
    let query = a:args
    if empty(query)
        let query = expand('<cword>')
    endif

    if s:rg_file_extension != ''
        let inc_ft = '-g "*.{' . s:rg_file_extension . '}" '
    endif

    if s:rg_no_file_extension != ''
        let inc_ft = inc_ft . ' -g "{' . s:rg_no_file_extension . '}" '
    endif

    if a:bang == 0
        exec 'Leaderf rg --smart-case -e '. query. ' --reverse --popup --match-path ' . inc_ft
    else
        exec 'Leaderf rg --smart-case -e '. query. ' -C5 --reverse --fullScreen --match-path ' .inc_ft
    endif
endfunc
command! -bang -nargs=* LFgrep call g:Ggrep(<bang>0, <q-args>)

" rippgerp keymaps
map <leader>fs :LFgrep 
map <leader>fg :LFinc
map <silent><leader>rt :Leaderf rg --recall --match-path<cr>
" map <leader>rg :Leaderf rg --smart-case -e <c-r>=expand("<cword>")<cr> --reverse --popup --match-path
" map <leader>ra :leaderf! rg -f --all-buffers -c3 --smart-case -e <c-r>=expand("<cword>")<cr> --fullscreen --match-path<cr>
" map <leader>rc :leaderf! rg -f --current-buffer -c3 --smart-case -e <c-r>=expand("<cword>")<cr> --fullscreen --match-path<cr>

" let g:Lf_GtagsfilesCmd = {
"     \ 'default': 'rg --no-messages --files --glob=!{
"                                                 \ D:\Project\new\AgS_2021\Build,
"                                                 \ }\*'
"     \ }

let g:Lf_GtagsAutoGenerate      = 0
let g:Lf_Gtagslabel             = "default"
let g:Lf_GtagsSource            = 0
let g:Lf_GtagsSkipSymlink       = "a"
" let g:Lf_Gtagsconf              = $VIM.'\3rd_tools\gtags\share\gtags\gtags.conf'
let g:Lf_GtagsStoreInProject    = 0
let g:Lf_GtagsStoreInRootMarker = 0

" let g:Lf_Ctags = "d:\vim\3rd_tools\universal_ctags"
" let g:Lf_CtagsFuncOpts = {
"     \ 'asl': '-R --sort=foldcase --exclude=Build,*.c,*.h',
"     \ 'dec': '-R --sort=foldcase --exclude=Build,*.c,*.h',
"     \ }

" gnu global keymaps
noremap <silent><leader>gc :<c-u><c-r>=printf("Leaderf gtags -r %s --match-path --popup", expand("<cword>"))<cr><cr>
noremap <silent><leader>gi :<c-u><c-r>=printf("Leaderf gtags -d %s --match-path --popup", expand("<cword>"))<cr><cr>
noremap <silent><leader>gv :<c-u><c-r>=printf("Leaderf gtags -s %s --match-path --popup", expand("<cword>"))<cr><cr>
noremap <silent><leader>gt :<c-u><c-r>=printf("Leaderf gtags --recall %s", "")<cr><cr>
