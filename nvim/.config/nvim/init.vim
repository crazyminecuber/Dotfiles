"TODO Learn language server for python when learning django.
"DONE Get a better solotion for formatting text in latex or markdwon. Wrap is horrible. More like work/libreoffice
"TODO Make a vim wiki.
"DONE Make tabs look better.
"TODO When i open a file, convert spaces in the beginning to tabs to show them. And when i save the file write them back as spaces
"DONE fix bug with formatoptions not being correctly set on startup
	"Still have not figured out the settings though. Is there a way to filter categorys better? For example, i do not want tables to be reformatted in that way.

"DONE make resizing nicer:
"TODO Add plugin to preview what buttons do.
"TODO Make special search engines for each type of programming. Do so in order to search the documentation! Use openbrowser plugin.
"TODO Find way to make word *bold* and ~curly~ in markdown. I know surround is probably the answer but i have to type things fast in order to make it work.
"TODO Learn to access arduino terminal as said in arch wiki. Then learn to make a makefile to compile and upload.
"DONE Find source of cheat sheets for programming languages.
"TODO Tabsettings change when opening python filTabsettings change when opening python file
"TODO Make nice keybindings for jumping to defintion and tests.
"TODO Find keybinding for jumping to tag in split
"TODO Find out how to remove timout from comands (surround is hard to not have
"TODO Decide if I want to keep wrap off or if i want to turn it on and use gk and gj for navigation.
"TODO sudo does not work in vim so saving as root does not work with :w!!
"TODO Vim does not automatilly update the contents of the file and does not sync with undotree. Have a clear warning imedially and not when saving that buffer has been updated? See diff between saved file and current buffer? Dynamically update buffer?0
"TODO f,F,t,T only searches current line?
"TODO Highliting of the word i am currently on when searching is not very clear.
"TODO Use makfile for makng documents and updating figures.
"TODO Use snippets for latex. Nice for \frac and \begin espically
"TODO Maybe use emacs and ORG-mode for making pdf:s? Depends on if tables are nicer.
"TODO Highlighting for one second when yanking would be nice.
"TODO Make my autocommands for number toggleable.
"TODO Would be nice to get errors in quickfixlist from django.
"TODO Look up how to smart rename (using language server) to rename variable in
	"entire project
"TODO CoC 'K' does not work with thing like global and nonlocal in python. Vim
"original does that
"TODO Linter is buggy? Figure out why!
"TODO Autcompletion for html,css, jinja?
"TODO Reload browser automatically?
"TODO Have to write file to have linter update some stuff (i.e. when i have
	 "removed unnasisary whitespace or added an empty line for style
"TODO Nerdtree does not sync across tabs
"DONE Automatically add and format braces when hitting enter.(Autoload to the
"reque!)
"TODO Show matching html tag somehow.
"TODO Checkout synctex in latex
"DONE CSS comments does not work properly. When i try to comment one part, it
	 "cmments the whole line.
	 "But not happy. The ways i would like to comment. A line, multiple lines
	 "with nice formatting, alternative comment markers, comment to the end.
	 "Comment a selected region inside a line (probably not that useful since
	 "it is a bad idea in most circomstances.), should work in both normalmode
	 "and visual mode.
"TODO Change so that search only searched the buffer in fokus.
"TODO Setup ultisnips with a language server to get autocompletion snippets.

"Regarding autoformatting, it is probably just an anoyance. But autowrapping
"could be nice for booth comments in code and text in md and latex. Probably
"nice to not autowrap lines that are already longer than textwidth. So
"tcqln(jw?) and remove t for programming. w could be questionable for code
"commited to repos since they could care about whitespaces not being at the end.
"I will try without it for now.
" Autoformatting behaviour i want.
" * Autolinebreak on comments and text.
" * Auto-comment if i press shift-enter
" * Fix indenting quickly
" * Maybe quickly toogle autoformatting?

" Disable compatibility for vi. No point in not having it
	set nocompatible



autocmd!
let mapleader =" "
set textwidth=79
set formatoptions=cqlnj
"let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#fnamemod = ':t'
" Scrolling
	nnoremap <C-H> 3zh
	nnoremap <C-L> 3zl
	nnoremap <C-J> 3<C-E>
	nnoremap <C-K> 3<C-Y>


"Någon form ut av script för att kolla om plugins pluginet är installerat
if ! filereadable(expand('~/.config/nvim/autoload/plug.vim'))
	echo "Downloading junegunn/vim-plug to manage plugins..."
	silent !mkdir -p ~/.config/nvim/autoload/
	silent !curl "https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim" > ~/.config/nvim/autoload/plug.vim
	autocmd VimEnter * PlugInstall
endif

" Live substitution
set inccommand=split

" Olika plugins vet inte vad alla gör
call plug#begin('~/.config/nvim/plugged')
"colorchemes
Plug 'morhetz/gruvbox'
Plug 'dracula/vim', { 'as': 'dracula' }
Plug 'tomasiser/vim-code-dark'
Plug 'rafi/awesome-vim-colorschemes'

" Syntax
Plug 'sirtaj/vim-openscad'

Plug 'bling/vim-airline'
Plug 'RRethy/vim-hexokinase'

Plug 'tpope/vim-surround'
"Plug 'tpope/vim-commentary'

Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'

Plug 'junegunn/goyo.vim'
"Plug 'jreybert/vimagit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

"Plug 'tpope/vim-fugitive'
"Plug 'vimwiki/vimwiki'

"Plug 'kovetskiy/sxhkd-vim'
" Open url under cursor. Better than default
Plug 'tyru/open-browser.vim'
" Practice
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
" Toggle zoom
Plug 'troydm/zoomwintab.vim'
" Many languages and fast
Plug 'sheerun/vim-polyglot'
Plug 'liuchengxu/vista.vim'
Plug 'easymotion/vim-easymotion'
Plug 'preservim/nerdcommenter'
Plug 'tpope/vim-repeat'
Plug 'jiangmiao/auto-pairs'
Plug 'liuchengxu/vim-which-key', { 'on': ['WhichKey', 'WhichKey!'] }
call plug#end()

"-------------------- Fix annoyances and improve quality of life --------------
" openbrowser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)

set noerrorbells
"Allows for mouse controll
set mouse=a
"Combines systemclipboard with vim :D
set clipboard+=unnamedplus

" Something to do with plugins. Probably leave it if I dont know better.
filetype plugin on
"filetype on
" Sets encoding. Any point in using anything else?
	set encoding=utf-8

" Makes windcmd o toggle zoom instead of permanent zoom
nnoremap <leader>wo :ZoomWinTabToggle<CR>

" Makes c not store deleted text in register. Dumps in null register. Dont know if i want it.
nnoremap c "_c

" Enable autocompletion, maybe look further into this?
	set wildmode=longest,list,full
	set wildmenu

"Scrolls when there is only one row left instead of 0
	set scrolloff=1
" Splits open at the bottom and right
	set nosplitbelow splitright

" Auto resize windows when resizing terminal
	autocmd VimResized * wincmd =

" ctrl_a, ctrl_x werks on hexadecimal as well
set nrformats+=alpha
" ignore case when autocompleting in cmd-mode
	set ignorecase

" Case insensitive search until I use capital letter
	set smartcase
" Go to matching during the typing of a search
	set incsearch
" Uses spaces instead of tabs. I will try tabs for a while
set tabstop=4 softtabstop=4
set shiftwidth=4
 set smarttab
" Uncomment if i get tired of seing tabs all over
"    set expandtab

" Tries to do smart indent
 set smartindent
 set autoindent

" Does not wrap
	set nowrap

" Sets path to all under path
" Used for using find
set path+=$PWD/**

" Highlightes all matches when searching and stops highliting matches when escape in normal mode is pressed is pressed.
set nohlsearch
nnoremap / :let @/=''<CR>:set hlsearch<CR>/
nnoremap ? :let @/=''<CR>:set hlsearch<CR>?
nnoremap <esc> :nohlsearch<CR>

set hidden
"--------------------------- Whitespace reprecentation ------------------------
" Display symbols instead of whitespace etc
	set list
" Replaces whitespace with symbols. And when there is text to scroll to horizontally.
	"Tabs do not tick out. Would be nice to make it more pronounced and put it to the right side.
	set listchars+=tab:\ \ ┋
	"set listchars+=tab:\ \ 
	"set listchars+=tab:\ \ ┫
	set listchars+=precedes:﮿
	set listchars+=extends:﯀
	set listchars+=eol:﬋
	set listchars+=trail:‿
"‖
"⎸
"⎹
"|
"⏭
"│
"┃
"┃
"❘
"⸡
"｜
"｜
"￨
"│
"│
"┫
"┫
"┋

"------------------------ Smart line numbers----------------------------------

" Switches between relative line numbers and normal line number.
" Relative line numbers only in normal and visual mode when windows is active.
" The events are before the * and the command to execute is after. Wrapped in
" fucntion in order to make goyu able to enable /disable numbers on the fly.

" Start with number and relative number on
	set number relativenumber

" Function to set correct autocommands for above to work
function! SetSmartNumbers()
	augroup numbers
		autocmd!
		autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber
		autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * set norelativenumber
	augroup END
endfunction
" call it imideatelly
call SetSmartNumbers()
" Goyo plugin makes text more readable when writing prose:
	map <leader>G :Goyo \| set norelativenumber<CR>

" Autogrup for goyo to make it able to handly my special line numbers.
augroup goyo
	autocmd! | set nonumber
    autocmd User GoyoLeave call SetSmartNumbers()
    autocmd User GoyoEnter autocmd! numbers | set nonumber norelativenumber
augroup END

"----------------------Color and highlights----------------------------------
" Enable true color
  set termguicolors

" Set colorscheme
	colorscheme gruvbox

 " Highlight syntax
	syntax on
	set colorcolumn=80
	highlight ColorColumn ctermbg=0 guibg=lightgrey
	highlight Cursor guibg=#101010

	set bg=dark
	"highlight Whitespace guibg=grey
	"highlight Whitespace guifg=gray

" Highlighs unchanged text with grey
if &diff
    highlight! link DiffText MatchParen
endif

"-----------------------Windows and related------------------------------------
" Scrolls sidways when 5 columns away from side
	set sidescrolloff=5

"-----------------------Nice shortcuts------------------------------------
" Spell-check set to <leader>L for Language
map <leader>L :setlocal spell! spelllang=se<CR>

" Enabels ctrl-s
	imap <C-s> <C-O>:w<CR>
	nmap <C-s> :w<CR>
	vmap <C-s> <C-C>:w<CR>

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	"Highlights file open in buffer in nerdtree.
	map <leader>t :NERDTreeFind<CR><c-w><c-p>

" Shortcutting split navigation, saving a keypress:
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Windowcommand is nicer
nnoremap <leader>w <C-w>
"----------------------- Luke scripts ----------------------------------------

" Quits Vim if nerd tree is only window open
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Replace all is aliased to S. ( Not so nice when using interactive search and
	" replace)
	nnoremap S :%s//gc<Left><Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc. ( Use inbuilt compiler
	" instead and have it jump to errors?)
	nnoremap <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	nnoremap <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace on save.
	autocmd BufWritePre * %s/\s\+$//e


" Source when vimrc is saved
    autocmd BufWritePost $MYVIMRC echo "vimrc sourced" | source $MYVIMRC




" Scrolls 5 chars when cursor get to edge of screen in horizontal direction
	set sidescroll=5



" EXPERIMENTAL ALTERNATIVE TO SWAPFILE (seems to work pretty well exept for
" when i edit the file externaly, then vim forgets about the changes :( )
	set noswapfile
	set nobackup
	set nowritebackup
	set undodir=~/.config/nvim/undodir
	set undofile


"----------------Undotree mapping -------------------------------------------
nnoremap <leader>u :UndotreeToggle<cr>
" Undotree options https://github.com/mbbill/undotree/blob/master/plugin/undtree.vim#L15
	let g:undotree_WindowLayout = 2
	let g:undotree_ShortIndicators = 1
	let g:undotree_SplitWidth = 30
	let g:undotree_DiffAutoOpen = 1
	let g:undotree_DiffpanelHeight = 7
	let g:undotree_SetFocusWhenToggle = 1
	let g:undotree_TreeNodeShape = '⃝⃝⏺'
	let g:undotree_DiffCommand = "diff"
	let g:undotree_RelativeTimestamp = 1
	let g:undotree_HighlightChangedText = 1
	let g:undotree_HighlightChangedWithSign = 1
	let g:undotree_HighlightSyntaxAdd = "DiffAdd"
	let g:undotree_HighlightSyntaxChange = "DiffChange"
	let g:undotree_HighlightSyntaxDel = "DiffDelete"
"
" FzF-----------------------------------------------------------
	" FZFSearch lines in the current file (open buffers? Have to look it up!)
	noremap <leader>fl <ESC>:BLines!<CR>
	" FZFSearch file from the current working directory
	nnoremap <leader>ff <ESC>:Files!<CR>
	" FZFSearch commits to the current git repo
	nnoremap <leader>fg <ESC>:BCommits!<CR>
	" FZFSearch the first command in command mode. Not the best. Could have
	" some work done to it.
	cnoremap <C-f> Commands<CR>


"-------------------------Hexokinase-----------------------------------------
 " Vim Hexokinase
  let g:Hexokinase_refreshEvents = ['InsertLeave']

  let g:Hexokinase_optInPatterns = [
  \     'full_hex',
  \     'triple_hex',
  \     'rgb',
  \     'rgba',
  \     'hsl',
  \     'hsla',
  \     'colour_names'
  \ ]

  let g:Hexokinase_highlighters = ['backgroundfull']

  " Reenable hexokinase on enter
  autocmd VimEnter * HexokinaseTurnOn

" ------------------------------ Web dev -------------------------------------

" reload browser from vim Obs! not generic!
nnoremap <leader>br :!sh ~/Scripts/reload_browser2.sh<CR>

"------------------------------ NERDcommenter--------------------------------
    let g:NERDCustomDelimiters = {
        \ 'python': { 'left': '#', 'leftAlt': '"""', 'rightAlt': '"""' }
    \ }
	let g:NERDSpaceDelims = 1
"------------------------------ Vim which key--------------------------------
nnoremap <silent> <leader> :WhichKey '<Space>'<CR>

"------------------------------------------------------------------------------
"CoC stuff


"Noted on lsp, coc and ale
" ale is mainly a linter and fixer, linter displays errors and things missed in
" formatting. Fixers fix formatting. CoC can be used for code completion and go
" to definition, documentation, locations used. It can show diagnostics,
" whatever that is, and it can go to implementation, call code action on stuff,
" whatever that is. It can also fix stuff

" TextEdit might fail if hidden is not set.
set hidden "already set

" Some servers have issues with backup files, see #649.
set nobackup "already set
set nowritebackup "already set

" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
"if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  "set signcolumn=number
"else
  set signcolumn=yes
"endif

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction


" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> <leader>K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder.
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Map function and class text objects (Does this remap the default text object
" in vim as well?
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)


