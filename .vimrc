let g:pathogen_disabled = ['lusty', 'csapprox']
call pathogen#infect()
call pathogen#helptags()

set mouse=a
syntax enable
set nobackup
set noswapfile
set pastetoggle=<F3>
set t_Co=256
set number
set nofoldenable
set laststatus=2
set autoread
set scrolloff=3
set cul
set wildmenu
set wildmode=list:longest

" System default for mappings is now the "," character
let mapleader = ","

" search
set ignorecase
set smartcase
set hlsearch
set tags=tags;/

" indenting
set smartindent
set tabstop=4
set shiftwidth=4
filetype plugin indent on

" buffers
set autowrite
set hidden 
" Wipe out all buffers
nmap <silent> <Leader>wa :1,9000bwipeout<cr>
nmap <Leader>da ggdG
map <C-j> :bprev<CR>
map <C-k> :bnext<CR>

" bindings
nnoremap ; :
vnoremap ; :
map <Leader>' :b#<CR>
map <C-C> "+y
map <C-A> <ESC>ggVG
nmap <silent> ,/ :set hlsearch!<CR>
map <Leader>M :%s/<C-V><C-M>//g<CR>
map <Leader>ff :let @+=expand('%:t')<CR>:echo expand('%:t')<CR>
map <Leader>fr :let @+=expand('%')<CR>:echo expand('%')<CR>
map <Leader>fp :let @+=expand('%:p')<CR>:echo expand('%:p')<CR>
map <Leader>sc <ESC>:Scratch<CR>

" Edit common files
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>
nmap <silent> <Leader>ssh :e ~/.ssh/config<CR>
nmap <silent> <Leader>bash :e ~/.bash_profile<CR>

" toggle between number and relative number on ,l
nnoremap <Leader>l :call ToggleRelativeAbsoluteNumber()<CR>
function! ToggleRelativeAbsoluteNumber()
  if &number
    set relativenumber
  else
    set number
  endif
endfunction

" Try jj for esc
imap jj <esc>

" comments
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o

" quickfix
map <Leader>qq <ESC>:cw<CR>
map <Leader>qc <ESC>:ccl<CR>
map <Leader>q] <ESC>:cn<CR>
map <Leader>q[ <ESC>:cp<CR>

" move lines
nmap <C-Up> ddkP
nmap <C-Down> ddp
vmap <C-Up> xkP`[V`]
vmap <C-Down> xp`[V`]

" wrap
map <Leader>wr <ESC>:set wrap!<CR>

" list whitespace
map <Leader>ww :set list!<CR>
set listchars=tab:▸\ ,eol:¬

" make up/down go to next row in editor instead of next line
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

" sudo write this
cmap W! w !sudo tee % >/dev/null

"Markdown to HTML  
nmap <Leader>md :%!/usr/local/bin/Markdown.pl --html4tags <CR>

" Nerd Tree
map <F2> :NERDTreeToggle<CR>
let g:NERDTreeWinSize = 25

" Nerd Commenter
let NERDCreateDefaultMappings = 0
nmap <Leader>c <Plug>NERDCommenterToggle
vmap <Leader>c <Plug>NERDCommenterToggle 

" Tabs
map <Leader>wt <C-W>T
map <Leader>tc :tabc<CR>
map <Leader>te :tabe 
map <Leader>to :tabo<CR>
map <M-]> gt
map <M-[> gT
map <M-1> 1gt
map <M-2> 2gt
map <M-3> 3gt
map <M-4> 4gt
map <M-5> 5gt
map <M-0> :tablast<CR>

" php folding with PHPDoc support
let g:DisableAutoPHPFolding = 1
map <F6> <Esc>:EnableFastPHPFolds<CR>

" taglist
map <F8> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" pdv - PHPDocumenter
imap <Leader>d <ESC>:call PhpDocSingle()<CR>i 
nmap <Leader>d :call PhpDocSingle()<CR> 
vmap <Leader>d :call PhpDocRange()<CR> 

" CtrlP
let g:ctrlp_root_markers = ['.root-dir']
let g:ctrlp_working_path_mode = 2
map <C-B> :CtrlPBuffer<CR>

" Syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes' : ['php'] }
let g:syntastic_auto_jump = 1
let g:syntastic_auto_loc_list = 1
let s:php_executable = 'php'

" Easy Motion
hi link EasyMotionTarget ErrorMsg
hi link EasyMotionShade Comment

" SuperTab
let g:SuperTabDefaultCompletionType = "context"
let g:SuperTabClosePreviewOnPopupClose = 1

" Color Scheme
set background=dark
let g:solarized_termtrans=1
let g:solarized_termcolors=256
let g:solarized_contrast="high"
let g:solarized_visibility="high"
colorscheme solarized

function HtmlEscape()
	silent s/&/\&amp;/eg
	silent s/</\&lt;/eg
	silent s/>/\&gt;/eg
	silent s/“/\&ldquo;/eg
	silent s/”/\&rdquo;/eg
	silent s/™/\&trade;/eg
	silent s/®/\&reg;/eg
	silent s/©/\&copy;/eg
	silent s/‘/\&lsquo;/eg
	silent s/’/\&rsquo;/eg
	silent s/–/\&ndash;/eg
	silent s/—/\&mdash;/eg
endfunction

function HtmlUnEscape()
	silent s/&amp;/\&/eg
	silent s/&lt;/</eg
	silent s/&gt;/>/eg
	silent s/&ldquo;/“/eg
	silent s/&rdquo;/”/eg
	silent s/&trade;/™/eg
	silent s/&reg;/®/eg
	silent s/&copy;/©/eg
	silent s/&lsquo;/‘/eg
	silent s/&rsquo;/’/eg
	silent s/&ndash;/–/eg
	silent s/&mdash;/—/eg
endfunction

nnoremap <silent> <Leader>h :call HtmlEscape()<CR>
nnoremap <silent> <Leader>H :call HtmlUnEscape()<CR>
vnoremap <silent> <Leader>h :call HtmlEscape()<CR>
vnoremap <silent> <Leader>H :call HtmlUnEscape()<CR>

" Start NERDTree on launch and focus file
"autocmd VimEnter * NERDTree
"autocmd BufEnter * NERDTreeMirror
"autocmd VimEnter * wincmd w

" Examples
" language specific setting
" autocmd filetype python set expandtab

" PHP
"autocmd FileType php setlocal expandtab shiftwidth=4 tabstop=4 softtabstop=4
