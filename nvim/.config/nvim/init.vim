" Dein Setup {{{

if &compatible
	set nocompatible
endif
set runtimepath+=~/.config/dein/repos/github.com/Shougo/dein.vim/

if dein#load_state("~/.config/dein/")
	call dein#begin("~/.config/dein/")

	call dein#add("~/.config/dein/repos/github.com/Shougo/dein.vim/")
	call dein#add('Shougo/deoplete.nvim')
	call dein#add('rstacruz/sparkup')

	call dein#end()
	call dein#save_state()
endif

" Required for dein
filetype plugin indent on
syntax enable
 " }}}

" Set autocomplete to be on by default
let g:deoplete#enable_at_startup = 1

" Colors {{{
"colorscheme molokai
"set background=dark

" set syntax highlighting for express templates to html
au BufNewFile,BufRead,BufReadPost *.ejs set syntax=html

" }}}
" Misc {{{

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

" how much vim shift text
set shiftwidth=2
" }}}
" UI Layout {{{

" show line numbers
set number

" show last command in the bottom bar
set showcmd
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
set foldlevelstart=6 " depth at which to start folding
set foldnestmax=10 " don't allow to many folds
set foldmethod=indent " vs marker, manual, expr, syntax, or diff
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

" leader is set to comma
let mapleader=","
let maplocalleader="\\"

" clear search highlighting
nnoremap <leader><space> :nohlsearch<CR>

" map and source vimrc
nnoremap <leader>ev :vsp ~/.config/nvim/init.vim<CR>
nnoremap <leader>sv :source ~/.config/nvim/init.vim<CR>

" escape to normal mode with just jk
inoremap jk <esc>

" save session
nnoremap <leader>s :mksession!<CR>

"toggle paste mode
set pastetoggle=<leader>p

"page up and down with shift
nnoremap J :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>

nnoremap K :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR>

"Move lines up and down with ctrl
nnoremap <c-j> ddp
nnoremap <c-k> ddkP

"Move up and down the location list
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprevious<CR>

" change double quotes to single quotes on given line
nnoremap <leader>' :s/['"]/\="'\""[submatch(0)!='"']/g<CR>

" indented enter (mostly for html editting)
inoremap <leader>l <CR><CR><esc>ki<Tab><Tab>

augroup filetypes
	autocmd!
	autocmd FileType python nnoremap <buffer><leader>c I#<esc>
	autocmd FileType python set expandtab softtabstop=4 shiftwidth=4 list

	autocmd FileType javascript nnoremap <buffer><leader>c I//<esc>
	autocmd FileType javascript :iabbrev <buffer> iff if()<left>
augroup END

" Tab autocomplete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ newcomplete#start_manual_complete()
function! s:check_back_space() "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}}


" }}}
" Backups {{{
set noswapfile
set nobackup
set nowritebackup
" }}}
autocmd VimEnter * echo ">^.^< LOL XD"
" vim:foldmethod=marker:foldlevel=0


