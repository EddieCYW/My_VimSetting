" 定义一个命令用来加载文件
python << END
import xml.etree.ElementTree as xml
import os

source = ''
error_value = 0
try:
    tree = xml.parse('.repo\manifest.xml')
except:
    error_value = 1
if error_value != 1:
    root = tree.getroot()
    for descript in root.iter('include'):
        break
    tree = xml.parse('.repo\manifests\\' + descript.get('name'))
    root = tree.getroot()
    for repo in root.iter('project'):
        source = repo.get('path')+'/.git'
	if os.path.exists(source):
            os.remove(source)    
END
command! -nargs=1 LoadScript exec 'so '.g:Eddie_vim_root.'/'.'<args>'

" --- configure encoding and default language {

  set encoding=utf-8

  " set the default encoding of file
  set fileencoding=utf-8
  set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1
  "set fileencodings=ucs-bom,utf-8,gbk,gb18030,big5,euc-jp,latin1,utf-16le,cp1252,iso-8859-15

  if has('gui_running')
     " set default lang
     let $LANG    = "en_us.utf-8"   "// "en_us.utf-8" | "zh_tw.utf-8"
     set langmenu =en_us.utf-8      "// en_us.utf-8   | zh_tw.utf-8
     language message en_us.utf-8
  endif

  " vim need to reload menu with utf-8
  source $VIMRUNTIME/delmenu.vim
  source $VIMRUNTIME/menu.vim
  
" }        

" --- configure <leader> key {

    "   let g:vim_leader='\'
    if !exists('g:vim_leader')
        let mapleader = ','
    else
        let mapleader=g:vim_leader
    endif

    if !exists('g:vim_localleader')
        let maplocalleader = '_'
    else
        let maplocalleader=g:vim_localleader
    endif

" }
    
" --- global variables {
    " get the absolute path of t_vim_root
    let g:Eddie_vim_root = fnamemodify(resolve(expand('<sfile>:p')), ':h')
    let g:lib  = printf('%s/lib', g:Eddie_vim_root)
    let g:conf = printf('%s/conf', g:Eddie_vim_root)
    
    if !exists('g:bundle_group')
        let g:bundle_group =  {
            \ 'search'         : 1,
            \ 'program'        : 1,
            \ 'ui'             : 1,
	    \ 'YouCompleteMe'  : 1,
        \ }
    endif
" }
    
" --- vim environment {

    " add vim env root to runtime path
    exec 'set rtp+='.g:Eddie_vim_root
    " add vim root to runtimepath
    set rtp+=~/.vim
    
    " loading common lib script
    let common_lib = printf('%s/common.vim', g:lib)
    exec 'source' common_lib

    " loading lib script (private plugins)
    let lib_list = common#get_script_list(g:lib, ':h')
    for lib_script in lib_list
        call common#load_script(lib_script)
    endfor
    
    " 插件加载
    LoadScript init/init-plugins.vim

    " 加载基础配置
    LoadScript init/init-basic.vim

    " 個人界面样式
    LoadScript init/init-style.vim

    " 個人Hotkey
    LoadScript init/init-keymaps.vim    

    " loading vim bundle_group configuration script
    for [group_config, group_enabled] in items(g:bundle_group)
        if group_enabled
            let config_script = printf('%s/%s.vim', g:conf, group_config)
            call common#load_script(config_script)
        endif
    endfor    

"}

