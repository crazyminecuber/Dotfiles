--      ██████╗ ██╗   ██╗██╗     ███████╗███████╗
--      ██╔══██╗██║   ██║██║     ██╔════╝██╔════╝
--      ██████╔╝██║   ██║██║     █████╗  ███████╗
--      ██╔══██╗██║   ██║██║     ██╔══╝  ╚════██║
--      ██║  ██║╚██████╔╝███████╗███████╗███████║
--      ╚═╝  ╚═╝ ╚═════╝ ╚══════╝╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local beautiful = require("beautiful")

-- define screen height and width
local screen_height = awful.screen.focused().geometry.height
local screen_width = awful.screen.focused().geometry.width

-- define module table
local rules = {}


-- ===================================================================
-- Rules
-- ===================================================================


-- return a table of client rules including provided keys / buttons
function rules.create(clientkeys, clientbuttons)
   local rofi_rule = {}

   if beautiful.name == "mirage" then
      rofi_rule = {
         rule_any = {name = {"rofi"}},
         properties = {floating = true, titlebars_enabled = true},
         callback = function(c)
            if beautiful.name == "mirage" then
               awful.placement.left(c)
            end
         end
      }
   else rofi_rule = {
         rule_any = {name = {"rofi"}},
         properties = {maximized = true, floating = true, titlebars_enabled = true},
      }
   end

   return {
      -- All clients will match this rule.
      {
         rule = {},
         properties = {
            titlebars_enabled = beautiful.titlebars_enabled,
            border_width = beautiful.border_width,
            border_color = beautiful.border_normal,
            focus = awful.client.focus.filter,
            raise = true,
            keys = clientkeys,
            buttons = clientbuttons,
            screen = awful.screen.preferred,
            --placement = awful.placement.centered --FIXME maybe wrong thing to do?
         },
      },
      -- Floating clients.
      {
         rule_any = {
            instance = {
               "DTA",
               "copyq",
            },
            class = {
               "Nm-connection-editor"
            },
            name = {
               "Event Tester",
               "Steam Guard - Computer Authorization Required"
            },
            role = {
               "pop-up",
               "GtkFileChooserDialog"
            },
            type = {
               "dialog"
            }
         }, properties = {floating = true, titlebars_enabled=false},
      },

      -- Fullscreen clients
      {
         rule_any = {
            class = {
               "Terraria.bin.x86",
            },
         }, properties = {fullscreen = true}
      },

      -- "Switch to tag"
      -- These clients make you switch to their tag when they appear
      {
         rule_any = {
            class = {
               "firefox"
            },
         }, properties = {switchtotag = true}
      },

      -- Visualizer
      {
         rule_any = {name = {"cava"}},
         properties = {
            floating = true,
            maximized_horizontal = true,
            sticky = true,
            ontop = false,
            skip_taskbar = true,
            below = true,
            focusable = false,
            height = screen_height * 0.40,
            opacity = 0.6
         },
         callback = function (c)
            decorations.hide(c)
            awful.placement.bottom(c)
         end
      },

      -- rofi rule determined above
      rofi_rule,

      -- File chooser dialog
      {
         rule_any = {role = {"GtkFileChooserDialog"}},
         properties = {floating = true, width = screen_width * 0.55, height = screen_height * 0.65}
      },

      -- Pavucontrol & Bluetooth Devices
      {
         rule_any = {class = {"Pavucontrol"}, name = {"Bluetooth Devices"}},
         properties = {floating = true, width = screen_width * 0.55, height = screen_height * 0.45}
      },
	  -- Steam
	  {
		rule_any = {class = {"Steam"}, name = {"Steam"}},
		properties = {floating = true, tag = "steam",switchtotag=true}
	  },
	  -- Matlab tab completion and previous command
	  {
		rule = {class = "MATLAB*", name = "Figure*"},
		--rule = {class = "matlab", name = "TabCompletionPopup"},
		properties = {floating=false, tag = 'matlab',switchtotag=true},
		callback = function (c)
			c.first_tag.layout = awful.layout.suit.fair
			print("figure!")

		end
	  },
	  {
		rule = {class = "matlab", name = "Command HistoryWindow"},
		properties = {titlebars_enabled=false}
	  },
	  {
		rule = {type = "dialog"},
		properties = {titlebars_enabled=false},
		callback = function (c)
			print("splash!")
		end
	  },
	  {
		rule_any = {class = {"Steam"}, name = {"Steam"}},
		properties = {floating = true, tag = "steam",switchtotag=true}
	  },
   }
end

-- return module table
return rules
