"YouComplete Me Plugin Buildcript
function! BuildYCM(info)
" info is a dictionary with 3 fields
" - name:   name of the plugin
" - status: 'installed', 'updated', or 'unchanged'
" - force:  set on PlugInstall! or PlugUpdate!
if a:info.status == 'installed' || a:info.force
!./install.py --all
endif
endfunction

" Install PDF to text
function! InstallPdfToText(info)
	if empty(glob('~/.vim/PDF_To_Text/installer.run'))
		silent !curl -fLo ~/.vim/PDF_To_Text/installer.run --create-dirs
		\ https://xpdfreader-dl.s3.amazonaws.com/XpdfReader-linux64-4.02.run
		chmod u+x ~/.vim/PDF_To_Text/installer.run
		"Note, stupid thing always does relative install
		autocmd VimEnter * ~/.vim/PDF_To_text/./installer.run
	endif
endfunction

" TODO: fun things to look into
" https://github.com/vim-syntastic/syntastic
" https://github.com/rust-lang/rust.vim
"

" Auto Install vim-plug
if empty(glob('~/.vim/autoload/plug.vim'))
silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
\ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugin Load -> vim-plug
call plug#begin('~/.vim/plugged')

" Inline git diff
Plug 'airblade/vim-gitgutter'

" File manager + git support
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'

" Hex color swatches
Plug 'ap/vim-css-color'

" Powerline status bar + themes
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" Tab completion directory searches
Plug 'Shougo/deoplete.nvim'
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'

" Tab completion vim internal
Plug 'vim-scripts/SearchComplete'

" Puppet syntax
Plug 'puppetlabs/puppet-syntax-vim'

" More puppet stuff
Plug 'rodjek/vim-puppet'

" Clipboard History stack TODO: Bugged
" Plug 'maxbrunsfield/vim-yankstack'

" Easier custom highlighting
Plug 'bimlas/vim-high'

" Ycm completion
if v:version > 800
    Plug 'ycm-core/YouCompleteMe', { 'do': function('BuildYCM') }
endif


" Vim PDF Reader so Baron stops making me feel bad.
Plug 'makerj/vim-pdf', {'do': function('InstallPdfToText') }

" Plug end
call plug#end()

" General Formating
filetype indent plugin on
syntax on
set autoindent
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set number
set ruler
set nomodeline
set encoding=utf-8
set smartindent
set showcmd
set mouse=
set cursorline
set wildmenu " display cli tab completion as menu
set title


"earch modifiers
set ignorecase
set smartcase
set incsearch " dynamic search
set hlsearch " high matches

" NO BEEP DEAR GOD WHO THOUGHT THIS WAS A GOOD IDEA?
set noerrorbells
set visualbell
set t_vb=

" Other configurations

" Cache settings
set tabpagemax=200
set history=1000
set undolevels=1000

" Minor optimizations
set lazyredraw " don't update screen during script exec

" Navigation Mapping
nmap <silent> <A-Up> :wincmd k<CR>
nmap <silent> <A-Down> :wincmd j<CR>
nmap <silent> <A-Left> :wincmd h<CR>
nmap <silent> <A-Right> :wincmd l<CR>

" Hotswap backup modifier
set backup
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set backupskip=/tmp/*,/private/tmp/*
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set writebackup

" strip trailing white space
autocmd BufWritePre * :%s/\s\+$//e

" Extra command aliases
command SudoWrite :w !sudo tee %

" colorcheme
colorscheme koehler

" column 80 highlight
highlight ColorColumn ctermbg=magenta
call matchadd('colorColumn', '\%81v', 100)

" spell language
" use z= to find suggestions
" use zg to add to dictionary
set spelllang=en

" File specifics
filetype on
filetype plugin indent on
filetype indent on

" File uniques

" C & CPP
autocmd FileType c,cpp,slang set cindent

autocmd FileType bash setlocal ts=4 sts=2 sw=2
autocmd Filetype cfg setlocal ts=2 sts=2 sw=2
autocmd Filetype html setlocal ts=2 sts=2 sw=2
autocmd Filetype javascript setlocal ts=2 sts=2 sw=2
autocmd Filetype ruby setlocal  ts=2 sts=2 sw=2
autocmd Filetype sh setlocal ts=4 sts=2 sw=2
autocmd FileType shell setlocal ts=4 sts=2 sw=2
autocmd FileType python setlocal ts=4 sts=4 sw=4
autocmd Filetype yaml setlocal  ts=4 sts=2 sw=2
autocmd Filetype markdown setlocal spell
autocmd Filetype gitcommit setlocal spell
autocmd BufNewFile,BufRead *.epp set filetype=eruby

autocmd FileType make set noexpandtab sw=8 sts=0

autocmd Filetype puppet setlocal  ts=2 sts=2 sw=2

" Plugin Configs

" Puppet
let g:puppet_align_hashes = 1

" NERD Tree remaps and default hide
map <C-t> :NERDTreeToggle<CR>
let NERDTreeShowHidden=1

" Git Gutter
let g:gitgutter_enabled = 1
let g:gitgutter_signs = 1
let g:gitgutter_highlight_lines = 0
set updatetime=100

" Airline theme
let g:airline_theme='hybridline'

" Deoplete
"let g:deoplete#enable_at_startup = 1

" YouCompleteMe
" Default auto-completion for C family in .ycm_extra_conf.py
let g:ycm_global_ycm_extra_conf = "~/.vim/.ycm_extra_conf.py"
" YCM config w UltiSnips, etc.
let g:clang_snippets_engine = "ultisnips"
let g:ycm_use_ultisnips_completer = 1
let g:ycm_key_list_select_completion = ['<Down>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '!!'
let g:ycm_enable_diagnostic_highlighting = 0
let g:ycm_goto_buffer_command = 'horizontal-split'
nnoremap <leader>gd :YcmCompleter GoTo<CR>
nnoremap <leader>fd :YcmCompleter GoToDefinition<CR>

" Python config
let g:ycm_python_binary_path = '/usr/bin/python3'
let g:ycm_semantic_triggers = {'python': ['re!from\s+\S+\s+import\s']}


" Patches
"
" Fix backspace on VIM 8+
if v:version > 800
    set backspace=indent,eol,start
endif

" CSS 3 keyword fix
autocmd FileType scss set iskeyword+=-
au BufRead,BufNewFile *.scss set filetype=scss.css

