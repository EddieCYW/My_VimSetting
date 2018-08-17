
" YCM debug log level set
let g:ycm_server_log_level = 'info'

let g:ycm_auto_trigger = 1

" load ycm global config
"let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

" 允许 vim 加载 .ycm_extra_conf.py 文件，不再提示
let g:ycm_confirm_extra_conf = 0

" enable completion from tags
let g:ycm_collect_identifiers_from_tags_files = 1

" Do not use YouCompleteMe to check C, C++ and Objective-C, do it by ale
let g:ycm_show_diagnostics_ui = 0

"注解與字符串中的內容也用於補全
let g:ycm_collect_identifiers_from_comments_and_strings = 0

"在注釋中也能補全
let g:ycm_complete_in_comments = 1

"在字串符中也能補全
let g:ycm_complete_in_strings = 1

" 語法關鍵字補全
let g:ycm_seed_identifiers_with_syntax = 1

" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_cache_omnifunc = 0

"ycm首先通过ultisnips进行代码块补全
let g:ycm_use_ultisnips_completer = 0

" Auto popup the complete in preview
let g:ycm_add_preview_to_completeopt = 1
set completeopt=longest,menu

"离开插入模式后自动关闭预览窗口
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

"Enter選中當前選項
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"

let g:ycm_max_num_candidate = 15

let g:ycm_autoclose_preview_window_after_completion = 1
let g:ycm_autoclose_preview_window_after_insertion  = 1
let g:ycm_filepath_completion_use_working_dir       = 1

" 直接触发自动补全
let g:ycm_min_num_of_chars_for_completion = 2
let g:ycm_min_num_identifier_candidate_chars = 2
let g:ycm_key_invoke_completion = '<C-;>'

inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"

" YcmCompleter GoTo keymap
nnoremap <leader>ygd :YcmCompleter GoToDefinition<CR>
nnoremap <leader>ydc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>ygt :YcmCompleter GoTo<CR>

" Vim 自動補全的彈出窗口配色
highlight PMenu     ctermfg = 0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel  ctermfg = 242 ctermbg=8 guifg=darkgrey guibg=DarkYellow

let g:ycm_semantic_triggers =  {
            \   'c' : ['->', '.'],
            \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
            \             're!\[.*\]\s'],
            \   'ocaml' : ['.', '#'],
            \   'cpp,cuda,objcpp' : ['->', '.', '::'],
            \   'perl' : ['->'],
            \   'php' : ['->', '::'],
            \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
            \   'ruby' : ['.', '::'],
            \   'lua' : ['.', ':'],
            \   'erlang' : [':'],
            \ }

" 两个字符自动触发语义补全
let g:ycm_semantic_triggers =  {
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \ }


" Enable markdown autocomplete and snippet
" by removing it from default blacklist
let g:ycm_filetype_blacklist = {
            \ 'tagbar'   : 1,
            \ 'nerdtree' : 1,
            \ 'qf'       : 1,
            \ 'notes'    : 1,
            \ 'unite'    : 1,
            \ 'text'     : 1,
            \ 'vimwiki'  : 1,
            \ 'pandoc'   : 1,
            \ 'infolog'  : 1,
            \ 'mail'     : 1
            \}

"----------------------------------------------------------------------
" Ycm 白名单（非名单内文件不启用 YCM），避免打开个 1MB 的 txt 分析半天
"----------------------------------------------------------------------
let g:ycm_filetype_whitelist = { 
            \ "c":1,
            \ "cpp":1, 
            \ "objc":1,
            \ "objcpp":1,
            \ "python":1,
            \ "java":1,
            \ "javascript":1,
            \ "coffee":1,
            \ "vim":1, 
            \ "go":1,
            \ "cs":1,
            \ "lua":1,
            \ "perl":1,
            \ "perl6":1,
            \ "php":1,
            \ "ruby":1,
            \ "rust":1,
            \ "erlang":1,
            \ "asm":1,
            \ "nasm":1,
            \ "masm":1,
            \ "tasm":1,
            \ "asm68k":1,
            \ "asmh8300":1,
            \ "asciidoc":1,
            \ "basic":1,
            \ "vb":1,
            \ "make":1,
            \ "cmake":1,
            \ "html":1,
            \ "css":1,
            \ "less":1,
            \ "json":1,
            \ "cson":1,
            \ "typedscript":1,
            \ "haskell":1,
            \ "lhaskell":1,
            \ "lisp":1,
            \ "scheme":1,
            \ "sdl":1,
            \ "sh":1,
            \ "zsh":1,
            \ "bash":1,
            \ "man":1,
            \ "markdown":1,
            \ "matlab":1,
            \ "maxima":1,
            \ "dosini":1,
            \ "conf":1,
            \ "config":1,
            \ "zimbu":1,
            \ "ps1":1,
            \ }


