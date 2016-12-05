set nocompatible
set exrc
set secure

let mapleader=';'
filetype off                  " required

" set the runtime path to include Vundle and initialize
"================= VUNDLE BEGIN ================= 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'spiiph/vim-space'                      " Use spacebar to repeat last movement
Plugin 'easymotion/vim-easymotion'             " Fast buffer navigation
Plugin 'benmills/vimux'                        " Tmux
Plugin 'mhinz/vim-startify'                    " Nicer start page / most recent files
Plugin 'godlygeek/tabular'                     " Alignment & tables
Plugin 'vim-scripts/a.vim'                     " Swap between cpp & hpp
Plugin 'tpope/vim-surround'                    " Does what it says on the tin
Plugin 'kshenoy/vim-signature'                 " marks in sidebar
Plugin 'scrooloose/nerdtree'                   " file tree
Plugin 'plasticboy/vim-markdown'               " markdown highlighting
Plugin 'vim-airline/vim-airline'               " Better tab/status line
Plugin 'vim-airline/vim-airline-themes'        " Themes for airline
Plugin 'morhetz/gruvbox'                       " Pretty theme!
Plugin 'vim-scripts/dbext.vim'                 " databases from within vim
Plugin 'gfontenot/vim-xcode'                   " Xcode integration
Plugin 'Shougo/unite.vim'                      " good?
Plugin 'sgur/unite-qf'                         " quickfix for unite
Plugin 'JamshedVesuna/vim-markdown-preview'    " Markdown preview
Plugin 'airblade/vim-rooter'                   " change directory to root of projects

if has("win32")
    Plugin 'Shougo/neocomplcache.vim'       " autocomplete across buffers
elseif has("mac")
    Plugin 'Valloric/YouCompleteMe'         " Clang based completeion
endif

"================= VUNDLE END ================= 
call vundle#end()            " required
filetype plugin indent on    " required



"" Settings
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

"search settings
nnoremap // /\v
vnoremap // /\v
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

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

"" MAPPINGS
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
" go next/previous buffer
nnoremap gb :bnext<cr> 
nnoremap gB :bprevious<cr> 

" create splits/tabs
nmap <leader>v :vnew<CR>
nmap <leader>h :new<CR>
nmap <leader>t :tabnew<CR>

" swap defauly behavior of ' and ` (jump to mark/jump to mark @ col)
noremap ' `
noremap ` '

" J & K jump to bottom/top & center on new pos
nmap J LztM
vmap J LztM
nmap K HzbM
vmap K HzbM

"<leader>y & <leader>p copy from system clipboard
nmap <leader>p "*p
nmap <leader>y 0"*y$
nmap <leader>Y "*y$
" Yank entire buffer
nmap <leader>ay mzggVG"*y`z

" Execute current line or current selection as Vim EX commands.
nnoremap <leader>e :exe getline(".")<CR>
vnoremap <leader>e :<C-w>exe join(getline("'<","'>"),'<Bar>')<CR>

" I never use the default s or S, so nop them; now its a new prefix!
" Think: special -> ...
nnoremap s <nop>
nnoremap S <nop>
nnoremap sl o<esc>
nnoremap so O<esc>
nnoremap sd yyp
nnoremap sr !!zsh<cr>

augroup commentz
    autocmd!
    autocmd FileType vim nnoremap sk 0i"<esc>
    autocmd FileType c,cpp nnoremap ska I//<esc>
    autocmd FileType c,cpp nnoremap sku :s/\/\///<CR>
    autocmd FileType c,cpp nnoremap skd :s/\/\/.*//<CR>
augroup END

"================= Plugin mappings/settings ================= 
colorscheme gruvbox
set background=dark
" use // for normal search
noremap // /
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
let g:EasyMotion_smartcase = 1  " Turn on case insensitive feature

" NERDTree
map <C-n> :NERDTreeToggle<CR>

" youcompleteme
let g:ycm_confirm_extra_conf = 0                              " Don't confirm on load
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' " provide some defaults

" airline
let g:airline#extensions#tabline#enabled = 1 
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#show_tabs = 1
let g:airline_powerline_fonts = 1
let g:airline#extensions#tabline#fnamemod = ':p:t'

" Rooter (auto cd to project roots)
let g:rooter_change_directory_for_non_project_files = 'current'
let g:rooter_targets = '/,*'

"vim-markdown
let g:vim_markdown_fenced_languages = ['c=c']
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_folding_level = 6
" markdown preview
let g:vim_markdown_preview_github=0
let g:vim_markdown_preview_temp_file=1
let g:vim_markdown_preview_toggle=2
augroup mkdownNotes
    au!
    autocmd BufWritePost /Users/lukepurcell/Desktop/nano-blog/posts/*.md silent exec "!/Users/lukepurcell/Desktop/nano-blog/make_preview.sh" | redraw!
    autocmd BufEnter /Users/lukepurcell/Desktop/nano-blog/posts/*.md lcd ~/Desktop/nano-blog
augroup END
augroup markdown
    au!
    autocmd BufNewFile,BufReadPost *.md set filetype=markdown
    autocmd BufNewFile,BufReadPost *.md setlocal wrap
    autocmd BufNewFile,BufReadPost *.md noremap <buffer> j gj
    autocmd BufNewFile,BufReadPost *.md noremap <buffer> k gk
    autocmd BufNewFile,BufReadPost *.md set linebreak
    autocmd BufEnter *.md set spell
    autocmd BufLeave *.md set nospell
    au BufRead *.md set nofoldenable
    au BufRead,BufWrite *.md Toc
augroup END

" a.vim
augroup clearimap
    autocmd!
    autocmd VimEnter * iunmap <leader>ih
    autocmd VimEnter * iunmap <leader>is
    autocmd VimEnter * iunmap <leader>ihn
augroup END
augroup plugcpp
    autocmd!
    autocmd FileType c,cpp nmap <leader>cv :AV<cr>
    autocmd FileType c,cpp nmap <leader>ch :AS<cr>
    autocmd FileType c,cpp nmap <leader><leader> m'A;<esc>''
    "Unite quickfix
    autocmd FileType c,cpp nmap <leader>cf :Unite qf<cr>
    if has("mac")
        "vimmux (tmux)
        autocmd FileType c,cpp nmap <leader>b :w<CR> :call VimuxRunCommand("xcb \| xcpretty")<CR>
        autocmd FileType c,cpp nmap <leader>r :call VimuxRunCommand("./run.sh")<CR>
        autocmd FileType c,cpp nmap <leader>z :call VimuxZoomRunner()<CR>
        autocmd FileType c,cpp nmap <leader>c :VimuxInterruptRunner<CR>
        "YouComepleteMe
        autocmd FileType c,cpp nmap <leader>ct :YcmCompleter GetType<cr>
        autocmd FileType c,cpp nmap <leader>cf :YcmCompleter FixIt<cr>
        autocmd FileType c,cpp nmap <leader>cd :YcmCompleter GoToDeclaration<cr>
        autocmd FileType c,cpp highlight YcmErrorSection cterm=NONE ctermfg=white ctermbg=darkgrey
        autocmd FileType c,cpp highlight YcmWarningSection cterm=NONE ctermfg=white ctermbg=Darkblue
    elseif has("win32")
        autocmd FileType c,cpp nmap <leader>cb :make ./vs2013/local.sln<cr>
    endif
augroup END

"unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
call unite#filters#sorter_default#use(['sorter_rank'])
call unite#custom#source('file_rec,file_rec/async', 'ignore_pattern', '\(xcode\/build\|\.xcodeproj\|\.DS_Store\|node_modules\)')
nmap <leader>f :Unite -no-split -start-insert file_rec buffer bookmark:*<cr>
nmap <leader>F :Unite -no-split file_rec buffer bookmark:*<cr>
nmap <leader>b :UniteBookmarkAdd<cr><cr>

"dbext
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


if has("win32")
    "neocomplcache
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
