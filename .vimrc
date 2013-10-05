" codequickly
"
"
" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2008 Dec 17
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

" if has("vms")
"   set nobackup		" do not keep a backup file, use versions instead
" else
"   set backup		" keep a backup file
" endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")


" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
    set hlsearch      " highlight search terms
endif

"load color scheme from .vim/colors
if &t_Co >= 256 || has("gui_running")
    "colorscheme mustang    
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

    "Python " 
    autocmd filetype setlocal python set expandtab
else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif

" disable insert
set textwidth=0
set wrapmargin=0

set nowrap
"set tabstop=4	"hardtab ?
set number 		"always show number
set shiftwidth=4
"set expandtab	" use space instead of tab, enabled only for python.
set softtabstop=4	"space used in softtab
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to shiftwidth, not tabstop
set incsearch     " do incremental search / show search 

"set hidden		"open new file without having to save current file

set history=1000         " remember more commands and search history
set undolevels=1000      " use many muchos levels of undo
set wildignore=*.swp,*.bak,*.pyc,*.class
set title                " change the terminal's title
set visualbell           " don't beep
set noerrorbells         " don't beep
" disable autobackup"
set nobackup
set noswapfile
"set autowrite	    " saves before changing to another buffer
"set autowriteall    " saves all buffer before quit,new,etc

set colorcolumn=80  "80 column shows vertical line
" change the mapleader from \ to ,
let mapleader=","
let maplocalleader="\\"

" make regex search compatible with php,perl,etc. using very magic
noremap / /\v
" g, : clear search highlights
nnoremap <leader>, :noh<cr> 

set termencoding=utf-8
set encoding=utf-8

set gdefault    "assumes that %s/abc/def/ is %s/abc/def/g, (no need for g)

"set cmdheight=2 " status bar that is 2 rows

"  shortcuts {{{
"  use ; as : to save keystrokes. ex: :w can be ;w
nnoremap ; :

" this makes j,k work properly in certain situations.
nnoremap j gj
nnoremap k gk

" Don't use Ex mode, use Q for formatting
vmap Q gq
nmap Q gqap

"Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Folding
" nnoremap <Space> za
" vnoremap <Space> za
"

"  }}}

" vim-airline =====================
" vim-airline wasn't showing. This forces status to be always visible
set laststatus=2

"set runtimepath^=~/.vim/bundle/ctrlp.vim

" NERDTree ========================
let NERDTreeIgnore=['\~$', '^\.pyc','^\.git', '\.swp$', '\.DS_Store$']
let NERDTreeShowHidden=1
nmap <LocalLeader>nn :NERDTreeToggle<cr>

" enable pathogen ================
call pathogen#infect()
call pathogen#helptags()
"call pathogen#runtime_append_all_bundles() "deprecated - incubate
"call pathogen#incubate() "lower-level than #infect()
