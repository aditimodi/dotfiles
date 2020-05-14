
syntax enable           " enable syntax processing
set backspace=indent,eol,start
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set laststatus=2
set noshowmode      "removing status in last line
set number              " show line numbers
set relativenumber      "show relative line numbering
set showcmd             " show command in bottom bar
"set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu
set showmatch           " highlight matching [{()}]

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
nnoremap <leader><space> :nohlsearch<CR>
set foldenable          " enable folding
set foldlevelstart=10   " open most folds by default
set foldnestmax=10      " 10 nested fold max
" space open/closes folds
nnoremap <space> za
set foldmethod=indent   " fold based on indent level

call plug#begin('~/.vim/plugged')

 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'itchyny/lightline.vim'
 Plug 'tpope/vim-surround'
 Plug 'dense-analysis/ale'
 Plug 'jiangmiao/auto-pairs'
 Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

"  backup
set backup
set backupdir=~/.vim_backup

" toggle between number and relativenumber
function! ToggleNumber()
    if(&relativenumber == 1)
        set norelativenumber
        set number
    else
        set relativenumber
    endif
endfunc

map <F1> :call ToggleNumber()<CR>
map ; :Files<CR>

