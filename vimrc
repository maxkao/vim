set number
syntax on

" auto-install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.vim/autoload/plugged')

  " Change dates fast
  Plug 'tpope/vim-speeddating'
  " Convert binary, hex, etc..
  Plug 'glts/vim-radical'
  " Files
  Plug 'tpope/vim-eunuch'
  " Repeat stuff
  Plug 'tpope/vim-repeat'
  " Surround
  Plug 'tpope/vim-surround'
  " Better Comments
  Plug 'tpope/vim-commentary'
  " Have the file system follow you around
  Plug 'airblade/vim-rooter'
  " auto set indent settings
  Plug 'tpope/vim-sleuth'

  " Text Navigation
  Plug 'justinmk/vim-sneak'
  " Plug 'unblevable/quick-scope'
  " Add some color
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'junegunn/rainbow_parentheses.vim'
  " Better Syntax Support
  Plug 'sheerun/vim-polyglot'
  " Cool Icons
  Plug 'ryanoasis/vim-devicons'
  " Auto pairs for '(' '[' '{' 
  Plug 'jiangmiao/auto-pairs'
  " Themes
  Plug 'christianchiarulli/onedark.vim'
  " Plug 'kaicataldo/material.vim'
  " Plug 'NLKNguyen/papercolor-theme'
  " Plug 'tomasiser/vim-code-dark'
  " Intellisense
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  " Status Line
  " Plug 'vim-airline/vim-airline'
  Plug 'kevinhwang91/rnvimr', {'do': 'make sync'}
  " FZF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'
  " See what keys do like in emacs
  Plug 'liuchengxu/vim-which-key'
  " Zen mode
  Plug 'junegunn/goyo.vim'
  " Making stuff
  Plug 'metakirby5/codi.vim'


call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif

colorscheme onedark
"let &t_SI = "\<Esc>]50;CursorShape=1\x7"
"let &t_SR = "\<Esc>]50;CursorShape=2\x7"
"let &t_EI = "\<Esc>]50;CursorShape=0\x7"
"highlight Cursor guifg=white guibg=black
"highlight iCursor guifg=white guibg=steelblue
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
"if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
"endif

" Don't try to be vi compatible
set nocompatible
set iskeyword+=-                      	" treat dash separated words as a word text object"
set formatoptions-=cro                  " Stop newline continution of comments

  syntax enable                           " Enables syntax highlighing
  set hidden                              " Required to keep multiple buffers open multiple buffers
  set nowrap                              " Display long lines as just one line
  set encoding=utf-8                      " The encoding displayed 
  set pumheight=10                        " Makes popup menu smaller
  set fileencoding=utf-8                  " The encoding written to file
  set ruler              			            " Show the cursor position all the time
  set cmdheight=2                         " More space for displaying messages
  set mouse=a                             " Enable your mouse
  set splitbelow                          " Horizontal splits will automatically be below
  set splitright                          " Vertical splits will automatically be to the right
  set t_Co=256                            " Support 256 colors
  set conceallevel=0                      " So that I can see `` in markdown files
  set tabstop=2                           " Insert 2 spaces for a tab
  set shiftwidth=2                        " Change the number of space characters inserted for indentation
  set smarttab                            " Makes tabbing smarter will realize you have 2 vs 4
  set expandtab                           " Converts tabs to spaces
  set smartindent                         " Makes indenting smart
  set autoindent                          " Good auto indent
  set laststatus=0                        " Always display the status line
  set number                              " Line numbers
  set cursorline                          " Enable highlighting of the current line
  set background=dark                     " tell vim what the background color looks like
  set showtabline=0                       " Always show tabs 
  set noshowmode                          " We don't need to see things like -- INSERT -- anymore
  set nobackup                            " This is recommended by coc
  set nowritebackup                       " This is recommended by coc
  set shortmess+=c                        " Don't pass messages to |ins-completion-menu|.
  set signcolumn=yes                      " Always show the signcolumn, otherwise it would shift the text each time
  set updatetime=300                      " Faster completion
  set timeoutlen=100                      " By default timeoutlen is 1000 ms
  set clipboard=unnamedplus               " Copy paste between vim and everything else
  set incsearch
  set guifont=Hack\ Nerd\ Font
  " let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  " set mmp=1300
  " set autochdir                           " Your working directory will always be the same as your working directory
  " set foldcolumn=2                        " Folding abilities

  " au! BufWritePost $MYVIMRC source %      " auto source when writing to init.vm alternatively you can run :source $MYVIMRC
  autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o


  " You can't stop me
  cmap w!! w !sudo tee %

if (has("termguicolors"))
    set termguicolors
    hi LineNr ctermbg=NONE guibg=NONE
endif
