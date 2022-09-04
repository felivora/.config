let mapleader = "\<Space>"

source $HOME/.config/nvim/config/keys.vim
source $HOME/.config/nvim/editor.vim
source $HOME/.config/nvim/config/autocmd.vim


" -------------------------------
" PlugIns
" -------------------------------

call plug#begin()

" package installer
Plug 'williamboman/mason.nvim'

" vim enhancements
Plug 'editorconfig/editorconfig-vim'
Plug 'terryma/vim-expand-region'
Plug 'ggandor/lightspeed.nvim'
Plug 'smithbm2316/centerpad.nvim'
Plug 'windwp/nvim-autopairs'

" GUI enhancements
Plug 'itchyny/lightline.vim'
Plug 'machakann/vim-highlightedyank'
Plug 'andymass/vim-matchup'

" Fuzzy finder
Plug 'airblade/vim-rooter'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Tree Explorer
Plug 'preservim/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'ryanoasis/vim-devicons'

" Color Theme
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'projekt0n/github-nvim-theme'

" UI Adjustments
Plug 'itchyny/lightline.vim'

" Collection of common configurations for the Nvim LSP client
Plug 'neovim/nvim-lspconfig'

" Completion framework
Plug 'hrsh7th/nvim-cmp'

" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'

" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'
Plug 'dcampos/nvim-snippy'
" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'

" See hrsh7th's other plugins for more completion sources!
Plug 'ray-x/lsp_signature.nvim'
" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'

" Snippet engine
Plug 'hrsh7th/vim-vsnip'

" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'nvim-lua/lsp_extensions.nvim'

Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

call plug#end()

colorscheme github_dimmed
" set background=dark

source $HOME/.config/nvim/config/lsp.vim

lua << EOF
require("nvim-autopairs").setup {}

require("mason").setup {}
EOF

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

" Configure vim-svelte
let g:svelte_preprocessor_tags = [
			\ {'name': 'ts', 'tag': 'script', 'as': 'typescript'}
			\ ]
let g:svelte_preprocessors = ['typescript', 'ts', 'scss']

" fzf ignore all files in gitignore
let $FZF_DEFAULT_COMMAND = 'ag -g ""'
