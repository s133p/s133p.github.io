set nocompatible
set exrc
set secure

let mapleader=';'

"======== [VUNDLE BEGIN] ========{{{
filetype off                                  " required
set rtp+=~/.vim/bundle/Vundle.vim             " required
call vundle#begin()                           " required
Plugin 'VundleVim/Vundle.vim'

Plugin 'tpope/vim-sensible'                   " [vim-sensible]        = Sensible defaults
Plugin 'tpope/vim-repeat'                     " [vim-repeat]          = Allow plugin mappings to be repeated w/ '.'
Plugin 'tpope/vim-unimpaired'                 " [vim-unimpaired]      = paired mappings
Plugin 'tpope/vim-abolish'                    " [vim-abolish]         = Coerce cases
Plugin 'michaeljsmith/vim-indent-object'      " [vim-indent-object]   = Use indent levels as text objects
Plugin 'tomtom/tcomment_vim'                  " [tcomment]            = Shortcuts for commenting
Plugin 'spiiph/vim-space'                     " [vim-space]           = Use spacebar to repeat last movement
Plugin 'Shougo/unite.vim'                     " [unite.vim]           = Fully replaces Ctrl-P & much more
Plugin 'sgur/unite-qf'                        " [unite-qf]            = Quickfix for unite
Plugin 'shougo/neomru.vim'                    " [neomru]              = MRU for unite, replaces startify
Plugin 'vim-scripts/a.vim'                    " [a.vim]               = Swap between cpp & hpp
Plugin 'tpope/vim-surround'                   " [vim-surround]        = Does what it says on the tin
Plugin 'airblade/vim-rooter'                  " [vim-rooter]          = Change directory to root of projects
Plugin 'tpope/vim-fugitive'                   " [vim-fugitive]        = Git integration
Plugin 'junegunn/vim-easy-align'              " [vim-easy-align]      = Replacees tabular, includes text-obj mappings
Plugin 'kshenoy/vim-signature'                " [vim-signature]       = marks in sidebar
Plugin 'scrooloose/nerdtree'                  " [nerdtree]            = file tree
Plugin 'plasticboy/vim-markdown'              " [vim-markdown]        = markdown highlighting
Plugin 'vim-airline/vim-airline'              " [vim-airline]         = Better tab/status line
Plugin 'vim-airline/vim-airline-themes'       " [vim-airline-themes]  = Themes for airline
Plugin 'morhetz/gruvbox'                      " [gruvbox]             = Pretty theme!
Plugin 'vim-scripts/dbext.vim'                " [dbext.vim]           = databases from within vim
Plugin 'gfontenot/vim-xcode'                  " [vim-xcode]           = Xcode integration

Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}    " [sparkup]             = shortcut format for generating html/xml
Plugin 'jiangmiao/auto-pairs'                 " [auto-pairs]          = Auto-create pair & jump to end if matching pair typed
Plugin 's133p/vim-magic-template'             " [vim-magic-template]  = make .h/.cpp interactively from template (personal)
Plugin 'sjl/gundo.vim'                        " [gundo.vim]           = run :Gundo to get visual change history

if has("win32")
    Plugin 'Shougo/neocomplcache.vim'         " [neocomplcache.vim]   = Autocomplete across buffers
elseif has("mac")
    Plugin 'Valloric/YouCompleteMe'           " [YouCompleteMe]       = Clang based completeion
endif

call vundle#end()                             " required
filetype plugin indent on                     " required
"======== [VUNDLE END] ========}}}

"======== [Settings] ========{{{
filetype indent plugin on
syntax on
set hidden
set showcmd
set nohlsearch
set nostartofline
set confirm
set novisualbell
set t_vb=
set mouse=a
set cmdheight=2
set notimeout ttimeout ttimeoutlen=200
set relativenumber
set number
set cul
set scrolloff=6
set splitbelow
set splitright
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
set noswapfile
set nowrap
set lazyredraw
set encoding=utf8
set t_Co=256
set switchbuf=usetab
set shortmess=I

" TESTING!!
set list                              " show whitespace
set listchars=nbsp:⦸                  " CIRCLED REVERSE SOLIDUS (U+29B8, UTF-8: E2 A6 B8)
set listchars+=tab:▷┅                 " WHITE RIGHT-POINTING TRIANGLE (U+25B7, UTF-8: E2 96 B7)
                                      " + BOX DRAWINGS HEAVY TRIPLE DASH HORIZONTAL (U+2505, UTF-8: E2 94 85)
set listchars+=extends:»              " RIGHT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00BB, UTF-8: C2 BB)
set listchars+=precedes:«             " LEFT-POINTING DOUBLE ANGLE QUOTATION MARK (U+00AB, UTF-8: C2 AB)
set listchars+=trail:•                " BULLET (U+2022, UTF-8: E2 80 A2)
"======== [END Settings] ========}}}

"======== [Search Settings] ========{{{
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr>
"======== [END Search Settings] ========}}}

"======== [Gvim / MacVim] ========{{{
if has("win32")
    "gvim specific
    set shellslash
    "set autochdir
    set guioptions=c  "only console prompt, no other ui-chrome
    set guifont=Sauce_Code_powerline:h10:cANSI:qDRAFT

    " Fullscreen on app-start
    au GUIEnter * simalt ~x
elseif has("mac")
    " macvim options
    set guioptions=c  "only console prompt, no other ui-chrome
    set guifont=Hack\ Regular:h12
endif
"======== [END Gvim / MacVim] ========}}}

"======== [MAPPINGS] ========{{{

"EXPERIMENTAL! But so-far, seem really good!
    "- operator pending for 'stamp'
    nmap <silent> s :set opfunc=MagicStamp<CR>g@
    vmap <silent> s :<C-U>call MagicStamp(visualmode())<CR>
    " non-operator pending: Stamp lasy yank, normal & visual
    nnoremap S viw"0p

    "- operator pending for 'system-clipboard-yank'
    nmap <silent> <leader>y :set opfunc=MagicClip<CR>g@
    vmap <silent> <leader>y :<C-U>call MagicClip(visualmode())<CR>

    "- operator pending for 'system-clipboard-paste-stamp'
    nmap <silent> <leader>s :set opfunc=MagicPaste<CR>g@
    vmap <silent> <leader>s :<C-U>call MagicPaste(visualmode())<CR>
    " non-operator echo: Paste fron system clipboard
    nnoremap <leader>p "*p
    nnoremap <leader>P "*P

    function! MagicStamp(type, ...)
        call MagicDo(a:type, "\"0p", a:000)
    endfunction

    function! MagicClip(type, ...)
        call MagicDo(a:type, "\"*y", a:000)
    endfunction

    function! MagicPaste(type, ...)
        call MagicDo(a:type, "\"*p", a:000)
    endfunction

    function! MagicDo(type, what_magic, ...)
        let sel_save = &selection
        let &selection = "inclusive"
        let reg_save = @@

        if a:type == 'v'  " Invoked from Visual mode, use gv command.
            silent exe "normal! gv" . a:what_magic
        elseif a:type == 'line'
            silent exe "normal! '[V']" . a:what_magic
        else
            silent exe "normal! `[v`]" . a:what_magic
        endif

        let &selection = sel_save
        let @@ = reg_save
    endfunction
    "END EXPERIMENTAL!

" yank til EOL
nnoremap Y y$ 

" Shorcuts for common actions
noremap <Leader><Leader> :

noremap <Leader>ww :w<CR>
noremap <Leader>wq :wq<CR>
nnoremap <leader>x :q<CR>
nnoremap <leader>q :q<CR>
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

" Movement between splits/windows/buffers
nnoremap gk <C-W>k
nnoremap gj <C-W>j
nnoremap gh <C-W>h
nnoremap gl <C-W>l
nnoremap <left> <c-w><left>
nnoremap <right> <c-w><right>
nnoremap <up> <c-w><up>
nnoremap <down> <c-w><down>
nnoremap gH :tabprevious<cr>
nnoremap gL :tabnext<cr>
nnoremap gw <c-w>
nnoremap gb :bnext<cr>
nnoremap gB :bprevious<cr>

" create splits/tabs
nnoremap <leader>v :vnew<CR>
nnoremap <leader>V :new<CR>
nnoremap <leader>t :tabnew<CR>

" swap defauly behavior of ' and ` (jump to mark/jump to mark @ col)
noremap ' `
noremap ` '

" J & K as page-up/page-down, orginal functions shadowed on <leader>
nnoremap J <c-d>
vnoremap J <c-d>
nnoremap K <c-u>
vnoremap K <c-u>
nnoremap <leader>J J
nnoremap <leader>K K

" Execute current line or current selection as Vim EX commands.
nnoremap <leader>e :exe getline(".")<CR>
vnoremap <leader>e :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>

augroup myfolding
    au!
    autocmd FileType vim setlocal fdm=marker
    autocmd FileType c,cpp setlocal fdm=syntax
    autocmd FileType c,cpp,vim setlocal nofoldenable
augroup END

" `<Tab>`/`<S-Tab>` to move between matches without leaving incremental search.
" Note dependency on `'wildcharm'` being set to `<C-z>` in order for this to
" work.
set wildcharm=<c-z>
cnoremap <expr> <Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>/<C-r>/' : '<C-z>'
cnoremap <expr> <S-Tab> getcmdtype() == '/' \|\| getcmdtype() == '?' ? '<CR>?<C-r>/' : '<S-Tab>'

" Personal notes: Opens unite in g:personal_notes_dir or g:personal_nv_notes_dir
" based on invocation
function! OpenPersonalNotes(type)
    if !exists("g:personal_notes_dir")
        let g:personal_notes_dir="~/Dropbox/vim-notes"
    endif
    if !exists("g:personal_nv_notes_dir")
        let g:personal_nv_notes_dir="~/Dropbox/NV-Notes"
    endif

    " Open Unite in notes directory
    if a:type == 'n'
        execute "Unite -path=" . g:personal_notes_dir . " -start-insert -no-split file_rec"
    elseif a:type == 'v'
        execute "Unite -path=" . g:personal_nv_notes_dir . " -start-insert -no-split file_rec"
    endif
endfunction
nnoremap <leader>n :call OpenPersonalNotes('n')<cr>
nnoremap <leader>N :call OpenPersonalNotes('v')<cr>

"======== [END MAPPINGS] ========}}}

"======== [Plugin mappings/settings] ========{{{

" [vim-easy-align] {{{
" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)
if !exists('g:easy_align_delimiters')
    let g:easy_align_delimiters = {}
endif
let g:easy_align_delimiters['r'] = { 'pattern': '=', 'ignore_groups': ['String'], 'left_margin': 2  }

" [END vim-easy-align] }}}

" [gruvbox] {{{
colorscheme gruvbox
set background=dark
" [END gruvbox] }}}

" [nerdtree] {{{
map <C-n> :NERDTreeToggle<CR>
" [END nerdtree] }}}

" [YouCompleteMe] {{{
let g:ycm_confirm_extra_conf = 0                              " Don't confirm on load
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' " provide some defaults
" [END YouCompleteMe] }}}

" [vim-airline] {{{
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#show_splits = 0
let g:airline#extensions#tabline#tab_nr_type = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#tabline#fnamemod = ':p:t'
" [END vim-airline] }}}

" [vim-rooter] (auto cd to project roots) {{{
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_targets = '/,*'
" [END vim-rooter] (auto cd to project roots) }}}

" [vim-markdown] {{{
let g:vim_markdown_fenced_languages = ['c=c']
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 6
augroup mkdownNotes
    au!
    " On osx-only (until I can get it working under windows):
    " Call MakeHtmlPreview function from vim-magic-template on each write of
    " personal notes
    if has("mac")
        autocmd BufWritePost ~/Dropbox/vim-notes/*.md silent call MakeHtmlPreview()
    endif
augroup END
augroup markdown
    au!
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    autocmd BufNewFile,BufReadPost *.md setlocal wrap
    autocmd BufNewFile,BufReadPost *.md nnoremap <buffer> j gj
    autocmd BufNewFile,BufReadPost *.md nnoremap <buffer> k gk
    autocmd BufNewFile,BufReadPost *.md setlocal linebreak
    autocmd BufEnter,BufnewFile *.md setlocal spell
    autocmd FileType markdown setlocal nofoldenable

    autocmd FileType markdown nnoremap <buffer> <leader>mc :Toc<cr>
    autocmd FileType markdown nmap <buffer> <leader>a A<cr>**[<space>_]**<space>
    " Swap [ X ] and [ _ ] with space
    autocmd FileType markdown nmap <buffer> <space> :.g/[ X ]/s/ X / * /<cr>:.g/[ _ ]/s/ _ / X /<cr>:.g/[ \* ]/s/ \* / _ /<cr>
augroup END
" [vim-markdown] }}}

" [a.vim]{{{
augroup clearimap
    autocmd!
    autocmd VimEnter * iunmap <leader>ih
    autocmd VimEnter * iunmap <leader>is
    autocmd VimEnter * iunmap <leader>ihn
augroup END
augroup plugcpp
    autocmd!
    autocmd FileType c,cpp nmap <buffer> <leader>cv :AV<cr>
    autocmd FileType c,cpp nmap <buffer> <leader>cV :AS<cr>
    " autocmd FileType c,cpp nmap <leader><leader> m'A;<esc>''
    if has("mac")
        " [vimmux] (tmux)
        " autocmd FileType c,cpp nmap <leader>ccb :w<CR> :call VimuxRunCommand("xcb \| xcpretty")<CR>
        " autocmd FileType c,cpp nmap <leader>ccr :call VimuxRunCommand("./run.sh")<CR>
        " autocmd FileType c,cpp nmap <leader>ccz :call VimuxZoomRunner()<CR>
        " autocmd FileType c,cpp nmap <leader>ccc :VimuxInterruptRunner<CR>
        " [YouComepleteMe]
        autocmd FileType c,cpp nmap <buffer> <leader>ct :YcmCompleter GetType<cr>
        autocmd FileType c,cpp nmap <buffer> <leader>cf :YcmCompleter FixIt<cr>
        autocmd FileType c,cpp nmap <buffer> <leader>cd :YcmCompleter GoToDeclaration<cr>
        autocmd FileType c,cpp highlight YcmErrorSection cterm=NONE ctermfg=white ctermbg=darkgrey
        autocmd FileType c,cpp highlight YcmWarningSection cterm=NONE ctermfg=white ctermbg=Darkblue
    elseif has("win32")
        autocmd FileType c,cpp nmap <buffer> <leader>cb :make ./vs2013/local.sln<cr>
        autocmd FileType c,cpp nmap <buffer> <leader>cr :make ./vs2013/local.sln /p:Configuration=Release<cr>
        " Convert visual studio solution for cinder to local version
        " combine this with a test to see if ./vs2013/local.sln exists,
        " creating it if it doesnt.
        " execute "%s/%DS_PLATFORM_086%/". escape($DS_PLATFORM_086, '\\/.*$^~[]') ."\/g"
    endif
augroup END
" [a.vim]}}}

" [unite.vim] & [unite-qf] {{{
call unite#filters#matcher_default#use(['matcher_glob'])
call unite#filters#sorter_default#use(['sorter_selecta'])
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\(xcode\/build\|\.xcodeproj\|\.DS_Store\|node_modules\|data\/fonts\|data\/images\|DSNode\/node\|install\|vs2013\/Debug\|vs2013\/Release\)')
nmap <leader>f :call MyUniteSpecial()<cr>
nmap <leader>F :UniteWithProjectDir -start-insert -no-split file tab<cr>
nmap <leader>r :Unite -no-split -start-insert -default-action=tabswitch file_mru <cr>
nmap <leader>U :UniteFirst resume<cr>
nmap <leader>ut :Unite tab bookmark<cr>
nmap <leader>ub :Unite -no-split buffer<cr>
nmap <leader>uB :UniteBookmarkAdd<cr><cr>
nmap <leader>uc :Unite change<cr>
nmap <leader>uf :Unite qf locationlist -default-action=switch<cr>

nmap <leader>ug :call MyUniteVimGrep(1)<cr>
nmap <leader>uG :call MyUniteVimGrep(0)<cr>
" Replaces vimgrep in unite, saving to locationlist for easy access
function! MyUniteVimGrep(clear_search)
    if !exists("g:my_vim_grep_search") || a:clear_search
        let g:my_vim_grep_search=""
    endif
    if !exists("g:my_vim_grep_pat")
        let g:my_vim_grep_pat="**"
    endif

    let g:my_vim_grep_search = input("Find> ", g:my_vim_grep_search)
    let g:my_vim_grep_pat = input("Where> ", g:my_vim_grep_pat)
    execute "lvimgrep /" . g:my_vim_grep_search . "/j " . g:my_vim_grep_pat
    execute "Unite qf locationlist -default-action=switch"
endfunction

" Dont try file_rec in my homedir
function! MyUniteSpecial()
    if expand("%:p:h") == expand("~")
        execute "UniteWithProjectDir -start-insert -no-split file file_mru"
    else
        execute "UniteWithProjectDir -start-insert -no-split -default-action=tabswitch file_rec"
    endif
endfunction

" [END unite.vim] }}}

" [dbext.vim]{{{
if has("mac")
    let g:dbext_default_profile_mySqlite = 'type=SQLITE:user=:passwd=:dbname=./db.sqlite'
elseif has("win32")
    let g:dbext_default_profile_mySqlite = 'type=SQLITE:user=:passwd=:dbname=./db.sqlite:bin_path=/Users/luke.purcell/Desktop/Misc/sqlite'
endif
augroup sqldb
    autocmd!
    autocmd FileType sql DBSetOption profile=mySqlite
    autocmd FileType sql nmap > ,sejgjggjVGygk//;<cr>o<esc>kp:DBResultsClose<cr>
    autocmd FileType sql nmap < ,selgjggjVGygko<esc>kp:DBResultsClose<cr>
augroup END
" [dbext.vim]}}}

" [vim-fugitive] {{{
nmap <leader>gs :Gstatus<cr>/modified<cr>
nmap <leader>gc :Gcommit<cr>
nmap <leader>gp :Gpush<cr>
nmap <leader>gu :Gpull<cr>
nmap <leader>gb :Gblame<cr>
nmap <leader>gd :Gdiff<cr>
" [END vim-fugitive] }}}

" [neocomplcache.vim]{{{
if has("win32")
    " Disable AutoComplPop.
    let g:acp_enableAtStartup = 0
    " Use neocomplcache.
    let g:neocomplcache_enable_at_startup = 1
    " Use smartcase.
    let g:neocomplcache_enable_smart_case = 1
    " Set minimum syntax keyword length.
    let g:neocomplcache_min_syntax_length = 3
    let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'

    " Define dictionary.
    let g:neocomplcache_dictionary_filetype_lists = {
                \ 'default' : '',
                \ 'vimshell' : $HOME.'/.vimshell_hist',
                \ 'scheme' : $HOME.'/.gosh_completions'
                \ }

    " Define keyword.
    if !exists('g:neocomplcache_keyword_patterns')
        let g:neocomplcache_keyword_patterns = {}
    endif
    let g:neocomplcache_keyword_patterns['default'] = '\h\w*'

    " Plugin key-mappings.
    inoremap <expr><C-g>     neocomplcache#undo_completion()
    inoremap <expr><C-l>     neocomplcache#complete_common_string()

    " Recommended key-mappings.
    " <CR>: close popup and save indent.
    inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
    function! s:my_cr_function()
        " return neocomplcache#smart_close_popup() . "\<CR>"
        " For no inserting <CR> key.
        return pumvisible() ? neocomplcache#close_popup() : "\<CR>"
    endfunction
    " <TAB>: completion.
    inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
    " <C-h>, <BS>: close popup and delete backword char.
    inoremap <expr><C-h> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><BS> neocomplcache#smart_close_popup()."\<C-h>"
    inoremap <expr><C-y>  neocomplcache#close_popup()
    inoremap <expr><C-e>  neocomplcache#cancel_popup()


    " use msbuild
    autocmd FileType c,cpp compiler msbuild
    " awkwardly use msvc errorformat rather than msbuild's
    autocmd FileType c,cpp set errorformat+=%f(%l)\ :\ %t%*\\D%n:\ %m,%*[^\"]\"%f\"%*\\D%l:\ %m,%f(%l)\ :\ %m,%*[^\ ]\ %f\ %l:\ %m,%f:%l:%c:%m,%f(%l):%m,%f:%l:%m,%f|%l|\ %m


    set encoding=utf8
    set novisualbell
endif
" [neocomplcache.vim]}}}

" [sparkup] {{{
" Use sparkup default mapping <c-e> in normal & insert mode
let g:sparkupMapsNormal = 1
" [END sparkup] }}}

" [gundo.vim] {{{
nmap <leader>gu :GundoToggle<cr>
" [END gundo.vim] }}}

"======== [END Plugin mappings/settings] ========}}}
