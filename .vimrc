" Colors {{{

syntax enable
"colorscheme

" }}}
" Misc {{{

set ttyfast											" faster redraw

" }}}
" Spaces and tabs {{{

set tabstop=2										" number of visual spaces per tab
set softtabstop=2								" number of spaces per tab when editing
set modelines=1									" vim comments affect current file

" }}}
" UI Layout {{{

set number											" show line numbers
set showcmd											" show last command in the bottom bar
" set cursorline									" highlight/underline current line
filetype indent on							" load filetype specific indent as ~/.vim/indent/file.vim
filetype plugin on
set wildmenu										" visual autocomplete for commands
set lazyredraw									" don't redraw when not needed (during macros)
set showmatch										" highlight matching [{()}]

" }}}
" Searching {{{

set incsearch										" search as chars are entered
set hlsearch										" highlight matches

"map clearing the search to ,<space>
nnoremap <leader><space> :nohlsearch<CR>

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

let mapleader=","								" leader is set to comma

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
