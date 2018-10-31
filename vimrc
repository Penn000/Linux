"https://github.com/VundleVim/Vundle.vim
":PluginsList -列举出列表中(.vimrc中)配置的所有插件
":PluginsInstall -安装列表中全部插件
":PluginsInstall! -更新列表中全部插件
":PluginsSearch foo -查找foo插件
":PluginsSearch! foo -刷新foo插件缓存
":PluginsClean -清除列表中没有的插件
":PluginsClean! -清除列表中没有的插件
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'	

syntax on
autocmd BufNewFile,BufRead * setlocal formatoptions=ql   "换行不自动注释
set ignorecase         " 设置默认进行大小写不敏感查找
set smartcase          " 如果有一个大写字母，则切换到大小写敏感查找
set cindent            " 使用 C/C++ 语言的自动缩进方式
set cinoptions={0,1s,t0,n-2,p2s,(03s,=.5s,>1s,=1s,:1s)}     "设置C/C++语言的具体缩进方式
set shiftwidth=4    " (自动) 缩进使用的4个空格
:se so=5 "下边总有几行"
set nu
set tabstop=4
set nobackup
set cursorline
set cursorcolumn
set autoindent
set ruler
set mouse=a
set showmatch
highlight LineNr ctermfg=darkgreen
highlight LineNr ctermbg=black
highlight MatchParen ctermfg=green

"设置水平滚动条
set guioptions+=b

map <C-n> :NERDTree<CR>
map <C-t> :Tagbar<CR>
map <C-A> ggVG
map! <C-A> <Esc>ggVG
map <F12> gg=G<C-o><C-o>
vnoremap <C-c> "+y

Plugin 'majutsushi/tagbar'
"nmap <Leader>tb :TagbarToggle<CR>        "快捷键设置
let g:tagbar_ctags_bin='/usr/bin/ctags'            "ctags程序的路径
let g:tagbar_width=30                    "窗口宽度的设置
"autocmd BufReadPost *.cpp,*.c,*.h,*.hpp,*.cc,*.cxx call tagbar#autoopen()     "如果是c语言的程序的话，tagbar自开启

Plugin 'scrooloose/nerdtree'
let NERDTreeWinPos='left'
let NERDTreeWinSize=30

Plugin 'bling/vim-airline'
Plugin 'tpope/vim-fugitive'
set laststatus=2
"这个是安装字体后 必须设置此项" 
let g:airline_powerline_fonts = 1   

"打开tabline功能,方便查看Buffer和切换,省去了minibufexpl插件
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#buffer_nr_show = 1

"git分支
let g:airline#extensions#hunks#enabled=1

"设置切换Buffer快捷键"
nnoremap <C-l> :bn<CR> 
nnoremap <C-h> :bp<CR> 
" 关闭状态显示空白符号计数
let g:airline#extensions#whitespace#enabled = 0
let g:airline#extensions#whitespace#symbol = '!'
let g:airline#extensions#tagbar#enabled = 1
" 设置consolas字体"前面已经设置过
"set guifont=Consolas\ for\ Powerline\ FixedD:h11
if !exists('g:airline_symbols')
	let g:airline_symbols = {}
endif
" old vim-powerline symbols
"let g:airline_left_sep = '⮀'
"let g:airline_left_alt_sep = '⮁'
"let g:airline_right_sep = '⮂'
"let g:airline_right_alt_sep = '⮃'
"let g:airline_symbols.branch = '⭠'
"let g:airline_symbols.readonly = '⭤'

Plugin 'Valloric/YouCompleteMe'
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/.ycm_extra_conf.py'
set completeopt=longest,menu
let OmniCpp_NamespaceSearch = 2     " search namespaces in the current buffer   and in included files
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteScope = 1    " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

set tags+=~/.vim/tags/cpp_src/tags


call vundle#end()            " required
filetype plugin indent on    " required


autocmd FileType cpp nnoremap <F9>   <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out<CR>
autocmd FileType cpp nnoremap <C-F9>   <Esc>:w<CR>:!g++ -std=c++11 %<CR>
autocmd FileType cpp nnoremap <F8> <Esc>:w<CR>:!g++ -std=c++11 -g % -o /tmp/a.out && gdb -q /tmp/a.out<CR>

autocmd FileType java nnoremap <F9>   <Esc>:w<CR>:javac Main.java && java Main<CR>

imap <c-> {<cr>}<c-o>O<left><right>
map <F2> :call SetTitle()<CR>
func SetTitle()
	let l = 0
	let l = l + 1 | call setline(l, '#include <cstdio>')
	let l = l + 1 | call setline(l, '#include <cstring>')
	let l = l + 1 | call setline(l, '#include <iostream>')
	let l = l + 1 | call setline(l, '#include <algorithm>')
	let l = l + 1 | call setline(l, '')
	let l = l + 1 | call setline(l, 'using namespace std;')
	let l = l + 1 | call setline(l, '')
	let l = l + 1 | call setline(l, 'int main()')
	let l = l + 1 | call setline(l, '{')
	let l = l + 1 | call setline(l, '')
	let l = l + 1 | call setline(l, '	return 0;')
	let l = l + 1 | call setline(l, '}')
	:9
endfunc


