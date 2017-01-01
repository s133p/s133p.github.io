set nocompatible
set exrc
set secure

let mapleader=';'

"======== [VUNDLE BEGIN] ========{{{
filetype off                                " required
set rtp+=~/.vim/bundle/Vundle.vim           " required
call vundle#begin()                         " required
Plugin 'VundleVim/Vundle.vim'

Plugin 'spiiph/vim-space'                   "  [vim-space]            =  Use spacebar to repeat last movement
Plugin 'Shougo/unite.vim'                   "  [unite.vim]            =  Fully replaces Ctrl-P & much more
Plugin 'mhinz/vim-startify'                 "  [vim-startify]         =  Nicer start page / most recent files **???**
Plugin 'godlygeek/tabular'                  "  [tabular]              =  Alignment & tables
Plugin 'vim-scripts/a.vim'                  "  [a.vim]                =  Swap between cpp & hpp
Plugin 'tpope/vim-surround'                 "  [vim-surround]         =  Does what it says on the tin
Plugin 'kshenoy/vim-signature'              "  [vim-signature]        =  marks in sidebar
Plugin 'scrooloose/nerdtree'                "  [nerdtree]             =  file tree
Plugin 'plasticboy/vim-markdown'            "  [vim-markdown]         =  markdown highlighting
Plugin 'vim-airline/vim-airline'            "  [vim-airline]          =  Better tab/status line
Plugin 'vim-airline/vim-airline-themes'     "  [vim-airline-themes]   =  Themes for airline
Plugin 'morhetz/gruvbox'                    "  [gruvbox]              =  Pretty theme!
Plugin 'vim-scripts/dbext.vim'              "  [dbext.vim]            =  databases from within vim
Plugin 'gfontenot/vim-xcode'                "  [vim-xcode]            =  Xcode integration
Plugin 'sgur/unite-qf'                      "  [unite-qf]             =  Quickfix for unite
Plugin 'JamshedVesuna/vim-markdown-preview' "  [vim-markdown-preview] =  Markdown preview
Plugin 'airblade/vim-rooter'                "  [vim-rooter]           =  Change directory to root of projects
Plugin 'tpope/vim-fugitive'                 "  [vim-fugitive]         =  Git integration
Plugin 'michaeljsmith/vim-indent-object'    "  [vim-indent-object]    =  Use indent levels as text objects
Plugin 'tpope/vim-unimpaired'               "  [vim-unimpaired]       =  paired mappings
Plugin 's133p/vim-magic-template'           "  [vim-magic-template]   =  make .h/.cpp interactively from template (personal)

if has("win32")
    Plugin 'Shougo/neocomplcache.vim'       "  [neocomplcache.vim]    =  Autocomplete across buffers
elseif has("mac")
    Plugin 'Valloric/YouCompleteMe'         "  [YouCompleteMe]        =  Clang based completeion
endif

call vundle#end()                           " required
filetype plugin indent on                   " required
"======== [VUNDLE END] ========}}}

"======== [Settings] ========{{{
filetype indent plugin on
syntax on
set hidden
set wildmenu
set showcmd
set nohlsearch
set ignorecase
set smartcase
set backspace=indent,eol,start
set autoindent
set nostartofline
set ruler
set laststatus=2
set confirm
set visualbell
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
"======== [END Settings] ========}}}

"======== [Search Settings] ========{{{
set incsearch
set ignorecase
set smartcase
set showmatch
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
    "
    " remap insert (FN-; on poker3 kbd)
    " inoremap <Insert> <esc>
elseif has("mac")
    " macvim options
    set guioptions=c  "only console prompt, no other ui-chrome
    set guifont=Hack\ Regular:h12
endif
"======== [END Gvim / MacVim] ========}}}

"======== [MAPPINGS] ========{{{
nnoremap Y y$ " yank til EOL
" Stamp lasy yank
nnoremap S viw"0p
noremap <Leader>ww :w<CR>
noremap <Leader>wq :wq<CR>
nnoremap <leader>x :q<CR>
nnoremap <leader>q :q<CR>
nnoremap <silent> <leader>ev :e $MYVIMRC<CR>
nnoremap <silent> <leader>sv :so $MYVIMRC<CR>

"go (beween) splits
"nmap gs <C-W><C-W>
nnoremap gk <C-W>k
nnoremap gj <C-W>j
nnoremap gh <C-W>h
nnoremap gl <C-W>l
nnoremap gH :tabprevious<cr>
nnoremap gL :tabnext<cr>
nnoremap gw <c-w>
" go next/previous buffer
nnoremap gb :bnext<cr>
nnoremap gB :bprevious<cr>

" create splits/tabs
nnoremap <leader>v :vnew<CR>
nnoremap <leader>V :new<CR>
nnoremap <leader>t :tabnew<CR>

" swap defauly behavior of ' and ` (jump to mark/jump to mark @ col)
noremap ' `
noremap ` '

" J & K jump to bottom/top & center on new pos
nnoremap J <c-d>
vnoremap J <c-d>
nnoremap K <c-u>
vnoremap K <c-u>
nnoremap <leader>J J
nnoremap <leader>K K

"<leader>y & <leader>p copy from system clipboard
nnoremap <leader>p "*p
nnoremap <leader>y 0"*y$
nnoremap <leader>Y "*y$
" Yank entire buffer
nnoremap <leader>aa ggVG

" Execute current line or current selection as Vim EX commands.
nnoremap <leader>e :exe getline(".")<CR>
vnoremap <leader>e :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>

augroup myfolding
    au!
    autocmd FileType vim setlocal fdm=marker
    autocmd FileType c,cpp setlocal fdm=syntax
    autocmd FileType c,cpp,vim setlocal nofoldenable
augroup END

" Personal notes: Opens unite in g:personal_notes_dir
function! OpenPersonalNotes()
    if !exists("g:personal_notes_dir")
        let g:personal_notes_dir="~/Dropbox/vim-notes"
    endif
    " Open nerdtree in notes directory
    execute "Unite -path=" . g:personal_notes_dir . " -start-insert -no-split file_rec"
endfunction
nnoremap <leader>n :call OpenPersonalNotes()<cr>

"======== [END MAPPINGS] ========}}}

"======== [Plugin mappings/settings] ========{{{

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

" [vim-markdown] & [vim-markdown-preview]{{{
let g:vim_markdown_fenced_languages = ['c=c']
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 6
let g:vim_markdown_preview_github=0
let g:vim_markdown_preview_temp_file=1
let g:vim_markdown_preview_toggle=1
augroup mkdownNotes
    au!
    autocmd BufWritePost /Users/lukepurcell/Desktop/nano-blog/posts/*.md silent exec "!/Users/lukepurcell/Desktop/nano-blog/make_preview.sh" | redraw!
    autocmd BufEnter /Users/lukepurcell/Desktop/nano-blog/posts/*.md lcd ~/Desktop/nano-blog
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
    autocmd FileType markdown nmap <buffer> <leader>mn A<cr>**[<space>_<space>]**<space>
    " TODO: make function to enable set clear to be same combo..
    autocmd FileType markdown nmap <buffer> <leader>m<space> ^f[lrx
    autocmd FileType markdown nmap <buffer> <leader>mu ^f[lr<space>
augroup END
" [vim-markdown] & [vim-markdown-preview]}}}

" [a.vim]{{{
augroup clearimap
    autocmd!
    autocmd VimEnter * iunmap <leader>ih
    autocmd VimEnter * iunmap <leader>is
    autocmd VimEnter * iunmap <leader>ihn
augroup END
augroup plugcpp
    autocmd!
    autocmd FileType c,cpp nmap <leader>cv :AV<cr>
    autocmd FileType c,cpp nmap <leader>cV :AS<cr>
    " autocmd FileType c,cpp nmap <leader><leader> m'A;<esc>''
    if has("mac")
        " [vimmux] (tmux)
        " autocmd FileType c,cpp nmap <leader>ccb :w<CR> :call VimuxRunCommand("xcb \| xcpretty")<CR>
        " autocmd FileType c,cpp nmap <leader>ccr :call VimuxRunCommand("./run.sh")<CR>
        " autocmd FileType c,cpp nmap <leader>ccz :call VimuxZoomRunner()<CR>
        " autocmd FileType c,cpp nmap <leader>ccc :VimuxInterruptRunner<CR>
        " [YouComepleteMe]
        autocmd FileType c,cpp nmap <leader>ct :YcmCompleter GetType<cr>
        autocmd FileType c,cpp nmap <leader>cf :YcmCompleter FixIt<cr>
        autocmd FileType c,cpp nmap <leader>cd :YcmCompleter GoToDeclaration<cr>
        autocmd FileType c,cpp highlight YcmErrorSection cterm=NONE ctermfg=white ctermbg=darkgrey
        autocmd FileType c,cpp highlight YcmWarningSection cterm=NONE ctermfg=white ctermbg=Darkblue
    elseif has("win32")
        autocmd FileType c,cpp nmap <leader>cb :make ./vs2013/local.sln<cr>
        autocmd FileType c,cpp nmap <leader>cr :make ./vs2013/local.sln /p:Configuration=Release<cr>
        " Convert visual studio solution for cinder to local version
        " execute "%s/%DS_PLATFORM_086%/". escape($DS_PLATFORM_086, '\\/.*$^~[]') ."\/g"
    endif
augroup END
" [a.vim]}}}

" [unite.vim] & [unite-qf] {{{
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_glob'])
call unite#filters#sorter_default#use(['sorter_selecta'])
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\(xcode\/build\|\.xcodeproj\|\.DS_Store\|node_modules\|data\/fonts\|data\/images\|DSNode\/node\|install\|vs2013\/Debug\|vs2013\/Release\)')
nmap <leader>f :UniteWithProjectDir -start-insert -no-split -default-action=tabswitch file_rec<cr>
nmap <leader>F :UniteWithProjectDir -start-insert -no-split file tab<cr>
nmap <leader>uu :UniteFirst resume<cr>
nmap <leader>ut :Unite tab bookmark<cr>
nmap <leader>ub :Unite -no-split buffer<cr>
nmap <leader>uB :UniteBookmarkAdd<cr><cr>
nmap <leader>ur :Unite register<cr>
nmap <leader>uf :Unite qf locationlist -no-split -default-action=tabswitch<cr>
nmap <leader>ug :Unite vimgrep -no-split -default-action=tabswitch<cr>

" let g:unite_source_menu_menus = get(g:,'unite_source_menu_menus',{})
" let g:unite_source_menu_menus.git = {
"     \ 'description' : '            gestionar repositorios git
"         \                            ⌘ [espacio]g',
"     \}
" let g:unite_source_menu_menus.git.command_candidates = [
"     \['▷ tig                                                        ⌘ ,gt',
"         \'normal ,gt'],
"     \['▷ git status       (Fugitive)                                ⌘ ,gs',
"         \'Gstatus'],
"     \['▷ git diff         (Fugitive)                                ⌘ ,gd',
"         \'Gdiff'],
"     \['▷ git commit       (Fugitive)                                ⌘ ,gc',
"         \'Gcommit'],
"     \['▷ git log          (Fugitive)                                ⌘ ,gl',
"         \'exe "silent Glog | Unite quickfix"'],
"     \['▷ git blame        (Fugitive)                                ⌘ ,gb',
"         \'Gblame'],
"     \['▷ git stage        (Fugitive)                                ⌘ ,gw',
"         \'Gwrite'],
"     \['▷ git checkout     (Fugitive)                                ⌘ ,go',
"         \'Gread'],
"     \['▷ git rm           (Fugitive)                                ⌘ ,gr',
"         \'Gremove'],
"     \['▷ git mv           (Fugitive)                                ⌘ ,gm',
"         \'exe "Gmove " input("destino: ")'],
"     \['▷ git push         (Fugitive, salida por buffer)             ⌘ ,gp',
"         \'Git! push'],
"     \['▷ git pull         (Fugitive, salida por buffer)             ⌘ ,gP',
"         \'Git! pull'],
"     \['▷ git prompt       (Fugitive, salida por buffer)             ⌘ ,gi',
"         \'exe "Git! " input("comando git: ")'],
"     \['▷ git cd           (Fugitive)',
"         \'Gcd'],
"     \]
" nnoremap <silent>[menu]g :Unite -silent -start-insert menu:git<CR>
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
nmap <leader>gs :Gstatus<cr>
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

"======== [END Plugin mappings/settings] ========}}}
