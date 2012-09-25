"------------------------------------------------------------------------------
" Global config, always run first
"------------------------------------------------------------------------------
set nocompatible    " Ignore vi compatibility mode.
filetype off

" Initialise Pathogen (https://github.com/tpope/vim-pathogen)
call pathogen#infect()
syntax on                   " Enable syntax highlighting
filetype plugin indent on   " Enable different indentation for different filetypes

"-------------------------------------------------------------------------------
" Visible Editor Features
"-------------------------------------------------------------------------------

set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.

set cursorline      " Highlight the current line

set relativenumber  " Show line numbers relative to current position.

set scrolloff=4     " Always try to keep 4 lines visible on the screen above and below the cursor.

set showcmd         " Show partial command info (like lines/char selected) at bottom
set wildmenu        " Show command completion list
set wildmode=list:longest
set ttyfast         " Assume a fast terminal, redraw on every character


set laststatus=2    " Always use a status line in the bottom of each window.

set list            " Show newline characters and tabs.

" Highlight tabs, trailing whitespace and line endings. Mark wrapped lines.
set listchars=tab:▸\ ,eol:¬,trail:~,extends:>,precedes:<

set guifont=Menlo:h11

set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.

" The next two commands come from
" http://blog.sanctum.geek.nz/vim-search-highlighting/
autocmd InsertEnter * :setlocal nohlsearch " Disable search highlighting when
                                           " entering insert mode
                                           "
autocmd InsertLeave * :setlocal hlsearch   " Enable search highlighting when
                                           " leaving insert mode

set colorcolumn=80  " Highlight column 80

set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 

set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.

" Highlight the word TODO in any document with magenta
highlight TODO ctermfg=DarkMagenta
match TODO /TODO/

colorscheme molokai " Port of Textmate monokai theme https://github.com/tomasr/molokai

"------------------------------------------------------------------------------
" General Editor Features
"------------------------------------------------------------------------------

" Tab settings
set tabstop=2       " Number of spaces that a <Tab> in the file counts for.
set softtabstop=2   " Number of spaces that inserting a <Tab> causes
set shiftwidth=2    " Number of spaces to use for each step of (auto)indent.
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.

set encoding=utf-8

set showmatch       " When typing a bracket, quickly jump to the matching one so we know.
set mat=5           " Matched brackets and quotations blink to draw attention

set history=1000    " Use a large command history
set undolevels=500  " Use a large number of undo levels
set title           " Change the title of the terminal that we're using to the
                    " name of the file that we are editing

" Ignore certain file types when tab completing
set wildignore=*.swp,*.bak,*.pyc,*.class
set wildignore+=*.a,*.o
set wildignore+=*.bmp,*.gif,*.ico,*.jpg,*.png
set wildignore+=.DS_Store,.git,.hg,.svn
set wildignore+=*~,*.tmp

" Code folding settings
set foldmethod=indent " Lines with equal indentation form a fold
set nofoldenable      " Don't fold code by default, only when asked

set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=indent,eol,start " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
 
set smartindent     " Do smart autoindenting when starting a new line. Works
                    " for C-like programs, but can also be used for other
                    " languages.

set wrap            " Wrap lines that are longer than the width of the screen

"------------------------------------------------------------------------------
" Search Settings
"------------------------------------------------------------------------------

set incsearch       " Start showing search results as soon as we type
set ignorecase      " Get search to ignore cases.
set smartcase       " If the search string has uppercase characters, override ignorecase.
"------------------------------------------------------------------------------
" Key Bindings
"------------------------------------------------------------------------------
let mapleader=","

" Use normal regex chars.
nnoremap / /\v
vnoremap / /\v

" Make the tab key swap between matching brackets as it's easier to type than %.
nnoremap <tab> %
vnoremap <tab> %

" Tell the ; key to do :'s job so I don't have to press shift all the time.
nnoremap ; :

" Map control-space to control-n for more eclipse-like text suggestion
inoremap <C-Space> <C-n>

" Fix fat finger typos of common commands via
" http://blog.sanctum.geek.nz/vim-command-typos/
if has("user_commands")
    command! -bang -nargs=? -complete=file E e<bang> <args>
    command! -bang -nargs=? -complete=file W w<bang> <args>
    command! -bang -nargs=? -complete=file Wq wq<bang> <args>
    command! -bang -nargs=? -complete=file WQ wq<bang> <args>
    command! -bang Wa wa<bang>
    command! -bang WA wa<bang>
    command! -bang Q q<bang>
    command! -bang QA qa<bang>
    command! -bang Qa qa<bang>
endif

"------------------------------------------------------------------------------
" Plugin specific settings
"------------------------------------------------------------------------------

" Tell vim's Taglist plugin to search the current directory first, then up the
" heirarchy until the root to try and find tags files.
set tags=./tags;/
let Tlist_WinWidth=50

" Start Rainbow parenthesis
call rainbow_parentheses#Toggle()

" Key bindings for Gundo
nnoremap <F5> :GundoToggle<CR>
