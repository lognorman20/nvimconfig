vim.cmd [[
try
  let g:neosolarized_termtrans = 1
  colorscheme NeoSolarized
  hi clear LineNr
  hi CursorLineNr guifg=#ffffff
catch /^Vim\%((\a\+)\)\=:E185/
  colorscheme default
  set background=dark
endtry
]]
  --[[ hi Normal guibg=NONE ctermbg=NONE ]]
  --[[ hi clear SignColumn ]]
  --[[ hi EndOfBuffer guifg=NONE  ]]
