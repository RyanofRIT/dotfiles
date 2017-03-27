if g:dein#_cache_version != 100 | throw 'Cache loading error' | endif
let [plugins, ftplugin] = dein#load_cache_raw(['/home/osboxes/dotfiles/nvim/.config/nvim/init.vim'])
if empty(plugins) | throw 'Cache loading error' | endif
let g:dein#_plugins = plugins
let g:dein#_ftplugin = ftplugin
let g:dein#_base_path = '/home/osboxes/.config/dein'
let g:dein#_runtime_path = '/home/osboxes/.config/dein/.cache/init.vim/.dein'
let g:dein#_cache_path = '/home/osboxes/.config/dein/.cache/init.vim'
let &runtimepath = '/home/osboxes/.config/nvim,/etc/xdg/nvim,/home/osboxes/.local/share/nvim/site,/usr/local/share/nvim/site,/home/osboxes/.config/dein/repos/github.com/Shougo/dein.vim,/home/osboxes/.config/dein/.cache/init.vim/.dein,/usr/share/nvim/site,/usr/share/nvim/runtime,/home/osboxes/.config/dein/.cache/init.vim/.dein/after,/usr/share/nvim/site/after,/usr/local/share/nvim/site/after,/home/osboxes/.local/share/nvim/site/after,/etc/xdg/nvim/after,/home/osboxes/.config/nvim/after,/home/osboxes/.config/dein/repos/github.com/Shougo/dein.vim/'
filetype off
