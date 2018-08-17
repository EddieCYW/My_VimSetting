# This file is NOT licensed under the GPLv3, which is the license for the rest
# of Samba.
#
# Here's the license text for this file:
#
# This is free and unencumbered software released into the public domain.
#
# Anyone is free to copy, modify, publish, use, compile, sell, or
# distribute this software, either in source code form or as a compiled
# binary, for any purpose, commercial or non-commercial, and by any
# means.
#
# In jurisdictions that recognize copyright laws, the author or authors
# of this software dedicate any and all copyright interest in the
# software to the public domain. We make this dedication for the benefit
# of the public at large and to the detriment of our heirs and
# successors. We intend this dedication to be an overt act of
# relinquishment in perpetuity of all present and future rights to this
# software under copyright law.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
# EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
# MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
# IN NO EVENT SHALL THE AUTHORS BE LIABLE FOR ANY CLAIM, DAMAGES OR
# OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE,
# ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
# OTHER DEALINGS IN THE SOFTWARE.
#
# For more information, please refer to <http://unlicense.org/>

import ConfigParser
import codecs
from io import StringIO

import fnmatch
import os
import ycm_core

flags = [
    '-Wall',
    '-Werror',
    # This is a C project
    '-x', 'c',
    '-I.',
]


# Set this to the absolute path to the folder (NOT the file!) containing the
# compile_commands.json file to use that instead of 'flags'. See here for
# more details: http://clang.llvm.org/docs/JSONCompilationDatabase.html
#
# You can get CMake to generate this file for you by adding:
#   set( CMAKE_EXPORT_COMPILE_COMMANDS 1 )
# to your CMakeLists.txt file.
#
# Most projects will NOT need to set this to anything; you can just change the
# 'flags' list of compilation flags. Notice that YCM itself uses that approach.
compilation_database_folder = ''

if os.path.exists( compilation_database_folder ):
  database = ycm_core.CompilationDatabase( compilation_database_folder )
else:
  database = None

SOURCE_EXTENSIONS = [ '.C', '.cpp', '.cxx', '.cc', '.c', '.m', '.mm' ]

def DirectoryOfThisScript():
  return os.path.dirname( os.path.abspath( __file__ ) )

def IsHeaderFile( filename ):
  extension = os.path.splitext( filename )[ 1 ]
  return extension in [ '.H', '.h', '.hxx', '.hpp', '.hh' ]

def MakeRelativePathsInFlagsAbsolute( flags, working_directory ):
    if not working_directory:
        return list( flags )
    new_flags = []
    new_flags += flags


    #
    # walk the root to collect all package dec file into list.
    #
    PkgDecFileList = []
    UefiPkgDirList = [PkgDir for PkgDir in os.listdir(working_directory) if os.path.isdir(PkgDir)]
    for UefiPkgName in UefiPkgDirList:
        PkgDecFile = os.path.join(working_directory, UefiPkgName, UefiPkgName + '.dec')
        if os.path.isfile(PkgDecFile):
            PkgDecFileList.append (PkgDecFile)

    #
    # Parser the include section for each dec files.
    #
    for DecFile in PkgDecFileList:
        Collection = False;
        fp = codecs.open(DecFile, 'r', 'utf-8')
        for line in fp.readlines():
            line = line.strip()
            line = line.replace('\r\n', '\n')
            if line.startswith('#') or line.startswith('$') or len(line) == 0:
                continue

            if line.startswith('[Includes'):
                Collection = True
                continue

            if Collection:
                if line.startswith('['):
                    Collection = False
                    break
                DecDirpath = os.path.dirname(DecFile)
                line = line.split()[0]
                new_flags.append('-I')
                new_flags.append(os.path.join(DecDirpath, line))

    return new_flags

def FlagsForFile( filename, **kwargs ):
    relative_to = DirectoryOfThisScript()
    final_flags = MakeRelativePathsInFlagsAbsolute( flags, relative_to )

    return {
        'flags': final_flags,
        'do_cache': True
    }


#  ProjectRoot = os.getcwd()
#  ycm_dict = FlagsForFile(ProjectRoot)
#
#  print '\n============================\n'
#  for flag in ycm_dict['flags']:
#      print flag


