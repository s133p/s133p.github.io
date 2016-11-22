set nocompatible
set exrc
set secure

let mapleader=','
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

Plugin 'spiiph/vim-space'

Plugin 'easymotion/vim-easymotion'
map  // <Plug>(easymotion-sn)
omap / <Plug>(easymotion-tn)
nmap s <Plug>(easymotion-overwin-f2)
" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1


Plugin 'benmills/vimux'
Plugin 'mhinz/vim-startify'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'honza/vim-snippets'
Plugin 'godlygeek/tabular'
Plugin 'vim-scripts/a.vim'
Plugin 'tpope/vim-surround'

Plugin 'scrooloose/nerdtree'
map <C-n> :NERDTreeToggle<CR>

"" Trigger configuration. Do not use <tab> if you use
Plugin 'Valloric/YouCompleteMe'
let g:ycm_confirm_extra_conf = 0
Plugin 'SirVer/ultisnips'
"let g:UltiSnipsExpandTrigger="<cr>"
"let g:UltiSnipsJumpForwardTrigger="<c-j>"
"let g:UltiSnipsJumpBackwardTrigger="<c-k>"

Plugin 'kshenoy/vim-signature'
" DEFAULT BINDINGS
" mx           Toggle mark 'x' and display it in the leftmost column
"  dmx          Remove mark 'x' where x is a-zA-Z
"
"  m,           Place the next available mark
"  m.           If no mark on line, place the next available mark. Otherwise, remove (first) existing mark.
"  m-           Delete all marks from the current line
"  m<Space>     Delete all marks from the current buffer
"  ]`           Jump to next mark
"  [`           Jump to prev mark
"  ]'           Jump to start of next line containing a mark
"  ['           Jump to start of prev line containing a mark
"  `]           Jump by alphabetical order to next mark
"  `[           Jump by alphabetical order to prev mark
"  ']           Jump by alphabetical order to start of next line having a mark
"  '[           Jump by alphabetical order to start of prev line having a mark
"  m/           Open location list and display marks from current buffer
"
"  m[0-9]       Toggle the corresponding marker !@#$%^&*()
"  m<S-[0-9]>   Remove all markers of the same type
"  ]-           Jump to next line having a marker of the same type
"  [-           Jump to prev line having a marker of the same type
"  ]=           Jump to next line having a marker of any type
"  [=           Jump to prev line having a marker of any type
"  m?           Open location list and display markers from current buffer
"  m<BS>        Remove all markers

Plugin 'kana/vim-arpeggio'

" All of your Plugins must be added before the following line
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
set cul 
set scrolloff=6
set splitbelow
set splitright
set nohlsearch

nnoremap / /\v
vnoremap / /\v
set incsearch
set ignorecase
set smartcase
set showmatch
map <leader><space> :let @/=''<cr> " clear search

" Use <F11> to toggle between 'paste' and 'nopaste'
"set pastetoggle=<f11>

set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab
map Y y$


"" MAPPINGS

"write/quit shorcuts
noremap <Leader>w :w<CR>
noremap <Leader>q :wq<CR>

nmap <silent> <leader>ev :e $MYVIMRC<CR>
nmap <silent> <leader>sv :so $MYVIMRC<CR>

nmap <silent> <leader>/ :set hls! <CR>

"go (beween) splits
nmap gs <C-W><C-W>
nmap gk <C-W>k
nmap gh <C-W>h
nmap gl <C-W>l
nmap gj <C-W>j

nmap <leader>v :vnew<CR>
nmap <leader>h :new<CR>
nmap <leader>t :tabnew<CR>
nmap <leader>x :q!<CR>
noremap ' `
noremap ` '
nmap J LztM
nmap K HzbM
nmap <leader>c/ :s/^\(\s\{-}\)\(\S\)/\1\/\/\2/<cr>
nmap <leader>c; :s/^\(\s\{-}\)\/\//\1/<cr>


autocmd FileType c,cpp nmap <leader>b :w<CR> :call VimuxRunCommand("xcb \| xcpretty")<CR>
autocmd FileType c,cpp nmap <leader>r :call VimuxRunCommand("./run.sh")<CR>
autocmd FileType c,cpp nmap <leader>z :call VimuxZoomRunner()<CR>
autocmd FileType c,cpp nmap <leader>c :VimuxInterruptRunner<CR>

"powerline
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup

"<leader>y & <leader>p copy from osx clipboard
nmap <leader>p "*p
nmap <leader>y "*yy
nmap <leader>a mzggVG"*y`z

"ctrl-p plugin for opening files
nmap <leader>o <Plug>(ctrlp)

"get type under cursor
autocmd FileType c,cpp nmap <leader>ct :YcmCompleter GetType<cr>
autocmd FileType c,cpp nmap <leader>cf :YcmCompleter FixIt<cr>
autocmd FileType c,cpp nmap <leader>cd :YcmCompleter GoToDeclaration<cr>
autocmd FileType c,cpp nmap <leader>cv :AV<cr>
autocmd FileType c,cpp nmap <leader>ch :AS<cr>

autocmd FileType c,cpp highlight YcmErrorSection cterm=NONE ctermfg=white ctermbg=darkgrey

autocmd FileType c,cpp highlight YcmWarningSection cterm=NONE ctermfg=white ctermbg=Darkblue

"------------------------------------------------------------
"------------------------------------------------------------
"------------------------------------------------------------
"
"Rollodex shit
"This function turns Rolodex Vim on or off for the current tab
"If turning off, it sets all windows to equal height
function! ToggleRolodexTab()
    if exists("t:rolodex_tab") > 0
        unlet t:rolodex_tab
        call ClearRolodexSettings()
        execute "normal \<C-W>="
    else
        let t:rolodex_tab = 1
        call SetRolodexSettings()
    endif
endfunction
 
"This function clears the Rolodex Vim settings and restores the previous values
function! ClearRolodexSettings()
    "Assume if one exists they all will
    if exists("g:remember_ea") > 0
        let &equalalways=g:remember_ea
        let &winheight=g:remember_wh
        let &winminheight=g:remember_wmh
        let &helpheight=g:remember_hh
    endif
endfunction
 
"This function set the Rolodex Vim settings and remembers the previous values for later
function! SetRolodexSettings()
    if exists("t:rolodex_tab") > 0
        let g:remember_ea=&equalalways
        let g:remember_wh=&winheight
        let g:remember_wmh=&winminheight
        let g:remember_hh=&helpheight
        set noequalalways winminheight=0 winheight=9999 helpheight=9999
    endif
endfunction
 
"These two autocmds make Vim change the settings whenever a new tab is selected
"We have to use TabLeave to always clear them.  If we try and turn them off
"in TabEnter, it is too late ( I think, since WinEnter has already been called and triggered the display)
au TabLeave * call ClearRolodexSettings()
au TabEnter * call SetRolodexSettings()

"With this mapping, <leader>cc (c collapse) toggles a tab to be Rolodex style
noremap <leader>cc :call ToggleRolodexTab()<CR>
