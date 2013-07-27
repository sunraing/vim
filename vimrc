runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()
filetype on
filetype plugin on
filetype indent on
syntax on

set nocompatible " 关闭兼容模式
"set guifont=Consolas:h13:cANSI " gvim字体设置
"set guifont=FreeMono\ 13 " gvim字体设置
set guifont=Source\ Code\ Pro\ Light\ 14
set encoding=utf-8 " gvim内部编码
set fileencoding=utf-8 " 当前编辑的文件编码
set fileencodings=utf-8,gbk,cp936,gb2312 " gvim支持打开支持编码的文件
let &termencoding=&encoding
set ambiwidth=double

let mapleader=';'
let g:mapleader=';'

"PowerLine
let g:Powerline_symbols = 'compatible'
"let g:Powerline_symbols = 'fancy'
set laststatus=2
set t_Co=256

"indentLine
nmap <leader>l :IndentLinesToggle<CR>
let g:indentLine_loaded = 1
let g:indentLine_color_term = 239
let g:indentLine_color_gui = '#A4E57E'
"let g:indentLine_char = '┊'
let g:indentLine_char = '┆'

"Tabular
if exists(":Tabularize")
	nmap f= :Tab/=
	vmap f= :Tab/=
	nmap f: :Tab/:\zs
	vmap f: :Tab/:\zs
endif

"NERDcommenter
map <F9> <leader>c<space>

if has("gui_running")
	set cursorline
	set guioptions+=r
	set guioptions-=R
	set guioptions-=l
	set guioptions-=L
	set guioptions-=T
endif
colors graywh
set nu
"set nowrap
set lines=29 columns=85

set autochdir
"setlocal foldmethod=indent
set foldmethod=syntax
set foldlevelstart=99
"set foldcolumn=4
"au BufWinLeave {*.*,.*} silent mkview
"au BufWinEnter {*.*,.*} silent loadview

"set lcs=tab:\|\ 
"set list
set completeopt=longest,menu "关掉智能补全时的预览窗口
"自动补全命令时候使用菜单式匹配列表
set wildmenu
autocmd FileType ruby,eruby set omnifunc=rubycomplete#Complete
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType java set omnifunc=javacomplete#Complet

"查找
set hlsearch
nmap <F3> <ESC>*
imap <F3> <ESC>*
nmap <F4> <ESC>#
imap <F4> <ESC>#

nmap <leader>s :%s/\s\+$//g<CR>
nmap <leader>w :w<CR>
nmap <leader>a ggVG

vmap <leader>x "+x
vmap <leader>y "+yy
nmap <leader>p "+gP

set nobackup
set nowb
set noswapfile

inoremap ( ()<Esc>i
inoremap ) <c-r>=ClosePair(')')<CR>
inoremap [ []<Esc>i
inoremap ] <c-r>=ClosePair(']')<CR>
function ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endf

"inoremap { {<CR>}<Esc>O
"inoremap } <c-r>=CloseBracket()<CR>
"function CloseBracket():w
	"if match(getline(line('.') + 1), '\s*}') < 0
		"return "\<CR>}"
	"else
		"return "\<Esc>j0f}a"
	"endif
"endf
 
inoremap " <c-r>=QuoteDelim('"')<CR>
inoremap ' <c-r>=QuoteDelim("'")<CR>
function QuoteDelim(char)
	let line = getline('.')
	let col = col('.')
	if line[col - 2] == "\\"
		"Inserting a quoted quotation mark into the string
		return a:char
	elseif line[col - 1] == a:char
		"Escaping out of the string
		return "\<Right>"
	else
		"Starting a string
		return a:char.a:char."\<Esc>i"
	endif
endf

