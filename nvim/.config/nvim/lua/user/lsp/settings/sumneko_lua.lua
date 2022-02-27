return {
   settings = {

      Lua = {
         diagnostics = {
            enable = true,
            globals = { "vim" },

            "use", -- Packer use keyword

            -- AwesomeWM

            "awesome",

            "client",

            "root",
         },
      },
      workspace = {
         library = {
            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
            [vim.fn.stdpath("config") .. "/lua"] = true,

            ["/usr/share/nvim/runtime/lua"] = true,

            ["/usr/share/nvim/runtime/lua/lsp"] = true,

            ["/usr/share/awesome/lib"] = true,
         },
      },
   },
}

--[[
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")
--print(vim.inspect(vim.api.nvim_get_runtime_file("", true)))
return {
  settings = {
    Lua = {
      runtime = {
        -- Tell the language server which version of Lua you're using (most likely LuaJIT in the case of Neovim)
        version = 'LuaJIT',
        -- Setup your lua path
        path = runtime_path,
      },
      diagnostics = {
        -- Get the language server to recognize the `vim` global
        globals = {'vim'},
      },
      workspace = {
        -- Make the server aware of Neovim runtime files
        --library = vim.api.nvim_get_runtime_file("", true),
        -- This line magically works rather than the other one
        library = {[vim.fn.expand('$VIMRUNTIME/lua')] = true, [vim.fn.expand('$VIMRUNTIME/lua/vim/lsp')] = true},
        checkThirdParty = false,
      },
      -- Do not send telemetry data containing a randomized but unique identifier
      telemetry = {
        enable = false,
      },
    },
  },
}
]]
--
