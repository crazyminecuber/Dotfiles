-- Mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
local opts = { noremap = true, silent = true }
vim.api.nvim_set_keymap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
vim.api.nvim_set_keymap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer

-- local lsp_keymaps = function(bufnr)
--    -- Enable completion triggered by <c-x><c-o>
--    vim.api.nvim_buf_set_option(bufnr, "omnifunc", "v:lua.vim.lsp.omnifunc")
--
--    -- Mappings.
--    -- See `:help vim.lsp.*` for documentation on any of the below functions
--    vim.api.nvim_buf_set_keymap(bufnr, "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
--    vim.api.nvim_buf_set_keymap(bufnr, "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
--    vim.api.nvim_buf_set_keymap(bufnr, "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
--    vim.api.nvim_buf_set_keymap(bufnr, "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
--    vim.api.nvim_buf_set_keymap(bufnr, "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
--    vim.api.nvim_buf_set_keymap(bufnr, "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
--    vim.api.nvim_set_keymap("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
--    vim.api.nvim_buf_set_keymap(bufnr, "n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
--    vim.api.nvim_buf_set_keymap(bufnr, "n", "gl", "<cmd>lua vim.diagnostic.get()<CR>", opts)
-- end
--
vim.api.nvim_set_option( "omnifunc", "v:lua.vim.lsp.omnifunc")

-- Mappings.
-- See `:help vim.lsp.*` for documentation on any of the below functions
vim.api.nvim_set_keymap( "n", "gD", "<cmd>lua vim.lsp.buf.declaration()<CR>", opts)
vim.api.nvim_set_keymap( "n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
vim.api.nvim_set_keymap( "n", "gh", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
vim.api.nvim_set_keymap( "n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
vim.api.nvim_set_keymap( "n", "gs", "<cmd>lua vim.lsp.buf.signature_help()<CR>", opts)
vim.api.nvim_set_keymap( "n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
vim.api.nvim_set_keymap("n", "gp", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
vim.api.nvim_set_keymap("n", "gt", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
vim.api.nvim_set_keymap("n", "gl", "<cmd>lua vim.diagnostic.get()<CR>", opts)

My_lsp_on_attach = function(client, bufnr)
   --lsp_keymaps(bufnr)
   if client.name == "sumneko_lua" then
      client.server_capabilities.document_formatting = false
   end
end

-- Use a loop to conveniently call 'setup' on multiple servers and
-- map buffer local keybindings when the language server attaches
local servers = {
   "arduino_language_server",
   "tsserver",
   "jedi_language_server",
   "clangd", --[[ "pyright", ]] --[[ "ccls", ]]
   "sumneko_lua",
   -- "rust_analyzer",
}
for _, lsp in pairs(servers) do
   local settings = {
      on_attach = My_lsp_on_attach,
      flags = {
         -- This will be the default in neovim 0.7+
         debounce_text_changes = 150,
      },
   }
   if lsp == "sumneko_lua" then
      local sumneko_settings = require("user.lsp.settings.sumneko_lua")
      settings = vim.tbl_deep_extend("error", sumneko_settings, settings)
   end
   if lsp == "arduino_language_server" then
      local arduino_settings = require("user.lsp.settings.arduino_language_server")
      settings = vim.tbl_deep_extend("error", arduino_settings, settings)
   end

   require("lspconfig")[lsp].setup(settings)
end

local signs = {
   { name = "DiagnosticSignError", text = "" },
   { name = "DiagnosticSignWarn", text = "" },
   { name = "DiagnosticSignHint", text = "" },
   { name = "DiagnosticSignInfo", text = "" },
}

for _, sign in ipairs(signs) do
   vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
end

local config = {
   -- disable virtual text
   virtual_text = true,
   -- show signs
   signs = {
      active = signs,
   },
   update_in_insert = true,
   underline = true,
   severity_sort = true,
   float = {
      focusable = false,
      style = "minimal",
      border = "rounded",
      source = "always",
      header = "",
      prefix = "",
   },
}

vim.diagnostic.config(config)

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, {
   border = "rounded",
})

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, {
   border = "rounded",
})

require("user.lsp.null-ls")
