--      ██╗   ██╗ ██████╗ ██╗     ██╗   ██╗███╗   ███╗███████╗
--      ██║   ██║██╔═══██╗██║     ██║   ██║████╗ ████║██╔════╝
--      ██║   ██║██║   ██║██║     ██║   ██║██╔████╔██║█████╗
--      ╚██╗ ██╔╝██║   ██║██║     ██║   ██║██║╚██╔╝██║██╔══╝
--       ╚████╔╝ ╚██████╔╝███████╗╚██████╔╝██║ ╚═╝ ██║███████╗
--        ╚═══╝   ╚═════╝ ╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================

local wibox = require("wibox")
local awful = require("awful")
local gears = require("gears")
local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local offsetx = dpi(56)
local offsety = dpi(300)
local screen = awful.screen.focused()
local icon_dir = gears.filesystem.get_configuration_dir() .. "/icons/volume/" .. beautiful.name .. "/"

-- ===================================================================
-- Appearance & Functionality
-- ===================================================================

local volume_icon = wibox.widget({
   widget = wibox.widget.imagebox,
})

-- create the volume_adjust component
local volume_adjust = wibox({
   screen = awful.screen.focused(),
   x = screen.geometry.width - offsetx,
   y = (screen.geometry.height / 2) - (offsety / 2),
   width = dpi(48),
   height = offsety,
   shape = gears.shape.rounded_rect,
   visible = false,
   ontop = true,
})

local volume_bar = wibox.widget({
   widget = wibox.widget.progressbar,
   shape = gears.shape.rounded_bar,
   color = "#efefef",
   background_color = beautiful.bg_focus,
   max_value = 100,
   value = 0,
})

volume_adjust:setup({
   layout = wibox.layout.align.vertical,
   {
      wibox.container.margin(volume_bar, dpi(14), dpi(20), dpi(20), dpi(20)),
      forced_height = offsety * 0.75,
      direction = "east",
      layout = wibox.container.rotate,
   },
   wibox.container.margin(volume_icon),
})

-- create a 4 second timer to hide the volume adjust
-- component whenever the timer is started
local hide_volume_adjust = gears.timer({
   timeout = 4,
   autostart = true,
   callback = function()
      volume_adjust.visible = false
   end,
})

-- FIXME: throws timer already started errors
-- show volume-adjust when "volume_change" signal is emitted
awesome.connect_signal("volume_change", function()
   -- set new volume value
   -- awful.spawn.easy_async_with_shell(
   --    "amixer sget Master | grep 'Right:'",
   --
   --    function(stdout, stderr, reason, exit_code)
   --       local volume_level, mute = string.match(stdout, ".+%[(%d?%d?%d)%%%].*%[(%a?%a%a)%].*")
   --       volume_level = tonumber(volume_level)
   --       volume_bar.value = volume_level
   --       if volume_level > 40 and mute == "on" then
   --          volume_icon:set_image(icon_dir .. "volume.png")
   --       elseif volume_level > 0 and mute == "on" then
   --          volume_icon:set_image(icon_dir .. "volume-low.png")
   --       else
   --          volume_icon:set_image(icon_dir .. "volume-off.png")
   --       end
   --    end,
   --    false
   -- )
   awful.spawn.easy_async_with_shell(
      "pamixer --get-volume; pamixer --get-mute",
      function(stdout, stderr, reason, exit_code)
         --local volume_level, mute = string.match(stdout, ".+%[(%d?%d?%d)%%%].*%[(%a?%a%a)%].*")
         local volume_level, mute = string.match(stdout, "^(.+)\n(.+)\n$")
         volume_level = tonumber(volume_level)
         volume_bar.value = volume_level
         --print("volume_level: '" .. volume_level.."'")
         --print("mute: '" .. mute.. "'")
         if volume_level > 50 and mute == "false" then
            volume_icon:set_image(icon_dir .. "volume.png")
         elseif volume_level > 0 and mute == "false" then
            volume_icon:set_image(icon_dir .. "volume-low.png")
         else
            volume_icon:set_image(icon_dir .. "volume-off.png")
         end
      end,
      false
   )
   print("gurk")
   -- make volume_adjust component visible
   -- if volume_adjust.visible then
   --    hide_volume_adjust:again()
   -- else
   --    volume_adjust.visible = true
   --    hide_volume_adjust:start()
   -- end
   hide_volume_adjust:again()
   volume_adjust.visible = true
end)
