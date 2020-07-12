"TODO Learn language server for python when learning django. 
"TODO Get a better solotion for formatting text in latex or markdwon. Wrap is horrible. More like work/libreoffice
"TODO Make a vim wiki.
"TODO Make tabs look better.
"TODO When i open a file, convert spaces in the beginning to tabs to show them. And when i save the file write them back as spaces
"TODO fix bug with remapping of scrolling. Does move cursor in directions.
"TODO fix bug with formatoptions not being correctly set on startup
"TODO make resizing nicer:
"TODO Add plugin to preview what buttons do.
"TODO Make special search engines for each type of programming. Do so in order to search the documentation! Use openbrowser plugin.
"TODO Find way to make word *bold* and ~curly~ in markdown. I know surround is probably the answer but i have to type things fast in order to make it work.
"TODO Learn to access arduino terminal as said in arch wiki. Then learn to make a makefile to compile and upload.
"TODO Find source of cheat sheets for programming languages.
"TODO Tabsettings change when opening python filTabsettings change when opening python file
"TODO Make nice keybindings for jumping to defintion and tests.
"

autocmd!
let mapleader =" "
set formatoptions=cjqa
let g:airline#extensions#tabline#enabled = 1
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
Plug 'tpope/vim-commentary'

Plug 'scrooloose/nerdtree'
Plug 'mbbill/undotree'

Plug 'junegunn/goyo.vim'
Plug 'jreybert/vimagit'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

Plug 'tpope/vim-fugitive'
Plug 'vimwiki/vimwiki'

Plug 'kovetskiy/sxhkd-vim'
Plug 'tyru/open-browser.vim'
" Practice
Plug 'ThePrimeagen/vim-be-good', {'do': './install.sh'}
" Toggle zoom
Plug 'troydm/zoomwintab.vim'
call plug#end()

"-------------------- Fix annoyances --------------------
" Disable compatibility for vi. No point in not having it
	set nocompatible
" openbrowser
let g:netrw_nogx = 1 " disable netrw's gx mapping.
nmap gx <Plug>(openbrowser-smart-search)
vmap gx <Plug>(openbrowser-smart-search)


set noerrorbells
"Allows for mouse controll
set mouse=a
"Combines systemclipboard with vim :D
set clipboard+=unnamedplus
	let g:netrw_nogx = 1 " disable netrw's gx mapping.
	nmap gx <Plug>(openbrowser-smart-search)
	vmap gx <Plug>(openbrowser-smart-search)
" Something to do with plugins. Probably leave it if I dont know better.
filetype plugin on
" Sets encoding. Any point in using anything else?
	set encoding=utf-8
"-----------------------Color and highlights----------------------------------
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
"	highlight Whitespace guibg=grey


"highlight Whitespace guifg=gray


" Scrolls sidways when 5 columns away from side
	set sidescrolloff=5
" Some basics:
    " Makes c not store deleted text in register. Dumps in null register. Dont know if i want it.
	nnoremap c "_c

" Enable autocompletion, maybe look further into this?
	set wildmode=longest,list,full
	set wildmenu

"Scrolls when there is only one row left
	set scrolloff=1
" Splits open at the top and right, which is non-retarded, unlike vim defaults and luke.
	set nosplitbelow splitright

" Nerd tree
	map <leader>n :NERDTreeToggle<CR>
	"Highlights file open in buffer in nerdtree.
	map <leader>t :NERDTreeFind<CR><c-w><c-p>

" Quits Vim if nerd tree is only window open
	autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Replace all is aliased to S.
	nnoremap S :%s//gc<Left><Left><Left>

" Compile document, be it groff/LaTeX/markdown/etc.
	map <leader>c :w! \| !compiler <c-r>%<CR>

" Open corresponding .pdf/.html or preview
	map <leader>p :!opout <c-r>%<CR><CR>

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
	autocmd VimLeave *.tex !texclear %

" Ensure files are read as what luke wants:
    " Just a variable? Does vim-wiki read it?
	let g:vimwiki_ext2syntax = {'.Rmd': 'markdown', '.rmd': 'markdown','.md': 'markdown', '.markdown': 'markdown', '.mdown': 'markdown'}
    "Shortcut to open vimwiki
	map <leader>v :VimwikiIndexlinewrap
    " Another variable
	let g:vimwiki_list = [{'path': '~/vimwiki', 'syntax': 'markdown', 'ext': '.md'}]
	autocmd BufRead,BufNewFile *.tex set filetype=tex
	"autocmd FileType tex setlocal formatoptions=qrctja

" Save file as sudo on files that require root permission
	cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace on save.
	"autocmd BufWritePre * %s/\s\+$//e

" Source when vimrc is saved
    autocmd BufWritePost $MYVIMRC echo "vimrc sourced" | source $MYVIMRC



"let g:Hexokinase_highlighters = ['foreground']
" Oskars tests----------------------------------------------
set nrformats+=alpha

" Enabels ctrl-s
	imap <C-s> <C-O>:w<CR>
	nmap <C-s> :w<CR>
	vmap <C-s> <C-C>:w<CR>

" Uses spaces instead of tabs. I will try tabs for a while
set tabstop=4 softtabstop=4
set shiftwidth=4
 set smarttab
" Uncomment if i get tired of seing tabs all over
"    set expandtab

" Tries to do smart indent
 set smartindent
 set autoindent
" Makes me less insane in some ways but more in others.
	set nowrap

" Makes backspace work everywhere
	set backspace=indent,eol,start

" Sets path to all under path
" Used for using find
set path+=$PWD/**

" Highlightes all matches when searching and stops highliting matches when escape in normal mode is pressed is pressed.
" Bug, shows previous search before typing new search
set nohlsearch
nnoremap / :let @/=''<CR>:set hlsearch<CR>/
nnoremap ? :let @/=''<CR>:set hlsearch<CR>?
nnoremap <esc> :nohlsearch<CR>

" Shortcutting split navigation, saving a keypress:
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" Switches between relative line numbers and normal line number.
" Relative line numbers only in normal and visual mode when windows is active.
" The events are before the * and the command to execute is after.
	set number relativenumber
    autocmd BufEnter,FocusGained,InsertLeave,WinEnter * set relativenumber
    autocmd BufLeave,FocusLost,InsertEnter,WinLeave   * set norelativenumber
	autocmd VimResized * execute "normal! \<c-w>="

" Scrolls 5 chars when cursor get to edge of screen in horizontal direction
	set sidescroll=5
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



" Case insensitive search until I use capital letter
	set ignorecase
	set smartcase
" Go to matching during the typing of a search
	set incsearch

" EXPERIMENTAL ALTERNATIVE TO SWAPFILE
	set noswapfile
	set nobackup
	set undodir=~/.config/nvim/undodir
	set undofile

	set nowritebackup

" Undotree mapping
nnoremap <leader>u :UndotreeToggle<cr>
" Undotree options https://github.com/mbbill/undotree/blob/master/plugin/undotree.vim#L15
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
"------------------------------------------------------------------------------
" Coc stuff
" TextEdit might fail if hidden is not set.


" Give more space for displaying messages.
set cmdheight=2

" Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" delays and poor user experience.
set updatetime=300

" Don't pass messages to |ins-completion-menu|.
set shortmess+=c

" Always show the signcolumn, otherwise it would shift the text each time
" diagnostics appear/become resolved.
if has("patch-8.1.1564")
  " Recently vim can merge signcolumn and number column into one
  set signcolumn=number
else
  set signcolumn=yes
endif

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

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
" <cr> could be remapped by other vim plugin, try `:verbose imap <CR>`.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

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

" Applying codeAction to the selected region.
" Example: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap keys for applying codeAction to the current buffer.
nmap <leader>ac  <Plug>(coc-codeaction)
" Apply AutoFix to problem on the current line.
nmap <leader>qf  <Plug>(coc-fix-current)

" Map function and class text objects
" NOTE: Requires 'textDocument.documentSymbol' support from the language server.
xmap if <Plug>(coc-funcobj-i)
omap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap af <Plug>(coc-funcobj-a)
xmap ic <Plug>(coc-classobj-i)
omap ic <Plug>(coc-classobj-i)
xmap ac <Plug>(coc-classobj-a)
omap ac <Plug>(coc-classobj-a)

" Use CTRL-S for selections ranges.
" Requires 'textDocument/selectionRange' support of LS, ex: coc-tsserver
"nmap <silent> <C-s> <Plug>(coc-range-select)
"xmap <silent> <C-s> <Plug>(coc-range-select)

" Add `:Format` command to format current buffer.
command! -nargs=0 Format :call CocAction('format')

" Add `:Fold` command to fold current buffer.
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" Add `:OR` command for organize imports of the current buffer.
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
"set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Mappings using CoCList:
" Show all diagnostics.
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions.
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands.
"nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document.
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols.
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
"nnoremap <silent> <space>j  :<C-u>CocNext<CR> Do default action for previous
"item.
"nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list.
"nnoremap <silent> <space>p  :<C-u>CocListResume<CR>


" FzF-----------------------------------------------------------
	noremap <leader>fl <ESC>:BLines!<CR>
	nnoremap <leader>ff <ESC>:Files!<CR>
	nnoremap <leader>fg <ESC>:BCommits!<CR>
	cnoremap <C-f> Commands<CR>



"------------------------------------------------------------------------------

" Turns off highlighting on the bits of code that are changed, so the line that is changed is highlighted but the actual text that has changed stands out on the line and is readable.
if &diff
    highlight! link DiffText MatchParen
endif

" Goyo plugin makes text more readable when writing prose:
	map <leader>G :Goyo \| set bg=dark \| set linebreak<CR>

" Less usefull stuff?_________________________________________________________________________

" Spell-check set to <leader>L for Language
	map <leader>L :setlocal spell! spelllang=se<CR>

" Autoformatting behaviour i want.
" * Autolinebreak on comments and text.
" * Auto-comment if i press shift-enter
" * Fix indenting quickly
" * Maybe quickly toogle autoformatting?

"set textwidth=80
"set formatoptions+=c auto break comments set formatoptions+=t auto break
"set formatoptions+=t "auto break text
"set formatoptions+=a "format paragraf after any textchange
"set formatoptions+=n "recognice numbered lists
"set formatoptions+=j "removes comment character when joining lines
"set formatoptions+=q "reformat with gq
"set formatoptions+=w "make vim recognice that two lines are connected in the same paragraph by that the line ends in a whitespace





" Disables automatic commenting on newline:
" what i acctually whant +c,-r,-o+q
" Seams like you can make vim know two rows are in the same paragraph if they
" end with whitespace. But formatoptions+c does not end my comments with
" whitespace :(

" To fokus and unfokus a split
"nnoremap <leader>z <C-w>\|<C-w>\_
"nnoremap <leader>Z <C-w>=
"nnoremap <leader>z :tab split<CR>
"nnoremap <leader>Z <C-w><C-q>
" Windowcommand is nicer
nnoremap <leader>w <C-w>
nnoremap <leader>wo :ZoomWinTabToggle<CR>

autocmd TextYankPost * silent! lua require'vim.highlight'.on_yank()
" Fancy stuff for man pages
autocmd FileType man
	\ call man#show_toc() |
	\ setlocal laststatus=0 nonumber norelativenumber |
	\ nnoremap <buffer> l <Enter> |
	\ wincmd L |
	\ exe 'vertical resize ' . (winwidth(0) * 1 / 2) |
	"\ vert resize 35 |
	\ nnoremap <buffer> <leader>n :wincmd p<CR> |
	\ wincmd p |
	\ nnoremap <buffer> <leader>n :wincmd p<CR> |
	\ cnoreabbrev q qa! |
	\ autocmd! 
