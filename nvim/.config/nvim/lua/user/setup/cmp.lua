local cmp_status_ok, cmp = pcall(require, "cmp") -- Not really nesisary
if not cmp_status_ok then
   return
end

local snip_status_ok, luasnip = pcall(require, "luasnip") -- Not really nesisary
if not snip_status_ok then
   return
end

require("luasnip/loaders/from_vscode").lazy_load() -- TJ did not do this but idunno

--local check_backspace = function()
-- local col = vim.fn.col "." - 1
--return col == 0 or vim.fn.getline("."):sub(col, col):match "%s"
--end

--   פּ ﯟ   some other good icons
local kind_icons = {
   Text = "",
   Method = "m",
   Function = "",
   Constructor = "",
   Field = "",
   Variable = "",
   Class = "",
   Interface = "",
   Module = "",
   Property = "",
   Unit = "",
   Value = "",
   Enum = "",
   Keyword = "",
   Snippet = "",
   Color = "",
   File = "",
   Reference = "",
   Folder = "",
   EnumMember = "",
   Constant = "",
   Struct = "",
   Event = "",
   Operator = "",
   TypeParameter = "",
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
   snippet = {
      expand = function(args)
         luasnip.lsp_expand(args.body) -- For `luasnip` users.
      end,
   },
   window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
   },
   -- 	--,
   -- },
   mapping = cmp.mapping.preset.insert({
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-o>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
   }),
   formatting = {
      fields = { "kind", "abbr", "menu" },
      format = function(entry, vim_item)
         -- Kind icons
         vim_item.kind = string.format("%s", kind_icons[vim_item.kind])
         -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
         vim_item.menu = ({
            luasnip = "[Snippet]",
            nvim_lsp = "[LSP]",
            nvim_lua = "[API]",
            buffer = "[Buffer]",
            path = "[Path]",
         })[entry.source.name]
         return vim_item
      end,
   },
   sources = {
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "nvim_lua" },
      { name = "buffer", keyword_length = 4 },
      --{ name = "buffer" },
      { name = "path" },
   },
   -- Does this do anything? No documentation??
   confirm_opts = {
      behavior = cmp.ConfirmBehavior.Replace,
      select = false,
   },
   -- documentation = {
   -- 	border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" },
   -- },
   -- Dont know if i really like this
   experimental = {
      ghost_text = false,
   },
})

-- Dont know if i really like this
cmp.setup.cmdline("/", {
   sources = {
      { name = "buffer" },
   },
})
