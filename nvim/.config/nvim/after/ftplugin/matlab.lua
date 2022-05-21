local opts = { noremap = true, silent = false }
vim.api.nvim_buf_set_keymap(0, "n", "K", "<cmd> lua _MATLAB_HELP()<cr>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "<leader>mt", "<cmd> lua _MATLAB_TOGGLE()<cr>", opts)
vim.api.nvim_buf_set_keymap(0, "v", "s", "<esc>:lua _MATLAB_RUN_SECTION()<cr>", opts)
vim.api.nvim_buf_set_keymap(0, "n", "<leader>mf", "<esc>:lua _MATLAB_RUN_FILE()<cr>", opts)
_MATLAB_OPEN()
