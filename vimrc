"===============================================================================
" Boostrap Vim-Plug on new systems

"===============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
"===============================================================================

"===============================================================================
" Plugins ...
call plug#begin('~/.vim/plugged')
"===============================================================================
" https://github.com/tomtom/tcomment_vim
Plug 'tomtom/tcomment_vim'
" gcc - toggle comments for line
"-------------------------------------------------------------------------------
" https://github.com/osyo-manga/vim-over
Plug 'osyo-manga/vim-over'
nnoremap g/r :<c-u>OverCommandLine<cr>%s/
xnoremap g/r :<c-u>OverCommandLine<cr>%s/\%V
"-------------------------------------------------------------------------------
" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'
"-------------------------------------------------------------------------------
" https://github.com/vim-scripts/YankRing.vim
Plug 'vim-scripts/YankRing.vim'
let g:yankring_history_dir = '$HOME/.vim'
let g:yankring_min_element_length = 2
let g:yankring_paste_using_g = 0 "do not map gp and gP
"-------------------------------------------------------------------------------
" https://github.com/bling/vim-airline
Plug 'vim-airline'
if has("gui_macvim")
  let g:airline_theme = 'solarized'
else
  let g:airline_theme = 'molokai'
endif
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
" let g:airline#extensions#tabline#enabled = 1
set laststatus=2
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif
" unicode symbols
let g:airline_symbols.whitespace = 'Ξ'
" powerline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''
autocmd CmdwinLeave * :AirlineRefresh
"-------------------------------------------------------------------------------
" https://github.com/airblade/vim-gitgutter
Plug 'airblade/vim-gitgutter'
"-------------------------------------------------------------------------------
" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'
map f <Plug>(easymotion-s)
let g:EasyMotion_move_highlight = 0
"let g:EasyMotion_keys = 'asdfghkl;qwertyuiopzxcvbnm'
let g:EasyMotion_keys = "kl;,.o/iu'hnmxsdewfvrcgaqbtzp[]y123456789ABSDFGHKLQWERTYUIOPZXCV<:N{M>j"
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1
"-------------------------------------------------------------------------------
" https://github.com/junegunn/fzf.vim
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': 'yes \| ./install' }
Plug 'junegunn/fzf.vim'
let g:fzf_action = {
  \ 'ctrl-m': 'e',
  \ 'ctrl-t': 'tabedit',
  \ 'alt-j':  'botright split',
  \ 'alt-k':  'topleft split',
  \ 'alt-h':  'vertical topleft split',
  \ 'alt-l':  'vertical botright split' }
" Advanced customization using autoload functions
autocmd VimEnter * command! Colors
  \ call fzf#vim#colors({'left': '15%', 'options': '--reverse --margin 30%,0'})
"-------------------------------------------------------------------------------
" https://github.com/scrooloose/syntastic
Plug 'scrooloose/syntastic'
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
"-------------------------------------------------------------------------------
" https://github.com/tomasr/molokai
Plug 'tomasr/molokai'
"-------------------------------------------------------------------------------
" https://github.com/altercation/vim-colors-solarized
Plug 'altercation/vim-colors-solarized'
"-------------------------------------------------------------------------------
" https://github.com/xolox/vim-misc
Plug 'xolox/vim-misc'
" https://github.com/xolox/vim-session
Plug 'xolox/vim-session'
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession        " /so
nnoremap <leader>ss :SaveSession        " /ss
nnoremap <leader>sd :DeleteSession<CR>  " /sd
nnoremap <leader>sc :CloseSession<CR>   " /sc
"-------------------------------------------------------------------------------
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
let g:UltiSnipsEditSplit = "context"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"
"-------------------------------------------------------------------------------
" https://github.com/bronson/vim-trailing-whitespace
Plug 'bronson/vim-trailing-whitespace'
"-------------------------------------------------------------------------------
" " https://github.com/vim-scripts/LustyJuggler
" Plug 'vim-scripts/LustyJuggler'
" let g:LustyJugglerDefaultMappings = 0
" let g:LustyJugglerShowKeys = 'a'
" let g:LustyJugglerSuppressRubyWarning = 1
" nnoremap <leader>b :LustyJuggler<cr>
"-------------------------------------------------------------------------------
" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'
"-------------------------------------------------------------------------------
" https://github.com/dyng/ctrlsf.vim
Plug 'dyng/ctrlsf.vim'
let g:ctrlsf_context = '-B 5 -A 8'
" search for root of project
let g:ctrlsf_default_root = 'project'
let g:ctrlsf_mapping = {
            \ "next": "n",
            \ "prev": "N",
            \ }

xnoremap <leader>g :<c-u>CtrlSF <c-r>=<SID>/rch('/')<cr><cr>
nnoremap <leader>g :CtrlSF
silent! nnoremap <unique> <silent> <leader>G :CtrlSFOpen<cr>
"-------------------------------------------------------------------------------
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
let g:jsx_ext_required = 0
"-------------------------------------------------------------------------------
"===============================================================================
" Add plugins to &runtimepath
call plug#end()
"===============================================================================

" Colorscheme
if has("gui_macvim")
  set background=light
  colorscheme solarized
else
  colorscheme molokai
  set background=dark
endif
" colorscheme solarized

" Directories for swp files
set nobackup
set noswapfile

" Set leader key to <comma>
let mapleader=","

" Encoding
set bomb
set binary

if &term =~ '256color'
  set t_ut=
endif

" Map cursor for insert mode
if &term =~ "xterm\\|rxvt"
  let &t_SI .= "\<Esc>[5 q"
  let &t_EI .= "\<Esc>[0 q"
endif

" Disable the blinking cursor.
set gcr=a:blinkon0
set scrolloff=3
set nocursorline

" Use modeline overrides
set modeline
set modelines=10

set title
set titleold="Terminal"
set titlestring=%F

set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\

" Clipboard integration
set clipboard+=unnamedplus

" yanked stack (also, in visual mode)
" Use ,d (or ,dd or ,dj r 20,dd) to delete a line without adding it to the
nnoremap <silent> <leader>d " _d
vnoremap <silent> <leader>d " _d

" Set leader key to <comma>
let mapleader=","

" End Insert mode, back to Normal mode
inoremap jk <esc>

inoremap kj <esc>
cnoremap ;; <C-c>

" Marks with '
nnoremap ' `
nnoremap mm '
nnoremap ` '

" Start/End of line in Normal
" noremap HH ^
" noremap LL $
" imap <C-0> <C-o>0

" Split
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>

" Enable syntax highlighting
syntax on

" Re-use the same window and switch from an unsaved buffer without saving it
" first. Also allows you to keep an undo history for multiple files when
" re-using the same window in this way.
set hidden

" Better command-line completion
set wildmenu
set complete=.,w,b,u,t,i,kspell
" set spell

" Show partial commands in the last line of the screen
set fileformats=unix,dos,mac
set showcmd
set shell=/usr/local/bin/zsh

" Highlight searches
set hlsearch
set incsearch

" Use case insensitive search, except when using capital letters
set ignorecase
set smartcase

" Allow backspacing over autoindent, line breaks and start of insert action
set backspace=indent,eol,start

" When opening a new line and no filetype-specific indenting is enabled, keep
" the same indent as the line you're currently on. Useful for READMEs, etc.
set autoindent
set smartindent

" Display the cursor position on the last line of the screen or in the status
" line of a window
set ruler

" Always display the status line, even if only one window is displayed
set laststatus=2

" Instead of failing a command because of unsaved changes, instead raise a
" dialogue asking if you wish to save changed files.
" set confirm

" Use visual bell instead of beeping when doing something wrong
set visualbell

" And reset the terminal code for the visual bell. If visualbell is set, and
" this line is also included, vim will neither flash nor beep. If visualbell
" is unset, this does nothing.
set t_vb=

" Enable use of the mouse for all modes
set mouse=a

" Set the command window height to 2 lines, to avoid many cases of having to
" "press <Enter> to continue"
set cmdheight=2

" Display line numbers on the left
set number

" Use <F10> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F10>

" Watch for file changes
set autoread

" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set tabstop=2
set shiftwidth=2
set softtabstop=2
set expandtab

" Indentation settings for using hard tabs for indent. Display tabs as
" four characters wide.
" set shiftwidth=4
" set tabstop=4

" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
nnoremap Y y$

" Down N screen lines (differs from "j" when line wraps)
nnoremap j gj

" Backwards (upwards) N pages
nnoremap K <C-b>

" Toggle regular line numbers
nnoremap <leader>n :setlocal number!<cr>

"Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>

" <Ctrl> + <hjkl> for split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Adjust viewports to the same size
map <leader>= <C-w>=

" Stop search highlighting
nnoremap <silent> <leader>/ :nohlsearch<cr> " ,/

" Keep the cursor in place while joining lines
nnoremap J mzJ`z

" Allow multiple indentation/deindentation in visual mode
vnoremap < <gv
vnoremap > >gv

" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Keep search matches when jumping around
nnoremap g; g;zz
nnoremap g, g,zz

" Go to the position of the last change in this file"
nnoremap gI `.

" Quick insertion of newline in normal mode
nnoremap <silent> <cr> :put=''<cr>

" Highlight VCS conflict markers
match ErrorMsg '^\(<\|=\|>\)\{7\}\([^=].\+\)\?$'

" Shortcut to jump to next conflict marker
nnoremap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<CR>

" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap

" Select entire buffer
nnoremap vaa ggvGg_


" Sudo to write
cnoremap w!! w !sudo tee % >/dev/null

" Abbreviations
" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

" Movement between tabs OR buffers {{{1
nnoremap L :call MyNext()<CR>
nnoremap H :call MyPrev()<CR>
" Close buffer
noremap <leader>c :bd<CR>
" MyNext() and MyPrev(): Movement between tabs OR buffers
function! MyNext()
    if exists( '*tabpagenr' ) && tabpagenr('$') != 1
        " Tab support && tabs open
        normal gt
    else
        " No tab support, or no tabs open
        execute ":bnext"
    endif
endfunction
function! MyPrev()
    if exists( '*tabpagenr' ) && tabpagenr('$') != '1'
        " Tab support && tabs open
        normal gT
    else
        " No tab support, or no tabs open
        execute ":bprev"
    endif
endfunction

" Pull word under cursor into LHS of a substitute
:nmap <leader>z :%s#\<<c-r>=expand("<cword>")<cr>\>#

" Pull Visually Highlighted text into LHS of a substitute
:vmap <leader>z :<C-U>%s/\<<c-r>*\>/

" Open a quickfix window for the last search.
nnoremap <silent> <leader>? :execute 'vimgrep /'.@/.'/g %'<cr>:copen<cr>

" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

" Autoreload vim settings
augroup reload_vimrc " {
   autocmd!
   autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END " }

" Uncomment the following to have Vim jump to the last position when
" reopening a file
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$")
    \| exe "normal! g'\"" | endif
endif

" Pretty print json for current buffer
nnoremap <leader>j :%!python -m json.tool<cr>
xnoremap <leader>j :!python -m json.tool<cr>

" co? : Toggle options (inspired by unimpaired.vim)
function! s:map_change_option(...)
  let [key, opt] = a:000[0:1]
  let op = get(a:, 3, 'set '.opt.'!')
  execute printf("nnoremap co%s :%s<bar>echo '%s: '. &%s<cr>",
        \ key, op, opt, opt)
endfunction

call s:map_change_option('p', 'paste')
call s:map_change_option('n', 'number')
call s:map_change_option('w', 'wrap')
call s:map_change_option('h', 'hlsearch')
call s:map_change_option('l', 'list')
call s:map_change_option('x', 'cursorline')
call s:map_change_option('t', 'textwidth',
    \ 'let &textwidth = input("textwidth (". &textwidth ."): ")<bar>redraw')
call s:map_change_option('s', 'shiftwidth',
    \ 'let &shiftwidth = input("shiftwidth (". &shiftwidth ."): ")<bar>redraw')

" Insert/append single char in 'normal' mode
" s insert
:nnoremap s :exec "normal i".nr2char(getchar())."\e"<CR>
" S append
:nnoremap S :exec "normal a".nr2char(getchar())."\e"<CR>

"-------------------------------------------------------------------------------
" TWEAKS:
" EscNNiCEsc : inserts NN times char C
"-------------------------------------------------------------------------------

augroup fast_quit
  au!
  au FileType fzf-multisnippet nnoremap <buffer> q :q<cr>
  au FileType help nnoremap <buffer> q :q<cr>
  au FileType qf nnoremap <buffer> q :q<cr>
  au FileType netrw nnoremap <buffer><nowait> q :bd!<cr>
  au FileType man nnoremap <buffer> q :q<cr>
  au CmdwinEnter * nnoremap <buffer> q :q<cr>
  au BufReadPost fugitive://* nnoremap <buffer> q :q<cr>
augroup END

"------------------------------------------------------------------------------
" Disable recording
" -----------------------------------------------------------------------------
map q <Nop>

if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif
