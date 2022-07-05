local awful = require("awful")
local gears = require("gears")
local filesystem = gears.filesystem
local config = require("configuration.config")
local wibox = require("wibox")

--  ========================================
-- 				Configuration
--	     Change your preference here
--  ========================================
local wall_config = {
   -- Wallpaper directory. The default is:
   -- local wall_config.wall_dir = os.getenv('HOME') .. 'Pictures/Wallpapers/'
   wall_dir = filesystem.get_configuration_dir() .. (config.module.simple_wallpaper.wall_dir or "themes/wallpapers/"),

   -- If there's a picture format that awesome accepts and i missed
   -- (which i probably did) feel free to add it right here
   valid_picture_formats = config.module.simple_wallpaper.valid_picture_formats or { "jpg", "png", "jpeg" },
}

print("simple wallpaper configuration")
print(filesystem.get_configuration_dir())
print(config.module.simple_wallpaper.wall_dir)
print(wall_config.wall_dir)
print("")

function random_wallpaper()
   return awful.wallpaper({
      widget = {
         vertical_fit_policy = "fit",
         image = gears.filesystem.get_random_file_from_dir(
            wall_config.wall_dir,
            wall_config.valid_picture_formats,
            true
         ),
         resize = true,
         widget = wibox.widget.imagebox,
      },
   })
end

local global_wallpaper = random_wallpaper()
screen.connect_signal("request::wallpaper", function()
   -- screen is the global screen module. It is also a list of all screens.
   global_wallpaper.screens = screen
end)

gears.timer({

   timeout = 1800,
   autostart = true,
   callback = function()
      for s in screen do
         global_wallpaper = random_wallpaper()

         s:emit_signal("request::wallpaper")
      end
   end,
})
