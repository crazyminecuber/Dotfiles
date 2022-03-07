--      ██████╗  █████╗ ████████╗████████╗███████╗██████╗ ██╗   ██╗
--      ██╔══██╗██╔══██╗╚══██╔══╝╚══██╔══╝██╔════╝██╔══██╗╚██╗ ██╔╝
--      ██████╔╝███████║   ██║      ██║   █████╗  ██████╔╝ ╚████╔╝
--      ██╔══██╗██╔══██║   ██║      ██║   ██╔══╝  ██╔══██╗  ╚██╔╝
--      ██████╔╝██║  ██║   ██║      ██║   ███████╗██║  ██║   ██║
--      ╚═════╝ ╚═╝  ╚═╝   ╚═╝      ╚═╝   ╚══════╝╚═╝  ╚═╝   ╚═╝

-------------------------------------------------
-- Battery Widget for Awesome Window Manager
-- Shows the battery status using the ACPI tool
-- More details could be found here:
-- https://github.com/streetturtle/awesome-wm-widgets/tree/master/battery-widget

-- @author Pavel Makhov
-- @copyright 2017 Pavel Makhov
-------------------------------------------------


-- ===================================================================
-- Initialization
-- ===================================================================


local awful = require("awful")
local watch = require("awful.widget.watch")
local wibox = require("wibox")
local clickable_container = require("widgets.pastel.clickable-container")
local gears = require("gears")
local dpi = require("beautiful").xresources.apply_dpi
local naughty = require("naughty")

local PATH_TO_ICONS = os.getenv("HOME") .. "/.config/awesome/icons/battery/"
local PATH_TO_SOUNDS = os.getenv("HOME") .. "/.config/awesome/sounds/"


-- ===================================================================
-- Widget Creation
-- ===================================================================


local widget = wibox.widget {
   {
      id = "icon",
      widget = wibox.widget.imagebox,
      resize = true
   },
   layout = wibox.layout.fixed.horizontal
}

local widget_button = clickable_container(wibox.container.margin(widget, dpi(7), dpi(7), dpi(7), dpi(7)))
widget_button:buttons(
   gears.table.join(
      awful.button({}, 1, nil,
         function()
            awful.spawn(apps.power_manager)
         end
      )
   )
)
-- Alternative to naughty.notify - tooltip. You can compare both and choose the preferred one
local battery_popup = awful.tooltip({
   objects = {widget_button},
   mode = "outside",
   align = "left",
   referred_positions = {"right", "left", "top", "bottom"}
})

local function show_battery_warning(charge)
   naughty.notify {
      icon = PATH_TO_ICONS .. "battery-alert-red.svg",
      icon_size = dpi(48),
      text = "Huston, we have a problem",
      title = "Battery is dying (" .. tostring(charge) .. " %)",
      timeout = 5,
      hover_timeout = 0.5,
      position = "top_right",
      bg = "#d32f2f",
      fg = "#EEE9EF",
      width = 248,
      urgency = 'critical',
   }
   awesome.spawn("paplay --volume=3000 " .. PATH_TO_SOUNDS .. 'low_bat.ogg')
end

--local last_battery_check = os.time()
local last_battery_check = 0

watch("acpi -i", 1,
--watch('echo "Battery 0: Charging, 50%, charging at zero rate - will never fully charge.\nBattery 0: design capacity 3037 mAh, last full capacity 2218 mAh = 73%"', 1,
   function(_, stdout)
       --print(stdout)
       --print(last_battery_check)
       --print(os.time())
      local battery_info = {}
      local capacities = {}
      for s in stdout:gmatch("[^\r\n]+") do
         local status, charge_str, time = string.match(s, ".+: ([%a ]+), (%d?%d?%d)%%,?.*")
         if status ~= nil then
            table.insert(battery_info, {status = status, charge = tonumber(charge_str)})
         else
            local cap_str = string.match(s, ".+:.+last full capacity (%d+)")
            table.insert(capacities, tonumber(cap_str))
         end
      end

      local capacity = 0
      for _, cap in ipairs(capacities) do
         capacity = capacity + cap
      end

      local charge = 0
      local status
      for i, batt in ipairs(battery_info) do
         if batt.charge >= charge then
            status = batt.status -- use most charged battery status
            -- this is arbitrary, and maybe another metric should be used
         end

         charge = charge + batt.charge * capacities[i]
      end
      charge = charge / capacity

         if status ~= "Charging" and os.difftime(os.time(), last_battery_check) > 60 then
            if (charge >= 0 and charge < 15) then
            -- if 5 minutes have elapsed since the last warning
            last_battery_check = os.time()

            show_battery_warning(charge)
         end
      end

      local battery_icon_name = "battery"

      if status == "Charging" or status == "Full" or status == "Not charging" then
          --print(status)
         battery_icon_name = battery_icon_name .. "-charging"
      end

      local rounded_charge = math.floor(charge / 10) * 10
      if (rounded_charge == 0) then
         battery_icon_name = battery_icon_name .. "-outline"
      elseif (rounded_charge ~= 100) then
         battery_icon_name = battery_icon_name .. "-" .. rounded_charge
      end
      if (charge >= 0 and charge < 15 and status ~="Charging") then
            battery_icon_name = "battery-alert-red"
      end

      widget.icon:set_image(PATH_TO_ICONS .. battery_icon_name .. ".svg")
      -- Update popup text
      battery_popup.text = string.gsub(stdout, "\n$", "")
      collectgarbage("collect")
   end,
   widget
)

return widget_button
