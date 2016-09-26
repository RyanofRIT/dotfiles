" Colors {{{

syntax enable
colorscheme desert
set background=dark

" }}}
" Misc {{{

" faster redraw
set ttyfast

set history=500

" Makes pasting into vim easier from outside apps
set paste

" vim comments affect current file
set modelines=1

" ignore compiled files
set wildignore=*.o,*~,*.pyc

" always show current position
set ruler

" A buffer becomes hidden when it is abandoned
set hid

" Set Window split options
set splitbelow
set splitright

" }}}
" Spaces and tabs {{{

" number of visual spaces per tab
set tabstop=2

" number of spaces per tab when editing
set softtabstop=2
" }}}
" UI Layout {{{

" show line numbers
set number

" show last command in the bottom bar
set showcmd

" load filetype specific indent as ~/.vim indent file.vim
filetype indent on
filetype plugin on

" visual autocomplete for commands
set wildmenu

" don't redraw when not needed (during macros)
set lazyredraw

" highlight matching {[()]}
set showmatch

" }}}
" Searching {{{

" search as chars are entered
set incsearch

" highlight matches
set hlsearch

"map clearing the search to ,<space>
nnoremap <leader><space> :nohlsearch<CR>

" Try to be smart about the case when searching
set ignorecase
set smartcase

" turn regular expressions on
set magic

" How many tenths of a second to blink when matching braces
set mat=2

" }}}
" Folding {{{

set foldenable
set foldlevelstart=6						" depth at which to start folding
set foldnestmax=10							" don't allow to many folds
set foldmethod=indent						" vs marker, manual, expr, syntax, or diff
nnoremap <space> za

" }}}
" Line shortcuts {{{

" move over wrapped lines as if they were separate
nnoremap j gj
nnoremap k gk

" move to the beginning/end of the line
nnoremap B ^
nnoremap E $
nnoremap ^ <nop>
nnoremap $ <nop>

" highlight last inserted text
nnoremap gV `[v`]

" leader is set to comma
let mapleader=","

" map and source vimrc
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" escape to normal mode with just jk
inoremap jk <esc>

" save session
nnoremap <leader>s :mksession!<CR>

" }}}
" Functions {{{
" strips trailing whitespace on buffer write
function! <SID>StripTrailingWhitespaces()
				" save last search and cursor position
				let _s=@/
				let l = line(".")
				let c - col(".")
				%s/\s\+$//e
				let @/=_s
				call cursor(l,c)
endfunction
" vim:foldmethod=marker:foldlevel=0
