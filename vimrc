
set nocompatible
filetype off
set ttyfast

"===============================================================================
" Boostrap Vim-Plug on new systems
"===============================================================================
if empty(glob('~/.vim/autoload/plug.vim'))
    silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

" Plugins ...
call plug#begin('~/.vim/plugged')

" https://github.com/tomtom/tcomment_vim
Plug 'tomtom/tcomment_vim' " gcc - toggle comments for line

" https://github.com/osyo-manga/vim-over
Plug 'osyo-manga/vim-over'

" https://github.com/tpope/vim-repeat
Plug 'tpope/vim-repeat'

" https://github.com/vim-scripts/YankRing.vim
" Plug 'vim-scripts/YankRing.vim'

" https://github.com/bling/vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" https://github.com/airblade/vim-gitgutter
" Plug 'airblade/vim-gitgutter'

" https://github.com/easymotion/vim-easymotion
Plug 'easymotion/vim-easymotion'

" https://github.com/scrooloose/syntastic
Plug 'scrooloose/syntastic'

" https://github.com/tomasr/molokai
Plug 'tomasr/molokai'

" https://github.com/altercation/vim-colors-solarized
Plug 'altercation/vim-colors-solarized'

" https://github.com/flazz/vim-colorschemes
Plug 'flazz/vim-colorschemes'

" https://github.com/xolox/vim-misc
Plug 'xolox/vim-misc'

" https://github.com/SirVer/ultisnips
Plug 'SirVer/ultisnips'

" https://github.com/honza/vim-snippets
Plug 'honza/vim-snippets'

" https://github.com/bronson/vim-trailing-whitespace
Plug 'bronson/vim-trailing-whitespace'

" https://github.com/tpope/vim-surround
Plug 'tpope/vim-surround'

" https://github.com/tpope/vim-fugitive
Plug 'tpope/vim-fugitive'

" https://github.com/dyng/ctrlsf.vim
Plug 'dyng/ctrlsf.vim'

" https://github.com/pangloss/vim-javascript
Plug 'pangloss/vim-javascript'

" https://github.com/'mxw/vim-jsx
Plug 'mxw/vim-jsx'

" http://myusuf3.github.com/numbers.vim
Plug 'myusuf3/numbers.vim'

" https://kien.github.io/ctrlp.vim
" Plug 'kien/ctrlp.vim'

" https://github.com/Shougo/unite.vim
Plug 'Shougo/unite.vim' " Navigation between buffers and files
Plug 'Shougo/vimproc.vim', {'do' : 'make'}
Plug 'Shougo/neoyank.vim'

" https://github.com/majutsushi/tagbar
Plug 'majutsushi/tagbar' " Class/module browser

" https://github.com/rosenfeld/conque-term
Plug 'rosenfeld/conque-term' " Consoles as buffers

" https://github.com/scrooloose/nerdtree
Plug 'scrooloose/nerdtree'

" https://github.com/Xuyuanp/nerdtree-git-plugin
Plug 'Xuyuanp/nerdtree-git-plugin'

" https://github.com/davidhalter/jedi-vim'
Plug 'davidhalter/jedi-vim' " Awesome Python autocompletion with VIM

" https://github.com/klen/python-mode
Plug 'klen/python-mode'

" https://github.com/mitsuhiko/vim-jinja
Plug 'mitsuhiko/vim-jinja' " Jinja support for vim

" https://github.com/mitsuhiko/vim-python-combined
" Plug 'mitsuhiko/vim-python-combined' " Combined Python 2/3 for Vim

" https://github.com/hynek/vim-python-pep8-indent
Plug 'hynek/vim-python-pep8-indent' " PEP8 indent

" https://github.com/jmcantrell/vim-virtualenv
Plug 'jmcantrell/vim-virtualenv' " Virtualenv support in VIM

" https://github.com/udalov/kotlin-vim
Plug 'udalov/kotlin-vim'


"===============================================================================
" Add plugins to &runtimepath
call plug#end()
"===============================================================================


"===============================================================================

" Display line numbers on the left
set number

" This must happen before the syntax system is enabled
" aunmenu Help.
" aunmenu Window.
let no_buffers_menu=1
set mousemodel=popup


" osyo-manga/vim-over
nnoremap g/r :<c-u>OverCommandLine<cr>%s/
xnoremap g/r :<c-u>OverCommandLine<cr>%s/\%V


" vim-scripts/YankRing.vim
" let g:yankring_history_dir = '$HOME/.vim'
" let g:yankring_min_element_length = 2
" let g:yankring_paste_using_g = 0 "do not map gp and gP


" vim-airline/vim-airline-themes
if has("gui_running")
  " let g:airline_theme = 'solarized'
  let g:airline_theme='powerlineish'
else
  let g:airline_theme = 'molokai'
endif
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
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


" easymotion/vim-easymotion
map f <Plug>(easymotion-s)
let g:EasyMotion_move_highlight = 0
"let g:EasyMotion_keys = 'asdfghkl;qwertyuiopzxcvbnm'
let g:EasyMotion_keys = "kl;,.o/iu'hnmxsdewfvrcgaqbtzp[]y123456789ABSDFGHKLQWERTYUIOPZXCV<:N{M>j"
let g:EasyMotion_do_shade = 0
let g:EasyMotion_smartcase = 1


" scrooloose/syntastic
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_error_symbol = '✗'
let g:syntastic_warning_symbol = '⚠'
let g:syntastic_style_error_symbol = '✗'
let g:syntastic_style_warning_symbol = '⚠'
let g:syntastic_auto_loc_list = 1
let g:syntastic_aggregate_errors = 1
let g:syntastic_javascript_checkers = ['eslint']
noremap <F7> :w<cr>:SyntasticCheck<cr>


" xolox/vim-session
let g:session_directory = "~/.vim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1
nnoremap <leader>so :OpenSession        " /so
nnoremap <leader>ss :SaveSession        " /ss
nnoremap <leader>sd :DeleteSession<cr>  " /sd
nnoremap <leader>sc :CloseSession<cr>   " /sc


" honza/vim-snippets
let g:UltiSnipsExpandTrigger = "<tab>"
let g:UltiSnipsJumpForwardTrigger = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<c-b>"
let g:UltiSnipsEditSplit = "context"
let g:UltiSnipsSnippetsDir = "~/.vim/UltiSnips"


" dyng/ctrlsf.vim
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


" mxw/vim-jsx
let g:jsx_ext_required = 0


" myusuf3/numbers.vim
nnoremap <F3> :NumbersToggle<cr>
nnoremap <F4> :NumbersOnOff<cr>
let g:numbers_exclude = ['tagbar', 'gundo', 'minibufexpl', 'nerdtree']


" kien/ctrlp.vim
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlP'
" set wildignore+=*/tmp/*,*.so,*.swp,*.zip
" let g:ctrlp_custom_ignore = {
	" \ 'dir':  '\v[\/]\.(git|hg|svn)$',
	" \ 'file': '\v\.(exe|so|dll)$',
	" \ 'link': 'SOME_BAD_SYMBOLIC_LINKS',
	" \ }


" Shougo/unite.vim
" browse a list of the currently opened buffers
nnoremap <F2> :Unite buffer<cr>
" file search
nnoremap <c-p> :Unite file_rec/async<cr>
" content search
nnoremap <space>/ :Unite grep:.<cr>
" yank history
" let g:unite_source_history_yank_enable = 1
" nnoremap <space>y :Unite history/yank<cr>
" buffer switching
nnoremap <space>s :Unite -quick-match buffer<cr>
if executable('ag')
  let g:unite_source_grep_command = 'ag'
  let g:unite_source_grep_default_opts = '-i --vimgrep --ignore ''.hg'' --ignore ''.svn'' --ignore ''.git'' --ignore ''.bzr'' --hidden'
  let g:unite_source_grep_recursive_opt = ''
elseif executable('pt')
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor'
    let g:unite_source_grep_recursive_opt = ''
elseif executable('ack')
    let g:unite_source_grep_command = 'ack'
    let g:unite_source_grep_default_opts = '-i --no-heading --no-color -k -H'
    let g:unite_source_grep_recursive_opt = ''
endif
function! s:unite_settings()
    nmap <buffer> Q <plug>(unite_exit)
    nmap <buffer> <esc> <plug>(unite_exit)
    imap <buffer> <esc> <plug>(unite_exit)
endfunction
autocmd FileType unite call s:unite_settings()

nmap <space> [unite]
nnoremap [unite] <nop>


" majutsushi/tagbar
map <F5> :TagbarToggle<cr>
let g:tagbar_autofocus = 0 " autofocus on Tagbar open


" rosenfeld/conque-term
nnoremap <F6> :ConqueTermSplit ipython<cr> " run python-scripts at <F6>
nnoremap <F7> :exe "ConqueTermSplit ipython " . expand("%")<cr> " and debug-mode for <F7>
let g:ConqueTerm_StartMessages = 0
let g:ConqueTerm_CloseOnEnd = 0


" scrooloose/nerdtree
map <F1> :NERDTreeToggle<cr>
" let g:NERDTreeDirArrowExpandable = '▸'
" let g:NERDTreeDirArrowCollapsible = '▾'
" Open NERDTree automatically when vim starts up on opening a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" davidhalter/jedi-vim
let g:jedi#force_py_version = 3
let g:jedi#show_call_signatures = 1 " Show call signatures
let g:jedi#popup_on_dot = 1         " Enable autocomplete on dot
let g:jedi#popup_select_first = 0   " Disable first select from auto-complete


" klen/python-mode
" Keys:
" K             Show python docs
" <Ctrl-Space>  Rope autocomplete
" <Ctrl-c>g     Rope goto definition
" <Ctrl-c>d     Rope show documentation
" <Ctrl-c>f     Rope find occurrences
" <Leader>b     Set, unset breakpoint (g:pymode_breakpoint enabled)
" [[            Jump on previous class or function (normal, visual, operator modes)
" ]]            Jump on next class or function (normal, visual, operator modes)
" [M            Jump on previous class or method (normal, visual, operator modes)
" ]M            Jump on next class or method (normal, visual, operator modes)
let g:pymode_rope = 1
let g:pymode_python = 'python3'
" Documentation
let g:pymode_doc = 1
let g:pymode_doc_key = 'K'
"Linting
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
" Auto check on save
let g:pymode_lint_write = 1
" Support virtualenv
let g:pymode_virtualenv = 1
" Enable breakpoints plugin
let g:pymode_breakpoint = 1
let g:pymode_breakpoint_bind = '<leader>b'
" syntax highlighting
let g:pymode_syntax = 1
let g:pymode_syntax_all = 1
let g:pymode_syntax_indent_errors = g:pymode_syntax_all
let g:pymode_syntax_space_errors = g:pymode_syntax_all
" Don't autofold code
let g:pymode_folding = 0


" Colorscheme
if has("gui_running")
  set background=light
  colorscheme solarized
else
   colorscheme molokai
  set background=dark
endif


set timeoutlen=1000 ttimeoutlen=0


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


" Show a visual line under the cursor's current line
set cursorline


" Show the matching part of the pair for [] {} and ()
set showmatch


" Use modeline overrides
set modeline
set modelines=10


set title
set titleold="Terminal"
set titlestring=%F


set statusline=(%{fugitive#statusline()})%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\


" Clipboard integration
set clipboard+=unnamed

" yanked stack (also, in visual mode)
" Use ,d (or ,dd or ,dj r 20,dd) to delete a line without adding it to the
" clipboard
nnoremap <silent> <leader>d " _d
vnoremap <silent> <leader>d " _d


" End Insert mode, back to Normal mode
inoremap jk <esc>
inoremap kj <esc>
cnoremap ;; <c-c>


" Marks with '
nnoremap ' `
nnoremap mm '
nnoremap ` '


" Start/End of line in Normal
" noremap HH ^
" noremap LL $
" imap <C-0> <C-o>0


" Split
noremap <Leader>h :<c-u>split<cr>
noremap <Leader>v :<c-u>vsplit<cr>


" Enable syntax highlighting
syntax on
if has("gui_running")
    set macmeta
    set lines=53 columns=155
endif


" special settings for vim
if has("mac")
    let macvim_hig_shift_movement = 1
endif


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


" Use <F10> to toggle between 'paste' and 'nopaste'
set pastetoggle=<F10>


" Watch for file changes
set autoread


" Indentation settings for using 4 spaces instead of tabs.
" Do not change 'tabstop' from its default value of 8 with this setup.
set tabstop=4
set shiftwidth=4
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
" nnoremap <leader>n :setlocal relativenumber!<cr>


"Toggle [i]nvisible characters
nnoremap <leader>i :set list!<cr>



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
nnoremap <silent> <leader>c /^\(<\\|=\\|>\)\{7\}\([^=].\+\)\?$<cr>


" Use Q for formatting the current paragraph (or visual selection)
vnoremap Q gq
nnoremap Q gqap


" Select entire buffer
nnoremap vaa ggvGg_


" Customize the wildmenu
set wildmenu
set wildignore+=*.dll,*.o,*.pyc,*.bak,*.exe,*.jpg,*.jpeg,*.png,*.gif,*$py.class,*.class,*/*.dSYM/*,*.dylib
set wildmode=list:full


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


" Close buffer
noremap <leader>c :bd<cr>
map <c-q> :bd<cr>


" Easier change size for splitted windows
nnoremap {{ :vertical resize +5<cr>
nnoremap }} :vertical resize -5<cr>


" Activate autocomplete at <Ctrl+Space>
inoremap <c-space> <c-x><c-o>


" Generate and insert UUID4 into code by <F12> key
nnoremap <F12> :call InsertUUID4()<cr>


" <Ctrl> + <hjkl> for split navigation
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" Navigation between tabs OR buffers
nnoremap L :call MyNext()<cr>
nnoremap H :call MyPrev()<cr>
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
:nnoremap s :exec "normal i".nr2char(getchar())."\e"<cr>
" S append
:nnoremap S :exec "normal a".nr2char(getchar())."\e"<cr>


" Easier moving of code blocks
vnoremap < <gv " Shift+> keys
vnoremap > >gv " Shift+< keys


" Backspace in Visual mode deletes selection
vnoremap <BS> d


"-------------------------------------------------------------------------------
" TWEAKS:
" EscNNiCEsc : inserts NN times char C
"-------------------------------------------------------------------------------


augroup fast_quit
  au!
  au FileType help nnoremap <buffer> q :q<cr>
  au FileType qf nnoremap <buffer> q :q<cr>
  au FileType netrw nnoremap <buffer><nowait> q :bd!<cr>
  au FileType man nnoremap <buffer> q :q<cr>
  au CmdwinEnter * nnoremap <buffer> q :q<cr>
  au BufReadPost fugitive://* nnoremap <buffer> q :q<cr>
augroup END


" Disable recording
map q <Nop>


if has("gui_macvim")
  let macvim_hig_shift_movement = 1
endif

"------------------------------------------------------------------------------
" Python
"------------------------------------------------------------------------------
let python_highlight_all=1
let python_highlight_exceptions=0
let python_highlight_builtins=0
let python_slow_sync=1
autocmd FileType python setlocal completeopt-=preview
autocmd FileType python setlocal expandtab shiftwidth=4 tabstop=8
\ formatoptions+=croq softtabstop=4 smartindent
\ cinwords=if,elif,else,for,while,try,except,finally,def,class,with
autocmd FileType pyrex setlocal expandtab shiftwidth=4 tabstop=8 softtabstop=4 smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,with
let g:syntastic_python_checkers = ['flake8-py3', 'python3']
let g:syntastic_python_flake8_args='--ignore=E121,E128,E711,E301,E261,E241,E124,E126,E721 --max-line-length=80'

" Python code check on PEP8
autocmd FileType python map <buffer> <leader>8 :PymodeLint<cr>
"-------------------------------------------------------------------------------
" Small helper that inserts a random uuid4
"-------------------------------------------------------------------------------
function! InsertUUID4()
python << endpython
if 1:
    import uuid, vim
    s = str(uuid.uuid4())
    cpos = vim.current.window.cursor
    cline = vim.current.line
    vim.current.line = cline[:cpos[1] + 1] + s + cline[cpos[1] + 1:]
    vim.current.window.cursor = (cpos[0], cpos[1] + len(s))
endpython
endfunction


" Netrw built in file browser
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 2
let g:netrw_altv = 1
let g:netrw_winsize = 30
" augroup ProjectDrawer
  " autocmd!
  " autocmd VimEnter * :Vexplore
" augroup END


" Automatically change window's cwd to file's dir
set autochdir


" More subtle popup colors
if has ('gui_running')
    highlight Pmenu guibg=#cccccc gui=bold
endif

