set nocompatible
filetype off

call plug#begin('~/.vim/plugged')
Plug 'junegunn/vim-plug'
Plug 'tpope/vim-unimpaired'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'ntpeters/vim-better-whitespace'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'ervandew/supertab'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'skwp/greplace.vim'
Plug 'airblade/vim-gitgutter'
Plug 'prettier/vim-prettier', { 'do': 'npm install', 'for': ['javascript', 'typescript', 'css', 'less', 'scss', 'json', 'graphql', 'markdown', 'vue'] }
Plug 'altercation/vim-colors-solarized'

Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --ts-completer' }
Plug 'leafgarland/typescript-vim'
Plug 'Quramy/tsuquyomi'
Plug 'Omnisharp/omnisharp-vim'
Plug 'scrooloose/syntastic'
call plug#end()            " required

filetype plugin indent on    " required

"---- General Settings ----"

" color schemes: https://github.com/daylerees/colour-schemes
set background=dark

syntax enable
let mapleader=','
set backspace=indent,eol,start
set paste
set number
set tabstop=4 softtabstop=0 expandtab shiftwidth=2 smarttab
set clipboard=unnamed
set hlsearch
set incsearch

" automatically write file when switching buffers
set autowriteall

" fugitive should always do vertical diffs"
set diffopt+=vertical

set tags=./tags,tags;$HOM

"---- Split Management
set splitbelow
set splitright

let g:syntastic_aggregate_errors = 1
let g:syntastic_error_symbol = "X"
let g:syntastic_warning_symbol = "!"
let g:syntastic_style_error_symbol = ">"
let g:syntastic_style_warning_symbol = "#"

let g:syntastic_always_populate_loc_list = 1

let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_reuse_loc_lists = 0

let g:syntastic_json_checkers = ['jsonlint']

let g:syntastic_javascript_checkers = ['eslint']
let g:syntastic_javascript_eslint_exec = '/bin/ls'
let g:syntastic_javascript_eslint_exe = '$(npm bin)/eslint'

let g:syntastic_html_checkers = ['htmlhint']
let g:syntastic_typescript_checkers = ['tslint', 'tsuquyomi']

let g:syntastic_cs_checkers = ['code_checker','syntax', 'semantic', 'issues']

"----Mappings----"
"Make it easy to edit vimrc"
nmap <Leader>ev :tabedit $MYVIMRC<cr>

nmap - :NERDTreeToggle<cr>

"Remove search highlight"
nmap <Leader><space> :nohlsearch<cr>

"Copy selection to clipboard
vmap <leader>c :!xclip -f -selection clipboard<cr>

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

" complete using current file, open file, open buffers, and unpresented buffers
set complete=.,w,b,u
set completeopt=longest,menuone,preview


"---- Syntastic Settings ---"
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" remove whitespace on save
let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save=1
let g:strip_whitespace_confirm=0

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

" --- Omnisharp ---
let g:OmniSharp_server_stdio = 1


" ---- YouCompleteMe ----"
let g:ycm_add_preview_to_completeopt=0
let g:ycm_confirm_extra_conf=0
let g:ycm_key_list_select_completion = ['<C-n>', '<C-l>', '<Down>']
let g:ycm_key_list_select_previous_completion = ['<C-p', '<C-k>', '<Up>']

if !exists("g:ycm_semantic_triggers")
  let g:ycm_semantic_triggers = {}
endif
let g:ycm_semantic_triggers['typescript'] = ['.']


" ---- Prettier Auto-run
" -- Disable autorformat on @format in first line
let g:prettier#autoformat = 0
" -- Run prettier on save
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue Prettier

function! CreatePdf()
   exec "!pandoc " . expand("%:p") . "--toc --chapter -o " . expand("%:p:r") . ".pdf"
endfunction
command! CreatePdf :call CreatePdf()

function! CreateBeamer()
  exec "!pandoc " . expand("%:p") . " -t beamer --latex-engine=xelatex -o " . expand("%:p:r") . "-presentation.pdf"
endfunction
command! CreateBeamer :call CreateBeamer()

function! OpenMupdf()
  exec "!mupdf " . fnameescape(expand("%:p"))
endfunction
command! OpenMupdf :call OpenMupdf()
