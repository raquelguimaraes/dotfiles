set nocompatible
filetype off

let mapleader=","

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'dracula/vim'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'kristijanhusak/vim-hybrid-material'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlpvim/ctrlp.vim'

map <leader>n :NERDTreeToggle<CR>

let NERDTreeShowHidden=1
let NERDTreeHighlightCursorline=1

" Don't display these kinds of files
let NERDTreeIgnore=[ '\.pyc$', '\.pyo$', '\.py\$class$', '\.obj$',
            \ '\.o$', '\.so$', '\.egg$', '^\.git$', '__pycache__', '\.DS_Store' ]


set wildignore+=*/tmp/*,*.so,*.swp,*.zip

call vundle#end()

let g:enable_bold_font = 1
"color dracula
color hybrid_material
let g:airline_theme = "hybrid"

filetype plugin indent on       " enable detection, plugins and indenting in one step

syntax on         " set syntax highlighting
set nowrap        " don't wrap lines
set tabstop=4     " a tab is four spaces
set number        " always show line numbers
set autoindent    " always set autoindenting on
set copyindent    " copy the previous indentation on autoindenting
set shiftwidth=4  " number of spaces to use for autoindenting
set shiftround    " use multiple of shiftwidth when indenting with '<' and '>'
set showmatch     " set show matching parenthesis
set ignorecase    " ignore case when searching
set smartcase     " ignore case if search pattern is all lowercase,
                  "    case-sensitive otherwise
set smarttab      " insert tabs on the start of a line according to
                    "    shiftwidth, not tabstop
set hlsearch      " highlight search terms
set incsearch     " show search matches as you type
set expandtab     " expand tabs by default
set showmode      " always show what mode we're currently editing in
set backspace=indent,eol,start

" clear search
nnoremap <leader><space> :noh<cr>

" toggle show/hide invisible chars
nnoremap <leader>i :set list!<cr>

