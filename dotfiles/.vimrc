set nocompatible
set exrc
set secure

let mapleader=';'

"======== [VUNDLE BEGIN] ========{{{
filetype off                                 " required
set rtp+=~/.vim/bundle/Vundle.vim            " required
call vundle#begin()                          " required
Plugin 'VundleVim/Vundle.vim'

Plugin 'spiiph/vim-space'                    " [vim-space]             = Use spacebar to repeat last movement
Plugin 'Shougo/unite.vim'                    " [unite.vim]             = Fully replaces Ctrl-P & much more
"Plugin 'easymotion/vim-easymotion'           " [vim-easymotion]        = Fast buffer navigation **???**
"Plugin 'benmills/vimux'                      " [vimux]                 = Tmux
Plugin 'mhinz/vim-startify'                  " [vim-startify]          = Nicer start page / most recent files **???**
Plugin 'godlygeek/tabular'                   " [tabular]               = Alignment & tables
Plugin 'vim-scripts/a.vim'                   " [a.vim]                 = Swap between cpp & hpp
Plugin 'tpope/vim-surround'                  " [vim-surround]          = Does what it says on the tin
Plugin 'kshenoy/vim-signature'               " [vim-signature]         = marks in sidebar
Plugin 'scrooloose/nerdtree'                 " [nerdtree]              = file tree
Plugin 'plasticboy/vim-markdown'             " [vim-markdown]          = markdown highlighting
Plugin 'vim-airline/vim-airline'             " [vim-airline]           = Better tab/status line
Plugin 'vim-airline/vim-airline-themes'      " [vim-airline-themes]    = Themes for airline
Plugin 'morhetz/gruvbox'                     " [gruvbox]               = Pretty theme!
Plugin 'vim-scripts/dbext.vim'               " [dbext.vim]             = databases from within vim
Plugin 'gfontenot/vim-xcode'                 " [vim-xcode]             = Xcode integration
Plugin 'sgur/unite-qf'                       " [unite-qf]              = Quickfix for unite
Plugin 'JamshedVesuna/vim-markdown-preview'  " [vim-markdown-preview]  = Markdown preview
Plugin 'airblade/vim-rooter'                 " [vim-rooter]            = Change directory to root of projects
Plugin 'tpope/vim-fugitive'                  " [vim-fugitive]          = Git integration
Plugin 'michaeljsmith/vim-indent-object'     " [vim-indent-object]     = Use indent levels as text objects
Plugin 'tpope/vim-unimpaired'                " [vim-unimpaired]        = paired mappings
Plugin 's133p/vim-magic-template'            " [vim-magic-template]    = make .h/.cpp interactively from template (personal)

if has("win32")
    Plugin 'Shougo/neocomplcache.vim'        " [neocomplcache.vim]     = Autocomplete across buffers
elseif has("mac")
    Plugin 'Valloric/YouCompleteMe'          " [YouCompleteMe]         = Clang based completeion
endif

call vundle#end()                            " required
filetype plugin indent on                    " required
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
"======== [END Settings] ========}}}

"======== [Search Settings] ========{{{
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search
"======== [END Search Settings] ========}}}

"======== [Gvim / MacVim] ========{{{
if has("win32")
    "gvim specific
    set shellslash
    "set autochdir
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L
    set guifont=Sauce_Code_powerline:h10:cANSI:qDRAFT
    set guioptions-=e " Use default vim tabs
    set guioptions+=c " use console prompt
    au GUIEnter * simalt ~x
    " remap insert (FN-; on poker3 kbd)
    inoremap <Insert> <esc>
elseif has("mac")
    " macvim options
    set guioptions-=m  "remove menu bar
    set guioptions-=T  "remove toolbar
    set guioptions-=r  "remove right-hand scroll bar
    set guioptions-=L
    set guifont=Hack\ Regular:h12
    set guioptions-=e " Use default vim tabs
    set guioptions+=c " use console prompt
endif
"======== [END Gvim / MacVim] ========}}}

"======== [MAPPINGS] ========{{{
nmap Y y$ " yank til EOL
noremap <Leader>ww :w<CR>
noremap <Leader>wq :wq<CR>
nmap <leader>x :q<CR>
nmap <leader>q :q<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

"go (beween) splits
nmap gs <C-W><C-W>
nmap gk <C-W>k
nmap gh <C-W>h
nmap gl <C-W>l
nmap gj <C-W>j
nmap gw <c-w>
" go next/previous buffer
nnoremap gb :bnext<cr>
nnoremap gB :bprevious<cr>

" create splits/tabs
nmap <leader>v :vnew<CR>
nmap <leader>V :new<CR>
nmap <leader>t :tabnew<CR>

" swap defauly behavior of ' and ` (jump to mark/jump to mark @ col)
noremap ' `
noremap ` '

" J & K jump to bottom/top & center on new pos
nnoremap J Lzz
vnoremap J Lzz
nnoremap K Hzz
vnoremap K Hzz
nnoremap <leader>J J

"<leader>y & <leader>p copy from system clipboard
nnoremap <leader>p "*p
nnoremap <leader>y 0"*y$
nnoremap <leader>Y "*y$
" Yank entire buffer
nnoremap <leader>ay mzggVG"*y`z

" Execute current line or current selection as Vim EX commands.
nnoremap <leader>e :exe getline(".")<CR>
vnoremap <leader>e :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>

augroup myfolding
    au!
    autocmd FileType vim setlocal fdm=marker
    autocmd FileType c,cpp setlocal fdm=syntax
    autocmd FileType c,cpp,vim setlocal nofoldenable
augroup END

" I never use the default s or S, so nop them; now its a new prefix!
" Think: special -> ...
" nnoremap s <nop>
" nnoremap S <nop>
" nnoremap sl o<esc>
" nnoremap so O<esc>
" nnoremap sd yyp
" nnoremap sr !!zsh<cr>

" Personal notes: Opens a new tab, opens nerdtree in notes_folder
function! OpenPersonalNotes()
    let notes_folder="~/Dropbox/vim-notes"
    tabnew
    execute "lcd " . notes_folder
    " Open nerdtree in notes directory
    execute "Unite -start-insert -no-split file_rec"
endfunction
nnoremap <leader>n :call OpenPersonalNotes()<cr>

"======== [END MAPPINGS] ========}}}

"======== [Plugin mappings/settings] ========{{{

" [gruvbox] {{{
colorscheme gruvbox
set background=dark
" [END gruvbox] }}}

" [vim-easymotion] {{{
" use // for normal search
nnoremap // <Plug>(easymotion-sn)
let g:EasyMotion_smartcase = 1  " Turn on case insensitive feature
" [END vim-easymotion] }}}

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
let g:airline_powerline_fonts = 1
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
    autocmd BufEnter *.md set spell
    autocmd BufLeave *.md set nospell
    "au BufRead *.md set nofoldenable
    "au BufRead,BufWrite *.md Toc
    autocmd FileType markdown nnoremap <buffer> <leader>mc :Toc<cr>
    autocmd FileType markdown setlocal nofoldenable
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
nmap <leader>f :Unite -start-insert -no-split file_rec<cr>
nmap <leader>F :Unite -start-insert -no-split file tab<cr>
nmap <leader>ut :Unite tab bookmark<cr>
nmap <leader>ub :Unite -no-split buffer<cr>
nmap <leader>uB :UniteBookmarkAdd<cr><cr>
nmap <leader>ur :Unite register<cr>
nmap <leader>uf :Unite qf locationlist<cr>
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
