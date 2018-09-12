set nowrap
set number
set hlsearch
set ignorecase
set smartcase
set showcmd
set wildmenu
set shiftwidth=4
set softtabstop=4
set nobackup
set tabstop=4
setlocal matchpairs+=<:>
set clipboard=unnamed

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle 
Plugin 'VundleVim/Vundle.vim'

" plugin
Plugin 'Valloric/YouCompleteMe'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'

" Look and feel
Plugin 'itchyny/lightline.vim'

call vundle#end()

let g:ycm_global_ycm_extra_conf='/home/robot/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
imap <c-k> <Plug>(neosnippet_expand_or_jump)
smap <c-k> <Plug>(neosnippet_expand_or_jump)
xmap <c-k> <Plug>(neosnippet_expand_target)
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

filetype plugin indent on
