call plug#begin('~/.vim_plugged')

 Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
 Plug 'junegunn/fzf.vim'
 Plug 'itchyny/lightline.vim'
 if $HOSTNAME =~ "iitmlogin"
  Plug 'dense-analysis/ale'
 endif

 if $HOSTNAME !~ "iitmlogin"
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
 endif
 
 Plug 'preservim/nerdcommenter'
 Plug 'Yggdroot/indentLine'
 Plug 'segeljakt/vim-stealth'
 Plug 'ctrlpvim/ctrlp.vim'

 " colorscheme plugins
 "Plug 'altercation/vim-colors-solarized'
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
 "Plug 'HenryNewcomer/vim-theme-papaya'

 call plug#end()

colorscheme one                 " which colorscheme you currently want
"colorscheme papaya
"let g:papaya_gui_color='blue'
"colorscheme onedark
set background=dark
syntax on

set nocompatible    " behave like vim, not old vi
set ruler           "show the cursor position
set title           "show title on the window
set display+=lastline  " show as much as possible of last lin
set autowrite       " save file on some commands
set ignorecase
set smartcase
" set vim encryption
set cm=blowfish2

" How Tab behaves
set tabstop=2        " number of visual spaces per TAB
set softtabstop=2   " number of spaces in tab when editing
set sw=2
set expandtab       " tabs are spaces
"set smarttab        " smart tabulation and backspace
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

syntax enable
" to enable comment plugin
filetype plugin on
:hi Comment ctermfg=White    " highlight comments 
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
autocmd BufRead,BufnewFile *.md :syn match Strategy /\[.*\!!.*$/ 
autocmd BufRead,BufnewFile *.md :hi Strategy ctermfg=White ctermbg=DarkCyan
autocmd BufRead,BufnewFile *.md :syn match Completed /\[.*\!!!!.*$/ 
autocmd BufRead,BufnewFile *.md :hi Completed ctermfg=White ctermbg=DarkGreen

"adding templates
autocmd BufnewFile *.md so ~/.vim/header_template.txt

let g:coc_global_extensions = [
        \'coc-markdownlint', 'coc-python', 'coc-explorer',
        \'coc-json', 'coc-texlab', 'coc-yaml', 'coc-clangd',
        \'coc-marketplace', 'coc-sh', 'coc-diagnostic'
        \]
" switch between solarised dark and light themes
"call togglebg#map("<F5>")

" Preferences for vimtex
let g:vimtex_fold_enabled = 1
let g:tex_flavor = 'latex'
let g:vimtex_compiler_latexmk = {
      \ 'options' : [
      \   '-lualatex',
      \   '-silent',
      \   '-synctex=1',
      \   '-interaction=nonstopmode',
      \ ],
      \ 'build_dir' : 'livepreview',
      \}

if has("autocmd")
   au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
       \| exe "normal! g'\"" | endif
endif
