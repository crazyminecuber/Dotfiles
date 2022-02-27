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

-- Autoformat
-- augroup _lsp
--   autocmd!
--   autocmd BufWritePre * lua vim.lsp.buf.formatting()
-- augroup end
-- oskpos gurk
