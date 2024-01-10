" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" List of plugins.
" Make sure you use single quotes

" Shorthand notation
Plug 'jalvesaq/Nvim-R', { 'branch' : 'stable' }
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'gaalcaras/ncm-R'
Plug 'preservim/nerdtree'
Plug 'Raimondi/delimitMate'
Plug 'patstockwell/vim-monokai-tasty'
Plug 'itchyny/lightline.vim'

Plug 'sillybun/vim-repl'

"Plug 'davidhalter/jedi-vim'
"Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"Plug 'zchee/deoplete-jedi'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/nerdcommenter'
Plug 'sbdchd/neoformat'
" Initialize plugin system
call plug#end()

" alter for python
"let coc_data_home = '~/.cache/coc'
let g:repl_program = {
	            \   'python': 'ipython',
            \   'default': 'zsh',
            \   'r': 'R',
            \   'lua': 'lua',
            \   }
let g:repl_predefine_python = {
	            \   'numpy': 'import numpy as np',
            \   'matplotlib': 'from matplotlib import pyplot as plt'
            \   }
let g:repl_cursor_down = 1
let g:repl_python_automerge = 1
let g:repl_ipython_version = '7'
nnoremap <leader>r :REPLToggle<Cr>
autocmd Filetype python nnoremap <F12> <Esc>:REPLDebugStopAtCurrentLine<Cr>
autocmd Filetype python nnoremap <F10> <Esc>:REPLPDBN<Cr>
autocmd Filetype python nnoremap <F11> <Esc>:REPLPDBS<Cr>
let g:repl_position = 3

" "g" (go to or show)
nmap gd <Plug>(coc-definition)
nmap gD <Plug>(coc-declaration)
nmap ge <Plug>(coc-diagnostic-next)
nmap gE <Plug>(coc-diagnostic-next)
nmap gr <Plug>(coc-references)
nmap gh <Plug>(coc-action-doHover)
nmap gi <Plug>(coc-diagnostic-info)

" "s" (server do)
nmap <Leader>sr <Plug>(coc-rename)
nmap <Leader>sa <Plug>(coc-codeaction)
nmap <Leader>sf <Plug>(coc-format-selected)
nmap <Leader>st <Plug>(coc-type-definition)

" Coc configuration is json + comments
autocmd FileType json syntax match Comment +\/\/.\+$+

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.

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


" alter for the python 2 
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:airline_theme='<theme>' " <theme> is a valid theme name
" Enable alignment
let g:neoformat_basic_format_align = 1
" Enable tab to space conversion
let g:neoformat_basic_format_retab = 1
" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 0
" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "right"

" alter for python, done

" Set foldbehavior

set tabstop=2        " Number of spaces that a <Tab> in the file counts for
set shiftwidth=2     " Number of spaces to use for each step of (auto)indent
set softtabstop=2    " Number of spaces that a <Tab> counts for while performing editing operations
set expandtab        " Use spaces instead of tabs

set foldmethod=indent
set foldlevelstart=2    " Start folding at an indent level greater than 2

" Set a Local Leader

" With a map leader it's possible to do extra key combinations
" like w saves the current file
let mapleader = ","
let g:mapleader = ","


" Plugin Related Settings

" NCM2
autocmd BufEnter * call ncm2#enable_for_buffer()    " To enable ncm2 for all buffers.
set completeopt=noinsert,menuone,noselect           " :help Ncm2PopupOpen for more
                                                    " information.

" NERD Tree
map nn :NERDTreeToggle                  " Toggle NERD tree.

" Monokai-tasty
let g:vim_monokai_tasty_italic = 1                  " Allow italics.
colorscheme vim-monokai-tasty                       " Enable monokai theme.

" LightLine.vim 
set laststatus=2              " To tell Vim we want to see the statusline.
let g:lightline = {
   \ 'colorscheme':'monokai_tasty',
   \ }


" General NVIM/VIM Settings

" Mouse Integration
set mouse=i                   " Enable mouse support in insert mode.

" Tabs & Navigation
map nt :tabnew    " To create a new tab.
map to :tabonly     " To close all other tabs (show only the current tab).
map tc :tabclose    " To close the current tab.
map tm :tabmove     " To move the current tab to next position.
map tn :tabn        " To swtich to next tab.
map tp :tabp        " To switch to previous tab.


" Line Numbers & Indentation
set backspace=indent,eol,start  " To make backscape work in all conditions.
set ma                          " To set mark a at current cursor location.
set number                      " To switch the line numbers on.
set expandtab                   " To enter spaces when tab is pressed.
set smarttab                    " To use smart tabs.
set autoindent                  " To copy indentation from current line 
                                " when starting a new line.
set si                          " To switch on smart indentation.


" Search
set ignorecase                  " To ignore case when searching.
set smartcase                   " When searching try to be smart about cases.
set hlsearch                    " To highlight search results.
set incsearch                   " To make search act like search in modern browsers.
set magic                       " For regular expressions turn magic on.


" Brackets
set showmatch                   " To show matching brackets when text indicator 
                                " is over them.
set mat=2                       " How many tenths of a second to blink 
                                " when matching brackets.


" Errors
set noerrorbells                " No annoying sound on errors.


" Color & Fonts
syntax enable                   " Enable syntax highlighting.
set encoding=utf8                " Set utf8 as standard encoding and 
                                 " en_US as the standard language.

" Enable 256 colors palette in Gnome Terminal.
if $COLORTERM == 'gnome-terminal'
    set t_Co=256
endif

try
    colorscheme desert
catch
endtry


" Files & Backup
set nobackup                     " Turn off backup.
set nowb                         " Don't backup before overwriting a file.
set noswapfile                   " Don't create a swap file.
set ffs=unix,dos,mac             " Use Unix as the standard file type.


" Return to last edit position when opening files
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
