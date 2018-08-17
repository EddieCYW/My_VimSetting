1. Install MSVC 14 (Microsoft Vitual Studio 2105)

2. Check your python ARCH which is 32-bit or 64-bit
  (command prompt: python)

3. Download the the latest and appreciate ARCH of cmake.exe from website.
   Put it in the shortest path of folder. e.g. D:\D:\cmake-3.12.1-win64-x64

4. a. Plug 'Valloric/YouCompleteMe' in your vim file.
   b. [option] PlugInstall to download and install YouCompleteMe folder
   or
   b. download YouCompleteMe folder from github (it's the fatest way. no waste much time.)
      then put it into your plugged or bundle folder.
      if did that, once PlugInstall you will update your YouCompleteMe folder, it's ok.

5. Open command prompt and type below command to compile your C/C++ or all sciptrs setting(depend on python 32-bit or 64-bit)
   cmdline: cd .vim
            cd plugged
            cd YouCompleteMe 
            set path=D:\cmake-3.12.1-win64-x64\bin;%path%
            python install.py --msvc 14 =======> if you install Microsoft Vitual Studio 2105, otherwise, type python install.py --msvc 15 for 2017
            ######if no error occurred, then do below cmd
            python install.py --clang-completer =======> to compile C/C++
            #####If you would like to compile all scripts, you could use : python install.py --all
            #####if you fail to compile when show not find any Microsoft visual studio version. you could try below command
            python install.py --msvc 14 --clang-completer
            ##### for all command usage, you could type: python install.py --help or refer to the release note from the github.

6. Put .ycm_extra_conf.py in which project code you would like to use YCM.

7. Make sure you have apply YouCompleteMe.vim in your vim setting. 
   
            

