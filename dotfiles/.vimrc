set nocompatible
set exrc
set secure

let mapleader=','
filetype off                  " required

"Saving for now, may delete
"Plugin 'tpope/vim-fugitive' " Git integration
"Plugin 'honza/vim-snippets'
"Plugin 'SirVer/ultisnips'
"let g:UltiSnipsExpandTrigger="<cr>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

" set the runtime path to include Vundle and initialize
"================= VUNDLE BEGIN ================= 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'spiiph/vim-space' " Use spacebar to repeat last movement
Plugin 'easymotion/vim-easymotion'


Plugin 'benmills/vimux'                 " Tmux
Plugin 'mhinz/vim-startify'             " Nicer start page / most recent files
Plugin 'godlygeek/tabular'              " Alignment & tables
Plugin 'vim-scripts/a.vim'              " Swap between cpp & hpp
Plugin 'tpope/vim-surround'             " Does what it says on the tin
Plugin 'kshenoy/vim-signature'          " marks in sidebar
Plugin 'scrooloose/nerdtree'            " file tree
Plugin 'Valloric/YouCompleteMe'         " Clang based completeion
Plugin 'gabrielelana/vim-markdown'      " markdown highlighting
Plugin 'vim-airline/vim-airline'        " Better tab/status line
Plugin 'vim-airline/vim-airline-themes' " Themes for airline
Plugin 'morhetz/gruvbox'                " Pretty theme!
Plugin 'vim-scripts/dbext.vim'          " databases from within vim
Plugin 'gfontenot/vim-xcode'            " Xcode integration
Plugin 'Shougo/unite.vim'               " good?

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

"search settings
nnoremap // /\v
vnoremap // /\v
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

"" MAPPINGS
map Y y$ " yank til EOL
noremap <Leader>w :w<CR>
noremap <Leader>q :wq<CR>
nmap <leader>x :q!<CR>
nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

" Insert line before/after without going to insert
"nmap <space>o o<esc>
"nmap <space>O O<esc>

"go (beween) splits
nmap gs <C-W><C-W>
nmap gk <C-W>k
nmap gh <C-W>h
nmap gl <C-W>l
nmap gj <C-W>j

" create splits/tabs
nmap <leader>v :vnew<CR>
nmap <leader>h :new<CR>
nmap <leader>t :tabnew<CR>

" swap defauly behavior of ' and ` (jump to mark/jump to mark @ col)
noremap ' `
noremap ` '

" J & K jump to bottom/top & center on new pos
nmap J LztM
nmap K HzbM

nnoremap gb :bnext<cr> " go-next buffer
nnoremap gB :bprevious<cr> " go previous buffer

"<leader>y & <leader>p copy from system clipboard
nmap <leader>p "*p
nmap <leader>y "*yy
nmap <leader>a mzggVG"*y`z


" I never use the default s or S, so nop them; now its a new prefix!
" Think: special -> ...
nnoremap s <nop>
nnoremap S <nop>
nnoremap sl o<esc>
nnoremap so O<esc>
nnoremap sd yyp
nnoremap sr !!zsh<cr>
autocmd FileType vim nnoremap sk 0i"<esc>
autocmd FileType c,cpp nnoremap ska I//<esc>
autocmd FileType c,cpp nnoremap sku :s/\/\///<CR>
autocmd FileType c,cpp nnoremap skd :s/\/\/.*//<CR>

"================= Plugin mappings/settings ================= 
" use // for normal search + magic
noremap // /\v
map  / <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
"nmap s <Plug>(easymotion-overwin-f2)
let g:EasyMotion_smartcase = 1  " Turn on case insensitive feature
map <C-n> :NERDTreeToggle<CR>
let g:ycm_confirm_extra_conf = 0                              " Don't confirm on load
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py' " provide some defaults
let g:gruvbox_invert_tabline="1"
colorscheme gruvbox
set background=dark
let g:airline#extensions#tabline#enabled = 1 
let g:airline_powerline_fonts = 1
" a.vim
autocmd FileType c,cpp nmap <leader>cv :AV<cr>
autocmd FileType c,cpp nmap <leader>ch :AS<cr>
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
"unite
let g:unite_source_history_yank_enable = 1
call unite#filters#matcher_default#use(['matcher_fuzzy'])
"dbext
let g:dbext_default_profile_mySqlite = 'type=SQLITE:user=:passwd=:dbname=./db.sqlite'
autocmd FileType sql DBSetOption profile=mySqlite

