local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
   print("gurk it broke!")
   return
end
--test
--
local setup = {
   plugins = {
      marks = true, -- shows a list of your marks on ' and `
      registers = true, -- shows your registers on " in NORMAL or <C-r> in INSERT mode
      spelling = {
         enabled = true, -- enabling this will show WhichKey when pressing z= to select spelling suggestions
         suggestions = 20, -- how many suggestions should be shown in the list?
      },
      -- the presets plugin, adds help for a bunch of default keybindings in Neovim
      -- No actual key bindings are created
      presets = {
         operators = true, -- adds help for operators like d, y, ... and registers them for motion / text object completion
         motions = true, -- adds help for motions
         text_objects = true, -- help for text objects triggered after entering an operator
         windows = true, -- default bindings on <c-w>
         nav = true, -- misc bindings to work with windows
         z = true, -- bindings for folds, spelling and others prefixed with z
         g = true, -- bindings for prefixed with g
      },
   },
   -- add operators that will trigger motion and text object completion
   -- to enable all native operators, set the preset / operators plugin above
   -- operators = { gc = "Comments" },
   key_labels = {
      -- override the label used to display some keys. It doesn't effect WK in any other way.
      -- For example:
      -- ["<space>"] = "SPC",
      -- ["<cr>"] = "RET",
      -- ["<tab>"] = "TAB",
   },
   icons = {
      breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
      separator = "➜", -- symbol used between a key and it's label
      group = "+", -- symbol prepended to a group
   },
   popup_mappings = {
      scroll_down = "<c-d>", -- binding to scroll down inside the popup
      scroll_up = "<c-u>", -- binding to scroll up inside the popup
   },
   window = {
      border = "rounded", -- none, single, double, shadow
      position = "bottom", -- bottom, top
      margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
      padding = { 2, 2, 2, 2 }, -- extra window padding [top, right, bottom, left]
      winblend = 0,
   },
   layout = {
      height = { min = 4, max = 25 }, -- min and max height of the columns
      width = { min = 20, max = 50 }, -- min and max width of the columns
      spacing = 3, -- spacing between columns
      align = "left", -- align columns left, center or right
   },
   ignore_missing = false, -- enable this to hide mappings for which you didn't specify a label
   hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:", "^ " }, -- hide mapping boilerplate
   show_help = true, -- show help message on the command line when the popup is visible
   triggers = "auto", -- automatically setup triggers
   -- triggers = {"<leader>"} -- or specify a list manually
   triggers_blacklist = {
      -- list of mode / prefixes that should never be hooked by WhichKey
      -- this is mostly relevant for key maps that start with a native binding
      -- most people should not need to change this
      i = { "j", "k" },
      v = { "j", "k" },
   },
}

local opts = {
   mode = "n", -- NORMAL mode
   prefix = "<leader>",
   buffer = nil, -- Global mappings. Specify a buffer number for buffer local mappings
   silent = false, -- use `silent` when creating keymaps
   noremap = true, -- use `noremap` when creating keymaps
   nowait = false, -- use `nowait` when creating keymaps
}

--local mappings = {}
local mappings = {
   --worthless["a"] = { "<cmd>Alpha<cr>", "Alpha" },
   --worthless["h"] = { "<cmd>nohlsearch<CR>", "No Highlight" },
   ["b"] = {
      "<cmd>lua require('telescope.builtin').buffers(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Buffers",
   },
   ["e"] = { "<cmd>NvimTreeToggle<cr>", "Explorer" },
   --["w"] = { "<cmd>w!<CR>", "Save" },
   ["c"] = { "<cmd>bdelete<CR>", "Close Buffer" },
   ["f"] = {
      "<cmd>lua require('telescope.builtin').find_files(require('telescope.themes').get_dropdown{previewer = false})<cr>",
      "Find files",
   },
   ["F"] = { "<cmd>Telescope live_grep theme=ivy<cr>", "Find Text" },
   ["P"] = { "<cmd>lua require('telescope').extensions.projects.projects()<cr>", "Projects" },
   --
   ["u"] = { ":UndotreeToggle<cr>", "Toggle undotree" },
   a = {
      name = "Arduino",
      a = { "<cmd>ArduinoAttach<CR>", "Attach arduino" },
      m = { "<cmd>ArduinoVerify<CR>", "Verifiy arduino sketch" },
      s = { "<cmd>lua arduino_serial:toggle()<CR>", "Open serial" },
      u = {
         function()
            arduino_serial:shutdown()
            vim.cmd([[ArduinoUpload]]) -- Gör denna något?? Laddar packer men borde väl ändå starta om nvim?
            vim.cmd([[wincmd j]]) -- Gör denna något?? Laddar packer men borde väl ändå starta om nvim?
            vim.cmd([[execute "normal! G"]]) -- Gör denna något?? Laddar packer men borde väl ändå starta om nvim?
         end,
         "Arduino upload"
      },
      --<cmd>ArduinoUpload<CR>", "Upload arduion sketch" },
      d = { "<cmd>ArduinoUploadAndSerial<CR>", "Upload and serial" },
      b = { "<cmd>ArduinoChooseBoard<CR>", "Choose board" },
      p = { "<cmd>ArduinoChooseProgrammer<CR>", "Choose programmer" },
   },
   p = {
      name = "Packer",
      c = { "<cmd>PackerCompile<cr>", "Compile" },
      i = { "<cmd>PackerInstall<cr>", "Install" },
      s = { "<cmd>PackerSync<cr>", "Sync" },
      S = { "<cmd>PackerStatus<cr>", "Status" },
      u = { "<cmd>PackerUpdate<cr>", "Update" },
   },
   d = {
      name = "Debug",
      s = {
         name = "Step",
         c = { "<cmd>lua require('dap').continue()<CR>", "Continue" },
         v = { "<cmd>lua require('dap').step_over()<CR>", "Step Over" },
         i = { "<cmd>lua require('dap').step_into()<CR>", "Step Into" },
         o = { "<cmd>lua require('dap').step_out()<CR>", "Step Out" },
      },
      h = {
         name = "Hover",
         h = { "<cmd>lua require('dap.ui.variables').hover()<CR>", "Hover" },
         v = { "<cmd>lua require('dap.ui.variables').visual_hover()<CR>", "Visual Hover" },
      },
      u = {
         name = "UI",
         c = { "<cmd> lua require('dapui').close()<CR>", "close" },
         o = { "<cmd> lua require('dapui').open()<CR>", "open" },
         h = { "<cmd>lua require('dap.ui.widgets').hover()<CR>", "Hover" },
         f = { "<cmd>lua local widgets=require('dap.ui.widgets');widgets.centered_float(widgets.scopes)<CR>", "Float" },
      },
      r = {
         name = "Repl",
         o = { "<cmd>lua require('dap').repl.open()<CR>", "Open" },
         l = { "<cmd>lua require('dap').repl.run_last()<CR>", "Run Last" },
      },
      b = {
         name = "Breakpoints",
         c = {
            "<cmd>lua require('dap').set_breakpoint(vim.fn.input('Breakpoint condition: '))<CR>",
            "Breakpoint Condition",
         },
         m = {
            "<cmd>lua require('dap').set_breakpoint({ nil, nil, vim.fn.input('Log point message: ') })<CR>",
            "Log Point Message",
         },
         t = { "<cmd>lua require('dap').toggle_breakpoint()<CR>", "Create" },
      },
      c = { "<cmd>lua require('dap').scopes()<CR>", "Scopes" },
      i = { "<cmd>lua require('dap').toggle()<CR>", "Toggle" },
   },
   g = {
      name = "Git",
      s = { "<cmd>Gcommit<cr>", "Commit to git" },
      g = { "<cmd>lua _LAZYGIT_TOGGLE()<CR>", "Lazygit" },
      j = { "<cmd>lua require 'gitsigns'.next_hunk()<cr>", "Next Hunk" },
      k = { "<cmd>lua require 'gitsigns'.prev_hunk()<cr>", "Prev Hunk" },
      l = { "<cmd>lua require 'gitsigns'.blame_line()<cr>", "Blame" },
      p = { "<cmd>lua require 'gitsigns'.preview_hunk()<cr>", "Preview Hunk" },
      r = { "<cmd>lua require 'gitsigns'.reset_hunk()<cr>", "Reset Hunk" },
      R = { "<cmd>lua require 'gitsigns'.reset_buffer()<cr>", "Reset Buffer" },
      s = { "<cmd>lua require 'gitsigns'.stage_hunk()<cr>", "Stage Hunk" },
      u = {
         "<cmd>lua require 'gitsigns'.undo_stage_hunk()<cr>",
         "Undo Stage Hunk",
      },
      o = { "<cmd>Telescope git_status<cr>", "Open changed file" },
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope git_commits<cr>", "Checkout commit" },
      d = {
         "<cmd>Gitsigns diffthis HEAD<cr>",
         "Diff",
      },
      s = { "<cmd>G<cr>", "Fugative menu" },
   },

   l = {
      name = "LSP",
      a = { "<cmd>lua vim.lsp.buf.code_action()<cr>", "Code Action" },

      c = {
         name = "Spellcheck",

         s = { ":setlocal spell | set spelllang=sv<CR>", "Set spellang to sv" },
         e = { ":setlocal spell | set spelllang=en<CR>", "Set spellang to en" },
         o = { ":setlocal spell!", "Turn off spellcheck" },
      },
      d = {
         "<cmd>Telescope lsp_document_diagnostics<cr>",
         "Document Diagnostics",
      },
      f = { "<cmd>lua vim.lsp.buf.format { async = true }<cr>", "Format" },

      i = { "<cmd>LspInfo<cr>", "Info" },
      -- 	I = { "<cmd>LspInstallInfo<cr>", "Installer Info" },
      --j = {
      ["<C-n>"] = {
         "<cmd>lua vim.lsp.diagnostic.goto_next()<CR>",
         "Next Diagnostic",
      },
      --k = {
      ["<C-p>"] = {
         "<cmd>lua vim.lsp.diagnostic.goto_prev()<cr>",
         "Prev Diagnostic",
      },
      l = { "<cmd>lua vim.lsp.codelens.run()<cr>", "CodeLens Action" },
      q = { "<cmd>lua vim.lsp.diagnostic.set_loclist()<cr>", "Quickfix" },
      r = { "<cmd>lua vim.lsp.buf.rename()<cr>", "Rename" },
      --vim.api.nvim_set_keymap("n", "<space>f", "<cmd>lua vim.diagnostic.open_float()<CR>", opts)
      s = { "<cmd>Telescope lsp_document_symbols<cr>", "Document Symbols" },
      S = {
         "<cmd>Telescope lsp_dynamic_workspace_symbols<cr>",
         "Workspace Symbols",
      },
      w = {
         name = "workspace",
         d = { "<cmd>Telescope lsp_workspace_diagnostics<cr>", "Workspace Diagnostics" },
         a = { "<cmd>lua vim.lsp.buf.add_workspace_folder()", "Set spellang to sv" },
         r = { "<cmd>lua vim.lsp.buf.remove_workspace_folder()", "Set spellang to en" },
         l = { "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>", "List workspace folders" },
      },
      v = {
         function()
            vim.diagnostic.config({ virtual_text = false })
         end,
         "Virtual text off",
      },
      V = {
         function()
            vim.diagnostic.config({ virtual_text = true })
         end,
         "Virtual text on",
      },
   },
   r = {
      name = "Random",
      a = { ":w<cr>:!cat test | awesome-client <enter>", "Awesome run repl" },
      p = {
         function()
            require("nabla").popup({ border = "rounded" })
         end,
         "Preview latex",
      }, --" Customize with popup({border = ...})  : 'single' (default), 'double', 'rounded' end
   },

   q = {
      name = "Location list",
      n = { ":lnext<cr>", "Location list next" },
      p = { ":lprev<cr>", "Location list prev" },
      q = { "<cmd>Telescope loclist<cr>", "Location list toggle" },
   },
   Q = {
      name = "Quickfix list",
      n = { ":cnext<cr>", "Quickfix next" },
      p = { ":cprev<cr>", "Quickfix prev" },
      q = { "<cmd>Telescope quickfix<cr>", "Quickfix list toggle" },
   },
   s = {
      name = "Search",
      b = { "<cmd>Telescope git_branches<cr>", "Checkout branch" },
      c = { "<cmd>Telescope colorscheme<cr>", "Colorscheme" },
      --h = { "<cmd>Telescope help_tags<cr>", "Find Help" },
      M = { "<cmd>Telescope man_pages<cr>", "Man Pages" },
      r = { "<cmd>Telescope oldfiles<cr>", "Open Recent File" },
      R = { "<cmd>Telescope registers<cr>", "Registers" },
      --k = { "<cmd>Telescope keymaps<cr>", "Keymaps" },
      C = { "<cmd>Telescope commands<cr>", "Commands" },
      s = { "<cmd>Telescope spell_suggest<cr>", "Spell suggestions" },
   },

   T = {
      name = "Terminal",
      --n = { "<cmd>lua _NODE_TOGGLE()<cr>", "Node" },
      --u = { "<cmd>lua _NCDU_TOGGLE()<cr>", "NCDU" },
      --t = { "<cmd>lua _HTOP_TOGGLE()<cr>", "Htop" },
      p = { "<cmd>lua _PYTHON_TOGGLE()<cr>", "Python" },
      e = { "<cmd>!alacritty &<cr>", "external" },
      d = { "<cmd>!alacritty -e gdb _test &<cr>", "debug tddd95" },
      t = { "<cmd>TermExec cmd='make' direction=float<cr>", "make tddd95" },
      f = { "<cmd>ToggleTerm direction=float<cr>", "Float" },
      h = { "<cmd>ToggleTerm size=10 direction=horizontal<cr>", "Horizontal" },
      v = { "<cmd>ToggleTerm size=80 direction=vertical<cr>", "Vertical" },
   },
   t = {
      name = "Tab",
      n = { "<cmd>tabnext<cr>", "Next tab" },
      p = { "<cmd>tabprevious<cr>", "Previous tab" },
   },
   w = {
      name = "Window",
      h = { ":wincmd h<CR>", "Left window" },
      j = { ":wincmd j<CR>", "Down window" },
      k = { ":wincmd k<CR>", "Up window" },
      l = { ":wincmd l<CR>", "Right window" },
      o = { ":ZoomWinTabToggle<CR>", "Toggle window zoom" },
   },
   [","] = {
      "<cmd>lua run_gurk()<cr>", "Gurk runner"
   },
}

local my_mappings = {}

---   w = { "<C-w>", "Window commands" },

which_key.setup(setup)
which_key.register(mappings, opts)
which_key.register(my_mappings)

-- "-----------------------Nice shortcuts------------------------------------
--   More bindings!!
