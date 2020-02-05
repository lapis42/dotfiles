""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')

" Autocompletion
Plug 'Valloric/YouCompleteMe', { 'do': './install.py --all' } " needs build-essential cmake python3-dev

" Latex
Plug 'lervag/vimtex', { 'for': 'tex' } " needs latexmk zathura

" Theme
Plug 'patstockwell/vim-monokai-tasty' 
Plug 'vim-airline/vim-airline' 

" Navigation
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/fzf', { 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Tag generation
Plug 'majutsushi/tagbar' " needs to install ctags
Plug 'lvht/tagbar-markdown' " needs php

" REPL
Plug 'jpalardy/vim-slime'

" Snippet
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

call plug#end()


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
"set ignorecase

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

"Show the next match while entering a search
set incsearch

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
map 0 ^

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Misc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remove the Windows ^M - when the encodings gets messed up
noremap <Leader>m mmHmt:%s/<C-V><cr>//ge<cr>'tzt'm


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Plugin 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" YouCompleteMe
let g:ycm_autoclose_preview_window_after_completion=1


" NERDTree
let NERDTreeMinimalUI=1
" Automatically starts NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
" Open NERDTree when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'cd '.argv()[0] | exe 'NERDTree' argv()[0] | endif
" Open NERDTree when vim starts up on opening a file 
"autocmd VimEnter * if argc() == 1 && !isdirectory(argv()[0]) && !exists("s:std_in") | NERDTree | wincmd p | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif


" airline
let g:airline_theme = 'monokai_tasty'
let g:airline_powerline_fonts = 1


" FZF 
set rtp+=~/.fzf


" tagbar
let g:tagbar_sort = 0
let g:tagbar_type_matlab = {
        \ 'ctagstype' : 'matlab',
        \ 'kinds' : [
            \ 't:TODO',
            \ 'f:function',
            \ 's:Section'
        \ ],
        \ 'sort' : 0
\ }
" Open tagbar if a supported file is open
"autocmd VimEnter * nested :call tagbar#autoopen(1)
" Open tagbar if a supported file is open in an already running Vim
"autocmd FileType * nested :call tagbar#autoopen(0)


" vim-slime
let g:slime_target = "tmux"
let g:slime_python_ipython = 1
let g:slime_dont_ask_default = 1
let g:slime_default_config = {"socket_name": "default", "target_pane": "{next}"}


" ultisnips
let g:UltiSnipsExpandTrigger="<F7>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

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
map <F9> :call RunCell()<CR>

func! RunProgram()
    exec "w"
    if &filetype == 'python'
        if ($TMUX=="")
            !python %
        else
            silent! !tmux send-key -t {next} \%run\ %:p Enter
            redraw!
        endif
    elseif &filetype == 'matlab'
        if ($TMUX=="")
            !matlab -batch %:r
        else
            silent! !tmux send-key -t {next} run\(\'%:p\'\) Enter
            redraw!
        endif
    elseif &filetype == 'tex'
        :VimtexCompile
        ":VimtexClean
    elseif &filetype == 'markdown'
        !pandoc %:p -s -o %:p:r.pdf && evince %:p:r.pdf
    elseif &filetype == 'c'
        !gcc %:p -o %:p:r && .%:p:r
    endif
endfunc

func! RunDebug()
    exec "w"
    if &filetype == 'python'
        !python -m pdb %
    elseif &filetype == 'matlab'
        !matlab -nodesktop -nosplash -r %:p:r
    endif
endfunc

func! RunCell()
    if &filetype == 'python'
        exec "normal j?##\<CR>v/##\<CR>\<c-c>\<c-c>n"
        :nohl
    elseif &filetype == 'matlab'
        exec "normal j?%%\<CR>v/%%\<CR>\<c-c>\<c-c>n"
        :nohl
    endif
endfunc
