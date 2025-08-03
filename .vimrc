"general
syntax on
set nocompatible
set cindent
set hlsearch
set incsearch
set nowrapscan
set nu
set rnu
set path+=**
set wildmenu
set belloff=all

"norm 
set shiftwidth=4
set softtabstop=4
set tabstop=4

"laststatus
set laststatus=2
set statusline=%F							" Path to the file
set statusline+=%=							" Switch to the right side
set statusline+=%l							" Current line
set statusline+=/							" Separator
set statusline+=%L							" Total lines
set statusline+=-							" Separator
set statusline+=%c							" Total lines
set statusline+=\ %{strftime('%A-%H:%M')}	" Time

"colorscheme
hi StatusLine ctermfg=Yellow
hi StatusLine ctermbg=Brown
hi StatusLineNC ctermfg=LightGray
hi StatusLineNC ctermbg=DarkGray
hi Search ctermbg=DarkGreen
hi Search ctermfg=Black
hi CurSearch ctermbg=LightCyan
hi CurSearch ctermfg=LightYellow
hi MatchParen ctermbg=Red
hi MatchParen ctermfg=LightYellow
hi String ctermfg=Cyan

"disable netrw browser banner
let g:netrw_banner=0
let g:netrw_browse_split=4
let g:netrw_preview=1
let g:netrw_liststyle=3
let g:netrw_winsize=80
