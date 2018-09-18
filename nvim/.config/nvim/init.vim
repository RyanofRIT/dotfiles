" Dein Setup {{{

if &compatible
	set nocompatible
endif
set runtimepath+=~/.config/nvim/dein/repos/github.com/Shougo/dein.vim/

if dein#load_state("~/.config/nvim/dein/")
	call dein#begin("~/.config/nvim/dein/")

	call dein#add("~/.config/nvim/dein/repos/github.com/Shougo/dein.vim/")

	" Autocompletion
	call dein#add('Shougo/deoplete.nvim')

	" Typescript syntax
	call dein#add('HerringtonDarkholme/yats.vim')
	" Typescript specific autocompletion on top of deoplete 
	" (after npm install neovim/typescript)
	call dein#add('mhartington/nvim-typescript', {'build':'./install.sh'})

	" Surrounding commands
	" cs12 - change surr 
	" cst2 - change surr to 
	" ysiw1 -you surr inner word
	" ds1  - delete surr
	call dein#add('tpope/vim-surround.git')

	" Commenting with <leader>
	" cc, cn (nesting), c<space> (toggle), cy (cc but yank), c$, cu (uncomments)
	call dein#add('scrooloose/nerdcommenter')
	call dein#add('airblade/vim-gitgutter')
	call dein#add('vim-airline/vim-airline')
	call dein#add('rstacruz/sparkup.git')

	" Supposedly matches if with endif etc based on language
	call dein#add('tpope/vim-endwise')

	" <C-A> and <C-X> work on dates
	call dein#add('tpope/vim-speeddating')

	" abbr gen "Abolish {despa,sepe}rat{e,es,ed,ing,ely,ion,ions,or} {despe,sepa}rat{}
	" :Subvert/facilit{y,ies}/building{,s}/g
	" crs (coerce to snake_case). MixedCase (crm), camelCase (crc), snake_case
	" (crs), UPPER_CASE (cru), dash-case (cr-), dot.case (cr.), space case
	" (cr<space>), and Title Case (crt)
	call dein#add('tpope/tpope-vim-abolish')

	" . now repeats plugin mappings (may need to explicitly add support)
	call dein#add('tpope/vim-repeat')

	" :Tab /: to line things up on :
	call dein#add('godlygeek/tabular')

	call dein#add('junegunn/limelight.vim')
	call dein#add('junegunn/goyo.vim')

	"call dein#add('AndrewRadev/splitjoin.vim')
	"call dein#add('raimondi/delimitmate')
	"call dein#add('vim-syntastic/syntastic')
  "tpope/vim-eunuch

	call dein#end()
	call dein#save_state()
endif


" gitgutter config
let g:gitgutter_realtime = 1 "update when done typing
set updatetime=250 "instead of 4 second default

" vim-airline config
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts = 1
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

let g:sparkupExecuteMapping = 'kk'


" Required for dein
filetype plugin indent on
syntax enable

" Set autocomplete to be on by default
let g:deoplete#enable_at_startup = 1

 " }}}
" Colors {{{
colorscheme molokai
set background=dark

" set syntax highlighting for express templates to html
au BufNewFile,BufRead,BufReadPost *.ejs set syntax=html

" }}}
" Misc {{{

" vim comments affect current file
set modelines=1

" ignore compiled files
set wildignore=*.o,*~,*.pyc

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
"set number

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
set foldlevelstart=60 " depth at which to start folding
set foldnestmax=10 " don't allow to0 many folds
set foldmethod=syntax " vs marker, manual, expr, syntax, or diff
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

" Toggle paste mode
set pastetoggle=<leader>p

" Page up and down with shift
nnoremap J :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-D>:set scroll=0<CR>

nnoremap K :set scroll=0<CR>:set scroll^=2<CR>:set scroll-=1<CR><C-U>:set scroll=0<CR>

" Move lines up and down with ctrl
nnoremap <c-j> ddp
nnoremap <c-k> ddkP

" Move up and down the location list
nnoremap <leader>j :lnext<CR>
nnoremap <leader>k :lprevious<CR>

" Indented enter (mostly for html editting)
inoremap <leader>l <CR><CR><esc>ki<Tab><Tab>

augroup filetypes
	autocmd!
	autocmd FileType python set expandtab softtabstop=4 shiftwidth=4 list
  autocmd FileType markdown inoremap <buffer> <CR> <SPACE><SPACE><CR>
	autocmd FileType markdown set expandtab softtabstop=2 shiftwidth=2 list
	autocmd FileType text set textwidth=80
	autocmd FileType text colorscheme molokai
	autocmd FileType text Limelight
augroup END


function! s:auto_goyo()
  if &ft == 'text'
    Goyo 80
  elseif exists('#goyo')
    let bufnr = bufnr('%')
    Goyo!
    execute 'b '.bufnr
  endif
endfunction

augroup goyo_markdown
  autocmd!
  autocmd BufNewFile,BufRead * call s:auto_goyo()
augroup END

" Tab autocomplete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ newcomplete#start_manual_complete()
function! s:check_back_space() "{{{
	let col = col('.') - 1
	return !col || getline('.')[col - 1] =~ '\s'
endfunction"}}}

" Trim whitespace
fun! TrimWhiteSpace()
	let l:save = winsaveview()
	%s/\s\+$//e
	call winrestview(l:save)
endfun

fun! Require(module)
	return "const ".a:module." = require('".a:module."');"
endfun

" }}}
" Backups {{{
set noswapfile
set nobackup
set nowritebackup
" }}}
autocmd VimEnter * echo ">^.^< LOL XD"
" vim:foldmethod=marker:foldlevel=0
