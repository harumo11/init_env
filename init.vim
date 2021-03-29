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
set nobackup

filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle 
Plugin 'VundleVim/Vundle.vim'

" Completion
Plugin 'Valloric/YouCompleteMe'
Plugin 'rdnetto/YCM-Generator'
Plugin 'vim-jp/vim-cpp'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'Shougo/neosnippet'
Plugin 'Shougo/neosnippet-snippets'
Plugin 'rhysd/vim-clang-format'
Plugin 'kana/vim-operator-user'
Plugin 'chenzhiwo/ycm-extra-conf-ros'

" Look and feel
Plugin 'itchyny/lightline.vim'
Plugin 'tomasr/molokai'
Plugin 'ntk148v/vim-horizon'

" File operation
Plugin 'cdelledonne/vim-cmake'

call vundle#end()

" Completion
" Vanila ycm-conf
let g:ycm_global_ycm_extra_conf='/home/harumo/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf='/home/harumo/opt/ycm-ros/.ycm_extra_conf.py'
"let g:ycm_global_ycm_extra_conf='/home/harumo/opt/ycm-extra-conf-ros/ycm_extra_conf.py'
" Use ctags from YCM
" let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_autoclose_preview_window_after_insertion=1
" Let clangd fully control code completion
let g:ycm_clangd_uses_ycmd_caching = 0
" Use installed clangd, not YCM-bundled clangd which doesn't update
let g:ycm_clangd_binary_path = exepath("clangd")
imap <c-k> <Plug>(neosnippet_expand_or_jump)
smap <c-k> <Plug>(neosnippet_expand_or_jump)
xmap <c-k> <Plug>(neosnippet_expand_target)
if has('conceal')
	set conceallevel=2 concealcursor=niv
endif

" Jump, type \de, \dc and \de. to back from definition document, type Cntl-O
nnoremap <leader>df :YcmCompleter GoToDefinition<CR>
nnoremap <leader>dc :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>de :YcmCompleter GoToDefinitionElseDeclaration<CR>

" Look and feel
"colorscheme molokai
set termguicolors
" colorscheme pulumi
"let g:lightline = {
"	\ 'colorscheme' : 'horizon',
"	\ }

" run clang-format when saving cpp or hpp files
function! s:clang_format()
	let now_line = line(".")
	exec ":%! clang-format -style='{BasedOnStyle: WebKit, IndentWidth: 4}'"
	exec ":" . now_line
endfunction

if executable('clang-format')
	augroup cpp_clang_format
		autocmd!
		autocmd BufWrite,FileWritePre,FileAppendPre *.[ch]pp call s:clang_format()
	augroup END
endif

filetype plugin indent on
syntax enable

" folding setting z-c=close, z-o=open
set foldmethod=syntax
set foldlevel=5 "Don't autofold anythig"

