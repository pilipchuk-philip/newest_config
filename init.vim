if !exists('g:vscode')
set nu
syntax on
set clipboard=unnamedplus,unnamed
set t_Co=256
set background=dark
"colorscheme atom-dark-256
"colorscheme dracula
colorscheme onedark
hi Normal guibg=NONE ctermbg=NONE

set visualbell
set t_vb=
set termguicolors

" Nvim
" TextEdit might fail if hidden is not set.
set hidden
set shortmess+=c
set signcolumn=yes
"vandle set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
call plug#begin()
" let Vundle manage Vundle, required
Plug 'arcticicestudio/nord-vim'
Plug 'VundleVim/Vundle.vim'
Plug 'tpope/vim-surround'
Plug 'lepture/vim-jinja'
Plug 'prettier/vim-prettier'
Plug 'mattn/emmet-vim'

Plug 'vim-python/python-syntax'
Plug 'ryanoasis/vim-devicons'
Plug 'honza/vim-snippets'

Plug 'bagrat/vim-buffet'
"Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'scrooloose/nerdtree'

Plug 'kien/ctrlp.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'scrooloose/nerdcommenter'

Plug 'airblade/vim-gitgutter'
"Plug 'davidhalter/jedi-vim'

Plug 'mileszs/ack.vim'
Plug 'miyakogi/conoline.vim'
"Plug 'Vimjas/vim-python-pep8-indent'
"
"Plug 'fisadev/vim-isort'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"
" All of your Plugins must be added before the following line
call plug#end()

filetype plugin indent on    " required

set ignorecase
set showmode                    " always show what mode we're currently
set nowrap                      " don't wrap lines

set tabstop=4                   " a tab is four spaces
set softtabstop=4               " when hitting <BS>, pretend like a tab is removed, even if spaces
set expandtab                   " expand tabs by default (overloadable per file type later)
set shiftwidth=4                " number of spaces to use for autoindenting
set shiftround                  " use multiple of shiftwidth when indenting with '<' and '>'
set backspace=indent,eol,start  " allow backspacing over everything in insert mode
set autoindent                  " always set autoindenting on
set copyindent                  " copy the previous indentation on autoindenting
set number                      " always show line numbers
set showmatch                   " set show matching parenthesis
set ignorecase                  " ignore case when searching
set smartcase                   " ignore case if search pattern is all lowercase,
                                "    case-sensitive otherwise
set smarttab                    " insert tabs on the start of a line according to
                                "    shiftwidth, not tabstop
set scrolloff=4                 " keep 4 lines off the edges of the screen when scrolling
set virtualedit=all             " allow the cursor to go in to "invalid" places
set hlsearch                    " highlight search terms
set incsearch                   " show search matches as you type
set gdefault                    " search/replace "globally" (on a line) by default
set listchars=tab:▸\ ,trail:·,extends:#,nbsp:·
set nolist                      " don't show invisible characters by default,
                                " but it is enabled for some file types (see later)
set pastetoggle=<F2>            " when in insert mode, press <F2> to go to
                                "    paste mode, where you can paste mass data
                                "    that won't be autoindented
set mouse=a                     " enable using the mouse if terminal emulator
                                "    supports it (xterm does)
set fileformats="unix,dos,mac"
set formatoptions+=1            " When wrapping paragraphs, don't end lines
                                "    with 1-letter words (looks stupid)

set nrformats=                  " make <C-a> and <C-x> play well with
                                "    zero-padded numbers (i.e. don't consider
                                "    them octal or hex)

set shortmess+=I                " hide the launch screen
set autoread                    " automatically reload files changed outside of Vim

" Toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>

" Toggle line numbers
nnoremap <leader>N :setlocal number!<cr>
" Editor layout {{{
set termencoding=utf-8
set encoding=utf-8
set lazyredraw                  " don't update the display while



set nobackup                    " do not keep backup files, it's 70's style
set noswapfile                  " do not write annoying intermediate swap

set wildmenu                    " make tab completion for files/buffers act like bash
set wildmode=list:full          " show a list when pressing tab and complete
                                "    first full match
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                       " change the terminal's title
set visualbell                  " don't beep
set noerrorbells                " don't beep
set showcmd                     " show (partial) command in the last line of the screen
                                "    this also shows visual selection info
set nomodeline                  " disable mode lines (security measure)
"set ttyfast                     " always use a fast terminal
set cursorline                  " underline the current line, for quick orientation
":hi CursorColumn cterm=NONE ctermbg=darkred ctermfg=white guibg=darkred guifg=white

" remapings

let mapleader = "'"
nnoremap ; :
nnoremap <leader>; ;

" NERDTree
nnoremap <BS> :NERDTreeToggle<CR>

" NERDCommenter
nmap <C-_>   <Plug>NERDCommenterToggle
vmap <C-_>   <Plug>NERDCommenterToggle<CR>gv
" Python

let g:vim_isort_map = '<C-i>'

" Easy window navigation
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" python autoformater
imap <C-a> :!/usr/bin/python3 -m autopep8 --in-place --aggressive --aggressive % <CR>
nmap <C-a> :!/usr/bin/python3 -m autopep8 --in-place --aggressive --aggressive % <CR>
vmap <C-a> :!/usr/bin/python3 -m autopep8 --in-place --aggressive --aggressive % <CR>

"python
let g:python_highlight_all = 1

imap <C-r> :!python % <CR>
nmap <C-r> :!python % <CR>
vmap <C-r> :!python % <CR>

imap <C-h> # ----------------------------------------------------------------------------- <CR>
vmap <C-h> %!python3 -m json.tool <CR>
nmap <C-h> %!python3 -m json.tool <CR>

imap <C-e> :CtrlPBuffer <CR>
nmap <C-e> :CtrlPBuffer <CR>
vmap <C-e> :CtrlPBuffer <CR>

imap <C-p> :CtrlP <CR>
nmap <C-p> :CtrlP <CR>
vmap <C-p> :CtrlP <CR>

"let g:ctrlp_cmd = 'CtrlPBuffer'
"javaScript
let g:javascript_plugin_jsdoc = 1

"snippets
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
"let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
"let g:UltiSnipsEditSplit="vertical"

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#formatter = 'unique_tail'

set tabstop=4
set softtabstop=4
set shiftwidth=4
"set textwidth=79
set expandtab
filetype indent on
set autoindent
set fileformat=unix

let g:conoline_auto_enable = 1

" Ack
let g:ackprg = 'ag --nogroup --nocolor --column'

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

" COC VIM
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"


function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <c-space> coc#refresh()

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

" Remap keys for applying codeAction to the current line.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')
 " Remap for do codeAction of selected region
function! s:cocActionsOpenFromSelected(type) abort
  execute 'CocCommand actions.open ' . a:type
endfunction
xmap <silent> <leader>a :<C-u>execute 'CocCommand actions.open ' . visualmode()<CR>
nmap <silent> <leader>a :<C-u>set operatorfunc=<SID>cocActionsOpenFromSelected<CR>g@

 " GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'
 " Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)
" Theme settings
let g:dracula_italic = 1
endif

"text width
au BufRead,BufNewFile *.py setlocal textwidth=79

"NERDTree
set wildignore+=*.pyc,*.o,*.obj,*.svn,*.swp,*.class,*.hg,*.DS_Store,*.min.*
let NERDTreeIgnore = ['\.pyc$', '\.egg-info$', '__pycache__', '__pycache__']

"Jinja
au BufNewFile,BufRead *.html,*.htm,*.shtml,*.stm set ft=jinja
let g:ctrlp_custom_ignore = 'venv'

" Auto delete trailing whitespace
autocmd BufWritePre * %s/\s\+$//e
