" --- vim plugins management {

call plug#begin('~/.vim/plugged')

  Plug 'Yggdroot/LeaderF'
  Plug 'bstaint/LeaderF-grep'

  Plug 'scrooloose/nerdtree'

  Plug 'liuchengxu/space-vim-dark'

  Plug 'ludovicchabant/vim-gutentags'

  Plug 'skywind3000/gutentags_plus'

  Plug 'skywind3000/asyncrun.vim'
  
  Plug 'skywind3000/vim-preview'
  
  " lean & mean status/tabline for vim that's light as air
  Plug 'vim-airline/vim-airline'
  
  Plug 'vim-airline/vim-airline-themes'
  
  Plug 'majutsushi/tagbar', { 'on': ['Tagbar', 'TagbarToggle'] }
  
  Plug 'dyng/ctrlsf.vim'
  
  Plug 'tittanlee/vim_for_UEFI'
  
  " A solid language pack for Vim.
  Plug 'sheerun/vim-polyglot'
    
  Plug 'octol/vim-cpp-enhanced-highlight', { 'for': ['c', 'cpp'] }

  "This is Vim syntax files with C++11 support
  Plug 'vim-jp/vim-cpp' , { 'for': ['c', 'cpp'] }
  
  Plug 'justinmk/vim-syntax-extra', { 'for': ['c', 'bison', 'flex', 'cpp'] }
  
  Plug 'wsdjeg/FlyGrep.vim'
  
  "High many words with different colors
  Plug 'lfv89/vim-interestingwords'

  Plug 't9md/vim-choosewin'
  
  Plug 'junegunn/fzf'
  Plug 'junegunn/fzf.vim'

call plug#end()

" }
