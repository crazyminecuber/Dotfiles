local options = {
  backup = false,                          -- creates a backup file
  clipboard = "unnamedplus",               -- allows neovim to access the system clipboard
  cmdheight = 2,    --Playable with                       -- more space in the neovim command line for displaying messages
  completeopt = { "menuone", "noselect" },-- dunno what this does -- mostly just for cmp
  conceallevel = 0, -- playable with                       -- so that `` is visible in markdown files
  fileencoding = "utf-8", -- just let it be                  -- the encoding written to a file
  hlsearch = false,  -- More advaned version that i use                       -- highlight all matches on previous search pattern
  ignorecase = true,    --good                   -- ignore case in search patterns
  smartcase = true, --good                        -- smart case
  mouse = "a", --good but scrool in hosizontal direction does not work                             -- allow the mouse to be used in neovim
  pumheight = 10, --playable with                          -- pop up menu height
  --showmode = false, --  I definatelly want this positive but a line might replace this??        -- we don't need to see things like -- INSERT -- anymore
  showmode = true, --  I definatelly want this positive but a line might replace this??        -- we don't need to see things like -- INSERT -- anymore
  showtabline = 2, -- show tabs at top nice to have                        -- always show tabs
  smartindent = true, --good                     -- make indenting smarter again
  splitbelow = true,  -- check my settings               -- force all horizontal splits to go below current window
  splitright = true,  --check my settings                     -- force all vertical splits to go to the right of current window
  swapfile = false,   --dunno I am not happy with current settings                     -- creates a swapfile
  termguicolors = true,  --good                  -- set term gui colors (most terminals support this)
  timeoutlen = 1000,     --good about there             -- time to wait for a mapped sequence to complete (in milliseconds)
  undofile = true,       --shoudl improve this alot before i am happy                  -- enable persistent undo
  updatetime = 300,                        -- faster completion (4000ms default)
  writebackup = false,     -- i dont quite get this comment but documentation strongly recomends this being on                -- if a file is being edited by another program (or was written to file while editing with another program), it is not allowed to be edited
  expandtab = true,                        -- convert tabs to spaces
  shiftwidth = 2,        -- I decide                  -- the number of spaces inserted for each indentation
  tabstop = 2,         -- I decide                    -- insert 2 spaces for a tab
  laststatus = 3,         -- I decide                    -- insert 2 spaces for a tab
  cursorline = true,  --nice                       -- highlight the current line
  number = true, --use my more advanced version                           -- set numbered lines
  relativenumber = false, --more advanced version                 -- set relative numbered lines
  numberwidth = 4, -- why so large                         -- set number column width to 2 {default 4}
  signcolumn = "yes",     --debugsymbols                 -- always show the sign column, otherwise it would shift the text each time
  wrap = false,     --good                       -- display lines as one long line
  scrolloff = 8,    -- play around with                       -- is one of my fav
  sidescrolloff = 8,
  guifont = "monospace:h17",               -- the font used in graphical neovim applications
  textwidth = 80,      -- Textwidth for when to hard wrap
	wildmode="longest,list,full", -- Enable autocompletion, maybe look further into this?
  colorcolumn="+1",
}

vim.opt.shortmess:append "c" -- "

vim.opt.formatoptions="cqlnjt"
vim.g.netrw_nogx = 1 -- disable netrw's gx mapping.

for k, v in pairs(options) do
  vim.opt[k] = v
end

--Color column
vim.cmd[[highlight ColorColumn ctermbg=0 guibg=lightgrey]]
vim.cmd[[highlight Cursor guibg=#101010]]

vim.cmd[[set nrformats+=alpha]] -- ctrl_a, ctrl_x werks on hexadecimal as well
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set iskeyword+=-]] -- changes what is considered a keyword now hello-world is one keyword becuase we consider - to be normal charcter. So this werks, but might whant this to be different for different languages
--vim.cmd [[set formatoptions=cqlnjt]] -- DONE?: this doesn't seem to work

-- --------------------------- Whitespace reprecentation ------------------------
--  Display symbols instead of whitespace etc
vim.cmd[[set list
" Replaces whitespace with symbols. And when there is text to scroll to horizontally.
	"set listchars+=tab:\ \ ┋
	"set listchars+=tab:\ \ 
	set listchars+=tab:\ \ ┫
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
]]


--
--
--
-- less usefull stuff
--
-- " Sets path to all under path
-- " Used for using find ---Useful?????
-- set path+=$PWD/**
--



-- disable builtins plugins
-- Any speed increas? Anhtihg broken?
-- local disabled_built_ins = {
--     "netrw",
--     "netrwPlugin",
--     "netrwSettings",
--     "netrwFileHandlers",
--     "gzip",
--     "zip",
--     "zipPlugin",
--     "tar",
--     "tarPlugin",
--     "getscript",
--     "getscriptPlugin",
--     "vimball",
--     "vimballPlugin",
--     --"2html_plugin",
--     "logipat",
--     "rrhelper",
--     --"spellfile_plugin",
--     --"matchit"
-- }
--
-- for _, plugin in pairs(disabled_built_ins) do
--     vim.g["loaded_" .. plugin] = 1
-- end
