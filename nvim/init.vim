" .vimrc
"
"
let $CACHE = expand('~/.cache')
if !isdirectory($CACHE)
  call mkdir($CACHE, 'p')
endif

"dein.vim"{{{
if &runtimepath !~# '/dein.vim'
  let s:dein_dir = fnamemodify('dein.vim', ':p')
  if !isdirectory(s:dein_dir)
    let s:dein_dir = $CACHE .. '/dein/repos/github.com/Shougo/dein.vim'
    if !isdirectory(s:dein_dir)
      execute '!git clone https://github.com/Shougo/dein.vim' s:dein_dir
    endif
  endif
  execute 'set runtimepath^=' .. substitute(
        \ fnamemodify(s:dein_dir, ':p') , '[/\\]$', '', '')
endif

let s:dein_toml = '~/.config/nvim/dein.toml'
let s:dein_lazy_toml = '~/.config/nvim/dein_lazy.toml'
let s:deinft_toml = '~/.config/nvim/deinft.toml'
if dein#load_state(s:dein_dir)
  call dein#begin(s:dein_dir, [
        \ expand('<sfile>'), s:dein_toml, s:dein_lazy_toml, s:deinft_toml
        \ ])
  call dein#load_toml(s:dein_toml)
  call dein#load_toml(s:dein_lazy_toml, {'lazy': 1})
  call dein#load_toml(s:deinft_toml)
  call dein#end()
  call dein#save_state()
endif


if dein#check_install()
  call dein#install()
endif

function! s:deinClean()
  if len(dein#check_clean())
    call map(dein#check_clean(), 'delete(v:val, "rf")')
  else
    echo '[ERR] no disabled plugins'
  endif
endfunction
command! DeinClean :call s:deinClean()
"}}}

"General"{{{
filetype plugin on
filetype indent on

" initialize augroup
augroup vimrc
  autocmd!
augroup end

set encoding=utf-8
syntax on
set autoindent
set smartindent

if has('persistent_undo')
  set undodir=~/.cache/vim/undo " You should mkdir -p ~/.cache/vim/undo
  set undofile
endif

" UI"{{{
colorscheme PaperColor
set background=dark

set list
set listchars=tab:¦-,trail:˽

let g:indentLine_char = '¦' "|¦┆│
"let g:indentLine_first_char = '|'
let g:indentLine_leadingSpaceChar = '·' "also can use: ˽˰··
"let g:indentLine_showFirstIndentLevel = 1
let g:indentLine_leadingSpaceEnabled = 1
let g:indentLine_setConceal = 0

set scrolloff=3
set laststatus=2
set cmdheight=2
set showcmd
set title
set noshowmode
set number
set ruler
set wrap
set wrapscan
set breakindent
set showmatch
set wildmenu
set formatoptions-=ro
set mouse=
set hidden
set textwidth=80
set colorcolumn=+1
set previewheight=5
set signcolumn=yes
"}}}

autocmd vimrc BufWritePre * :%s/\s\+$//ge

" tab
set tabstop=2
set softtabstop=2
set shiftwidth=2
set expandtab
set backspace=2

" search
set hlsearch
set ignorecase
set smartcase
set incsearch

set foldmethod=marker

let g:incsearch#magic = '\v'

set pyxversion=3

"}}}

" Key Mappings"{{{
tnoremap <Esc> <C-\><C-n>

nnoremap [tags] <Nop>
nmap <Space>t [tags]
nnoremap <silent> [tags]j <C-]>
nnoremap <silent> [tags]b <C-t>

nnoremap [loc] <Nop>
nmap <Space>l [loc]
nnoremap <silent> [loc]c :<C-u>lclose<CR>
nnoremap <silent> [loc]n :<C-u>lnext<CR>
nnoremap <silent> [loc]p :<C-u>lprev<CR>

nnoremap [lsp] <Nop>
nmap <Space>s [lsp]
nnoremap <silent> [lsp]s :<C-u>lua vim.diagnostic.open_float()<CR>
nnoremap <silent> [lsp]h :<C-u>lua vim.lsp.buf.hover()<CR>
nnoremap <silent> [lsp]r :<C-u>LspRestart<CR>

nnoremap [git] <Nop>
nmap <Space>g [git]
nnoremap [git]a :Gwrite<CR>
nnoremap [git]c :Gcommit<CR>
nnoremap [git]s :Gstatus<CR>
nnoremap [git]d :Gdiff<CR>
nnoremap [git]l :Glog<CR>

nnoremap [buf] <Nop>
nmap <Space>b [buf]
nnoremap [buf]n :<C-u>bnext<CR>
nnoremap [buf]p :<C-u>bprevious<CR>
nnoremap [buf]l :<C-u>ls<CR>

nnoremap j gj
nnoremap k gk
nnoremap gj j
nnoremap gk k
nnoremap Q <Nop>
inoremap <C-c> <Esc>

noremap <Left> <Nop>
noremap <Right> <Nop>
noremap <Down> <Nop>
noremap <Up> <Nop>
inoremap <Down> <Nop>
inoremap <Up> <Nop>


nmap <Leader>c <Plug>(caw:hatpos:toggle)
vmap <Leader>c <Plug>(caw:hatpos:toggle)

map / <Plug>(incsearch-forward)
map ? <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)
nnoremap <silent> <Space>nh :<C-u>noh<CR>

nnoremap <silent> <Space>jd :<C-u>JsDoc<CR>

command! SourceRc :source ~/.config/nvim/init.vim

"}}}

" Languages"{{{
" python"{{{
 autocmd vimrc FileType python setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
"
"}}}

" elm"{{{
autocmd vimrc FileType elm setl tabstop=4 expandtab shiftwidth=4 softtabstop=4
"
"}}}

" scheme{{{
autocmd vimrc FileType scheme
\   if &l:omnifunc == ''
\ |   setlocal omnifunc=syntaxcomplete#Complete
\ | endif
"}}}

" javascript"{{{
let g:vim_json_syntax_conceal = 0
let g:jsdoc_allow_input_prompt = 1
let g:jsdoc_tags = {}
let g:jsdoc_tags['returns'] = 'return'
let g:vim_jsx_pretty_colorful_config = 1 " default 0
"}}}
"
" OCaml{{{
let g:opamshare = substitute(system('opam config var share'),'\n$','','''')
" execute "set rtp+=" . g:opamshare . "/merlin/vim"
"}}}
"
" Rust{{{
autocmd vimrc FileType rust setl textwidth=100
"}}}
"}}}

" Load local settings {{{
if filereadable(expand($HOME.'/.local.vim'))
  source $HOME/.local.vim
endif
"}}}
