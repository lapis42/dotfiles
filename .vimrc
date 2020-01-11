""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'

" Autocompletion
Plugin 'Valloric/YouCompleteMe'

" Latex
Plugin 'lervag/vimtex'

" Theme
Plugin 'patstockwell/vim-monokai-tasty' 
let g:airline_theme = 'monokai_tasty'
Plugin 'vim-airline/vim-airline' 
let g:airline_powerline_fonts = 1

" Navigation
Plugin 'scrooloose/nerdtree'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'junegunn/fzf'
Plugin 'junegunn/fzf.vim'

" Git
Plugin 'airblade/vim-gitgutter'
Plugin 'Xuyuanp/nerdtree-git-plugin'

" Tag generation
Plugin 'majutsushi/tagbar' " needs to install ctags
let g:tagbar_type_matlab = {
        \ 'ctagstype' : 'matlab',
        \ 'kinds' : [
            \ 't:TODO',
            \ 'F:FIXME',
            \ 'r:REVIEW',
            \ 's:Section'
        \ ],
        \ 'sort' : 0
\ }

" REPL
Plugin 'jpalardy/vim-slime'
let g:slime_target = "tmux"

call vundle#end()
filetype plugin indent on


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Sets how many lines of history VIM has to remember
set history=700

" Set to auto read when a file is changes from the outside
set autoread

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set 7 lines to the cursor - when moving vertically using j$/k
set so=7

" Turn on the Wild menu
set wildmenu

" Always show current position
set ruler

" Height of the command bar
set cmdheight=1

" Configure backspace so it acts as it should act
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

" Ignore case when searching
set ignorecase

" When searching try to be smart about cases
set smartcase

" Highlight search results
set hlsearch

" For regular expressions turn magic on
set magic

" Show matching brackets when text indicator is over them
set showmatch
" How many tenths of a second to blink when matching brackets
set mat=2

" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Show line number and cursor line
set number
set cursorline

" Enable mouse use
set mouse=a

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Colors and Fonts
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Enable syntax highlighting
let python_highlight_all = 1
syntax on

colorscheme vim-monokai-tasty
set background=dark
set t_ut=

" Set utf8 as standard encoding
set encoding=utf8
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Show invisible charactors
"set listchars=space:·,eol:↲
"set list
"hi SpecialKey ctermbg=235


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Files, backups, and undo
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Turn backup off
set nobackup
set nowritebackup
set noswapfile

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Text, tab and indent related
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use spaces instead of tabs
set expandtab

" Be smart when using tabs
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

" Linebreak on 500 characters
set lbr
set tw=500

set autoindent "Auto indent
set smartindent "Smart indent
set wrap "Wrap lines

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Moving around, tabs, windows and buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Map <Space> to / (search) and Ctrl-<Space> to ? (backwards search)
map <space> /
map <c-space> ?

" Smart way to move between windows
"map <C-j> <C-W>j
"map <C-k> <C-W>k
"map <C-h> <C-W>h
"map <C-l> <C-W>l

" Map <Enter> to insert a new line
nmap <ENTER> o<ESC>
nmap <S-ENTER> O<ESC>

" Map <backspace> as deletion
nmap <backspace> X

" Copy/Paste (needs vim-gnome)
vmap <C-x> "+x
vmap <C-c> "+y


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Status line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Always show the status line
set laststatus=1

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Editing mappings
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap VIM 0 to first non-blank character
"map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NERDTree
" Automatically starts NERDTree
"autocmd VimEnter * NERDTree

" Automattically starts NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Open NERDTree when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif

" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" FZF 
set rtp+=~/.fzf


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Shortcut
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggle<CR>
map <F8> :TagbarToggle<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Function 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <F5> :call RunProgram()<CR>
map <F6> :call RunDebug()<CR>

func! RunProgram()
    exec "w"
    if &filetype == 'python'
        exec "!time ~/anaconda3/bin/python %"
    elseif &filetype == 'matlab'
        exec "!time /usr/local/MATLAB/R2019b/bin/matlab -batch %:r"
    endif
endfunc

func! RunDebug()
    exec "w"
    if &filetype == 'python'
        exec "!time ~/anaconda3/bin/python -m pdb %"
    elseif &filetype == 'matlab'
        exec "!time /usr/local/MATLAB/R2019b/bin/matlab -nodesktop -nosplash -r %:r"
    endif
endfunc

