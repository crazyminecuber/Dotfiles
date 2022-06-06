local awful = require('awful')
local wibox = require('wibox')
local gears = require('gears')
local beautiful = require('beautiful')
local dpi = beautiful.xresources.apply_dpi
local clickable_container = require('widgets.glorious.clickable-container')
local icons = require('icons.glorious')

return function()

	return wibox.widget {
		layout = wibox.layout.flex.horizontal,
		spacing = dpi(7),
		require('components.pastel.central-panel.settings.quick-settings'),
		require('components.pastel.central-panel.settings.hardware-monitor')
	}
end

