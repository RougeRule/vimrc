let mapleader=" "
syntax on
set nu
set norelativenumber
set cursorline
set wrap
set showcmd
set wildmenu
set hlsearch
exec "nohlsearch"
set incsearch
set ignorecase
set nocompatible
filetype on
filetype indent on
filetype plugin on
filetype plugin indent on
set mouse=a
set encoding=utf-8
set tabstop=4
set expandtab
set shiftwidth=4
set softtabstop=4
set list
set listchars=tab:▸\ ,trail:▫
"set scrolloff=5
set tw=0
set indentexpr=
set backspace=indent,eol,start
set foldmethod=indent
set foldlevel=99
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
set laststatus=2
set autochdir
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
let g:SnazzyTransparent = 1
set cindent
set completeopt=longest,menu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""新文件标题
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"新建.c,.h,.sh,.java文件，自动插入文件头
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()"
""定义函数SetTitle，自动插入文件头
func SetTitle()
	"如果文件类型为.sh文件
	if &filetype == 'sh'
		call setline(1, "##########################################################################")
		call append(line("."), "# File Name: ".expand("%"))
		call append(line(".")+1, "# Author: lafin")
		call append(line(".")+2, "# mail: nope")
		call append(line(".")+3, "# Created Time: ".strftime("%c"))
		call append(line(".")+4, "#########################################################################")
	else
		call setline(1, "/*************************************************************************")
		call append(line("."), "	> File Name: ".expand("%"))
		call append(line(".")+1, "	> Author: lafin")
		call append(line(".")+2, "	> Mail: nope")
		call append(line(".")+3, "	> Created Time: ".strftime("%c"))
		call append(line(".")+4, " ************************************************************************/")
		call append(line(".")+5, "")
	endif
	if &filetype == 'cpp'
		call append(line(".")+6, "#include <iostream>")
		call append(line(".")+7, "#include <cstdio>")
		call append(line(".")+8, "#include <cstdlib>")
		call append(line(".")+9, "#include <cstring>")
		call append(line(".")+10, "#include <algorithm>")
		call append(line(".")+11, "#include <vector>")
		call append(line(".")+12, "#include <stack>")
		call append(line(".")+13, "#include <queue>")
		call append(line(".")+14, "#include <list>")
		call append(line(".")+15, "#include <map>")
		call append(line(".")+16, "#include <cmath>")
		call append(line(".")+17, "#include <string.h>")
		call append(line(".")+18, "#include <bitset>")
		call append(line(".")+19, "#include <fstream>")
		call append(line(".")+20, "#include <set>")
		call append(line(".")+21, "#include <climits>")
		call append(line(".")+22, "")
		call append(line(".")+23, "using namespace std;")
		call append(line(".")+24, "typedef long long ll;")
		call append(line(".")+25, "typedef unsigned int uint;")
		call append(line(".")+26, "typedef long double lb;")
		call append(line(".")+27, "const double PI = acos(-1.0);")
		call append(line(".")+28, "const double eps = 1e-6;")
		call append(line(".")+29, "const int INF = 0x3f3f3f3f;")
		call append(line(".")+30, "const int maxn = 100;")
		call append(line(".")+31, "")
		call append(line(".")+32, "int main()"
		call append(line(".")+33, "{")
		call append(line(".")+34, "    ")
		call append(line(".")+35, "    ")
		call append(line(".")+36, "    return 0;")
		call append(line(".")+37, "}")
	endif
	if &filetype == 'c'
		call append(line(".")+6, "#include <stdio.h>")
		call append(line(".")+7, "#include <stdlib.h>")
		call append(line(".")+8, "#include <string.h>")
		call append(line(".")+9, "")
        call append(line(".")+10, "int main()")
		call append(line(".")+11, "{")
		call append(line(".")+12, "    ")
		call append(line(".")+13, "    ")
		call append(line(".")+14, "    exit(0);")
		call append(line(".")+15, "}")
	endif
	"	if &filetype == 'java'
	"		call append(line(".")+6,"public class ".expand("%"))
	"		call append(line(".")+7,"")
	"	endif
	"新建文件后，自动定位到文件末尾
	autocmd BufNewFile * normal G
endfunc
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

noremap + nzz 
noremap - Nzz
noremap <LEADER><CR> :nohlsearch<CR>
map tt :r !figlet 
map ; :
map A :split<CR>
map S :vsplit<CR>
map Q :q<CR>
map W :w<CR>
map R :source $MYVIMRC<CR>
map <LEADER>k <C-w>h
map <LEADER>l <C-w>l
map <LEADER>p :PlugInstall<CR>
map <LEADER>t :NERDTree<CR>

""""""""""""""""""""""
""""""""COC"""""""""""
""""""""""""""""""""""
" Some servers have issues with backup files, see #649.
"set nobackup
"set nowritebackup
set hidden
let g:coc_global_extensions = [
      \ 'coc-vimlsp']
" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
set signcolumn=yes
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: There's always complete item selected by default, you may want to enable
" no select by `"suggest.noselect": true` in your configuration file.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

" Make <CR> to accept selected completion item or notify coc.nvim to format
" <C-g>u breaks current undo, please make your own choice.
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Use K to show documentation in preview window.
nnoremap <silent> K :call ShowDocumentation()<CR>

function! ShowDocumentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction

nmap ts <Plug>(coc-translator-p)

call plug#begin('~/.vim/plugged')

Plug 'vim-airline/vim-airline'
Plug 'connorholyday/vim-snazzy'
Plug 'preservim/nerdtree'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"函数原型
Plug 'liuchengxu/vista.vim'
"括号补齐
Plug 'jiangmiao/auto-pairs'
Plug 'sainnhe/everforest'
" Error checking
Plug 'w0rp/ale'

"主题颜色
Plug 'rhysd/vim-color-spring-night'

"enter 快速选取
Plug 'gcmt/wildfire.vim'

call plug#end()

colorscheme spring-night
let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
set termguicolors
let g:airline_theme = 'spring_night'

