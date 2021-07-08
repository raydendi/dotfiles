
"------------------------------------------------------------------- Basic setting
set linebreak
set number
set wrap
set noerrorbells
syntax on
set nobackup	
set noswapfile
set hidden
set incsearch
set shiftwidth=2
set nu
set nohls
set tabstop=4 softtabstop=4
set spelllang=id,en
set cmdheight=1
set smarttab
set expandtab
set smartcase
set smartindent
set shiftwidth=2                        
set encoding=UTF-8
set conceallevel=0
set scrolloff=7
filetype plugin indent on
highlight ColorColumn ctermbg=0 guibg=lightgrey

" ---------------------------------------------------------------------- keybinding
" Quick Shortcut
nnoremap <silent> <A-g> :Goyo<Enter> <CR>
nnoremap <silent>ns :set nospell<Enter>
nnoremap <silent> <leader>ll :Limelight<Enter>
nnoremap <silent> <A-n> :NERDTree<Enter><CR>
nnoremap <silent> <A-q> :SClose<Enter>
nnoremap <A-s> :w<Enter>
nnoremap <A-s> :FZF<Enter>

"copy paste to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Jump through pane
nnoremap <S-h> :wincmd h<CR>
nnoremap <S-l> :wincmd l<CR>
nnoremap <S-j> :wincmd j<CR>
nnoremap <S-k> :wincmd k<CR>

" Resizing pane 
nnoremap <Up> :resize +2<CR> 
nnoremap <Down> :resize -2<CR>
nnoremap <Left> :vertical resize +2<CR>
nnoremap <Right> :vertical resize -2<CR>


" ---------------------------------------------- Markdown Config
" Markdown plugin
let g:vim_markdown_folding_level = 6
let g:vim_markdown_toc_autofit = 1
set conceallevel=2
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'

" Thesaurus



" Markdown enchantment plugin
let g:mkdx#settings     = { 'highlight': { 'enable': 1 },
                        \ 'enter': { 'shift': 1 },
                        \ 'links': { 'external': { 'enable': 1 } },
                        \ 'toc': { 'text': 'Table of Contents', 'update_on_write': 1 },
                        \ 'fold': { 'enable': 1 } }
let g:mkdx#settings = { 'map': { 'enable': 1 } }

" :h mkdx-setting-map-prefix
let g:mkdx#settings = { 'map': { 'prefix': '<leader>' } }

" :h mkdx-setting-gf-on-steroids
" :h mkdx-mapping-jump-to-file
" :h mkdx-mapping-open-external-file
let g:mkdx#settings.gf_on_steroids = 1

" :h mkdx-setting-image-extension-pattern
let g:mkdx#settings = { 'image_extension_pattern': 'a\?png\|jpe\?g\|gif' }

" :h mkdx-setting-checkbox-toggles
let g:mkdx#settings = { 'checkbox': { 'toggles': [' ', '-', 'x'] } }

" GFM supported list (e.g. on GitHub)
let g:mkdx#settings = { 'checkbox': { 'toggles': [' ', 'x'] } }

" :h mkdx-setting-checkbox-update-tree
let g:mkdx#settings = { 'checkbox': { 'update_tree': 2 } }

" :h mkdx-setting-checkbox-initial-state
let g:mkdx#settings = { 'checkbox': { 'initial_state': ' ' } }

" :h mkdx-setting-tokens-header
let g:mkdx#settings = { 'tokens': { 'header': '#' } }

" :h mkdx-setting-tokens-enter
let g:mkdx#settings = { 'tokens': { 'enter': ['-', '*', '>'] } }

" :h mkdx-setting-tokens-fence
let g:mkdx#settings = { 'tokens': { 'fence': '' } }

" :h mkdx-setting-tokens-italic
let g:mkdx#settings = { 'tokens': { 'italic': '*' } }

" :h mkdx-setting-tokens-bold
let g:mkdx#settings = { 'tokens': { 'bold': '**' } }

" :h mkdx-setting-tokens-list
let g:mkdx#settings = { 'tokens': { 'list': '-' } }

" :h mkdx-setting-table-header-divider
let g:mkdx#settings = { 'table': { 'header_divider': '-' } }

" :h mkdx-setting-table-divider
let g:mkdx#settings = { 'table': { 'divider': '|' } }

" :h mkdx-setting-table-align
let g:mkdx#settings = { 'table': { 'align': {
        \ 'left':    [],
        \ 'center':  [],
        \ 'right':   [],
        \ 'default': 'center' } } }

" :h mkdx-setting-tab-enable
" :h mkdx-function-indent-handler
let g:mkdx#settings = { 'tab': { 'enable': 1 } }

" :h mkdx-setting-enter-enable
let g:mkdx#settings = { 'enter': { 'enable': 1 } }

" :h mkdx-setting-enter-shift
" :h mkdx-function-shift-enter-handler
:let g:mkdx#settings = { 'enter': { 'shift': 0 } }

" :h mkdx-setting-enter-o
let g:mkdx#settings = { 'enter': { 'o': 1 } }

" :h mkdx-setting-enter-shifto
let g:mkdx#settings = { 'enter': { 'shifto': 1 } }

" :h mkdx-setting-toc-text
let g:mkdx#settings = { 'toc': { 'text': 'TOC' } }

" :h mkdx-setting-toc-list-token
let g:mkdx#settings = { 'toc': { 'list_token': '-' } }

" :h mkdx-setting-toc-update-on-write
let g:mkdx#settings = { 'toc': { 'update_on_write': 1 } }

" :h mkdx-setting-toc-details-enable
let g:mkdx#settings = { 'toc': { 'details': { 'enable': 0 } } }

" :h mkdx-setting-toc-details-summary
let g:mkdx#settings = { 'toc': { 'details': { 'summary': 'Click to expand {{toc.text}}' } } }
      
" :h mkdx-setting-toc-details-nesting-level
let g:mkdx#settings = { 'toc': { 'details': { 'nesting_level': -1 } } }

" :h mkdx-setting-toc-details-child-count
let g:mkdx#settings = { 'toc': { 'details': { 'child_count': 5 } } }

" :h mkdx-setting-toc-details-child-summary
let g:mkdx#settings = { 'toc': { 'details': { 'child_summary': 'show {{count}} items' } } }

" :h mkdx-setting-highlight-enable
" :h mkdx-highlighting
let g:mkdx#settings = { 'highlight': { 'enable': 1 } }

let g:mkdx#settings = { 'auto_update': { 'enable': 1 } }



"
" :h mkdx-setting-links-external-enable




"let g:polyglot_disabled = ['markdown'] " for vim-polyglot users, it loads Plasticboy's markdown
                                       " plugin which unfortunately interferes with mkdx list indentation.

" ----------------------------------------------Functions


"Goyo settings
function! s:goyo_enter()
    set noshowmode 
    set nospell
    NERDTree
endfunction

function! s:goyo_leave()
    set showmode showcmd nocursorline
    doautocmd Syntax
    hi! Normal ctermbg=NONE guibg=NONE
endfunction

autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave() 

" for opening file
" Read-only .doc through antiword
autocmd BufReadPre *.doc silent set ro
autocmd BufReadPost *.doc silent %!antiword "%"

" Read-only odt/odp through odt2txt
autocmd BufReadPre *.odt,*.odp silent set ro
autocmd BufReadPost *.odt,*.odp silent %!odt2txt "%"

" Read-only pdf through pdftotext
autocmd BufReadPre *.pdf silent set ro
autocmd BufReadPost *.pdf silent %!pdftotext -nopgbrk -layout -q -eol unix "%" - | fmt -w78

" Read-only rtf through unrtf
autocmd BufReadPre *.rtf silent set ro
autocmd BufReadPost *.rtf silent %!unrtf --text

" For jpegs
autocmd BufReadPre *.jpg,*.jpeg silent set ro
autocmd BufReadPost *.jpg,*.jpeg silent %!jp2a --width=78 "%"
" For other image formats
autocmd BufReadPre *.png,*.gif,*.bmp silent set ro
autocmd BufReadPost *.png,*.gif,*.bmp silent %!convert "%" jpg:- | jp2a --width=78 -



"------------------------------------------------------------ plugin

" auto-install plugins upon starting
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif

call plug#begin('~/.config/nvim/autoload/plugged')

" TEXT SUPPORT
    Plug 'reedes/vim-pencil'

" LaTeX Support
    " Plug 'lervag/vimtex'
    " Plug 'dense-analysis/ale' " LaTeX Linting

" Markdown
    "Plug 'gabrielelana/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    Plug 'SidOfc/mkdx'
    Plug 'plasticboy/vim-markdown'    
    Plug 'godlygeek/tabular'
    
" Pandoc: conflict with markdown auto-indent and syntax highlighting
    " Plug 'vim-pandoc/vim-pandoc'
    " Plug 'vim-pandoc/vim-pandoc-syntax' " Syntax not as good

" Better Syntax Support
    " Plug 'sheerun/vim-polyglot'
    
" Spelling
    Plug 'kopischke/unite-spell-suggest'

" VimWiki
    Plug 'vimwiki/vimwiki'

" Templates
    " Plug 'KabbAmine/vBox.vim'
    " Plug 'tibabit/vim-templates'
    " Plug 'aperezdc/vim-template'

" Startup Screen
    Plug 'mhinz/vim-startify'
    
" File Explorer
    " Plug 'ryanoasis/vim-devicons' "adds icons to coc-explorer
    Plug 'vifm/vifm.vim'
    Plug 'ivalkeen/nerdtree-execute'
    " Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdtree'
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    " Plug 'tsony-tsonev/nerdtree-git-plugin'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Is this required?
    
" Fuzzy Finder
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    Plug 'junegunn/fzf.vim'
    " Plug 'jremmen/vim-ripgrep'
    
" Git Integration
    " Plug 'mhinz/vim-signify'
    " Plug 'airblade/vim-gitgutter'
    " Plug 'tpope/vim-fugitive'
    " Plug 'tpope/vim-rhubarb'
    " Plug 'junegunn/gv.vim'


" AUTOCOMPLETE

" Intellisense
   Plug 'neoclide/coc.nvim', {'branch': 'release'}
      " Keeping up to date with master
      " Plug 'neoclide/coc.nvim', {'do': 'yarn install --frozen-lockfile'}
    " Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins' }
   "  Plug 'Valloric/YouCompleteMe'
    
" Snippets
    Plug 'SirVer/ultisnips'
    " Plug 'honza/vim-snippets'

" Auto pairs and surround for '(' '[' '{' etc.
    Plug 'jiangmiao/auto-pairs' 
    Plug 'tpope/vim-surround' 
    Plug 'machakann/vim-sandwich' 
    Plug 'tpope/vim-repeat' 
    

" ADDITIONAL FUNCTIONS

" Comments
   Plug 'tpope/vim-commentary'
    " Plug 'jbgutierrez/vim-better-comments'

" Quick Movements in Text
    Plug 'unblevable/quick-scope'
    " Plug 'easymotion/vim-easymotion'
    " Plug 'justinmk/vim-sneak'
    
" Terminal
    " Plug 'voldikss/vim-floaterm'
    
" Undo tree
    " Plug 'mbbill/undotree'
    
" Multiple Cursors
   " Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    " Plug 'terryma/vim-multiple-cursors'

" Browser Support
    Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }

" Registers
    " Plug 'gennaro-tedesco/nvim-peekup'

" Zen mode
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'

" Look up words
    "Plug 'beloglazov/vim-online-thesaurus'
    Plug 'Ron89/thesaurus_query.vim'

" MAPPINGS

" Look Up Key Bindings
    " Plug 'liuchengxu/vim-which-key'

" APPEARANCE

" Themes 
  Plug 'morhetz/gruvbox'  " 
    " Plug 'HerringtonDarkholme/yats.vim' " TS Syntax
    " Plug 'joshdick/onedark.vim'
  Plug 'dracula/vim'   

 " Satus Line
    Plug 'vim-airline/vim-airline'
    Plug 'vim-airline/vim-airline-themes'
  
  Plug 'skywind3000/asyncrun.vim'

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
call plug#end()



"------------------------------------------------------Color settings
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
let g:airline_theme='simple'

