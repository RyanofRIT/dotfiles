" Dein Setup {{{

" Disable compatibility for dein
if &compatible
  set nocompatible
endif

set runtimepath+=~/.local/share/dein/repos/github.com/Shougo/dein.vim

if dein#load_state("~/.local/share/dein")
  call dein#begin("~/.local/share/dein")

  call dein#add("~/.local/share/dein/repos/github.com/Shougo/dein.vim")

  " Autocompletion
  call dein#add('Shougo/deoplete.nvim')
  call dein#add('itchyny/lightline.vim')
  call dein#add('taohexxx/lightline-buffer')
  call dein#add('patstockwell/vim-monokai-tasty')

  " Surrounding commands
  " cs12  - change surr
  " cst2  - change surr to
  " ysiw1 - you surr inner word
  " ds1    - delete surr
  call dein#add('tpope/vim-surround.git')

  " Commenting with <leader>
  " cc, cn (nesting), c<space> (toggle), cy (cc but yank), c$, cu (uncomments)
  call dein#add('scrooloose/nerdcommenter')

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

  call dein#add('fatih/vim-go')

  call dein#add('Shougo/neosnippet.vim')
  call dein#add('Shougo/neosnippet-snippets')

  "call dein#add('AndrewRadev/splitjoin.vim')
  "call dein#add('tpope/vim-fugitive')
  "call dein#add('ctrlpvim/ctrlp.vim')
  "call dein#add('vim-airline/vim-airline')
  "call dein#add('airblade/vim-gitgutter')
  "call dein#add('vim-airline/vim-airline-themes')
  " :Tab /: to line things up on :
  "call dein#add('godlygeek/tabular')
  "call dein#add('raimondi/delimitmate')
  "call dein#add('tpope/vim-eunuch')
  "call dein#add('majutsushi/tagbar')
  "call dein#add('mustache/vim-mustache-handlebars')
  call dein#end()
  call dein#save_state()
endif

let g:deoplete#enable_at_startup = 1

" Required for dein
filetype plugin indent on
syntax enable

" Move through autocomplete with tab
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
      \ "\<Plug>(neosnippet_expand_or_jump)" : "\<TAB>"

" expand and jump through completion template
imap <CR> <Plug>(neosnippet_expand_or_jump)
smap <CR> <Plug>(neosnippet_expand_or_jump)
xmap <CR> <Plug>(neosnippet_expand_target)

" }}}
" Colors {{{
let g:vim_monokai_tasty_italic =1
colorscheme vim-monokai-tasty
let g:lightline = {
  \ 'colorscheme': 'monokai_tasty',
  \ 'active': {
  \    'right': [[ 'lineinfo' ], [ 'percent' ], [ 'filetype' ]]
  \  },
  \ 'tabline' : { 
  \   'left': [[ 'bufferbefore', 'buffercurrent', 'bufferafter' ]],
  \ },
  \ 'component_expand': {
  \   'buffercurrent': 'lightline#buffer#buffercurrent',
  \   'bufferbefore': 'lightline#buffer#bufferbefore',
  \   'bufferafter': 'lightline#buffer#bufferafter',
  \ },
  \ 'component_type': {
  \   'buffercurrent': 'tabsel',
  \   'bufferbefore': 'raw',
  \   'bufferafter': 'raw',
  \ },
  \ 'component_function': {
  \   'bufferinfo': 'lightline#buffer#bufferinfo',
  \    'readonly' : 'LightlineReadonly',
  \ },
  \ 'component': {
  \   'separator': '',
  \ },
  \ }

function! LightlineReadonly()
  return &readonly && &filetype !=# 'help' ? 'RO' : ''
endfunction

" set syntax highlighting for express templates to html
au BufNewFile,BufRead,BufReadPost *.ejs set syntax=html
au BufNewFile,BufRead,BufReadPost *.ts set syntax=typescript

" }}}
" Misc {{{

" Changing displayed buffer
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprev<CR>

" vim comments affect current file
set modelines=1

" ignore compiled files
set wildignore=*.o,*~,*.pyc

" A buffer becomes hidden when it is abandoned
set hid

" Always show tabline
set showtabline=2

" Set Window split options
set splitbelow
set splitright

" line numbering
set number

" show last command in the bottom bar
set showcmd

" highlight matching {[()]}
set showmatch
" }}}
" Spaces and tabs {{{

" width of a \t
set tabstop=2

" sets the number of columns for a tab
set softtabstop=2

" sets indentation size
set shiftwidth=2

" expand tabs to spaces
set expandtab

" }}}
" Line shortcuts {{{

" move over wrapped lines as if they were separate
nnoremap j gj
nnoremap k gk

" move to the beginning/end of the line
nnoremap B ^
nnoremap E $

" leader is set to comma
let mapleader=","
let maplocalleader="\\"

" map and source vimrc
nnoremap <leader>ev :sp ~/.config/nvim/init.vim<CR>
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

" Move through the quickfix list
nnoremap <leader>n :cnext<CR>
nnoremap <leader>p :cprevious<CR>

" Escape terminal mode with esc
tnoremap <Esc> <C-\><C-n>

augroup filetypes
  autocmd!
  autocmd FileType python set expandtab softtabstop=4 shiftwidth=4 list
  autocmd FileType sh set makeprg=shellcheck\ -f\ gcc\ %
  autocmd FileType markdown inoremap <buffer> <CR> <SPACE><SPACE><CR>
  autocmd FileType markdown set expandtab softtabstop=2 shiftwidth=2 list
  autocmd FileType dockerfile set tabstop=4 softtabstop=4 shiftwidth=4
  autocmd FileType go set noexpandtab tabstop=2 softtabstop=2 shiftwidth=2
augroup END

" Tab autocomplete
inoremap <expr><TAB> pumvisible() ? "\<C-n>" : "\<tab>"

" Trim whitespace
fun! TrimWhiteSpace()
  let l:save = winsaveview()
  %s/\s\+$//e
  call winrestview(l:save)
endfun

fun! CSV()
  execute "%s/,/\t/g"
  setlocal nowrap
  setlocal noexpandtab
  setlocal shiftwidth=20
  setlocal softtabstop=20
  setlocal tabstop=20
  " always visible header
  execute "sp"
  execute "0"
  wincmd K
  1wincmd _
  wincmd j
  " bind horizontal scrolling
  set scrollopt=hor
  set scrollbind
  wincmd k
  set scrollbind
  wincmd j
endfun
" Make tsv files more readable
fun! TSV()
  setlocal nowrap
  setlocal noexpandtab
  setlocal shiftwidth=20
  setlocal softtabstop=20
  setlocal tabstop=20
  " always visible header
  execute "sp"
  execute "0"
  wincmd K
  1wincmd _
  wincmd j
  " bind horizontal scrolling
  set scrollopt=hor
  set scrollbind
  wincmd k
  set scrollbind
  wincmd j
endfun

" }}}
" Searching {{{

" search as chars are entered
set incsearch

" highlight matches
set hlsearch

" map clearing the search to ,<space>
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
set foldnestmax=10 " don't allow too many folds
set foldmethod=indent " vs marker, manual, expr, syntax, or diff
nnoremap <space> za

" }}}
" Backups {{{
set noswapfile
set nobackup
set nowritebackup
" }}}
autocmd VimEnter * echo ">^.^< LOL XD"
" vim:foldmethod=marker:foldlevel=0
