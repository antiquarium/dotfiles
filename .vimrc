" Based on: https://missing.csail.mit.edu/2020/files/vimrc

" Derive indentation from the parent line when creatin a new blank line with o
" or O
set smartindent

" Vim is based on Vi. Setting `nocompatible` switches from the default
" Vi-compatibility mode and enables useful Vim functionality. This
" configuration option turns out not to be necessary for the file named
" '~/.vimrc', because Vim automatically enters nocompatible mode if that file
" is present. But we're including it here just in case this config file is
" loaded some other way (e.g. saved as `foo`, and then Vim started with
" `vim -u foo`).
set nocompatible

" Turn on syntax highlighting.
syntax on

" Disable the default Vim startup message.
set shortmess+=I

" Show line numbers.
set number

set relativenumber

" Always show the status line at the bottom, even if you only have one window open.
set laststatus=2

" The backspace key has slightly unintuitive behavior by default. For example,
" by default, you can't backspace before the insertion point set with 'i'.
" This configuration makes backspace behave more reasonably, in that you can
" backspace over anything.
set backspace=indent,eol,start

" By default, Vim doesn't let you hide a buffer (i.e. have a buffer that isn't
" shown in any window) that has unsaved changes. This is to prevent you from "
" forgetting about unsaved changes and then quitting e.g. via `:qa!`. We find
" hidden buffers helpful enough to disable this protection. See `:help hidden`
" for more information on this.
set hidden

" This setting makes search case-insensitive when all characters in the string
" being searched are lowercase. However, the search becomes case-sensitive if
" it contains any capital letters. This makes searching more convenient.
set ignorecase
set smartcase

" Enable searching as you type, rather than waiting till you press enter.
set incsearch

" Unbind some useless/annoying default key bindings.
nmap Q <Nop> " 'Q' in normal mode enters Ex mode. You almost never want this.

" Disable audible bell because it's annoying.
set noerrorbells visualbell t_vb=

" Enable mouse support. 
set mouse+=a

" Wait 500ms for a subsequent key in a sequence
set timeoutlen=500

" Automatically insert pairs
inoremap { {}<Esc>ha
inoremap } {  }<Esc>hha
inoremap ( ()<Esc>ha
inoremap ) (  )<Esc>hha
inoremap [ []<Esc>ha
inoremap ] [  ]<Esc>hha
inoremap <> <><Esc>ha
inoremap " ""<Esc>ha
" Single ' is an apostrophe in regular text
inoremap '' ''<Esc>ha 
inoremap ` ``<Esc>ha

" Insert blank line between braces (`smartindent` handles indentation)
inoremap {<CR> {}<Esc>ha<CR><Esc>O
inoremap (<CR> ()<Esc>ha<CR><Esc>O
inoremap [<CR> []<Esc>ha<CR><Esc>O
inoremap <<CR> <><Esc>ha<CR><Esc>O

" Automatically install plug.vim if it doesn't exist locally
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Plugins
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

" Make sure you use single quotes
Plug 'doums/darcula'
Plug 'tpope/vim-surround'
Plug 'ctrlpvim/ctrlp.vim'

call plug#end()

colorscheme darcula
" set termguicolors
