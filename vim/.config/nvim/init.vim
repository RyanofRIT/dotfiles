" Pathogen {{{
execute pathogen#infect()
set statusline+=%{fugitive#statusline()}
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_python_checkers = ['pylint']
let g:syntastic_mode="passive"

let g:sparkupExecuteMapping = 'kk'
au BufRead, BufNewFile *.ejs setfiletype html

" }}}
" Colors {{{

syntax enable
colorscheme desert
set background=dark

"set syntax highlighting for express templates to html
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

" don't redraw when not needed (during macros)
"set lazyredraw

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
nnoremap <leader>ev :vsp ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

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
	autocmd FileType javascript :iabbrev <buffer><leader>f function
	autocmd FileType javascript :iabbrev <buffer><leader>r return
	autocmd FileType javascript :iabbrev <buffer> iff if()<left>
	"autocmd FileType javascript :iabbrev <buffer> return NONONONO
	"autocmd FileType javascript :iabbrev <buffer> function NONONONO
	"autocmd FileType javascript :iabbrev <buffer> if( NONONONO
augroup END

" }}}
" Backups {{{
set noswapfile
set nobackup
set nowritebackup
set backupdir=~/.vim/backup//
set undodir=~/.vim/undo//
set directory=~/.vim/swap//
" }}}
" Functions {{{
" strips trailing whitespace on buffer write
function! <SID>StripTrailingWhitespaces()
	echom "whitespace"
	" save last search and cursor position
	let _s=@/
	let l = line(".")
	let c - col(".")
	%s/\s\+$//e
	let @/=_s
	call cursor(l,c)
endfunction

autocmd VimEnter * echo ">^.^< LOL XD"
" vim:foldmethod=marker:foldlevel=0
