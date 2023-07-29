let mapleader = "\<Space>"

source $HOME/.config/nvim/config/keys.vim
source $HOME/.config/nvim/editor.vim
source $HOME/.config/nvim/config/autocmd.vim


" vp doesn't replace paste buffer
function! RestoreRegister()
  let @" = s:restore_reg
  return ''
endfunction
function! s:Repl()
  let s:restore_reg = @"
  return "p@=RestoreRegister()\<cr>"
endfunction
vmap <silent> <expr> p <sid>Repl()

nnoremap <CR> G
nnoremap <BS> gg

" fzf ignore all files in gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
