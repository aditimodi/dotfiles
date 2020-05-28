
syntax enable           " enable syntax processing
set tabstop=4       " number of visual spaces per TAB
set softtabstop=4   " number of spaces in tab when editing
set nocompatible    " behave like vim, not old vi
set ruler           "show the cursor position
set title           "show title on the window
set display+=lastline  " show as much as possible of last lin
set autowrite       " save file on some commands

" How Tab behaves
set tabstop=4        " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set expandtab       " tabs are spaces
set smarttab        " smart tabulation and backspace
set bs=indent,eol,start " allow backspacing over everything
                
set laststatus=2    " always show the status line
set noshowmode      "removing status in last line
set number              " show line numbers
set relativenumber      "show relative line numbering
set showcmd             " show command in bottom bar
set cursorline          " highlight current line
filetype indent on      " load filetype-specific indent files
set wildmenu            " visual autocomplete for command menu 
set wildmode=longest:full   " with wildmode
set showmatch           " highlight matching [{()}]

" How IO behaves
set ttyfast              " assume the terminal is fast 
set mouse=a             " assume the terminal is fast

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
" Plug 'tpope/vim-surround'
 Plug 'dense-analysis/ale'
 Plug 'jiangmiao/auto-pairs'
 "Plug 'neoclide/coc.nvim', {'branch': 'release'}
 Plug 'preservim/nerdcommenter'

 " colorscheme plugins
 Plug 'altercation/vim-colors-solarized'
 "Plug 'tomasr/molokai'
 "Plug 'chriskempson/base16-vim'
 "Plug 'lifepillar/vim-gruvbox8'
 "Plug 'nielsmadan/harlequin'
 "Plug 'w0ng/vim-hybrid'
 "Plug 'kristijanhusak/vim-hybrid-material'
 "Plug 'nanotech/jellybeans.vim'
 "Plug 'Wutzara/vim-materialtheme'
 Plug 'rakr/vim-one'
 "Plug 'joshdick/onedark.vim'
 "Plug 'NLKNguyen/papercolor-theme'
 "Plug 'jpo/vim-railscasts-theme'
 "Plug 'chriskempson/vim-tomorrow-theme'
 call plug#end()
syntax enable
set background=dark
colorscheme one                 " which colorscheme you currently want

" to enable comment plugin
filetype plugin on
:hi Comment ctermbg=DarkGray ctermfg=White    " highlight comments 
"backup
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

"mapping key for date insertion (helpful while creating logbooks)
":map <F3> :r! date +"\%Y-\%m-\%d"<cr>
:map <F3> :put =strftime(\"%c\")<cr>


"syntax highlighting for important marked events
autocmd BufRead,BufnewFile *.md nnoremap <leader>n o [  ]
autocmd BufRead,BufnewFile *.md :syn match Important /\[.*\!.*$/ 
autocmd BufRead,BufnewFile *.md :hi Important ctermfg=White ctermbg=DarkRed
autocmd BufRead,BufnewFile *.md :syn match Completed /\[.*\!!!!.*$/ 
autocmd BufRead,BufnewFile *.md :hi Completed ctermfg=White ctermbg=DarkGreen

" switch between solarised dark and light themes
call togglebg#map("<F5>")


