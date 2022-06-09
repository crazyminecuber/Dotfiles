--NOTE test and proof that vim undotree is far from perfect
-- function gurk()
--    local fname = vim.fn.undofile(vim.fn.expand("%:p"))
--    vim.cmd("wundo " .. fname)
-- end

-- Trying to fix behaviour i saw in terminal. Turns out gui already fixed it and
-- i wasted a lot of time that i could have used better.
-- function _SAVE_SIGTERM(dying)
--   print("sigtermcheck")
--   if dying ~= 0 then
--     print("saving on kill")
--     vim.cmd("wa!")
--     vim.cmd("!sleep 2")
--     return
--   end
--   print("not saving")
--   vim.cmd("!sleep 2")
--   return
-- end

-- "autocmd VimLeavePre * wall
-- "autocmd VimLeave * wall
--"autocmd VimLeavePre * wall
--autocmd BufWritePre * lua print("Gurk2")
--"autocmd VimLeavePre * wall
--autocmd VimLeavePre * lua save_sigterm(v:dying)

vim.cmd([[
  augroup _general_settings
    autocmd!
    autocmd FileType qf,help,man,lspinfo nnoremap <silent> <buffer> q :close<CR> "q to quit stuff that is not normal files
    autocmd TextYankPost * silent!lua require('vim.highlight').on_yank({higroup = 'Visual', timeout = 200}) "See yank for post
    autocmd FileType qf set nobuflisted " qf means quickfix list
    " Automatically deletes all trailing whitespace on save.
    autocmd BufWritePre * %s/\s\+$//e
  augroup end

  augroup _git
    autocmd!
    autocmd FileType gitcommit setlocal wrap "Ja här borde man väl sätta på wrap och stänga av autoabreak"
    autocmd FileType gitcommit setlocal spell
  augroup end

  augroup _markdown
    autocmd!
    autocmd FileType markdown setlocal wrap
    autocmd FileType markdown setlocal spell
  augroup end

  augroup _auto_resize
    autocmd!
    autocmd VimResized * tabdo wincmd =  " I had my own solution for this. Check it" is the same but his is better because it does it in every tab
  augroup end

  augroup _alpha
    autocmd!
    autocmd User AlphaReady set showtabline=0 | autocmd BufUnload <buffer> set showtabline=2
  augroup end
]])

-- I could do fancy shit quering git what the repo name is but for now, it is
-- probably fine to regex match against some folder and some file-ending
local group = vim.api.nvim_create_augroup("SmashThatLikeButton", { clear = true })
-- vim.api.nvim_create_autocmd("BufEnter", {
--    callback = function()
--          print("gurk")
--          print(vim.fn.expand("%"))
--          print(vim.fn.expand("<afile>"))
--          print("gurk")
--    end,
--    pattern = "*/*",
--    group = group,
-- })

-- Use cargo run as gurk_runner for rust
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      -- print("gurk")
      -- print(vim.fn.expand("%"))
      -- print(vim.fn.expand("<afile>"))
      -- print("gurk")
      vim.g.gurk_runner = "cargo run"
      print("gurk its rust")
   end,
   pattern = "*rs",
   group = group,
})
-- Use manage.py to run webgruppen
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      -- print("gurk")
      -- print(vim.fn.expand("%"))
      -- print(vim.fn.expand("<afile>"))
      -- print("gurk")
      vim.g.gurk_runner = "./manage.py runserver"
      print("gurk its webgruppen")
   end,
   pattern = { "*/webgruppen/*.py", "*/webgruppen/*.css", "*/webgruppen/*.js" },
   group = group,
})

-- Use make as command for tddd95
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      -- print("gurk")
      -- print(vim.fn.expand("%"))
      -- print(vim.fn.expand("<afile>"))
      -- print("gurk")
      vim.g.gurk_runner = "make"
      print("gurk its tddd95")
   end,
   pattern = { "*/TDDD95/*.cc" },
   group = group,
})


-- Setting searchengine for word under cursor----------------------------------
-- For rust
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      vim.g.openbrowser_search_engines = {
         favorite = "http://google.com/search?q=rust+{query}",
      }
   end,
   pattern = { "*.rs" },
   group = group,
})

-- For cpp
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      vim.g.openbrowser_search_engines = {
         favorite = "http://google.com/search?q=cpp+{query}",
      }
   end,
   pattern = { "*.cc","*.cpp" },
   group = group,
})

-- For arduino
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      vim.g.openbrowser_search_engines = {
         favorite = "http://google.com/search?q=arduino+{query}",
      }
   end,
   pattern = { "*.ino" },
   group = group,
})

-- For matlab
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      vim.g.openbrowser_search_engines = {
         favorite = "http://google.com/search?q=matlab+{query}",
      }
   end,
   pattern = { "*.m" },
   group = group,
})

-- For css
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      vim.g.openbrowser_search_engines = {
         favorite = "http://google.com/search?q=css+{query}",
      }
   end,
   pattern = { "*.css" },
   group = group,
})

-- For javascript
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      vim.g.openbrowser_search_engines = {
         favorite = "http://google.com/search?q=javascript+{query}",
      }
   end,
   pattern = { "*.js" },
   group = group,
})

-- For python
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      vim.g.openbrowser_search_engines = {
         favorite = "http://google.com/search?q=python+{query}",
      }
   end,
   pattern = { "*.py" },
   group = group,
})

-- For lua
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      vim.g.openbrowser_search_engines = {
         favorite = "http://google.com/search?q=lua+{query}",
      }
   end,
   pattern = { "*.lua" },
   group = group,
})

-- For c
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      vim.g.openbrowser_search_engines = {
         favorite = "http://google.com/search?q=c+{query}",
      }
   end,
   pattern = { "*.c" },
   group = group,
})

-- For latex
vim.api.nvim_create_autocmd("BufEnter", {
   callback = function()
      vim.g.openbrowser_search_engines = {
         favorite = "http://google.com/search?q=latex+{query}",
      }
   end,
   pattern = { "*.tex" },
   group = group,
})
