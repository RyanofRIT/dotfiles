if &compatible
	set nocompatible
endif
set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim/

if dein#load_state("~/.config/dein/")
	call dein#begin("~/.config/dein/")

	call dein#add("~/.config/dein/repos/github.com/Shougo/dein.vim/")
	call dein#add('Shougo/deoplete.nvim')

	call dein#end()
	call dein#save_state()
endif

filetype plugin indent on
syntax enable

let g:deoplete#enable_at_startup = 1
