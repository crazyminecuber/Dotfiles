return {
   settings = {
      Lua = {
         runtime = {
            -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
            version = "LuaJIT",
         },
         diagnostics = {
            -- Get the language server to recognize the `vim` global
            globals = { "vim", "client" },
         },
         workspace = {
            -- Make the server aware of Neovim runtime files
            --might need to change this to table.unpack if lua versions change
            --Unpack needs to be last!!
            library = { "/usr/share/awesome/lib/", unpack(vim.api.nvim_get_runtime_file("", true)) },
            maxPreload = 100000,
            preloadFileSize = 10000,
             checkThirdParty = false, -- THIS IS THE IMPORTANT LINE TO ADD
         },
      },
   },
}
