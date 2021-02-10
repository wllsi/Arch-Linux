syntax on
filetype plugin on
if has("gui_running")
  colorscheme dracula
  set mouse=c guifont=Noto\ Sans\ Mono\ Regular\ 12 guioptions-=T guioptions-=r guioptions-=L guicursor+=c:blinkon000 guicursor=i-ci:hor100
else
  hi ColorColumn ctermbg=Black
endif
set t_Co=16 clipboard=unnamedplus encoding=utf8 ttimeoutlen=1 undofile undodir=$HOME/.vim/undo laststatus=2 colorcolumn=80 cursorline re=1 lazyredraw incsearch ignorecase nocompatible noswapfile hidden wrap noeol virtualedit=onemore backspace=2 expandtab autoindent tabstop=2 shiftwidth=4 noshowmode guioptions-=m viminfo+=:10000,n~/.vim/.viminfo
hi CursorLine cterm=none ctermbg=Black
autocmd BufNewFile,BufEnter *.hs set tabstop=8 softtabstop=4 shiftround
autocmd BufNewFile,BufReadPre *.hs inoremap {- {-<CR>}<Esc>ka<Space>
autocmd BufNewFile,BufReadPre *.hs inoremap -- --<Space>\|<Space>
autocmd BufNewFile,BufReadPre *.hs inoremap '' ``<left>
autocmd BufNewFile,BufReadPre *.hs inoremap ' `
autocmd BufNewFile,BufReadPre *.hs inoremap ` '
autocmd BufNewFile,BufEnter *.go set tabstop=4 
autocmd BufNewFile,BufReadPre *.go inoremap /* /*<CR><Space><Space>*/<Esc>O
autocmd BufNewFile,BufEnter *.py set tabstop=4 
autocmd BufNewFile,BufReadPre *.py inoremap ## """<CR>"""<Esc>ko
autocmd BufNewFile,BufReadPre *.py inoremap :<CR> :<CR><tab>
inoremap /* /*<CR>/<Esc>ka<Space>
inoremap {<Space> {<CR>};<Esc>O<tab>
inoremap {<CR> {<CR>}<Esc>O<tab>
inoremap { {}<left>
inoremap [ []<left>
inoremap ( ()<left>
inoremap "" ""<left>
inoremap '' ''<left>
inoremap << <><left>
inoremap [dot ●
nnoremap <S-Tab> <<
vnoremap <S-Tab> <
nnoremap S :x <enter>
nnoremap s :w <enter>
nnoremap q :q <enter>
nnoremap w <C-W>w
nnoremap r <C-R>
nnoremap <C-R> r
nnoremap H 0
vnoremap H 0
nnoremap L $
vnoremap L $
nnoremap K <C-U>
vnoremap K <C-U>
nnoremap J <C-D>
vnoremap J <C-D>
nnoremap f e
vnoremap f e
nnoremap p Pl
vnoremap p Pl
vnoremap d "_d
nnoremap o o<Esc>
nnoremap O O<Esc>

func! WriteEdit()
  syntax off
  set fo=a tw=80 nonumber noautoindent virtualedit=onemore tabstop=5 shiftwidth=5
  inoremap <CR> <CR><CR>
  inoremap " “
  inoremap ." .”
  inoremap ," ,”
  inoremap ?" ?”
  inoremap --" —”
  inoremap "<Space> ”<Space>
  inoremap ' ’
  inoremap '' ‘
  inoremap -- —
  normal vy
  let x1 = getreg('0')
  if (x1 == '●')
    normal OO
    " put = strftime('● %x %X (%Z)')
    put = strftime('● %x %T')
    normal Hfhvfffffy
    let x2 = getreg('0')
    normal jjvfffffy
    let x3 = getreg('0')
    if (x2 == x3)
      put = '[EARLIER: ]'
      normal kLvbbbbbxjLpHvfffffldLlvjdbbbbbbblvyfffffflpggVdoo
    else
      normal kkVxkpoj
    endif
  endif
  func! Spelling()
    set spell spelllang=en_us
  endfu 
  com! SP call Spelling()
  func! ExportDoc()
    %s/\ \ \ \ \ /\t/g
    %s/\n\n/\ \r\r\r\r/g 
    setlocal fo=croql 
    vnoremap N J
    %norm vipN 
    %s/\ \n\n/\ \r/g 
    %s/\.\ \ /\.\ /g
    %s/\ \ /\ /g
    %s/\t/\ \ \ \ \ /g
    normal gg
  endfu 
  com! ED call ExportDoc()
  func! ImportDoc()
    %s/\n/\ \r\r/g
    %s/\t/\ \ \ \ \ /g
    normal gggqGgg
  endfu 
  com! ID call ImportDoc()
endfu
com! WE call WriteEdit()