set nocompatible
filetype off

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'tpope/vim-rails'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'JamshedVesuna/vim-markdown-preview'

" " All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

au BufRead,BufNewFile *.json set filetype=json

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_reuse_loc_lists = 0

let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_javascript_checkers = ['eslint', 'jshint']
let g:syntastic_html_checkers = ['htmlhint']

syntax enable
set background=dark
color slate

set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

set laststatus=2
let g:airline_powerline_fonts = 1

set clipboard=unnamed
set relativenumber

" ctrlP needs to load more files
let g:ctrlp_max_files=0

" cltrlP should ignore everything in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" fugitive should always do vertical diffs
set diffopt+=vertical

set tags=./tags,tags;$HOME

set grepprg=ack
nnoremap K :grep! "\b<C-R><C-W>\b"<CR>:cw<CR>
map <C-i> :cn<CR>
map <C-o> :cp<CR>

let vim_markdown_preview_hotkey='<C-m>'
autocmd BufWritePre * StripWhitespace
let vim_markdown_preview_browser='Google Chrome'
let vim_markdown_preview_temp_file=1
