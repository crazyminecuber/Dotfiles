--
--       █████╗ ██╗    ██╗███████╗███████╗ ██████╗ ███╗   ███╗███████╗
--      ██╔══██╗██║    ██║██╔════╝██╔════╝██╔═══██╗████╗ ████║██╔════╝
--      ███████║██║ █╗ ██║█████╗  ███████╗██║   ██║██╔████╔██║█████╗
--      ██╔══██║██║███╗██║██╔══╝  ╚════██║██║   ██║██║╚██╔╝██║██╔══╝
--      ██║  ██║╚███╔███╔╝███████╗███████║╚██████╔╝██║ ╚═╝ ██║███████╗
--      ╚═╝  ╚═╝ ╚══╝╚══╝ ╚══════╝╚══════╝ ╚═════╝ ╚═╝     ╚═╝╚══════╝


--  Stuff to block modeline

--awesome_mode: api-level=4:screen=on
-- awesome_mode: api-level=6:screen=on
--TODO Ljudknappar funkar inte när inget ljud spelas. Annars funkar det bra. Är
--för att amixer inte har någon ljudinfo om master då. Försökte lösa med pactl
--istälet för amixer för att få volym, men då såg jag att de rapporterar olika
--volym... Kolla på senare när pipewire är mer mainstream.
--TODO Keepass startar inte som det ska.
--TODO Hur switcha till client på annan skärm?
--TODO Avsluta max när man fokuserar på ett annat fönster
--TODO Fixa med rules så att saker som ska vara floating är floating
--DONE Steam spawnser i separat workspace.
--TODO Borders Leaking through in full screen
--TODO Spawna firefox på rimligt ställe
--DONE Ändra så att ny fönster spawner på master.
--TODO Lär kortkommandon hur man byter ordning på fönster. Flytta till master
--DONE Fokusera primära fönstret när jag byter tag (kanske bara om det är en enskilld tag)
--DONE hur flytta fönster mellan taggar på smidigt sätt? Windosklicka på den
--taggen så flyttas fönster i fokus till den? Drag och drop?
--TODO fltta till annan skärm
--DONE Flytt program till annat workspace med musen
--DONE Flytta matlabgrafer till andra skrämen och tila
--DONE matlab autocompletion fönstret är buggigt
--DONE När jag går till en tag som har fönster men inte maximerade så blir det felmeddelande
--DONE Fönster i float läge spawner ibland off screen
--TODO Ibland blir master/stacken jättesmala utan att jag vet att jag har pillat på dem
--TODO Blir fel nör fönster swawnar h är maximerat och relaterat
--
--
--Notes
--Taggar: Varje skärm har taggar. Vill kunna byta applikationer mellan taggar.
--Kan gör genom att ha aktiv och 2-clicka på tagicon.
--Terminalcommandot awesome-clent är awesome! (på riktigt alltså!)
--

-- Standard awesome libraries
local gears = require("gears")
local awful = require("awful")
local naughty = require("naughty")

local beautiful = require("beautiful")
local dpi = beautiful.xresources.apply_dpi

local wibox = require("wibox")


-- ===================================================================
-- User Configuration
-- ===================================================================


local themes = {
   "pastel", -- 1
   "mirage"  -- 2
}

-- change this number to use the corresponding theme
local theme = themes[1]
local theme_config_dir = gears.filesystem.get_configuration_dir() .. "configuration/" .. theme .. "/"

-- define default apps (global variable so other components can access it)
apps = {
   network_manager = "nm-connection-editor", -- recommended: nm-connection-editor
   power_manager = "xfce4-power-manager-settings", -- recommended: xfce4-power-manager
   terminal = "alacritty",
   --launcher = "rofi -normal-window -modi drun -show drun -theme " .. theme_config_dir .. "rofi.rasi",
   launcher = "rofi -show drun -sort -i -theme " .. theme_config_dir .. "rofi2.rasi",
   lock = "i3lock -c 222233",
   screenshot = "flameshot gui",
   filebrowser = "nautilus",
   clipboard = "clipmenu -sort -i -p 'Clipboard'", -- Rofi thingy
   --ocr = "maim -s | tesseract -c debug_file=/dev/null stdin stdout | xclip -sel clip && notify-send \"<span color='#9624c7' font='32px'><i><b>Tesseract</b></i></span>\" \"OCR copied to clipboard\" --app-name='Gurk Incorporate'"
   ocr = "sh " .. "/home/oskar/.config/awesome/utilities/ocr",
   beats = "sh " .. "/home/oskar/.config/awesome/utilities/rofi-beats",

}

-- define wireless and ethernet interface names for the network widget
-- use `ip link` command to determine these
network_interfaces = {
   wlan = 'wlan0',
   lan = 'eno1'
}

-- List of apps to run on start-up
local run_on_start_up = {
   --"picom --experimental-backends --config " .. theme_config_dir .. "picom.conf",
   --"redshift",
   --"unclutter"
}
local function set_shape(c)
	if not c.requests_no_titlebar or c.class == "firefox" then
	    c.shape = beautiful.client_shape_rounded
	end
end

-- ===================================================================
-- Initialization
-- ===================================================================

-- Import notification appearance
--require("components.notifications")
require("components.notifications")

-- Run all the apps listed in run_on_start_up
for _, app in ipairs(run_on_start_up) do
   local findme = app
   local firstspace = app:find(" ")
   if firstspace then
      findme = app:sub(0, firstspace - 1)
   end
   -- pipe commands to bash to allow command to be shell agnostic
   awful.spawn.with_shell(string.format("echo 'pgrep -u $USER -x %s > /dev/null || (%s)' | bash -", findme, app), false)
end

-- Define layouts
awful.layout.append_default_layouts({
   awful.layout.suit.tile,
   awful.layout.suit.floating,
   --awful.layout.suit.fair,
   --awful.layout.suit.max,
})
-- Unmax when unfocus

--client.connect_signal("unfocus", function(c) c.maximized = false end)

-- Import theme
local beautiful = require("beautiful")
beautiful.init(gears.filesystem.get_configuration_dir() .. "themes/" .. theme .. "-theme.lua")

-- Initialize theme
local selected_theme = require(theme)
selected_theme.initialize()

-- Import Keybinds
local keys = require("keys")
root.keys(keys.globalkeys)
root.buttons(keys.desktopbuttons)

-- Import rules
local create_rules = require("rules").create
awful.rules.rules = create_rules(keys.clientkeys, keys.clientbuttons)


-- remove gaps if layout is set to max
tag.connect_signal('property::layout', function(t)
   local current_layout = awful.tag.getproperty(t, 'layout')
   if (current_layout == awful.layout.suit.max) then
      t.gap = 0
   else
      t.gap = beautiful.useless_gap
   end
end)

-- Signal function to execute when a new client appears.
client.connect_signal("manage", function (c)
   -- Set the window as a slave (put it at the end of others instead of setting it as master)
   --if not awesome.startup then
    --  awful.client.setslave(c)
   --end

   if awesome.startup and not c.size_hints.user_position and not c.size_hints.program_position then
      -- Prevent clients from being unreachable after screen count changes.
      awful.placement.no_offscreen(c)
   end
end)


-- ===================================================================
-- Client Focusing
-- ===================================================================


-- Autofocus a new client when previously focused one is closed
require("awful.autofocus")

-- Focus clients under mouse
--client.connect_signal("mouse::enter", function(c)
   --c:emit_signal("request::activate", "mouse_enter", {raise = false})
--end)


-- ===================================================================
-- Screen Change Functions (ie multi monitor)
-- ===================================================================


-- Reload config when screen geometry changes
screen.connect_signal("property::geometry", awesome.restart)
screen.connect_signal("added", awesome.restart)
screen.connect_signal("removed", awesome.restart)
screen.connect_signal("primary_changed", awesome.restart)


-- ===================================================================
-- Garbage collection (allows for lower memory consumption)
-- ===================================================================


collectgarbage("setpause", 110)
collectgarbage("setstepmul", 1000)


local resizer_container = require('widgets.resizer-container')

function resizer_widget()
return	wibox.widget{
	widget = resizer_container,
}
end


-- Add a titlebar if titlebars_enabled is set to true in the rules.
client.connect_signal("request::titlebars", function(c)

local main_titlebar_vert = awful.titlebar(c, {
	position = "right",
    size    = 25,
	bg_focus = beautiful.titelbar_bg_focus,
	bg_normal = beautiful.titelbar_bg_normal,
})

local main_titlebar_horiz = awful.titlebar(c, {
	position = "top",
    size    = 30,
	bg_focus = beautiful.titelbar_bg_focus,
	bg_normal = beautiful.titelbar_bg_normal,
})
--[[
local double_click_event_handler = function(double_click_event)
	if double_click_timer then
		double_click_timer:stop()
		double_click_timer = nil
		double_click_event()
		return
	end
	double_click_timer = gears.timer.start_new(
		0.20,
		function()
			double_click_timer = nil
			return false
		end
	)
end
--]]
  -- Double click titlebar
    function double_click_event_handler(double_click_event)
        if double_click_timer then
            double_click_timer:stop()
            double_click_timer = nil
            return true
        end

        double_click_timer = gears.timer.start_new(0.20, function()
            double_click_timer = nil
            return false
        end)
    end

-- buttons for the titlebar
local buttons = gears.table.join(
            awful.button({ }, 1, function()
                c:emit_signal("request::activate", "titlebar", {raise = true})
            -- WILL EXECUTE THIS ON DOUBLE CLICK
                if double_click_event_handler() then
                    c.maximized = not c.maximized
                    c:raise()
                else
                    awful.mouse.client.move(c)
                end
            end),
		--awful.button(
			--{},
			--1,
			--function()
				--double_click_event_handler(function()
					--if c.floating then
						--c.floating = false
						--return
					--end
					--c.maximized = not c.maximized
					--c:raise()
					--return
				--end)
				--c:activate {context = 'titlebar', action = 'mouse_move'}
			--end
		--),
    --awful.button({ }, 1, function()
        --client.focus = c
        --c:raise()
        --awful.mouse.client.move(c)
    --end),
    awful.button({ }, 3, function()
        client.focus = c
        c:raise()
        awful.mouse.client.resize(c)
    end)
)


-- left--bot right--top top--left bot right

main_titlebar_horiz: setup {
	{
		{
			awful.titlebar.widget.closebutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.minimizebutton(c),
			spacing = dpi(7),
			layout  = wibox.layout.fixed.horizontal,
		},
		bottom   = dpi(4),
        top  = dpi(4),
        right    = 0,
        left = dpi(4),
        layout = wibox.container.margin
	},
	{
		nil,
		{
			awful.titlebar.widget.iconwidget(c),
			{ -- Title
            widget = awful.titlebar.widget.titlewidget(c),
			},
			layout  = wibox.layout.align.horizontal,

		},
		buttons= buttons,
		expand = "outside",
		layout  = wibox.layout.align.horizontal,--ush! Men det funkar!
	},
 	{
		{
			awful.titlebar.widget.floatingbutton (c),
			awful.titlebar.widget.stickybutton   (c),
			spacing = dpi(10),
			layout  = wibox.layout.fixed.horizontal,
		},
		bottom   = dpi(4),
        top  = dpi(4),
        right    = dpi(4),
        left = 0,
        layout = wibox.container.margin
	},
	expand="inside",
	layout = wibox.layout.align.horizontal
}

main_titlebar_vert: setup {
	{
		{
			awful.titlebar.widget.closebutton(c),
			awful.titlebar.widget.maximizedbutton(c),
			awful.titlebar.widget.minimizebutton(c),
			spacing = dpi(7),
			layout  = wibox.layout.fixed.vertical,
		},
		left   = dpi(3),
        right  = dpi(3),
        top    = dpi(2),
        bottom = 0,
		buttons= buttons,
        layout = wibox.container.margin
	},
	{
		{
			layout  = wibox.layout.fixed.vertical,
		},
		buttons= buttons,
		left   = dpi(4),
        right  = dpi(4),
        top    = dpi(20),
        bottom = 0,
        layout = wibox.container.margin
	},
 	{
		{
			awful.titlebar.widget.iconwidget(c),
			awful.titlebar.widget.stickybutton   (c),
			awful.titlebar.widget.floatingbutton (c),
			spacing = dpi(10),
			layout  = wibox.layout.fixed.vertical,
		},
		buttons= buttons,
		left   = dpi(3),
        right  = dpi(3),
        top    = 0,
        bottom = dpi(10),
        layout = wibox.container.margin
	},
	layout = wibox.layout.align.vertical
}

	-- Make three extra titlebars that i can click to resize
	-- Buttons for the resizer
    local buttons2 = gears.table.join(
        awful.button({ }, 1, function()
            c:emit_signal("request::activate", "titlebar", {raise = true})
            awful.mouse.client.resize(c)
        end)
    )
	-- The actual resizers.
	awful.titlebar(c, {position="bottom",
		bg_focus = beautiful.titelbar_bg_focus,
		bg_normal = beautiful.titelbar_bg_normal,
		size=beautiful.resizer_size}):setup
	{
		resizer_widget(),
		buttons = buttons2,
		layout = wibox.layout.stack,
	}
	awful.titlebar(c, {position="right",
		bg_focus = beautiful.titelbar_bg_focus,
		bg_normal = beautiful.titelbar_bg_normal,
		size=beautiful.resizer_size}):setup
	{
		resizer_widget(),
		buttons = buttons2,
		layout = wibox.layout.stack,
	}
	awful.titlebar(c, {position="left",
		bg_focus = beautiful.titelbar_bg_focus,
		bg_normal = beautiful.titelbar_bg_normal,
		size=beautiful.resizer_size}):setup
	{
		resizer_widget(),
		buttons = buttons2,
		layout = wibox.layout.stack,
	}
end)

-- FIX
tag.connect_signal(
	--'property::selected',
	'property::selected',
	function(t)
		if t == awful.screen.focused().selected_tag and #(t:clients()) > 0 then
			if awful.client.getmaster() then
				awful.client.getmaster():activate()
			else
				t:clients()[1].minimized = false
			end
		end
	end
)

client.connect_signal("manage", function (c)
	set_shape(c)
end)

--much nicer than before
client.connect_signal("request::geometry", function(c, context, ...)
    if context == "fullscreen" then
		if not c.fullscreen then
			set_shape(c)
		else
			c.shape = beautiful.client_shape_rect
		end
    end
end
)

awesome.spawn("paplay /usr/share/sounds/freedesktop/stereo/service-login.oga")

awful.spawn.with_shell("~/.config/awesome/autostart.sh")

awful.spawn.with_shell(
   'if (xrdb -query | grep -q "^awesome\\.started:\\s*true$"); then exit; fi;' ..
   'xrdb -merge <<< "awesome.started:true";' ..
   -- list each of your autostart commands, followed by ; inside single quotes, followed by ..
   'dex --environment Awesome --autostart --search-paths "$XDG_CONFIG_DIRS/autostart:$XDG_CONFIG_HOME/autostart"' -- https://github.com/jceb/dex
   )


