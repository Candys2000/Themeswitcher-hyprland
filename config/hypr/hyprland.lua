------------------
---- MONITORS ----
------------------

-- See https://wiki.hypr.land/Configuring/Basics/Monitors/
hl.monitor({
    output   = "",
    mode     = "preferred",
    position = "auto",
    scale    = "1",
})


---------------------
---- MY PROGRAMS ----
---------------------

-- Set programs that you use
local terminal    = "kitty",
local fileManager = "dolphin",
local menu        = "hyprlauncher",


-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

-- Autostart necessary processes (like notifications daemons, status bars, etc.)
-- Or execute your favorite apps at launch like this:
--
 hl.on("hyprland.start", function () 
   hl.exec_cmd("kitty"),
   hl.exec_cmd("nm-applet"),
   hl.exec_cmd("firefox"),
   hl.exec_cmd("wpg -n -s ~/Bilder/pictures/ai_hoshino.jpg && swaybg -i ~/Bilder/pictures/ai_hoshino.jpg -m fill"),
   hl.exec_cmd("komikku"),
   hl.exec_cmd("wpg -a ~/.config/wpg/templates/colors-hyprland.base"),
 end)


-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

hl.env("XCURSOR_SIZE", "24")
hl.env("HYPRCURSOR_SIZE", "24")


-----------------------
----- PERMISSIONS -----
-----------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Permissions/
-- Please note permission changes here require a Hyprland restart and are not applied on-the-fly
-- for security reasons

-- hl.config({
--   ecosystem = {
--     enforce_permissions = true,
--   },
-- })

-- hl.permission("/usr/(bin|local/bin)/grim", "screencopy", "allow")
-- hl.permission("/usr/(lib|libexec|lib64)/xdg-desktop-portal-hyprland", "screencopy", "allow")
-- hl.permission("/usr/(bin|local/bin)/hyprpm", "plugin", "allow")


-----------------------
---- LOOK AND FEEL ----
-----------------------

-- Refer to https://wiki.hypr.land/Configuring/Basics/Variables/
hl.config({
    general = {
        gaps_in  = 5,
        gaps_out = 20,

        border_size = 2,
        
         local function load_wal_colors()
            local colors = {},
            local file = io.open(os.getenv("HOME") .. "/.cache/wal/colors", "r"),
            local index = 0,
            for line in file:lines() do
            local hex = line:gsub("#", ""),
            colors[index] = "rgba(" .. hex .. "ee)",
            index = index + 1,
            end,
         file:close()
         end,
    return colors,
    end,

    local wal = load_wal_colors()
    local color1 = wal[1] or "rgba(33ccffee)",
    local color15 = wal[15] or "rgba(595959aa)",
    
    col = {
        active_border   = { colors = { color1, color1 }, angle = 45 },
        inactive_border = color15,
     },

        
--        col = {
--            active_border   = { colors = {"rgba(33ccffee)", "rgba(00ff99ee)"}, angle = 45 },
--            inactive_border = "rgba(595959aa)",
--        },

        -- Set to true to enable resizing windows by clicking and dragging on borders and gaps
        resize_on_border = true,

        -- Please see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Tearing/ before you turn this on
        allow_tearing = false,

        layout = "dwindle",
        
     snap = {
		enabled = true,
		monitor_gap = 5,
		border_overlap = true,
	    }
	
    },
    
    dwindle = {
        force_split = 1,
	    preserve_split = true,
	    },

    decoration = {
        rounding       = 25,
        rounding_power = 3,

        -- Change transparency of focused and unfocused windows
        active_opacity   = 1.0,
        inactive_opacity = 0.7,

--        shadow = {
--            enabled      = true,
--            range        = 10,
--            render_power = 3,
--            color        = rgb (aa99ff),
--        },

        blur = {
            enabled   = true,
            size      = 8,
            passes    = 1,
            ignore_opacity = false,
	    new_optimizations = true,
	    noise = 0.5,
	    contrast = 0.8916,
	    brightness = 0.08172,
            vibrancy = 0.1696,
	    vibrancy_darkness = 0.1696,
	    popups = false,
        },
    },

    animations = {
        enabled = true,
        workspace_wraparound = true,
    },
})

-- Default curves and animations, see https://wiki.hypr.land/Configuring/Advanced-and-Cool/Animations/
hl.curve("easeInOutQuint", { type = "bezier", points = { {0.83, 1},    {0.17, 1}    } })
hl.curve("easeInQuint",    { type = "bezier", points = { {0.64, 0}, {0.78, 0}    } })
hl.curve("easeOutQuint",   { type = "bezier", points = { {0.22, 1},       {0.36, 1}       } })
--hl.curve("almostLinear",   { type = "bezier", points = { {0.5, 0.5},   {0.75, 1}    } })
--hl.curve("quick",          { type = "bezier", points = { {0.15, 0},    {0.1, 1}     } })

-- Default springs
hl.curve("easy",           { type = "spring", mass = 1, stiffness = 71.2633, dampening = 15.8273644 })

hl.animation({ leaf = "global",        enabled = true,  speed = 10,   bezier = "default" })
hl.animation({ leaf = "border",        enabled = true,  speed = 5.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "windows",       enabled = true,  speed = 4.79, spring = "easy" })
hl.animation({ leaf = "windowsIn",     enabled = true,  speed = 4.1,  spring = "easeInQuint"  })
hl.animation({ leaf = "windowsOut",    enabled = true,  speed = 1.49, bezier = "easeOutQuint",   style = "popin 87%" })
hl.animation({ leaf = "fadeIn",        enabled = true,  speed = 1.73, bezier = "easeInOutQuint" })
hl.animation({ leaf = "fadeOut",       enabled = true,  speed = 1.46, bezier = "easeInOutQuint" })
hl.animation({ leaf = "fade",          enabled = true,  speed = 3.03, bezier = "easeInOutQuint" })
hl.animation({ leaf = "layers",        enabled = true,  speed = 3.81, bezier = "easeOutQuint" })
hl.animation({ leaf = "layersIn",      enabled = true,  speed = 4,    bezier = "easeOutQuint", style = "slide" })
hl.animation({ leaf = "layersOut",     enabled = true,  speed = 1.5,  bezier = "easeInQuint",  style = "slide" })
hl.animation({ leaf = "fadeLayersIn",  enabled = true,  speed = 1.79, bezier = "easeInQuint" })
hl.animation({ leaf = "fadeLayersOut", enabled = true,  speed = 1.39, bezier = "easeOutQuint" })
hl.animation({ leaf = "workspaces",    enabled = true,  speed = 1.94, bezier = "easeInOutQuint", style = "slide" })
hl.animation({ leaf = "workspacesIn",  enabled = true,  speed = 1.21, bezier = "easeInQuint", style = "slide"    })
hl.animation({ leaf = "workspacesOut", enabled = true,  speed = 1.94, bezier = "easeOutQuint", style = "slide"   })
hl.animation({ leaf = "zoomFactor",    enabled = true,  speed = 7,    bezier = "easeInOutQuint" })

-- Ref https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/
-- "Smart gaps" / "No gaps when only"
-- uncomment all if you wish to use that.
-- hl.workspace_rule({ workspace = "w[tv1]", gaps_out = 0, gaps_in = 0 })
-- hl.workspace_rule({ workspace = "f[1]",   gaps_out = 0, gaps_in = 0 })
-- hl.window_rule({
--     name  = "no-gaps-wtv1",
--     match = { float = false, workspace = "w[tv1]" },
--     border_size = 0,
--     rounding    = 0,
-- })
 hl.window_rule({
     name  = "no-gaps-f1",
     match = { float = false, workspace = "f[1]" },
     border_size = 0,
     rounding    = 0,
 })

-- See https://wiki.hypr.land/Configuring/Layouts/Dwindle-Layout/ for more
--hl.config({
--    dwindle = {
--        preserve_split = true, -- You probably want this
--    },
--})

-- See https://wiki.hypr.land/Configuring/Layouts/Master-Layout/ for more
--hl.config({
--    master = {
--        new_status = "master",
--    },
--})

-- See https://wiki.hypr.land/Configuring/Layouts/Scrolling-Layout/ for more
hl.config({
    scrolling = {
        fullscreen_on_one_column = true,
    },
})

----------------
----  MISC  ----
----------------

hl.config({
    misc = {
        session_lock_xray = true,
        force_default_wallpaper = 0,    -- Set to 0 or 1 to disable the anime mascot wallpapers
        disable_hyprland_logo   = true, -- If true disables the random hyprland logo / anime girl background. :(
    },
})


---------------
---- INPUT ----
---------------

hl.config({
    input = {
        kb_layout  = "de",
        kb_variant = "",
        numlock_by_default = true,
        kb_model   = "",
        kb_options = "",
        kb_rules   = "",

        follow_mouse = 1,

        sensitivity = 0, -- -1.0 - 1.0, 0 means no modification.
        scroll_method = 2fg,    --Sets the scroll method to 2 Fingers

        touchpad = {
            natural_scroll = true,
        },
    },
})

hl.gesture({
    fingers = 3,
    direction = "horizontal",
    action = "workspace"
})

-- Example per-device config
-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Devices/ for more
hl.device({
    name        = "epic-mouse-v1",
    sensitivity = -0.5,
})


---------------------
---- KEYBINDINGS ----
---------------------

local mainMod = "SUPER" -- Sets "Windows" key as main modifier

-- Example binds, see https://wiki.hypr.land/Configuring/Basics/Binds/ for more
hl.bind(mainMod .. " + Q", hl.dsp.exec_cmd(terminal))
local closeWindowBind = hl.bind(mainMod .. " + C", hl.dsp.window.close())
-- closeWindowBind:set_enabled(false)
hl.bind(mainMod .. " + M", hl.dsp.exec_cmd("command -v hyprshutdown >/dev/null 2>&1 && hyprshutdown || hyprctl dispatch 'hl.dsp.exit()'"))
hl.bind(mainMod .. " + E", hl.dsp.exec_cmd(fileManager))
hl.bind(mainMod .. " + V", hl.dsp.window.float({ action = "toggle" }))
hl.bind(mainMod .. " + R", hl.dsp.exec_cmd(menu))
hl.bind(mainMod .. " + P", hl.dsp.window.pseudo())
hl.bind(mainMod .. " + J", hl.dsp.layout("togglesplit"))    -- dwindle only

-- Move focus with mainMod + arrow keys
hl.bind(mainMod .. " + left",  hl.dsp.focus({ direction = "left" }))
hl.bind(mainMod .. " + right", hl.dsp.focus({ direction = "right" }))
hl.bind(mainMod .. " + up",    hl.dsp.focus({ direction = "up" }))
hl.bind(mainMod .. " + down",  hl.dsp.focus({ direction = "down" }))

--binding mainMod + b to waybar
hl.bind(mainMod .. " + b",  hl.dsp.exec_cmd("pkill -SIGUSR1 waybar #& waybar -c ~/.config/waybar/config.json -s ~/.config/waybar/style.css"))
hl.bind(mainMod .. " + b",  hl.dsp.exec_cmd("waybar && "))

-- Switch workspaces with mainMod + [0-9]
-- Move active window to a workspace with mainMod + SHIFT + [0-9]
for i = 1, 10 do
    local key = i % 10 -- 10 maps to key 0
    hl.bind(mainMod .. " + " .. key,             hl.dsp.focus({ workspace = i}), hl.dsp.exec_cmd("command pkill swaybg"))
    hl.bind(mainMod .. "+ 1",    hl.dsp.exec_cmd("wpg -s ~/Bilder/pictures/ai_hoshino.jpg && swaybg -i ~/Bilder/pictures/ai_hoshino.jpg -m fill"))
    hl.bind(mainMod .. "+ 2",    hl.dsp.exec_cmd("wpg -s ~/Bilder/pictures/Arch_chan.jpg && swaybg -i ~/Bilder/pictures/Arch_chan.jpg -m fill"))
    hl.bind(mainMod .. "+ 3",    hl.dsp.exec_cmd("wpg -s ~/Bilder/pictures/starry_night.jpg && swaybg -i ~/Bilder/pictures/starry_night.jpg -m fill"))
    hl.bind(mainMod .. "+ 4",    hl.dsp.exec_cmd("wpg -s ~/Bilder/pictures/autumn_forest.png && swaybg -i ~/Bilder/pictures/autumn_forest.png -m fill"))
    hl.bind(mainMod .. "+ 5",    hl.dsp.exec_cmd("wpg -s ~/Bilder/pictures/princess_mononoke.jpg && swaybg -i ~/Bilder/pictures/princess_mononoke.jpg -m fill"))
    hl.bind(mainMod .. "+ 6",    hl.dsp.exec_cmd("wpg -s ~/Bilder/pictures/Sakura_and_Syaoran.jpg && swaybg -i ~/Bilder/pictures/Sakura_and_Syaoran.jpg -m fill"))
    hl.bind(mainMod .. "+ 7",    hl.dsp.exec_cmd("wpg -s ~/Bilder/pictures/weirdcore.jpg && swaybg -i ~/Bilder/pictures/weirdcore.jpg -m fill"))
    hl.bind(mainMod .. "+ 8",    hl.dsp.exec_cmd("wpg -s ~/Bilder/pictures/dreamcore.jpg && swaybg -i ~/Bilder/pictures/dreamcore.jpg -m fill"))
    hl.bind(mainMod .. "+ 9",    hl.dsp.exec_cmd("wpg -s ~/Bilder/pictures/cardcaptor_sakura.jpg && swaybg -i ~/Bilder/pictures/cardcaptor_sakura.jpg -m fill"))
    hl.bind(mainMod .. "+ 0",    hl.dsp.exec_cmd("wpg -s ~/Bilder/pictures/sailor_moon_sleep.jpg && swaybg -i ~/Bilder/pictures/sailor_moon_sleep.jpg -m fill"))
    hl.bind(mainMod .. " + SHIFT + " .. key,     hl.dsp.window.move({ workspace = i }))
    hl.bind(mainMod .. "+ l", hl.dsp.exec_cmd("hyprlock"))
    hl.bind(mainMod .. "+ SHIFT + s", hl.dsp.exec_cmd("grim "~/Bilder/$(date +'%Y-%m-%d')_screenshot.png"))
end

-- Example special workspace (scratchpad)
hl.bind(mainMod .. " + S",         hl.dsp.workspace.toggle_special("magic"))
hl.bind(mainMod .. " + SHIFT + S", hl.dsp.window.move({ workspace = "special:magic" }))

-- Scroll through existing workspaces with mainMod + scroll
hl.bind(mainMod .. " + mouse_down", hl.dsp.focus({ workspace = "e+1" }))
hl.bind(mainMod .. " + mouse_up",   hl.dsp.focus({ workspace = "e-1" }))

-- Move/resize windows with mainMod + LMB/RMB and dragging
hl.bind(mainMod .. " + mouse:272", hl.dsp.window.drag(),   { mouse = true })
hl.bind(mainMod .. " + mouse:273", hl.dsp.window.resize(), { mouse = true })

-- Laptop multimedia keys for volume and LCD brightness
hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 5%+"), { locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-"),      { locked = true, repeating = true })
hl.bind("XF86AudioMute",        hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle"),     { locked = true, repeating = true })
hl.bind("XF86AudioMicMute",     hl.dsp.exec_cmd("wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle"),   { locked = true, repeating = true })
hl.bind("XF86MonBrightnessUp",  hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%+"),                  { locked = true, repeating = true })
hl.bind("XF86MonBrightnessDown",hl.dsp.exec_cmd("brightnessctl -e4 -n2 set 5%-"),                  { locked = true, repeating = true })

-- Requires playerctl
hl.bind("XF86AudioNext",  hl.dsp.exec_cmd("playerctl next"),       { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPlay",  hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPrev",  hl.dsp.exec_cmd("playerctl previous"),   { locked = true })    

-- Trigger when the switch is toggled.
hl.bind("switch:[Lid Switch]", hl.dsp.exec_cmd("hyprlock"), { locked = true })     
--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Example window rules that are useful

local suppressMaximizeRule = hl.window_rule({
    -- Ignore maximize requests from all apps. You'll probably like this.
    name  = "suppress-maximize-events",
    match = { class = ".*" },

    suppress_event = "maximize",
})
-- suppressMaximizeRule:set_enabled(false)

hl.window_rule({
    -- Fix some dragging issues with XWayland
    name  = "fix-xwayland-drags",
    match = {
        class      = "^$",
        title      = "^$",
        xwayland   = true,
        float      = true,
        fullscreen = false,
        pin        = false,
    },

    no_focus = true,
})

-- Layer rules also return a handle.
-- local overlayLayerRule = hl.layer_rule({
--     name  = "no-anim-overlay",
--     match = { namespace = "^my-overlay$" },
--     no_anim = true,
-- })
-- overlayLayerRule:set_enabled(false)

-- Hyprland-run windowrule
hl.window_rule({
    name  = "move-hyprland-run",
    match = { class = "hyprland-run" },
    opacity = "0.5",
    move  = "20 monitor_h-120",
    float = true,
})
