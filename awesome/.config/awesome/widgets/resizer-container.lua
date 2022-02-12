local wibox = require('wibox')
local beautiful = require("beautiful")

function build(widget)
  local container =
    wibox.widget {
    widget,
    widget = wibox.container.background
  }
  --local old_cursor, old_wibox

  container:connect_signal(
    'mouse::enter',
    function()
      container.bg = beautiful.resizer_focus
      -- Hm, no idea how to get the wibox from this signal's arguments...
      --local w = _G.mouse.current_wibox
      --if w then
        --old_cursor, old_wibox = w.cursor, w
        --w.cursor = 'cross'
      --end
    end
  )

-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"
  container:connect_signal(
    'mouse::leave',
    function()
      container.bg = beautiful.titlebar_bg_normal
      --if old_wibox then
       -- old_wibox.cursor = old_cursor
        --old_wibox = nil
      --end
    end
  )

  container:connect_signal(
    'button::press',
    function()
      --container.bg = '#ffffff00'
    end
  )

  container:connect_signal(
    'button::release',
    function()
   --   container.bg = '#ffffff11'
    end
  )

  return container
end

return build
