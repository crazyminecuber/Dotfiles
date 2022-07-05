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

local ruled = require("ruled")

-- define screen height and width
local screen_height = awful.screen.focused().geometry.height
local screen_width = awful.screen.focused().geometry.width

-- define module table
local rules = {}

local centered_properties = {
   floating = true,
   placement = awful.placement.centered,
   width = screen_width * 0.55,
   height = screen_height * 0.65,
}
-- ===================================================================
-- Rules
-- ===================================================================

-- return a table of client rules including provided keys / buttons
function rules.create(clientkeys, clientbuttons)
   local rofi_rule = {}

   if beautiful.name == "mirage" then
      rofi_rule = {
         rule_any = { name = { "rofi" } },
         properties = { floating = true, titlebars_enabled = true },
         callback = function(c)
            if beautiful.name == "mirage" then
               awful.placement.left(c)
            end
         end,
      }
   else
      rofi_rule = {
         rule_any = { name = { "rofi" } },
         properties = { maximized = true, floating = true, titlebars_enabled = true },
      }
   end
   ruled.client.append_rule(rofi_rule)

   -- All clients will match this rule.
   ruled.client.append_rule({
      rule = {},
      properties = {
         titlebars_enabled = beautiful.titlebars_enabled,
         border_width = beautiful.border_width,
         border_color = beautiful.border_color_normal,
         focus = awful.client.focus.filter,
         raise = true,
         keys = clientkeys,
         buttons = clientbuttons,
         screen = awful.screen.preferred,
         maximized = false,
      },
   })
   ruled.client.append_rule({
      rule = {},
      except_any = { name = { "Command HistoryWindow", "TabCompletionPopup" } }, --Non causal behavior??? But it werks now.
      properties = {
         placement = awful.placement.centered,
      },
      callback = function(c)
         print("clien called " .. c.name)
      end,
   })
   -- Floating clients.
   ruled.client.append_rule({
      rule_any = {
         instance = {
            "DTA",
            "copyq",
         },
         class = {
            "Nm-connection-editor",
         },
         name = {
            "Event Tester",
            "Steam Guard - Computer Authorization Required",
         },
         role = {
            "pop-up",
         },
         type = {
            "dialog",
         },
      },
      properties = { floating = true, titlebars_enabled = false },
   })

   -- Fullscreen clients
   ruled.client.append_rule({
      rule_any = {
         class = {
            "Terraria.bin.x86",
         },
      },
      properties = { fullscreen = true },
   })

   -- "Switch to tag"
   -- These clients make you switch to their tag when they appear
   ruled.client.append_rule({
      rule_any = {
         class = {
            "firefox",
         },
      },
      properties = { switch_to_tags = true },
   })

   -- Visualizer
   ruled.client.append_rule({
      rule_any = { name = { "cava" } },
      properties = {
         floating = true,
         maximized_horizontal = true,
         sticky = true,
         ontop = false,
         skip_taskbar = true,
         below = true,
         focusable = false,
         height = screen_height * 0.40,
         opacity = 0.6,
      },
      callback = function(c)
         decorations.hide(c)
         awful.placement.bottom(c)
      end,
   })

   -- rofi rule determined above
   --rofi_rule,

   -- File chooser dialog
   ruled.client.append_rule({
      rule_any = { role = { "GtkFileChooserDialog" } },
      properties = centered_properties,
   })

   -- Pavucontrol & Bluetooth Devices
   ruled.client.append_rule({
      rule_any = { class = { "Pavucontrol" }, name = { "Bluetooth Devices" } },
      properties = { floating = true, width = screen_width * 0.55, height = screen_height * 0.45 },
   })
   ruled.client.append_rule({
      rule_any = { class = { "obs" } },
      properties = { maximized = false },
   })
   -- Steam
   ruled.client.append_rule({
      rule_any = { class = { "Steam" }, name = { "Steam" } },
      properties = { floating = true, tag = "steam", switch_to_tags = true },
      callback = function(c)
         c.first_tag.layout = awful.layout.suit.fair
         print("obs!")
      end,
   })
   -- Matlab tab completion and previous command
   ruled.client.append_rule({
      rule = { class = "MATLAB*", name = "Figure*" },
      --rule = {class = "matlab", name = "TabCompletionPopup"},
      properties = { floating = false, tag = "matlab", switch_to_tags = true },
      callback = function(c)
         c.first_tag.layout = awful.layout.suit.fair
         print("figure!")
      end,
   })

   ruled.client.append_rule({
      rule = { class = "MATLAB*", name = "Select a new folder" },
      properties = centered_properties,
      callback = function(c)
         print("select file")
      end,
   })
   ruled.client.append_rule({
      rule = { class = "MATLAB*", name = "Command HistoryWindow" },
      properties = { titlebars_enabled = false },
   })
   ruled.client.append_rule({
      rule = { type = "dialog" },
      properties = { titlebars_enabled = false },
      callback = function(c)
         print("splash!")
      end,
   })
   ruled.client.append_rule({
      rule_any = { class = { "Steam" }, name = { "Steam" } },
      properties = { floating = true, tag = "steam", switch_to_tags = true },
   })
end

-- return module table
return rules
