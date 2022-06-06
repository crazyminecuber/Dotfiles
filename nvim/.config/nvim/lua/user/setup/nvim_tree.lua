-- key can be either a string or a table of string (lhs)
-- action is the name of the action
-- action_cb is the function that will be called, it receives the node as a parameter. Optional for default actions
-- mode is normal by default

local tree_cb = require 'nvim-tree.config'.nvim_tree_callback

local function print_node_path(node)
  print(node.absolute_path)
end

local list = {
  { key = { "<CR>", "o", "<2-LeftMouse>" }, action = "edit" },
  { key = { "O" }, action = "edit_no_picker" },
  { key = { "<2-RightMouse>", "<C-]>" }, action = "cd" },
  { key = "<C-v>", action = "vsplit" },
  { key = "<C-x>", action = "split" },
  { key = "<C-t>", action = "tabnew" },
  { key = "<", action = "prev_sibling" },
  { key = ">", action = "next_sibling" },
  { key = "P", action = "parent_node" },
  { key = "<BS>", action = "close_node" },
  { key = "<Tab>", action = "preview" },
  { key = "K", action = "first_sibling" },
  { key = "J", action = "last_sibling" },
  { key = "I", action = "toggle_ignored" },
  { key = "H", action = "toggle_dotfiles" },
  { key = "R", action = "refresh" },
  { key = "a", action = "create" },
  { key = "d", action = "remove" },
  { key = "D", action = "trash" },
  { key = "r", action = "rename" },
  { key = "<C-r>", action = "full_rename" },
  { key = "x", action = "cut" },
  { key = "c", action = "copy" },
  { key = "p", action = "paste" },
  { key = "y", action = "copy_name" },
  { key = "Y", action = "copy_path" },
  { key = "gy", action = "copy_absolute_path" },
  { key = "[c", action = "prev_git_item" },
  { key = "]c", action = "next_git_item" },
  { key = "-", action = "dir_up" },
  { key = "s", action = "system_open" },
  { key = "q", action = "close" },
  { key = "g?", action = "toggle_help" },
  { key = "p", action = "print_path", action_cb = print_node_path },
  { key = "A", action = "rename" },
  { key = "|", action = "vsplit" },
  { key = "_", action = "split" },
  { key = "t", action = "tabnew" },
}




-- following options are the default
-- each of these are documented in `:help nvim-tree.OPTION_NAME`
require 'nvim-tree'.setup {
  disable_netrw        = false,
  hijack_netrw         = true,
  open_on_setup        = false,
  ignore_ft_on_setup   = {},
  auto_reload_on_write = true,
  open_on_tab          = false,
  hijack_cursor        = false,
  update_cwd           = true,
  respect_buf_cwd      = true,
  update_to_buf_dir    = {
    enable = true,
    auto_open = true,
  },
  diagnostics          = {
    enable = false,
    icons = {
      hint = "",
      info = "",
      warning = "",
      error = "",
    }
  },
  update_focused_file  = {
    enable      = true,
    update_cwd  = true,
    ignore_list = {}
  },
  system_open          = {
    cmd  = nil,
    args = {}
  },
  filters              = {
    dotfiles = false,
    custom = {}
  },
  git                  = {
    enable = true,
    ignore = true,
    timeout = 500,
  },
  view                 = {
    width = 30,
    height = 30,
    hide_root_folder = false,
    side = 'left',
    auto_resize = false,
    mappings = {
      custom_only = false,
      list = list
    },
    number = false,
    relativenumber = false,
    signcolumn = "yes"
  },
  trash                = {
    cmd = "trash",
    require_confirm = true
  },
  actions              = {
    change_dir = {
      global = false,
    },
    open_file = {
      quit_on_open = false,
    }
  }
}
