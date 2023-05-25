" MY VIMCONFIG " 

" custom settings
syntax on
set number
set relativenumber
set colorcolumn=80
hi ColorColumn ctermbg=DarkGrey
set tabstop=4
set shiftwidth=4
set scrolloff=8
filetype indent on
set swapfile
set nobackup
set dir=~/.tmp
set showcmd
set tgc " makes colors good 
set splitright " open vsplits to the right

" color scheme
colorscheme solarized8_high

" indentation setup
autocmd Filetype ocaml setlocal ts=2 sw=2 expandtab
autocmd Filetype python setlocal ts=4 sw=4 expandtab

" for polyglot
set nocompatible

" toggle term
fun! TabTogTerm()
  let l:OpenTerm = {x -> x
        \  ? { -> execute('botright 15 split +term') }
        \  : { -> execute('botright term ++rows=15') }
        \ }(has('nvim'))
  let term = gettabvar(tabpagenr(), 'term',
        \ {'main': -1, 'winnr': -1, 'bufnr': -1})
  if ! bufexists(term.bufnr)
    call l:OpenTerm()
    call settabvar(tabpagenr(), 'term',
          \ {'main': winnr('#'), 'winnr': winnr(), 'bufnr': bufnr()})
    exe 'tnoremap <buffer> <leader>t <cmd>q<cr>'
    exe 'tnoremap <buffer> <c-d> <cmd>bd!<cr>'
    setl winheight=12
  else
    if ! len(filter(tabpagebuflist(), {_,x -> x == term.bufnr}))
      exe 'botright 15 split +b\ ' . term.bufnr
    else
      exe term.winnr . ' wincmd w'
    endif
  endif
endfun
" you're advised to alias :Q to exit if mapping <c-d>

""" netrw setup
autocmd filetype netrw call Netrw_mappings()
function! Netrw_mappings()
  noremap <buffer>% :call CreateInPreview()<cr>
endfunction
function! CreateInPreview()
  let l:filename = input("please enter filename: ")
  execute 'pedit ' . b:netrw_curdir.'/'.l:filename
endfunction
function! CreateInPreview()
  let l:filename = input("please enter filename: ")
  execute 'silent !touch ' . b:netrw_curdir.'/'.l:filename 
  redraw!
endf
let g:NetrwIsOpen=0

function! ToggleNetrw()
    if g:NetrwIsOpen
        let i = bufnr("$")
        while (i >= 1)
            if (getbufvar(i, "&filetype") == "netrw")
                silent exe "bwipeout " . i 
            endif
            let i-=1
        endwhile
        let g:NetrwIsOpen=0
    else
        let g:NetrwIsOpen=1
        silent Vexplore
    endif
endfunction
" close if only remaining buffer
autocmd WinEnter * if winnr('$') == 1 && getbufvar(winbufnr(winnr()), "&filetype") == "netrw" || &buftype == 'quickfix' |q|endif
" Start with dotfiles hidden
let ghregex='\(^\|\s\s\)\zs\.\S\+'
let g:netrw_list_hide=ghregex
" Usual things
let g:netrw_special_syntax = 3
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_browse_split = 4
let g:netrw_altv = 1
let g:netrw_winsize = 15
let g:netrw_keepdir=0

" status line basics
set laststatus=2
set statusline=%<%f%m\ cwd:\%{getcwd()}\ \ \ %=\ [%{strftime('%Y/%b/%d\ %a\ %I:%M\ %p')}\]\ \ %P

"""" PLUGINS """"
call plug#begin()
	
Plug 'altercation/vim-colors-solarized'
Plug 'sheerun/vim-polyglot'
Plug 'ap/vim-buftabline'
Plug 'xuhdev/vim-latex-live-preview'

call plug#end()

"""" KEY MAPPINGS """"
  " general
  let mapleader = " "

  " personal preferences
  nnoremap <C-A> ggVG

  " window navigation
  nnoremap <silent> <leader>w :bd!<CR>

  " netrw navingation
  nnoremap <silent> <leader>e  :call ToggleNetrw()<CR>

  " toggle terminal
  nnoremap <silent> <leader>t <cmd>call TabTogTerm()<cr>
  tnoremap jk <C-\><C-N> " escape
  tnoremap <buffer> <leader>p :colo delek<cr>

  " tabline view
  set hidden
  nnoremap <C-N> :bnext<CR>
  nnoremap <C-P> :bprev<CR>

  " window movement 
  nnoremap <C-K> <C-W>k
  nnoremap <C-J> <C-W>j
  nnoremap <C-H> <C-W>h
  nnoremap <C-L> <C-W>l
  inoremap jk <ESC>


  " window resizing with arrow keys
  nnoremap <C-Up> :resize -2<CR>
  nnoremap <C-Down> :resize +2<CR>
  nnoremap <C-Left> :vertical resize -2<CR>
  nnoremap <C-Right> :vertical resize +2<CR>
  





















" END OF MY VIM CONFIG 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 2k GENERIC VIMCONFIG
" Get the defaults that most users want.
source $VIMRUNTIME/defaults.vim

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Put these in an autocmd group, so that we can delete them easily.
augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78
augroup END

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
" The ! means the package won't be loaded right away but when plugins are
" loaded during initialization.
if has('syntax') && has('eval')
  packadd! matchit
endif
