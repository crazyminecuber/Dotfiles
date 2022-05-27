local opts = { noremap = true, silent = false } --silent to not say stuff, turn true if you get anoying popups but i have never seen any todate
-- does not scilence command but scilence printing out what your keymap maps to

--<SNR> local fucntions and functions from other files
--s:function??
--"<buffer>" local to buffer, "<nowait>" do not wait for other possible commands with more keystrokes,
--"<silent>" do not echo what commands are being run, "<script>" only namespace local mappings and functions,
--"<expr>" , call function "<unique>" throw error if keymap is already in use
--
--
--
local term_opts = { silent = false }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

--Remap space as leader key
vim.g.mapleader = " " -- different than normal set because it is a vimscript vairiable
vim.g.maplocalleader = " "

-- Modes
--   normal_mode = "n",
--   insert_mode = "i",
--   visual_mode = "v",
--   visual_block_mode = "x",
--   term_mode = "t",
--   command_mode = "c",

keymap("", "<Space>", "<Nop>", opts)
-- Navigate buffers
-- keymap("n", "<S-l>", ":bnext<CR>", opts) -- Not comfortable enough with buffers jet and what order they are in. Better to remap this to switching tabs?
-- keymap("n", "<S-h>", ":bprevious<CR>", opts)
--
--
--
--
-- Normal --
-- Better window navigation
-- keymap("n", "<C-h>", "<C-w>h", opts) -- Fine but i mapped that to scrolling. Will have to think about what I want. If I want to use terminal,using leader for switching windows will be a pain
-- keymap("n", "<C-j>", "<C-w>j", opts)
-- keymap("n", "<C-k>", "<C-w>k", opts)
-- keymap("n", "<C-l>", "<C-w>l", opts)

--keymap("n", "<leader>e", ":Lex 30<cr>", opts) -- Nice did not know about this Lex thing. But i used <leader>n in my config for nerd tree might use lua-tree instead??

-- Resize with arrows
--keymap("n", "<C-Up>", ":resize -2<CR>", opts) --Nah just use mouse instead
--keymap("n", "<C-Down>", ":resize +2<CR>", opts)
--keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
--keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

-- Move text up and down
-- keymap("n", "<M-j>", "<Esc>:m .+1<CR>==gi", opts) -- alt not working?? But nice to have?
-- keymap("n", "<M-k>", "<Esc>:m .-2<CR>==gi", opts)
keymap("n", "<M-j>", "<Esc>:m .+1<CR>==", opts) -- alt not working?? But nice to have?
keymap("n", "<M-k>", "<Esc>:m .-2<CR>==", opts)

-- Insert --
-- Press jk fast to enter
--keymap("i", "lkjh", "<ESC>", opts) -- Interresting, might try for a while

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts) -- less hacky way to do this using <command> for vim map? Otherwise wonderful!!!
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<A-j>", ":m .+1<CR>==", opts)
keymap("v", "<A-k>", ":m .-2<CR>==", opts)
keymap("v", "p", '"_dP', opts) --Do not yank on past in visual mode. Somehting similar could be nice to have but I dont know if I like this behaveiour better than the original behaviour. Yanking could also be pretty nice if you try to replace stuff

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts) -- Moves entire line. Not what i expected but i do not know when the behaviour I was expecting could be useful. But I guess that this is never useful if you are in block mode. Why would you want to move some lines then?
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts) -- Why have <A-j> and J do the same thing?
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- Terminal --
-- Better terminal navigation
keymap("t", "<C-Left>", "<C-\\><C-N><C-w>h", term_opts)
keymap("t", "<C-Down>", "<C-\\><C-N><C-w>j", term_opts)
keymap("t", "<C-Up>", "<C-\\><C-N><C-w>k", term_opts)
keymap("t", "<C-Right>", "<C-\\><C-N><C-w>l", term_opts)

-- " Highlightes all matches when searching and stops highliting matches when escape in normal mode is pressed is pressed.
keymap("n", "/", ":let @/=''<CR>:set hlsearch<CR>/", opts)
keymap("n", "?", ":let @/=''<CR>:set hlsearch<CR>?", opts)
keymap("n", "<esc>", ":nohlsearch<CR>", opts)
keymap("n", "Q", "<Nop>", opts)
keymap("n", "gx", "<Plug>(openbrowser-smart-search)", opts)
keymap("v", "gx", "<Plug>(openbrowser-smart-search)", opts)
keymap("n", "<C-H>", "3zh", opts)
keymap("n", "<C-L>", "3zl", opts)
keymap("n", "<C-J>", "3<C-E>", opts)
keymap("n", "<C-K>", "3<C-Y>", opts)
keymap("n", "<C-Left>", ":wincmd h<CR>", opts)
keymap("n", "<C-Down>", ":wincmd j<CR>", opts)
keymap("n", "<C-Up>", ":wincmd k<CR>", opts)
keymap("n", "<C-Right>", ":wincmd l<CR>", opts)
-- Better remap spellsuggestions
keymap("n", "<C-.>", ":echo 'gurk'", opts)


-- TDDD95
--keymap("v", "<c-f>", ':normal ^yss"$i\\n<ESC>', opts)
vim.keymap.set({ "v" }, "<c-f>", ':normal ^yss"$i\\n<ESC>')
--vnoremap f :normal ^yss"$i\n<ESC>
