" ---------------------------------------------------------------------- keybinding
" Quick Shortcut
nnoremap <silent> <A-g> :Goyo<Enter> <CR>
nnoremap <silent>ns :set nospell<Enter>
nnoremap <silent> <leader>ll :Limelight<Enter>
nnoremap <silent> <A-t> :NERDTreeToggle<Enter><CR>
nnoremap <silent> <A-q> :SClose<Enter>
nnoremap <A-w> :w<Enter>
nnoremap <A-f> :Files ~/<Enter>

"copy paste to system clipboard
noremap <Leader>y "*y
noremap <Leader>p "*p
noremap <Leader>Y "+y
noremap <Leader>P "+p

" Set nonumber
nnoremap <silent> <leader>nn :set nonumber<CR>

" Switch tabs
nnoremap <A-n> :tabn<CR> 

" Jump through pane
nnoremap <A-h> :wincmd h<CR>
nnoremap <A-l> :wincmd l<CR>
nnoremap <A-j> :wincmd j<CR>
nnoremap <A-k> :wincmd k<CR>

" Resizing pane 
nnoremap <A-Up> :resize +2<CR> 
nnoremap <A-Down> :resize -2<CR>
nnoremap <A-Left> :vertical resize +2<CR>
nnoremap <A-Right> :vertical resize -2<CR>

vmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)
" ---------------------------------------------- Markdown Config
"--Markdown plugin
let g:vim_markdown_folding_level = 6
let g:vim_markdown_toc_autofit = 1
set conceallevel=2
let g:vim_markdown_new_list_item_indent = 2
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'

"--Thesaurus lexical
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 0 })
augroup END
let g:lexical#spell = 1  
let g:lexical#thesaurus = ['~/.config/nvim/thesaurus/Indonesia.txt',]
let g:lexical#spelllang = ['id','en']

"------------------------------------------------ Flutter con fig
let g:dart_format_on_save = 1
let g:dartfmt_options = ['--fix', '--line-length 120']

" Coc
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <Leader>e :CocCommand flutter.emulators<CR>
nnoremap <Leader>r :CocCommand flutter.run<CR>
nmap <leader>gs :G<CR>
nmap <leader>gh :diffget //2<CR>
nmap <leader>gl :diffget //3<CR>

imap <tab> <Plug>(coc-snippets-expand)
let g:UltiSnipsExpandTrigger = '<Nop>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'

inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a <Plug>(coc-codeaction-selected)
nmap <leader>a <Plug>(coc-codeaction-selected)

"coc config
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-tsserver',
  \ 'coc-eslint', 
  \ 'coc-prettier', 
  \ 'coc-json', 
  \ 'coc-flutter',
  \ 'coc-snippets',
  \ 'coc-yaml',
  \ 'coc-tslint-plugin',
  \ 'coc-tsserver',
  \ 'coc-emmet',
  \ 'coc-css',
  \ 'coc-html',
  \ 'coc-json',
  \ ]

let g:NERDTreeGitStatusWithFlags = 1

" == AUTOCMD ================================ 
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

" ---------------------------------------------- General config
"-----Goyo settings
function! s:goyo_enter()
    set noshowmode 
    set nospell
endfunction

function! s:goyo_leave()
    set showmode showcmd nocursorline
    doautocmd Syntax
		setlocal spell
		set spelllang=id,en
endfunction
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave() 

"-----for opening file
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


"------------------------------------------------------------ PLUGIN
" auto-install plugins upon starting
if empty(glob('~/.config/nvim/autoload/plug.vim'))
  silent !curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  "autocmd VimEnter * PlugInstall
  "autocmd VimEnter * PlugInstall | source $MYVIMRC
endif
call plug#begin('~/.config/nvim/autoload/plugged')


"--------------------------- Plugin for writting
" TEXT SUPPORT
   " Plug 'reedes/vim-pencil'
" Markdown
    "Plug 'gabrielelana/vim-markdown'
    Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
    "Plug 'SidOfc/mkdx'
    Plug 'plasticboy/vim-markdown'    
    Plug 'godlygeek/tabular'
" Pandoc: conflict with markdown auto-indent and syntax highlighting
    " Plug 'vim-pandoc/vim-pandoc'
" Better Syntax Support
    " Plug 'sheerun/vim-polyglot'
" Spelling
    "Plug 'sedm0784/vim-you-autocorrect'
    Plug 'kopischke/unite-spell-suggest'
" VimWiki
    Plug 'vimwiki/vimwiki'
" Startup Screen
    Plug 'mhinz/vim-startify'
" File Explorer and fzf
    "Plug 'vifm/vifm.vim'
    Plug 'ivalkeen/nerdtree-execute'
    Plug 'preservim/nerdtree'
    Plug 'junegunn/fzf.vim'
    Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
    "Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
    Plug 'ryanoasis/vim-devicons' "adds icons to coc-explorer
    " Plug 'Xuyuanp/nerdtree-git-plugin'
    " Plug 'tsony-tsonev/nerdtree-git-plugin'
    " Plug 'tiagofumo/vim-nerdtree-syntax-highlight' " Is this required?
    " Plug 'scrooloose/nerdtree'
" Quick Movements in Text
    "Plug 'unblevable/quick-scope'
    " Plug 'easymotion/vim-easymotion'
    " Plug 'justinmk/vim-sneak'
    " Plug 'jremmen/vim-ripgrep'
" Zen mode
    Plug 'junegunn/goyo.vim'
    Plug 'junegunn/limelight.vim'
" Look up words
    "Plug 'beloglazov/vim-online-thesaurus'
    "Plug 'Ron89/thesaurus_query.vim'
    Plug 'preservim/vim-lexical'

" ---------------------------- Autocomplete & neccesary for text editor
" Intellisense
  	Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'tpope/vim-projectionist'
		"  Plug 'Valloric/YouCompleteMe'
" Snippets
    Plug 'SirVer/ultisnips'
    Plug 'natebosch/dartlang-snippets'
    Plug 'honza/vim-snippets'
" Auto pairs and surround for '(' '[' '{' etc.
    Plug 'jiangmiao/auto-pairs' 
    Plug 'tpope/vim-surround' 
    Plug 'machakann/vim-sandwich' 
    Plug 'tpope/vim-repeat' 
" Git Integration
    Plug 'tpope/vim-fugitive'
    " Plug 'mhinz/vim-signify'
    " Plug 'airblade/vim-gitgutter'
    " Plug 'tpope/vim-rhubarb'
    " Plug 'junegunn/gv.vim'
" Multiple Cursors
    Plug 'mg979/vim-visual-multi', {'branch': 'master'}
    " Plug 'terryma/vim-multiple-cursors'
" Terminal
    Plug 'voldikss/vim-floaterm'
" Typescript
    Plug 'ianks/vim-tsx'
    Plug 'leafgarland/typescript-vim'
" spelling checker for neovim
    "Plug 'iamcco/coc-spell-checker'

"--------------------------- DART and flutter plugin 
" Dart 
    Plug 'dart-lang/dart-vim-plugin'


"--------------------------- ADDITIONAL FUNCTIONS
" Comments
   Plug 'tpope/vim-commentary'
    " Plug 'jbgutierrez/vim-better-comments'
" Undo tree
    " Plug 'mbbill/undotree'
" Browser Support
    " Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Registers
    " Plug 'gennaro-tedesco/nvim-peekup'

"------------------------ APPEARANCE
" Themes
	"Plug 'drewtempelmeyer/pale night.Vim'
	"Plug 'ayu-theme/ayu.vim'
	"Plug 'kaicataldo/material.vim'
	"Plug 'goskiwi/Vim-atom-dark'
	Plug 'dracula/vim'   
 	"Plug 'joshdick/onedark.vim'

  " Satus Line
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  
" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif
call plug#end()

"------------------------------------------------------------------- Basic setting
set linebreak
set number 
set wrap
set noerrorbells
set nobackup	
set undofile
set undodir=~/.config/nvim/undofile
set noswapfile
set nohlsearch
set tabstop=4 softtabstop=4
set spelllang=id,en
setlocal spelllang=en,id
set cmdheight=1
set shiftwidth=2
set smarttab
set smartcase
set tabstop=2
set softtabstop=0 noexpandtab
set smartindent
set colorcolumn=120
set encoding=UTF-8
set conceallevel=0
set scrolloff=8
set colorcolumn=120
set clipboard=unnamedplus
filetype plugin on
filetype plugin indent on
syntax on
"highlight ColorColumn ctermbg=0 guibg=lightgrey

"-------------------------------Color's settings
"set color for dracula
set t_Co=256
set background=dark
let g:dracula_colorterm=0
let g:dracula_italic=1
colorscheme dracula

"set theme for onedark
"let g:onedark_hide_endofbuffer=1
"let g:onedark_termcolors=256
"colorscheme onedark


"limelight
let g:limelight_conceal_ctermfg = 'gray'
let g:limelight_conceal_ctermfg = 240
let g:limelight_conceal_guifg = 'DarkGray'
let g:limelight_conceal_guifg = '#777777'
"Airlinethemes
let g:airline_theme='ravenpower'

" Highlight
hi SpellBad cterm=underline
hi clear SpellBad 

" Startify 
let g:startify_custom_header = [
 \ '     ___        ___        ___                              ___     ',
 \ '    /__/\      /  /\      /  /\          ___     ___       /__/\    ',
 \ '    \  \:\    /  /:/_    /  /::\        /__/\   /  /\     |  |::\   ',
 \ '     \  \:\  /  /:/ /\  /  /:/\:\       \  \:\ /  /:/     |  |:|:\  ',
 \ ' _____\__\: /  /:/ /:/ /  /:/  \:\       \  \:/__/::\   __|__|:|\:\ ',
 \ '/__/:::::::/__/:/ /:/ /__/:/ \__\:\  ___  \__\\__\/\:\_/__/::::| \:\',
 \ '\  \:\~~\~~\  \:\/:/ /\  \:\ /  /:/ /__/\ |  |:| \  \:\\  \:\~~\__\/',
 \ ' \  \:\  ~~ \  \::/ /: \  \:\  /:/  \  \:\|  |:|  \__\::\  \:\      ',
 \ '  \  \:\     \  \:\/:/  \  \:\/:/    \  \:\__|:|  /__/:/ \  \:\     ',
 \ '   \  \:\     \  \::/    \  \::/      \__\::::/   \__\/   \  \:\    ',
 \ '    \__\/      \__\/      \__\/           ~~~~             \__\/    ',
 \]

let g:startify_lists = [
          "\ { 'type': 'sessions',  'header': ['   Sessions']                     },
          \ { 'type': 'bookmarks', 'header': ['   Bookmarks']                    },
          \ { 'type': 'files',     'header': ['   Files']                        },
          "\ { 'type': 'dir',       'header': ['   Current Directory '. getcwd()] },
          \ ]

let g:startify_bookmarks = [
            \ '~/Documents/Academic-writing/right-to-repair/',
            \ '~/AndroidStudioProjects/rechtly/lib/',
						\  '~/.config/nvim/vim-plug/plugins.vim',
            \  '~/.config/kitty/kitty.conf',
            \  '~/.config/ranger/rc.conf',
            \  '~/.config/ncmpcpp/config',
            \ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

