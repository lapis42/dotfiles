""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => Vim-plug 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin()

" Autocompletion
Plug 'neoclide/coc.nvim', { 'branch': 'release' } " need nodejs, npm

" Latex
Plug 'lervag/vimtex', { 'for': 'tex' } " needs latexmk zathura

" Theme
Plug 'patstockwell/vim-monokai-tasty' 
Plug 'vim-airline/vim-airline' 
Plug 'Yggdroot/indentLine'

" Tmux
Plug 'christoomey/vim-tmux-navigator'

" Explorer
Plug 'scrooloose/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git
Plug 'airblade/vim-gitgutter'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Tag generation
Plug 'majutsushi/tagbar' " needs to install ctags
Plug 'lvht/tagbar-markdown' " needs php

" REPL
Plug 'jpalardy/vim-slime'

" C, C++
Plug 'rhysd/vim-clang-format', { 'for': ['c', 'cpp'] }

" Matlab
Plug 'yinflying/matlab.vim'

" Snippet
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
hi Type ctermfg=197
"hi SpecialKey ctermbg=235
"hi SpecialKey ctermbg=None
hi Normal ctermbg=None
hi VertSplit ctermbg=None

set t_ut=

" Set utf8 as standard encoding
set encoding=utf8
set langmenu=en_US
let $LANG = 'en_US'
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

" Show invisible charactors
"set list
"set listchars=tab:├─,trail:·,space:· 
"set listchars=space:·,eol:↲
"set listchars=space:·

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

" Copy/Paste (needs vim-gnome or vim-gtk3)
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
"""" coc.nvim

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

let g:coc_snippet_next = '<tab>'

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
"inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
"                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Remap <C-f> and <C-b> for scroll float windows/popups.
if has('nvim-0.4.0') || has('patch-8.2.0750')
  nnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  nnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
  inoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(1)\<cr>" : "\<Right>"
  inoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? "\<c-r>=coc#float#scroll(0)\<cr>" : "\<Left>"
  vnoremap <silent><nowait><expr> <C-f> coc#float#has_scroll() ? coc#float#scroll(1) : "\<C-f>"
  vnoremap <silent><nowait><expr> <C-b> coc#float#has_scroll() ? coc#float#scroll(0) : "\<C-b>"
endif

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of language server.
nmap <silent> <C-s> <Plug>(coc-range-select)
xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'

" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.)
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Use <leader>x for convert visual selected code to snippet
xmap <leader>x  <Plug>(coc-convert-snippet)


" NERDTree
let NERDTreeMinimalUI=1
" Automatically starts NERDTree if no files were specified
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTreeToggleVCS | endif
" Open NERDTree when vim starts up on opening a directory
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | wincmd p | ene | exe 'cd '.argv()[0] | exe 'NERDTreeToggleVCS' argv()[0] | endif
" Open NERDTree when vim starts up on opening a file 
autocmd VimEnter * if argc() == 1 && !isdirectory(argv()[0]) && !exists("s:std_in") | NERDTreeToggleVCS | wincmd p | endif
" Close vim if the only window left open is a NERDTree
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() |
            \ quit | endif

" airline
let g:airline_theme = 'monokai_tasty'
let g:airline_powerline_fonts = 1


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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" =>  Shortcut
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <C-n> :NERDTreeToggleVCS<CR>
map <F8> :TagbarToggle<CR>
autocmd FileType python nnoremap <F7> :0,$!yapf<Cr><C-o>
autocmd FileType c,cpp,objc nnoremap <F7> :ClangFormat<Cr><C-o>
map <F10> :vne \| :e $MYVIMRC<CR>

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
            !python "%"
        else
            silent! !tmux send-key -t {next} "run '%:p'" Enter
            redraw!
        endif
    elseif &filetype == 'matlab'
        if ($TMUX=="")
            !matlab -batch "%:r"
        else
            silent! !tmux send-key -t {next} "run('%:p')" Enter
            redraw!
        endif
    elseif &filetype == 'tex'
        :VimtexCompile
        ":VimtexClean
    elseif &filetype == 'markdown'
        !pandoc "%:p" -s -o "%:p:r.pdf" && evince "%:p:r.pdf"
    elseif &filetype == 'c'
        if ($TMUX=="")
            !gcc "%:p" -o "%:p:r" && "%:p:r"
        else
            silent !tmux send-key -t {next} "gcc %:p -o %:p:r && %:p:r" Enter
            redraw!
        endif
    elseif &filetype == 'cpp'
        if ($TMUX=="")
            !g++ "%:p" -o "%:p:r" -O2 -Wall -lm && "%:p:r"
        else
            silent !tmux send-key -t {next} "g++ %:p -o %:p:r -O2 -Wall -lm && %:p:r" Enter
            redraw!
        endif
    elseif &filetype == 'java'
        if ($TMUX=="")
            !javac -encoding UTF-8 "%:p" && java "%:p:r"
        else
            silent !tmux send-key -t {next} "javac -encoding UTF-8 %:p && java %:r" Enter
            redraw!
        endif
    endif
endfunc

func! RunDebug()
    exec "w"
    if &filetype == 'python'
        !pypy3 -m pdb "%"
    elseif &filetype == 'matlab'
        "!matlab -nodesktop -nosplash -r %:p:r
        if ($TMUX=="")
            !matlab -batch "%:r"
        else
            silent! !tmux send-key -t {next} "try;run('%:p');tgprintf('Done\n');catch err;disp(err.message);tgprintf('Error\n');end;" Enter
            redraw!
        endif
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
