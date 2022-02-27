local status_ok, toggleterm = pcall(require, "toggleterm")
if not status_ok then
   print("gurk! It broke!")
   return
end

toggleterm.setup({
size = function(term)
    if term.direction == "horizontal" then
      return 15
    elseif term.direction == "vertical" then
      return vim.o.columns * 0.4
    end
  end,
   open_mapping = [[<c-\>]],
   hide_numbers = true,
   shade_filetypes = {},
   shade_terminals = true,
   shading_factor = 2,
   start_in_insert = true,
   insert_mappings = true,
   persist_size = true,
   --direction = "float",
   direction = "vertical",
   close_on_exit = true,
   shell = vim.o.shell,
   float_opts = {
      border = "curved",
      winblend = 0,
      highlights = {
         border = "Normal",
         background = "Normal",
      },
   },
})

function _G.set_terminal_keymaps()
   local opts = { noremap = true }
   vim.api.nvim_buf_set_keymap(0, "t", "<esc>", [[<C-\><C-n>]], opts)
   vim.api.nvim_buf_set_keymap(0, "t", "jk", [[<C-\><C-n>]], opts)
   vim.api.nvim_buf_set_keymap(0, "t", "<C-h>", [[<C-\><C-n><C-W>h]], opts)
   vim.api.nvim_buf_set_keymap(0, "t", "<C-j>", [[<C-\><C-n><C-W>j]], opts)
   vim.api.nvim_buf_set_keymap(0, "t", "<C-k>", [[<C-\><C-n><C-W>k]], opts)
   vim.api.nvim_buf_set_keymap(0, "t", "<C-l>", [[<C-\><C-n><C-W>l]], opts)
end

vim.cmd("autocmd! TermOpen term://* lua set_terminal_keymaps()")

local Terminal = require("toggleterm.terminal").Terminal
local lazygit = Terminal:new({ cmd = "lazygit", hidden = true })

-- function _LAZYGIT_TOGGLE()
-- 	lazygit:toggle()
-- end
--
-- local node = Terminal:new({ cmd = "node", hidden = true })
--
-- function _NODE_TOGGLE()
-- 	node:toggle()
-- end
--
-- local ncdu = Terminal:new({ cmd = "ncdu", hidden = true })
--
-- function _NCDU_TOGGLE()
-- 	ncdu:toggle()
-- end
--
-- local htop = Terminal:new({ cmd = "htop", hidden = true })
--
-- function _HTOP_TOGGLE()
-- 	htop:toggle()
-- end
-- -- Could be interresting to have something like this. A nice repl to quickly bring up. Would also be
-- -- nice to be able to send code to it.
-- local python = Terminal:new({ cmd = "python", hidden = true })
--
-- function _PYTHON_TOGGLE()
-- 	python:toggle()
-- end
matlab = Terminal:new({
   cmd = "matlab -nodesktop -nosplash",
   hidden = true,
   on_open = function(t)
      t.__gurk = true
   end, -- function to run when the terminal opens
   on_close = function(t)
      t.__gurk = false
   end, -- function to run when the terminal opens
})
matlab.__gurk = false

function _MATLAB_OPEN()
   if matlab.__gurk == false then
      matlab:open()
else
	print("Nope")
   end
end
function _MATLAB_TOGGLE()
   print("tog")
   matlab:toggle()
end

function _MATLAB_RUN_FILE()
   local f_path = vim.fn.expand("%:p")
   matlab:send("run('" .. f_path .. "')", false)
end

local function visual_selection_range()
   local _, csrow, cscol, _ = unpack(vim.fn.getpos("'<"))
   local _, cerow, cecol, _ = unpack(vim.fn.getpos("'>"))
   if csrow < cerow or (csrow == cerow and cscol <= cecol) then
      return csrow - 1, cscol - 1, cerow, cecol
   else
      return cerow - 1, cecol - 1, csrow, cscol
   end
end

function _MATLAB_RUN_SECTION()
   local csrow, _, cerow, _ = visual_selection_range()
   local t_table = vim.api.nvim_buf_get_lines(0, csrow, cerow, false)
   local s = table.concat(t_table, "\n")
   matlab:send(s, false)
end

function _MATLAB_HELP()
   local gurk = vim.fn.expand("<cword>")
   print(gurk)
   matlab:send("help " .. gurk, false)
end

-- function _MATLAB_RUN_FILE()
-- --local selected_text = nvim_buf_get_lines(0, {start}, {end}, {strict_indexing})
--    local f_path = vim.fn.expand("%:p"))
-- 	matlab:send("run('".. f_path.. "')",false)
-- end
