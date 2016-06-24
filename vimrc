set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" " alternatively, pass a path where Vundle should install plugins
" "call vundle#begin('~/some/path/here')
"
" " let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-unimpaired'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-surround'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdTree'
Plugin 'scrooloose/syntastic'
Plugin 'ntpeters/vim-better-whitespace'
Plugin 'ternjs/tern_for_vim'
Plugin 'Valloric/YouCompleteMe'
Plugin 'wikitopian/hardmode'

" " All of your Plugins must be added before the following line
call vundle#end()            " required

filetype plugin indent on    " required

let NERDTreeShowHidden=1

map :E :NERDTreeToggle<CR>


set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

au BufRead,BufNewFile *.json set filetype=json

let g:syntastic_error_symbol = "✗"
let g:syntastic_warning_symbol = "⚠"
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_javascript_checkers = ['eslint', 'jshint']
let g:syntastic_html_checkers = ['htmlhint']

syntax enable
set background=light
colorscheme solarized

set number
let g:netrw_liststyle = 3
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab

" " YCM gives you popups and splits by default that some people might not
" like, so these should tidy it up a bit for you.
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
set completeopt-=preview

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

" enable hardmode
autocmd VimEnter,BufNewFile,BufReadPost * silent! call HardMode()

set tags=./tags
