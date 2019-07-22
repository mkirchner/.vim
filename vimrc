"
" .vimrc
"
" Copyright (C) 2019 Marc Kirchner
"
" Licensed under the MIT license. See LICENSE.txt
"

filetype off " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" plugins
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
Plugin 'Shougo/vimproc.vim'
Plugin 'ycm-core/YouCompleteMe'
Plugin 'scrooloose/syntastic'
Plugin 'jnurmine/Zenburn'
Plugin 'altercation/vim-colors-solarized'
Plugin 'Lokaltog/powerline', {'rtp': 'powerline/bindings/vim/'}
Plugin 'tmhedberg/SimpylFold'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'nvie/vim-flake8'
Plugin 'Chiel92/vim-autoformat'
Plugin 'plasticboy/vim-markdown'
Plugin 'aperezdc/vim-template'
"Plugin 'vimoutliner/vimoutliner'
Plugin 'tpope/vim-fireplace'
Plugin 'venantius/vim-cljfmt'
Plugin 'elzr/vim-json'
Plugin 'vim-scripts/VimClojure'
" Plugin 'junegunn/rainbow_parentheses'

" writing
Plugin 'junegunn/goyo.vim'
Plugin 'reedes/vim-pencil'
Plugin 'junegunn/limelight.vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" 
set encoding=utf-8
" open new split panes to right and bottom
set splitbelow
set splitright

set backspace=indent,eol,start
set number  " show line numbers
"let python_highlight_all=1

" nerd tree
"let NERDTreeIgnore=['\.pyc$', '\~$']
map <C-\> :NERDTreeToggle<CR>

" Protect changes between writes. Default values of
" updatecount (200 keystrokes) and updatetime
" (4 seconds) are fine
set swapfile
set directory^=~/.vim/swap//
" protect against crash-during-write
set writebackup
" but do not persist backup after successful write
set nobackup
" use rename-and-write-new method whenever safe
set backupcopy=auto
" patch required to honor double slash at end
if has("patch-8.1.0251")
	" consolidate the writebackups -- not a big
	" deal either way, since they usually get deleted
	set backupdir^=~/.vim/backup//
end

" persist the undo tree for each file
set undofile
set undodir^=~/.vim/undo//

" quickfix shortcuts
nmap ]q :cnext<cr>
nmap ]Q :clast<cr>
nmap [q :cprev<cr>
nmap [Q :cfirst<cr>

" make
map <silent> <F5> :make<cr><cr><cr>

syntax enable
set background=dark

" solarized options
let g:solarized_termcolors=256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
colorscheme solarized

" Enable folding: native and simpylfold plugin
set foldmethod=indent
set foldlevel=99

" Mark bad whitespace
highlight BadWhitespace ctermbg=red guibg=red

" C/C++
au BufNewFile,BufRead *.c,*.h,*.cpp,*.hpp
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.c,*.h match BadWhitespace /\s\+$/

" Python
autocmd FileType python nnoremap <leader>y :0,$!yapf<Cr><C-o>
au BufNewFile,BufRead *.py,*.pyw
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=99 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /\s\+$/

" JS, HTML, CSS
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set shiftwidth=2

" Markdown
au BufNewFile,BufRead *.md,*.mkd,*.markdown
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix
" make sure the markdown mode can deal with YAML front matters (Jekyll)
let g:vim_markdown_frontmatter=1
set thesaurus+=~/.vim/thesaurus/openthesaurus.txt

" Powerline
set guifont=Inconsolata\ for\ Powerline:h15
let g:Powerline_symbols = 'fancy'
set encoding=utf-8
set t_Co=256
set fillchars+=stl:\ ,stlnc:\
" set term=xterm-256color
set termencoding=utf-8
set laststatus=2

" Vim-Clojure
let g:vimclojure#HighlightBuiltins = 1
let g:vimclojure#ParenRainbow = 1
