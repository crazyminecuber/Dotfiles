--      ██████╗  █████╗ ███████╗████████╗███████╗██╗
--      ██╔══██╗██╔══██╗██╔════╝╚══██╔══╝██╔════╝██║
--      ██████╔╝███████║███████╗   ██║   █████╗  ██║
--      ██╔═══╝ ██╔══██║╚════██║   ██║   ██╔══╝  ██║
--      ██║     ██║  ██║███████║   ██║   ███████╗███████╗
--      ╚═╝     ╚═╝  ╚═╝╚══════╝   ╚═╝   ╚══════╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================

local awful = require("awful")
local gears = require("gears")
local gears = require("gears")
local wibox = require("wibox")

local pastel = {}

-- ===================================================================
-- Pastel setup
-- ===================================================================

pastel.initialize = function()
   -- Import components
   require("components.simple_wallpaper")
   require("components.exit-screen")
   require("components.volume-adjust")

   -- Import panels
   local left_panel = require("components.pastel.left-panel")
   local top_panel = require("components.pastel.top-panel")
   local central_panel = require("components.pastel.central-panel")

   -- Set up each screen (add tags & panels)
   awful.screen.connect_for_each_screen(function(s)
      -- Only add the left panel on the primary screen
      if s.index == 1 then
         left_panel.create(s)
         for i = 1, 9, 1 do
            awful.tag.add((i == 6 and "steam") or (i == 7 and "matlab") or i, {
               icon = gears.filesystem.get_configuration_dir() .. "/icons/tags/pastel/" .. i .. ".png",
               icon_only = true,
               layout = i == 6 and awful.layout.suit.floating or awful.layout.suit.tile,
               screen = s,
               selected = i == 1,
            })
         end
      else
         -- Secondary screen
         awful.tag.add(0, {
            layout = awful.layout.suit.tile.bottom,
            screen = s,
            selected = true,
         })
      end

      -- Add the top panel to every screen
      top_panel.create(s)
      s.central_panel = central_panel(s)
   end)
   awful.screen.connect_for_each_screen(function(s)
      --print("Screen tags")
      --print(#s.tags)
   end)
end
return pastel
