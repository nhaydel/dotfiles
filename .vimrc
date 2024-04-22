" Set defaults
set backspace=indent,eol,start
set nocompatible
set relativenumber
set rnu
set mouse=a
call plug#begin()
Plug 'preservim/NERDTree' " File nav
Plug 'zivyangll/git-blame.vim'
" Requires adapter installs:
" :VimspectorInstall debugpy - for python
" :VimspectorInstall delve - for go
" :VimspectorInstall CodeLLDB
Plug 'machakann/vim-highlightedyank' " Highlight on copy
Plug 'skammer/vim-css-color' " View css color codes
Plug 'ayu-theme/ayu-vim'
Plug 'easymotion/vim-easymotion'
Plug 'puremourning/vimspector'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'rust-lang/rust.vim'
Plug 'dense-analysis/ale'
Plug 'itchyny/lightline.vim'
Plug 'luochen1990/rainbow'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'liuchengxu/vim-which-key'
Plug 'wellle/context.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
call plug#end()

" KEYMAPPINGS
nnoremap <space>fw :Rg<CR>
nnoremap <space>ff :Files<CR>
nnoremap gb :<C-u>call gitblame#echo()<CR>
" END KEYMAPPINGS
let g:iced_enable_default_key_mappings = v:true
syntax on
filetype plugin indent on

let g:python_highlight_all = 1
set completeopt=menu,menuone,popup,noselect,noinsert
" ==== ALE ====
let g:ale_lint_on_text_changed = 'always'
let g:ale_fix_on_save = 0
let g:ale_linters = {
  \ 'python': ['ruff'],
  \ 'go': ['gofmt'],
  \ 'yaml': ['yamllint'],
  \ }
let g:ale_fixers = {
  \ 'python': ['ruff', 'black'],
  \ 'go': ['gofmt'],
  \ '*': ['remove_trailing_lines', 'trim_whitespace']
  \ }
let g:ale_python_flake8_options = '--ignore=E501,E402,F401,E701' " ignore long-lines, import on top of the file, unused modules and statement with colon
let g:ale_python_autopep8_options = '--ignore=E501'              " ignore long-lines for autopep8 fixer
let g:ale_yaml_yamllint_options='-d "{extends: relaxed, rules: {line-length: disable}}"'

" let g:airline#extensions#ale#enabled = 1
let g:ale_sign_warning = "\uf421" "  
let g:ale_sign_error = "\uf658" "  

let g:ale_echo_msg_format = '[%linter%] %code%: %s'
let g:rainbow_active = 1 

" tab spacing
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" when indenting with '>', use 4 spaces width
set shiftwidth=4
" On pressing tab, insert 4 spaces
set expandtab

" tab controls
map  <C-l> :tabn<CR>
map  <C-c> :tabc<CR>
map  <C-t> :term<CR>
map  <C-a> :tabp<CR>
map  <C-n> :tabnew<CR>

" NERDTree config
" map nerdtree to the ctrl+n
function MyNerdToggle()
    if &filetype == 'nerdtree' || exists("g:NERDTree") && g:NERDTree.IsOpen()
        :NERDTreeToggle
    else
        :NERDTreeFind
    endif
endfunction
let g:NERDTreeQuitOnOpen = 1
nnoremap <space><space> :call MyNerdToggle()<CR>
let g:NERDTreeWinSize=80

hi Pmenu ctermfg=white ctermbg=black gui=NONE guifg=white guibg=black
set pastetoggle=<F3>

let g:vimspector_enable_mappings = 'HUMAN'
set updatetime=100

" StatusLine
set laststatus=2

set termguicolors
" Color settings
" let ayucolor="light"  " for light version of theme
" let ayucolor="mirage" " for mirage version of theme
let ayucolor="dark"   " for dark version of theme
colorscheme ayu
let g:lightline = { 'colorscheme': 'ayu' }

let g:tokyonight_style = 'night' " available: night, storm
let g:tokyonight_enable_italic = 1

let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = 'CtrlP'

" Coc config
let g:coc_disable_startup_warning = 1
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
nmap <silent> gd :call CocAction('jumpDefinition', 'tabe')<CR>
nmap <silent> gt <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" highlight config
let g:highlightedyank_highlight_duration = 100
