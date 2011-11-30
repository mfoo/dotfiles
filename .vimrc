" Initialise Pathogen (https://github.com/tpope/vim-pathogen)
filetype off
call pathogen#runtime_append_all_bundles() 
filetype plugin indent on

" Ignore vi compatibility mode.
set nocompatible

set modelines=0             " See http://lists.alioth.debian.org/pipermail/pkg-vim-maintainers/2007-June/004020.html


" Tab settings
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.

set softtabstop=4   " Number of spaces that inserting a <Tab> causes

set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set encoding=utf-8
set scrolloff=4     " Always try to keep 4 lines visible on the screen above and below the cursor.

set showcmd
set wildmenu
set wildmode=list:longest
set cursorline
set ttyfast
set laststatus=2

set ignorecase      " Get search to ignore cases.
set smartcase       " If the search string has uppercase characters, override ignorecase.
set incsearch       " Use incremental searching rather than searching only after the search term has been entered.
set showmatch       " When typing a bracket, quickly jump to the matching one so we know.

nnoremap / /\v
" Use normal regex chars.
vnoremap / /\v

nnoremap <tab> %
" Make the tab key swap between matching brackets as it's easier to type than %.
vnoremap <tab> %

set list            " Show newline characters and tabs.
set listchars=tab:▸\ ,eol:¬

nnoremap ; :
" Tell the ; key to do :'s job so I don't have to press shift all the time.

set guifont=Menlo:h11


" .vimrc
" File based on the Arch Linux .vimrc file:
" https://wiki.archlinux.org/index.php/Vim#Example_.vimrc
"
" See: http://vimdoc.sourceforge.net/htmldoc/options.html for details

" For multi-byte character support (CJK support, for example):
"set fileencodings=ucs-bom,utf-8,cp936,big5,euc-jp,euc-kr,gb18030,latin1

""set t_Co=256



set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.
 
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

set wrap

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
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.
 
set relativenumber
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
 
"set mouse=a         " Enable the use of the mouse.

colorscheme molokai

" Tell vim's Taglist plugin to search the current directory first, then up the
" heirarchy until the root to try and find tags files.
set tags=./tags;/

filetype plugin indent on
syntax on

set colorcolumn=85

highlight TODO ctermfg=DarkMagenta
match TODO /TODO/

" Start Rainbow parenthesis
call rainbow_parentheses#Toggle()

" Key bindings for Gundo
nnoremap <F5> :GundoToggle<CR>
