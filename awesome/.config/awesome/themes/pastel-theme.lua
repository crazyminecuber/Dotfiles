--      ████████╗██╗  ██╗███████╗███╗   ███╗███████╗
--      ╚══██╔══╝██║  ██║██╔════╝████╗ ████║██╔════╝
--         ██║   ███████║█████╗  ██╔████╔██║█████╗
--         ██║   ██╔══██║██╔══╝  ██║╚██╔╝██║██╔══╝
--         ██║   ██║  ██║███████╗██║ ╚═╝ ██║███████╗
--         ╚═╝   ╚═╝  ╚═╝╚══════╝╚═╝     ╚═╝╚══════╝

-- ===================================================================
-- Initialization
-- ===================================================================


local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi

local gears = require("gears")

-- define module table
local theme = {}


-- ===================================================================
-- Theme Variables
-- ===================================================================


theme.name = "pastel"

-- Font
theme.font = "JetbrainsMono Nerd 14" --TODO Fix later
--theme.font = "gurk 10"
theme.title_font = "JetbrainsMono Nerd 10"

theme.transparent = "#00000011"
theme.background = "#1f2430ff"
-- Background
--theme.bg_normal = "#1f2430ee"
--theme.bg_normal = "#2e3440"
theme.bg_normal = "#3e4450"

theme.bg_dark = "#000000"
--theme.bg_focus = "#151821"
--theme.bg_focus = "#888888aa"
--theme.bg_focus = "#8022aaff"
theme.bg_focus = "#248811ff"
theme.bg_urgent = "#ed8274"
theme.bg_minimize = "#444444"

-- Foreground
theme.fg_normal = "#ebdbb2"
theme.fg_focus= "#ebdbb2"
theme.fg_urgent = "#ebdbb2"
theme.fg_minimize = "#ebdbb2"
--theme.fg_focus = "#e4e4e4"
--theme.fg_urgent = "#ffffff"
--theme.fg_minimize = "#ffffff"

-- Window Gap Distance
theme.useless_gap = dpi(1)

-- Show Gaps if Only One Client is Visible
theme.gap_single_client = true

-- Window Borders
theme.border_width = dpi(0)
theme.border_normal = theme.bg_normal
theme.border_focus = "#ff8a65"
theme.border_marked = theme.fg_urgent

-- Taglist
theme.taglist_bg_empty = "#00000000"
--theme.taglist_bg_occupied = "#8022aaff"
--theme.taglist_bg_occupied = "#888888aa"
theme.taglist_bg_occupied = "#cc6655aa"
theme.taglist_bg_urgent = "#ff1e00ff"
theme.taglist_bg_focus = theme.bg_focus

-- Tasklist
theme.tasklist_font = theme.font

theme.tasklist_bg_normal = theme.bg_normal
theme.tasklist_bg_focus = theme.bg_focus
theme.tasklist_bg_urgent = theme.bg_urgent

theme.tasklist_fg_focus = theme.fg_focus
theme.tasklist_fg_urgent = theme.fg_urgent
theme.tasklist_fg_normal = theme.fg_normal

-- Panel Sizing
theme.left_panel_width = dpi(55)
theme.top_panel_height = dpi(30)

-- Notification Sizing
theme.notification_max_width = dpi(350)

-- System Tray
theme.bg_systray = theme.bg_normal
theme.systray_icon_spacing = dpi(5)

-- Titlebars
theme.titlebars_enabled = true


-- ===================================================================
-- Icons
-- ===================================================================


-- Define layout icons
theme.layout_tile = "~/.config/awesome/icons/layouts/tiled.png"
theme.layout_floating = "~/.config/awesome/icons/layouts/floating.png"
theme.layout_max = "~/.config/awesome/icons/layouts/maximized.png"

theme.icon_theme = "Tela-dark"


--Oskar

theme.resizer_focus = "#cc0000"
theme.resizer_size = dpi(8)

tip = "~/.config/awesome/theme/icons/titlebar/blocks/"

-- Titlebar
theme.titlebar_size = dpi(80)
--theme.titelbar_bg_focus = "#333344ff"
--theme.titelbar_bg_normal = "#333344ff"
theme.titelbar_bg_focus = "#2e3440"
theme.titelbar_bg_normal = "#2e3440"
theme.titelbar_fg_normal = "#ebdbb2"


--theme.titlebar_bg_focus = gtk_variable().bg_color:sub(1,7) .. '66'
--theme.titlebar_bg_normal = gtk_variable().base_color:sub(1,7) .. '66'
--theme.titlebar_fg_focus = gtk_variable().fg_color
--theme.titlebar_fg_normal = gtk_variable().fg_color
-- Close Butto
theme.titlebar_close_button_normal = tip .. 'close_normal.svg'
theme.titlebar_close_button_focus  = tip .. 'close_focus.svg'

-- Minimize Button
theme.titlebar_minimize_button_normal = tip .. 'minimize_normal.svg'
theme.titlebar_minimize_button_focus  = tip .. 'minimize_focus.svg'

-- Sticky ButtonR
theme.titlebar_sticky_button_normal_inactive = tip .. 'sticky_normal_inactive.svg'
theme.titlebar_sticky_button_focus_inactive  = tip .. 'sticky_focus_inactive.svg'
theme.titlebar_sticky_button_normal_active = tip .. 'sticky_normal_active.svg'
theme.titlebar_sticky_button_focus_active  = tip .. 'sticky_focus_active.svg'

-- Floating Button
theme.titlebar_floating_button_normal_inactive = tip .. 'floating_normal_inactive.svg'
theme.titlebar_floating_button_focus_inactive  = tip .. 'floating_focus_inactive.svg'
theme.titlebar_floating_button_normal_active = tip .. 'floating_normal_active.svg'
theme.titlebar_floating_button_focus_active  = tip .. 'floating_focus_active.svg'

-- Maximized Button
theme.titlebar_maximized_button_normal_inactive = tip .. 'maximized_normal_inactive.svg'
theme.titlebar_maximized_button_focus_inactive  = tip .. 'maximized_focus_inactive.svg'
theme.titlebar_maximized_button_normal_active = tip .. 'maximized_normal_active.svg'
theme.titlebar_maximized_button_focus_active  = tip .. 'maximized_focus_active.svg'

-- Hovered Close Button
theme.titlebar_close_button_normal_hover = tip .. 'close_normal_hover.svg'
theme.titlebar_close_button_focus_hover  = tip .. 'close_focus_hover.svg'

-- Hovered Minimize Buttin
theme.titlebar_minimize_button_normal_hover = tip .. 'minimize_normal_hover.svg'
theme.titlebar_minimize_button_focus_hover  = tip .. 'minimize_focus_hover.svg'


-- Hovered Sticky Button
theme.titlebar_sticky_button_normal_inactive_hover = tip .. 'sticky_normal_inactive_hover.svg'
theme.titlebar_sticky_button_focus_inactive_hover  = tip .. 'sticky_focus_inactive_hover.svg'
theme.titlebar_sticky_button_normal_active_hover = tip .. 'sticky_normal_active_hover.svg'
theme.titlebar_sticky_button_focus_active_hover  = tip .. 'sticky_focus_active_hover.svg'

-- Hovered Floating Button
theme.titlebar_floating_button_normal_inactive_hover = tip .. 'floating_normal_inactive_hover.svg'
theme.titlebar_floating_button_focus_inactive_hover  = tip .. 'floating_focus_inactive_hover.svg'
theme.titlebar_floating_button_normal_active_hover = tip .. 'floating_normal_active_hover.svg'
theme.titlebar_floating_button_focus_active_hover  = tip .. 'floating_focus_active_hover.svg'

-- Hovered Maximized Button
theme.titlebar_maximized_button_normal_inactive_hover = tip .. 'maximized_normal_inactive_hover.svg'
theme.titlebar_maximized_button_focus_inactive_hover  = tip .. 'maximized_focus_inactive_hover.svg'
theme.titlebar_maximized_button_normal_active_hover = tip .. 'maximized_normal_active_hover.svg'
theme.titlebar_maximized_button_focus_active_hover  = tip .. 'maximized_focus_active_hover.svg'

theme.client_shape_rounded = function(cr, width, height)
    gears.shape.rounded_rect(cr, width, height, theme.resizer_size)
--gears.shape.partially_rounded_rect (cr, width, height, true, true, false, false, 20)
--gears.shape.partially_rounded_rect (cr, width, height, false, false, true, true, dpi(20))
end

-- Notification
theme.notification_position = 'top_left'
theme.notification_bg = theme.transparent
theme.notification_margin = dpi(5)
theme.notification_border_width = dpi(0)
theme.notification_border_color = theme.transparent
theme.notification_spacing = dpi(5)
theme.notification_icon_resize_strategy = 'center'
theme.notification_icon_size = dpi(32)

-- Hotkeys popup
theme.hotkeys_bg = "#1f2430" 	--Hotkeys widget background color.
theme.hotkeys_fg = theme.fg_normal	--Hotkeys widget foreground color.
theme.hotkeys_border_width = dpi(0)	--Hotkeys widget border width.
theme.hotkeys_border_color = "#00ff00"	--Hotkeys widget border color.
theme.hotkeys_shape = function(cr, width, height) gears.shape.rounded_rect(cr, width, height, theme.resizer_size*2) end
--Hotkeys widget shape.
theme.hotkeys_modifiers_fg = "#7f9cc9"	--Foreground color used for hotkey modifiers (Ctrl, Alt, Super, etc).
theme.hotkeys_label_bg = "#0000ff"	--Background color used for miscellaneous labels of hotkeys widget.
theme.hotkeys_label_fg = theme.fg_normal	--Foreground color used for hotkey groups and other labels.
theme.hotkeys_font = "JetbrainsMono Ned 12"	--Main hotkeys widget font.
theme.hotkeys_description_font = "JetbrainsMono Nerd 15" 	--Font used for hotkeys descriptions.
theme.hotkeys_group_margin = dpi(40)	--Margin between hotkeys groups.


-- return theme
return theme

--wibox.layout.margin has been renamed to wibox.container.margin.
