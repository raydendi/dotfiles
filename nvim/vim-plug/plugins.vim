" ---------------------------------------------------------------------- keybinding
" Quick Shortcut
nnoremap <silent> <A-g> :Goyo<Enter> <CR>
nnoremap <silent>ns :set nospell<Enter>
nnoremap <silent> <leader>ll :Limelight<Enter>
nnoremap <silent> <C-t> :NERDTreeToggle<Enter><CR>
nnoremap <A-f> :Files ~/StudioProjects<CR>

"copy paste to system clipboard
" " Copy to clipboard
vnoremap  <leader>y  "+y nnoremap  <leader>Y  "+yg_
nnoremap  <leader>y  "+y
nnoremap  <leader>yy  "+yy

" " Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

" Jump through pane
nnoremap <silent> <C-h> :wincmd h<CR>
nnoremap <silent> <C-l> :wincmd l<CR>
nnoremap <silent> <C-j> :wincmd j<CR>
nnoremap <silent> <C-k> :wincmd k<CR>

" split
nnoremap <silent> <C-d> :split <CR>
nnoremap <silent> <C-v> :vsplit <CR>

" Resizing pane
nnoremap <A-j> :resize +2<CR>
nnoremap <A-k> :resize -2<CR>
nnoremap <A-h> :vertical resize +2<CR>
nnoremap <A-l> :vertical resize -2<CR>

"Quit
nnoremap <A-q> :q
nnoremap <A-x> :bd
nnoremap <silent> <A-w> :w<CR>
nmap <silent> <leader>q :SClose<CR>

" FZF
nmap <C-f> :FZF<CR>
nmap <C-b> :Buffers<CR>
nmap <C-a> :BLines<CR>
nmap <C-m> :Marks<CR>

" Terminal
"nmap <C-T> :FloatermToggle<CR>

" Translate
nnoremap <leader>t :Trans :id '
nnoremap <leader>te :Trans :en '

"search google
nmap <leader>g :OpenBrowserSmartSearch

" ----------------------------------------------- FZF config
let g:fzf_preview_window = ['right:50%', 'ctrl-/']
let g:fzf_buffers_jump = 1

" ----------------------------------------------- Neoformat config
augroup fmt
  autocmd!
  autocmd BufWritePre * undojoin | Neoformat
augroup END

" Enable alignment
let g:neoformat_basic_format_align = 1

" Enable tab to spaces conversion
let g:neoformat_basic_format_retab = 1

" Enable trimmming of trailing whitespace
let g:neoformat_basic_format_trim = 1

let g:neoformat_only_msg_on_error = 1


" ----------------------------------------------- python config

" --Jedi vim for python
" disable autocompletion, because we use deoplete for completion
let g:jedi#completions_enabled = 1

" open the go-to function in split, not another buffer
let g:jedi#use_splits_not_buffers = "left"
" pylint
let g:neomake_python_enabled_makers = ['pylint']
let g:jedi#popup_select_first = 0
let g:jedi#show_call_signatures = "1"
let g:jedi#popup_on_dot = 0
let g:jedi#popup_select_first = 0
let g:jedi#environment_path = "/usr/bin/python3"
let g:jedi#environment_path = "venv"

" formatting

let g:neoformat_enabled_python = ['autopep8']

"------------------------------------------------ Flutter config
nnoremap <Leader>fe :CocCommand flutter.emulators<CR>
nnoremap <Leader>fr :CocCommand flutter.run<CR>
nmap <leader>fp :CocList --input=flutter.pub.get<CR>
nmap <silent> <leader>fR :CocList --input=flutter.dev.hotRestart<CR>
nmap <silent> <leader>fr :CocList --input=flutter.dev.hotReload<CR>
nmap <silent> <leader>fd :CocList --input=flutter.dev.debugProfileWidgetBuilds<CR>

imap <tab> <Plug>(coc-snippets-expand)
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

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

" Ale for dart format
let g:ale_fixers = {
      \   'dart': ['dart format'],
      \}
" neoformat
let g:neoformat_enabled_dart = ['format']

" Use <c-space> to trigger completion.
if has('nvim')
  inoremap <silent><expr> <c-space> coc#refresh()
else
  inoremap <silent><expr> <c-@> coc#refresh()
endif

" Complete default mappings are:
let g:lsc_auto_map = {
      \ 'GoToDefinition': '<C-]>',
      \ 'GoToDefinitionSplit': ['<C-W>]', '<C-W><C-]>'],
      \ 'FindReferences': 'gr',
      \ 'FindImplementations': 'gI',
      \ 'FindCodeActions': 'ga',
      \ 'Rename': 'gR',
      \ 'ShowHover': v:true,
      \ 'DocumentSymbol': 'go',
      \ 'WorkspaceSymbol': 'gS',
      \ 'SignatureHelp': 'gm',
      \ 'Completion': 'completefunc',
      \}
      "\ 'PreviousReference': '<C-p>',
      "\ 'NextReference': '<C-n>',

"coc config
"let g:dart_format_on_save = 1
"let g:dartfmt_options = ['--fix', '--line-length 120']
let dart_html_in_string=v:true
let g:NERDTreeGitStatusWithFlags = 1
let g:dart_style_guide = 2
let g:lsc_server_commands = {'dart': 'dart_language_server'}
let g:UltiSnipsExpandTrigger = '<Nop>'
let g:coc_snippet_next = '<TAB>'
let g:coc_snippet_prev = '<S-TAB>'
let g:lsc_auto_map = v:true
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

" == AUTOCMD ================================
" by default .ts file are not identified as typescript and .tsx files are not
" identified as typescript react file, so add following
autocmd CompleteDone * silent! pclose
au BufNewFile,BufRead *.ts setlocal filetype=typescript
au BufNewFile,BufRead *.tsx setlocal filetype=typescript.tsx
" == AUTOCMD END ================================

"---------------------------------------------- telescope config
"nnoremap <leader>ff <cmd>Telescope find_files<cr>
"nnoremap <leader>fg <cmd>Telescope live_grep<cr>
"nnoremap <leader>fb <cmd>Telescope buffers<cr>
"nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" ---------------------------------------------- Markdown Config
"--Markdown plugin plasticboy/vim-markdown
let g:vim_markdown_folding_level = 6
let g:vim_markdown_toc_autofit = 1
let g:vim_markdown_override_foldtext = 0
let g:vim_markdown_folding_style_pythonic = 1
let g:vim_markdown_new_list_item_indent = 4
let g:vim_markdown_no_extensions_in_markdown = 1
let g:vim_markdown_anchorexpr = "'<<'.v:anchor.'>>'"
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'

"-- snippets
let g:UltiSnipsExpandTrigger="<tab>"  " use <Tab> to trigger autocompletion
let g:UltiSnipsJumpForwardTrigger="<c-j>"
let g:UltiSnipsJumpBackwardTrigger="<c-k>"

"-- vim pencil
"let g:pencil#autoformat = 1
"let g:pencil#joinspaces = 0     " 0=one_space (def), 1=two_spaces
"let g:pencil#textwidth = 74
"let g:pencil#wrapModeDefault = 'soft'   " default is 'hard'
"augroup pencil
"  autocmd!
"  autocmd FileType markdown,mkd call pencil#init()
"  autocmd FileType text         call pencil#init({'wrap': 'hard'})
"augroup END

"--Thesaurus lexical
augroup lexical
  autocmd!
  autocmd FileType markdown,mkd call lexical#init()
  autocmd FileType textile call lexical#init()
  autocmd FileType text call lexical#init({ 'spell': 1 })
augroup END
let g:lexical#spell = 1
let g:lexical#thesaurus = ['~/.config/nvim/thesaurus/Indonesia.txt',]
let g:lexical#spelllang = ['id','en']
let g:lexical#thesaurus_key = '<leader>tk'

augroup pandoc_syntax
  autocmd! FileType vimwiki set syntax=markdown.pandoc
augroup END

"-- Make footnote
inoremap ,f <Esc>:call VimFootnotes()<CR>
inoremap ,r <Esc>:exe b:pos<CR>
"--markdown preview

"--vimwiki markdown
let g:vimwiki_list = [{'path': '~/vimwiki/',
      \ 'syntax': 'markdown', 'ext': '.md'}]


" ---------------------------------------------- Function general
" Search function
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)
"-----Goyo settings
function! s:goyo_enter()
  set noshowmode
  set noshowcmd
  set nospell
  set scrolloff=999
endfunction

function! s:goyo_leave()
  set showmode
  set showcmd
  set scrolloff=5
  "doautocmd Syntax
  set nospell
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

"------------------------------------------------------------ plug
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
"Plug 'reedes/vim-pencil'
"Plug 'preservim/vim-colors-pencil'
" Markdown
"Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'tpope/vim-markdown'
Plug 'vim-pandoc/vim-markdownfootnotes'
Plug 'plasticboy/vim-markdown'
Plug 'godlygeek/tabular'
" Pandoc conflict with markdown auto-indent and syntax highlighting
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'vim-pandoc/vim-pandoc'
" Better Syntax Support
Plug 'sheerun/vim-polyglot'
" Spelling
Plug 'preservim/vim-wordy'
"Plug 'sedm0784/vim-you-autocorrect'
"Plug 'kopischke/unite-spell-suggest'
" VimWiki
Plug 'vimwiki/vimwiki'
" Startup Screen
Plug 'mhinz/vim-startify'
" File Explorer and fzf
Plug 'ivalkeen/nerdtree-execute'
Plug 'preservim/nerdtree'
Plug 'junegunn/fzf.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
"Plug 'vifm/vifm.vim'
Plug 'ryanoasis/vim-devicons' "adds icons to coc-explorer
Plug 'Xuyuanp/nerdtree-git-plugin'
" Plug 'tsony-tsonev/nerdtree-git-plugin'
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
Plug 'echuraev/translate-shell.vim', { 'do': 'wget -O ~/.vim/trans git.io/trans && chmod +x ~/.vim/trans' }
Plug 'preservim/vim-lexical'

" ---------------------------- Autocomplete & neccesary for text editor
" LSP Client
Plug 'dense-analysis/ale'
" Intellisense
Plug 'neoclide/coc.nvim', {'branch': 'release'}
"Plug 'tpope/vim-projectionist'
"Plug 'Valloric/YouCompleteMe'
" Snippets
Plug 'SirVer/ultisnips'
Plug 'natebosch/dartlang-snippets'
Plug 'honza/vim-snippets'
" Auto pairs and surround for '(' '[' '{' etc.
Plug 'jiangmiao/auto-pairs'
"Plug 'tpope/vim-surround'
"Plug 'machakann/vim-sandwich'
"Plug 'tpope/vim-repeat'
" Git Integration
Plug 'tpope/vim-fugitive'
" Plug 'mhinz/vim-signify'
" Plug 'airblade/vim-gitgutter'
" Plug 'tpope/vim-rhubarb'
" Plug 'junegunn/gv.vim'
" Multiple Cursors
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
"Plug 'terryma/vim-multiple-cursors'
" Terminal
"Plug 'voldikss/vim-floaterm'
" Typescript
Plug 'ianks/vim-tsx'
Plug 'leafgarland/typescript-vim'
" spelling checker for neovim
"Plug 'iamcco/coc-spell-checker'
" ---------------------------------
Plug 'sbdchd/neoformat'
"Plug 'neomake/neomake'
" -------------------------------Python
Plug 'davidhalter/jedi-vim'
"--------------------------- DART and flutter plugin
" dart
Plug 'dart-lang/dart-vim-plugin'
Plug 'natebosch/vim-lsc'
Plug 'natebosch/vim-lsc-dart'
" coc.flutter
Plug 'iamcco/coc-flutter'

"------------------------------ telescope
"Plug 'nvim-lua/popup.nvim'
"Plug 'nvim-lua/plenary.nvim'
"Plug 'nvim-telescope/telescope.nvim'

"--------------------------- ADDITIONAL FUNCTIONS
" Search
Plug 'tyru/open-browser.vim'
" Comments
Plug 'tpope/vim-commentary'
" Plug 'jbgutierrez/vim-better-comments'
" Undo tree
" Plug 'mbbill/undotree'
" Browser Support
" Plug 'glacambre/firenvim', { 'do': { _ -> firenvim#install(0) } }
" Registers
" Plug 'gennaro-tedesco/nvim-peekup'
"Plug 'psliwka/vim-smoothie'

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
set ignorecase
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
"let g:airline_theme='pencil'
"let g:airline_theme='lucius'
let g:airline_theme='peaksea'
"let g:airline_theme='deus'
"let g:airline_theme='zenburn'
"set statusline=%<%f\ %h%m%r%w\ \ %{PencilMode()}\ %=\ col\ %c%V\ \ line\ %l\,%L\ %P
"set rulerformat=%-12.(%l,%c%V%)%{PencilMode()}\ %P

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
      \ '~/vimwiki/index.md',
      \ '~/StudioProjects/rechtly/lib/',
      \  '~/.config/nvim/vim-plug/plugins.vim',
      \  '~/.config/kitty/kitty.conf',
      \  '~/.config/ranger/rc.conf',
      \  '~/.config/fish/config.fish',
      \ ]
let g:startify_session_autoload = 1
let g:startify_session_delete_buffers = 1
let g:startify_change_to_vcs_root = 1
let g:startify_fortune_use_unicode = 1
let g:startify_session_persistence = 1
let g:startify_enable_special = 0

" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files
let g:NERDTreeLimitedSyntax = 1
let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule

