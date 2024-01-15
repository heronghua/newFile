if exists("g:loaded_newFile") || &cp || v:version < 700
  finish
endif
let g:loaded_newFile = 1

" add head of a file {{{
autocmd BufNewFile *.[ch],*.py,*.hpp,*.cpp,Makefile,*.mk,*.sh,*.bat,*.java exec ":call SetTitle()"
func! SetTitle() 
	"如果文件类型为.sh文件 
	if &filetype == 'sh' || &filetype == 'make' || &filetype == 'python' || &filetype == 'dosbatch'
        let l:commentMark="#"
        if &filetype == 'dosbatch'
           let l:commentMark = "::"
        endif
		call setline(1, l:commentMark . "================================================================") 
		call append(line("."), l:commentMark . " File Name: ".expand("%")) 
		call append(line(".")+1, l:commentMark . " Author: He Ronghua") 
		call append(line(".")+2, l:commentMark . " mail: heronghua1989@126.com") 
		call append(line(".")+3, l:commentMark . " Created Time: ".strftime("%c")) 
		call append(line(".")+4, l:commentMark . "================================================================") 
	else 
		call setline(1, "/*************************************************************************") 
		call append(line("."), "	 File Name: ".expand("%")) 
		call append(line(".")+1, "	 Author: He Ronghua") 
		call append(line(".")+2, "	 Mail: heronghua1989@126.com") 
		call append(line(".")+3, "	 Created Time: ".strftime("%c")) 
		call append(line(".")+4, " ************************************************************************/") 
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")
    	call append(line(".")+7, "using namespace std;")
		call append(line(".")+8, "")
	    normal! G
	endif
	if &filetype == 'python'
		call append(line(".")+5, "#!/usr/bin/env python")
		call append(line(".")+6, "")
	    normal! G
	endif

	if &filetype == 'c'
		call append(line(".")+6, "#include<stdio.h>")
		call append(line(".")+7, "")
	    normal! G
	endif
	if &filetype == 'java'
		call append(line(".")+6,"public class ".expand("%:r")." {")
		call append(line(".")+7,"")
		call append(line(".")+8,"    public static void main(String[] args){")
		call append(line(".")+9,"")
		call append(line(".")+10,"    }")
		call append(line(".")+11,"")
		call append(line(".")+12,"}")
	    normal! G
	endif
    if &filetype == 'sh'
		call append(line(".")+5, "#!/bin/bash")
		call append(line(".")+6, "")
	    normal! G
    endif
    if &filetype == 'dosbatch'
        call append(line(".")+5,"@if \"%DEBUG%\"==\"\" @echo off")
        call append(line(".")+6,"if \"%OS%\" == \"Windows NT\" setlocal")
        call append(line(".")+7,"    ")
        call append(line(".")+8,"if \"%OS%\" == \"Windows NT\" endlocal")
        normal! 9gg
    endif
	if  &filetype == 'make' 
		call append(line(".")+5, "LOCAL_PATH:= $(call my-dir)")
		call append(line(".")+6, "")
		call append(line(".")+7, "include $(CLEAR_VARS)")
		call append(line(".")+8, "")
		call append(line(".")+9, "LOCAL_MODULE_TAGS := optional")
		call append(line(".")+10, "")
		call append(line(".")+11, "# LOCAL_STATIC_JAVA_LIBRARIES :=")
		call append(line(".")+12, "")
		call append(line(".")+13, "LOCAL_SRC_FILES := $(call all-java-files-under, src)")
		call append(line(".")+14, "")
		call append(line(".")+15, "LOCAL_RESOURCE_DIR += $(LOCAL_PATH)/res")
		call append(line(".")+16, "")
		call append(line(".")+17, "LOCAL_PACKAGE_NAME := ")
		call append(line(".")+18, "")
        call append(line(".")+19, "LOCAL_AAPT_FLAGS := --auto-add-overlay")
		call append(line(".")+20, "")
		call append(line(".")+21, "LOCAL_DEX_PREOPT := false")
		call append(line(".")+22, "")
		call append(line(".")+23, "LOCAL_CERTIFICATE := platform")
		call append(line(".")+24, "")
		call append(line(".")+25, "LOCAL_SDK_VERSION := current ")
		call append(line(".")+26, "")
		call append(line(".")+27, "LOCAL_PROGUARD_FLAG_FILES := proguard.flags")
		call append(line(".")+28, "")
		call append(line(".")+29, "include $(BUILD_PACKAGE)")
	    normal! G

    endif
endfunc
" }}}
