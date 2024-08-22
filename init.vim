" drop vi support - kept for vim compatibility but not needed for nvim
" Probably not needed with Vim 8+
set nocompatible

" Search recursively downward from CWD; provides TAB completion for filenames
" e.g., `:find vim* <TAB>`
set path+=**

" number of lines at the beginning and end of files checked for file-specific vars
set modelines=0

" reload files changed outside of Vim not currently modified in Vim (needs below)
set autoread

" http://stackoverflow.com/questions/2490227/how-does-vims-autoread-work#20418591
au FocusGained,BufEnter * :silent! !

" use Unicode
set encoding=utf-8

" don't create `filename~` backups
set nobackup

" don't create temp files
set noswapfile

set number 

" Tab key enters 2 spaces
" To enter a TAB character when `expandtab` is in effect,
" CTRL-v-TAB
set expandtab tabstop=4 shiftwidth=4 softtabstop=4 

" Indent new line the same as the preceding line
set autoindent
set smartindent

" statusline indicates insert or normal mode
set showmode showcmd

" highlight matching parens, braces, brackets, etc
set showmatch

" http://vim.wikia.com/wiki/Searching
set hlsearch incsearch ignorecase smartcase

" As opposed to `wrap`
set nowrap

" http://vim.wikia.com/wiki/Set_working_directory_to_the_current_file
set autochdir

" http://stackoverflow.com/questions/9511253/how-to-effectively-use-vim-wildmenu
set wildmenu wildmode=list:longest,full

" StatusLine always visible, display full path
" http://learnvimscriptthehardway.stevelosh.com/chapters/17.html
set laststatus=2 statusline=%F

" Use system clipboard
" http://vim.wikia.com/wiki/Accessing_the_system_clipboard
" for linux
set clipboard=unnamedplus
" for macOS
"set clipboard=unnamed

" Plugins, syntax, and colors
" ---------------------------------------------------------------------------
" vim-plug
" https://github.com/junegunn/vim-plug
" Specify a directory for plugins
" - For Neovim: ~/.local/share/nvim/plugged
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin()

" Make sure to use single quotes
" Install with `:PlugInstall`

" https://github.com/itchyny/lightline.vim
Plug 'itchyny/lightline.vim'

" https://github.com/tpope/vim-commentary
" Plug 'tpope/vim-commentary'

" https://github.com/tpope/vim-surround
" Plug 'tpope/vim-surround'
"
Plug 'tpope/vim-sensible'
Plug 'RRethy/vim-illuminate'

" https://github.com/APZelos/blamer.nvim
" Plug 'APZelos/blamer.nvim'

Plug 'haishanh/night-owl.vim'

" Initialize plugin system
call plug#end()

syntax enable
" Neovim only
set termguicolors 

" Light scheme
colorscheme night-owl

" Dark scheme
set background=dark

" lightline config - add file 'absolutepath'
" Delete colorscheme line below if using Dark scheme

let g:lightline = { 'colorscheme': 'nightowl' }

"let g:lightline = {
"      \ 'colorscheme': 'PaperColor_light',
"      \ 'active': {
"      \   'left': [ [ 'mode', 'paste' ],
"      \             [ 'readonly', 'absolutepath', 'modified' ] ]
"      \ }
"      \ }
"
"let g:blamer_enabled = 1
"" %a is the day of week, in case it's needed
"let g:blamer_date_format = '%e %b %Y'
"highlight Blamer guifg=darkorange
