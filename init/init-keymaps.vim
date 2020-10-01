"======================================================================
"
" init-keymaps.vim - Eddie's key maps setting
"
" Created by EddieChen on 2018/07/30
"
"======================================================================

" LeaderF{

    map <c-f> :Leaderf file --fullPath --bottom<cr>
    map <c-b> :Leaderf buffer --bottom<cr>
    map <c-s> :Leaderf tag --bottom<cr>
    "map <leader>f :Leaderf function --right<cr>
    "map <leader>fe :Leaderf function --right --stayOpen<cr>
    " function list
    map <F8> :Leaderf function --right<cr>
    map <leader>sh :Leaderf searchHistory --bottom<cr>
    map <leader>ls :Leaderf self --bottom --stayOpen<cr>
    nmap <leader>sf :CtrlSF 
    nmap <leader>st :CtrlSFToggle<cr>
    nmap <leader>sd :CtrlSFStop<cr>
    map <leader>ll :LeaderfLine <cr>   
    " toggle relative line number
    noremap <silent><leader>rl :call g:Relative_number_toggle()<cr>        
    
"}
"
" LeaderF-grep {

    noremap <leader>lg :LeaderfGrepCword<cr>

" }
"
"AsyncRun{

    "rg hotkey"
    nmap <F11> :AsyncRun rg --vimgrep -i -g 
    
    "Call Project_build.bat to build project 
    map <F9> :AsyncRun Project_Build.bat 
     
"}

"ChooseWin{
    nmap  -  <Plug>(choosewin)
"}

"Others{
    " open folder of currently edit file
    map <C-e> :!start explorer %:p:h:gs?\/?\\\\\\?<CR>

    nmap <F10> :CtrlSFOptions 
    
    " copy current file path to system pasteboard, m-c is Alt+c
    map <silent><m-c> :let @* = expand("%")<cr>:echo "Copied: ".expand("%")<cr>
    
    map <f2> :noh<cr>    
    
    " move to next buffer
    map <silent><C-s> :bn<cr>
    
    " move to previou buffer
    map <silent><C-Tab> :bp<cr>    
    
    "close current window
    map <F4> :bd<cr>
    
    map <C-Up> :ts  <c-r><c-w><cr>
    map <m-Left> :1po<cr>
    
    "show function list by pressing F8
    "map <F8> :TagbarToggle<CR>   
    map <F5> :NERDTreeToggle<CR> 
    
    noremap <silent><Space>gs :GscopeFind s <c-r><c-w><cr>
    noremap <silent><Space>gg :GscopeFind g <c-r><c-w><cr>
    noremap <silent><Space>gc :GscopeFind c <c-r><c-w><cr>
    noremap <silent><Space>gt :GscopeFind t <c-r><c-w><cr>  
    
    "remap select all to Ctrl+a
    map <C-a> <esc>ggVG<CR>    
    
    "hex mode view binary file
    nnoremap <Space>he :%!xxd<cr>
    
    "hex mode edit binary file, make sure :w after did that to save it 
    nnoremap <Space>hs :%!xxd -r<cr>    
    
    "add hotkey 'ctrl+r shift+' to represent insert key"
    cmap <s-insert> <c-r>+
"}     

"FlyGrep{

    "FlyGrep hotkey definition
    nnoremap <Space>fg :FlyGrep<cr>
    
"}

"jump windows cmd (Eddie define ){

    " move to and maximize the below split
    "map <C-J> <C-W>j<C-W>_
    map <c-j> <c-w>j

    " move to and maximize the ablove split
    "map <C-K> <C-W>k<C-W>_
    map <c-k> <c-w>k

    " move to and maximize the left split
    "nmap <c-h> <c-w>h<c-w><bar>
     nmap <c-h> <c-w>h

    " move to and maximize the rgiht split
    "nmap <c-l> <c-w>l<c-w><bar>
    nmap <c-l> <c-w>l    
    
"}

"Preview{

    autocmd FileType qf nnoremap <silent><buffer>j <down>:PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer>k <up>:PreviewQuickfix<cr>
    autocmd FileType qf nnoremap <silent><buffer><cr> :pclose <cr> \| <cr>
    " 0 - (h - top)
    " 1 - (h - bottom)
    " 2 - (v - left)
    " 3 - (v - right)
    let greview#preview_position = '3'

"}

"---fzf {

            " fzf mappings
            nnoremap <leader>.f  :Files<cr>
            nnoremap <leader>.l  :Lines<cr>
            nnoremap <leader>.t  :Tags<cr>
            nnoremap <leader>.b  :Buffers<cr>
            nnoremap <leader>.c  :Commands<cr>
            nnoremap <leader>.w  :Windows<cr>
            nnoremap <leader>.a  :Ag<cr>
            nnoremap <leader>.g  :GitFiles<cr>
            nnoremap <leader>.o  :Locate<Space>
            nnoremap <leader>.m  :Maps<cr>
            nnoremap <leader>.h  :History<cr>
            nnoremap <leader>.s  :Snippets<cr>
            nnoremap <leader>.i  :Commits<cr>
            nnoremap <leader>.r  :Colors<cr>
            nnoremap <leader>.e  :Helptags<cr>
            nnoremap <leader>..c :BCommits<cr>
            nnoremap <leader>..t :BTags<cr>
            nnoremap <leader>..l :BLines<cr>
            "nnoremap <silent> <leader>ag :call fzf#vim#ag(expand('<cword>'))<cr>
            "nnoremap <leader>j :call fzf#vim#tags(expand('<cword>'), {'options': '--exact --select-1 --exit-0'})<cr>

            imap <c-x><c-k> <plug>(fzf-complete-word)
            imap <c-x><c-f> <plug>(fzf-complete-path)
            imap <c-x><c-j> <plug>(fzf-complete-file-ag)
            imap <c-x><c-l> <plug>(fzf-complete-line)

            " Advanced customization using autoload functions
            "inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'left': '15%'})

" }

"
"
"---dirvish {
"Opens the [count]th parent directory.
nmap bd <Plug>(dirvish_up)
"Quits and returns to the original file.
nmap bq <Plug>(dirvish_quit)
"
"
"}

