set nocompatible
filetype off


call plug#begin('~/.vim/plugged')
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/syntastic'
Plug 'ntpeters/vim-better-whitespace'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'skwp/greplace.vim'
Plug 'Valloric/YouCompleteMe'
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'

" " All of your Plugins must be added before the following line
call plug#end()            " required

filetype plugin indent on    " required


"---- General Settings ----"
syntax enable
colorscheme slate "atom-dark

let mapleader=','
set backspace=indent,eol,start
set paste
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set clipboard=unnamed
set relativenumber
set hlsearch
set incsearch

" complete using current file, open file, open buffers, and unpresented buffers
set complete=.,w,b,u

" automatically write file when switching buffers
set autowriteall

" fugitive should always do vertical diffs"
set diffopt+=vertical

set tags=./tags,tags;$HOM

"---- Split Management
set splitbelow
set splitright


"----Mappings----"
"Make it easy to edit vimrc"
nmap <Leader>ev :tabedit $MYVIMRC<cr>
nmap - :NERDTreeToggle<cr>

"Remove search highlight"
nmap <Leader><space> :nohlsearch<cr>

"quickly browse to any tag/symbol"
"Note: use :tn and :tp to browse the tag findings"
nmap <Leader>f :tag<space>

"--- Auto-Commands ---"
augroup autosourcing
  autocmd!
  "source vimrc when write"
  autocmd BufWritePost .vimrc source %

  au BufRead,BufNewFile *.json set filetype=json
augroup END

"---- Syntastic Settings ---"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_aggregate_errors = 1

let g:syntastic_error_symbol = "X"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_error_symbol = "~"
let g:syntastic_style_warning_symbol = ">"

let g:syntastic_always_populate_loc_list = 1

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_reuse_loc_lists = 0

let g:tsuquyomi_disable_quickfix = 1

let g:syntastic_json_checkers = ['jsonlint']
let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_html_checkers = ['htmlhint']
let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi']

"---- Tsuquyomi (Typescript fanciness) ----"
nmap <Leader>i :TsuImport<cr>
nmap <Leader>d :TsuDefinition<cr>
nmap <Leader>r :TsuReferences<cr>


"---- Airline Settings ----"
set laststatus=2
let g:airline_powerline_fonts = 1


"---- CtrlP Settings ----"
" ctrlP needs to load more files
let g:ctrlp_max_files=0

" cltrlP should ignore everything in .gitignore
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" show more items at the bottom
let g:ctrlp_match_window = 'bottom,order:ttb,min:1,max:30, results:30'

nmap <c-R> :CtrlPBufTag<cr>
nmap <C-e> :CtrlPMRUFiles<cr>


"---- UltiSnips Settings----"
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<cr>"
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" Where to look for snippets
let g:UltiSnipsSnippetDirectories=["UltiSnips"]

" Where to add new snippets via :UltiSnipsEdit
let g:UltiSnipsSnippetsDir="~/.vim/UltiSnips"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" ---- Greplace settings ----"
set grepprg=ack
let g:grep_cmd_opts="--no-heading"

" ---- YouCompleteMe ----"
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_key_list_select_completion = ['<C-n>', '<Down>']
let g:ycm_key_list_select_previous_completion = ['<C-p', '<Up']

if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']

set completeopt-=preview


" ---- Remove Whitespace on save ----"
autocmd BufEnter * EnableStripWhitespaceOnSave

" Notes and Tips"
" - Press 'zz' to center screen on the cursor"

