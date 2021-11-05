from typing import List  # noqa: F401
from libqtile import bar, layout, widget
from libqtile.config import Click, Drag, Group, Key, Match, Screen
from libqtile.lazy import lazy

# adding scripts that launch while qtile begins
from libqtile import hook
import os
import subprocess

mod = "mod4"
mod1 = "mod1"
HOME = os.environ.get('HOME')
keys = [
    # Switch between windows
    Key([mod], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "j", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "k", lazy.layout.up(), desc="Move focus up"),

    Key([mod], "Left", lazy.layout.left(), desc="Move focus to left"),
    Key([mod], "Right", lazy.layout.right(), desc="Move focus to right"),
    Key([mod], "Down", lazy.layout.down(), desc="Move focus down"),
    Key([mod], "Up", lazy.layout.up(), desc="Move focus up"),

    Key([mod], "space", lazy.layout.next(),
        desc="Move window focus to other window"),

    # Move windows between left/right columns or move up/down in current stack.
    # Moving out of range in Columns layout will create new column.
    Key([mod, "shift"], "h", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "l", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "j", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "k", lazy.layout.shuffle_up(), desc="Move window up"),

    Key([mod, "shift"], "Left", lazy.layout.shuffle_left(),
        desc="Move window to the left"),
    Key([mod, "shift"], "Right", lazy.layout.shuffle_right(),
        desc="Move window to the right"),
    Key([mod, "shift"], "Down", lazy.layout.shuffle_down(),
        desc="Move window down"),
    Key([mod, "shift"], "Up", lazy.layout.shuffle_up()),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    Key([mod1], "h", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod1], "l", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod1], "j", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod1], "k", lazy.layout.grow_up(), desc="Grow window up"),

    Key([mod1], "Left", lazy.layout.grow_left(),
        desc="Grow window to the left"),
    Key([mod1], "Right", lazy.layout.grow_right(),
        desc="Grow window to the right"),
    Key([mod1], "Down", lazy.layout.grow_down(),
        desc="Grow window down"),
    Key([mod1], "Up", lazy.layout.grow_up(), desc="Grow window up"),


    Key([mod], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between split and unsplit sides of stack.
    # Split = all windows displayed
    # Unsplit = 1 window displayed, like Max layout, but still with
    # multiple stack panes
    Key([mod, "shift"], "f", lazy.layout.Floating(),
        desc="Toggle between split and unsplit sides of stack"),
    Key([mod], "Return", lazy.spawn('kitty'), desc="Launch terminal"),

    # Toggle between different layouts as defined below
    Key([mod], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([mod, "shift"], "q", lazy.window.kill(), desc="Kill focused window"),

    Key([mod, "shift"], "r", lazy.restart(), desc="Restart Qtile"),
    Key([mod, "shift"], "e", lazy.shutdown(), desc="Shutdown Qtile"),
    Key([mod], "r", lazy.spawncmd(),
        desc="Spawn a command using a prompt widget"),
    Key(
        [mod],
        "f",
        lazy.window.toggle_fullscreen()
    ),
    Key(
        [],
        "XF86MonBrightnessDown",
        lazy.spawn("brightnessctl set 2%-")
    ),
    Key(
        [],
        "XF86MonBrightnessUp",
        lazy.spawn("brightnessctl set 2%+")
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("amixer set Master 2%+")
    ),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("amixer set Master 2%-")
    ),
    Key(
        [],
        "XF86AudioMute",
        lazy.spawn("amixer set Master toggle")
    ),
    # A very dirty hack but works for now anyway :'c
    Key(
        [mod],
        "x",
        lazy.spawn("pactl set-sink-volume @DEFAULT_SINK@ 125%")
        ),
    Key(
        [],
        "XF86AudioPrev",
        lazy.spawn("playerctl previous")
    ),
    Key(
        [],
        "XF86AudioPlay",
        lazy.spawn("playerctl play-pause")
    ),
    Key(
        [],
        "XF86AudioNext",
        lazy.spawn("playerctl next")
    ),
    Key(
        [],
        "Print",
        lazy.spawn(f"flameshot full -c -p {HOME}/Pictures/screenshots/")
    ),
    Key(
        ["shift"],
        "Print",
        lazy.spawn("flameshot gui")
    ),
    Key(
        [mod],
        "e",
        lazy.spawn("pcmanfm")
    ),
    Key(
        [mod],
        "g",
        lazy.spawn("chromium")
    ),
    Key(
        [mod],
        "p",
        lazy.spawn("pavucontrol")
    ),
    Key(
        [mod],
        "d",
        lazy.spawn("rofi -combi-modi window,drun -theme android_notification -font \"iosevkasemibold 12\" -show combi -icon-theme \"Paper\" -show-icons")
    ),
    Key(
        [mod, "shift"],
        "x",
        lazy.spawn("i3lock-fancy && systemctl suspend")
    ),
    Key(
        [mod],
        "q",
        lazy.to_screen(0)
    ),
    Key(
        [mod],
        "a",
        lazy.to_screen(1)
    )
]
column_layout = layout.Columns(border_width=3, margin=8)
groups = [
    Group(
        "term",
        layouts=[column_layout],
        matches=[
            Match(wm_class="Alacritty")
        ]
    ),
    Group(
        "web",
        matches=[
            Match(wm_class="firefox"),
            Match(wm_class="qutebrowser"),
            Match(wm_class="brave-browser"),
            Match(wm_class="chromium"),
            Match(wm_class="Pale moon")
        ],
        layouts=[column_layout]
    ),
    Group(
        "chat",
        layouts=[column_layout],
        matches=[
            Match(wm_class="zoom")
        ]
    ),
    Group(
        "files",
        layouts=[column_layout],
        matches=[
            Match(wm_class="Pcmanfm")
        ]
    ),
    Group(
        "docs",
        layouts=[
            layout.TreeTab(
                font="sourcecodepro",
                panel_width=240,
                active_bg="#212F3D"
            )
        ]
    ),
    Group(
        "music",
        layouts=[column_layout],
        matches=[
            Match(wm_class="nuclear"),
            Match(wm_class="rhythmbox")
        ]
    ),

    Group(
        "videos",
        layouts=[column_layout],
        matches=[
            Match(wm_class="mpv")
        ]
    ),
    Group(
        "edits",
        layouts=[layout.Columns(border_width=0)],
        matches=[
            Match(wm_class="Gimp-2.10"),
            Match(wm_class="obs"),
            Match(wm_class="Ghb")
        ]
    )
]

for i, group in enumerate(groups):
    keys.extend([
        Key(
                [mod],
                str(i+1),
                lazy.group[group.name].toscreen()
                ),
        Key(
            [mod, "shift"],
            str(i+1),
            lazy.window.togroup(group.name, switch_group=True)
        )
    ])


widget_defaults = dict(
    font='iosevkaheavy',
    fontsize=13,
    padding=3
)
extension_defaults = widget_defaults.copy()

backgroundEven = "#1A1D39"
backgroundOdd = "#635088"
screens = [
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Cmus(fmt="{}", font="iosevka", max_chars=25),
                widget.Systray(),
                widget.Notify(action=True, font="isoveka"),
                widget.Volume(fmt='vol: {}', background=backgroundOdd),
                widget.Clock(format='%d-%b-%Y %H:%M',
                             background=backgroundEven),
                widget.Memory(background=backgroundOdd)
            ],
            24,
            background="#2E2E2E",
        )
    ),
    Screen(
        top=bar.Bar(
            [
                # widget.CurrentLayout(),
                widget.GroupBox(),
                widget.Prompt(),
                widget.WindowName(),
                widget.Chord(
                    chords_colors={
                        'launch': ("#ff0000", "#BDBDBD"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.Systray(),
                widget.Notify(action=True, font="isoveka"),
                widget.Volume(fmt='vol: {}', background=backgroundOdd),
                widget.Clock(format='%d-%b-%Y %H:%M',
                             background=backgroundEven),
                widget.Memory(background=backgroundOdd)
            ],
            20,
            background="#2E2E2E"
        ),
    )
]

# Drag floating layouts.
mouse = [
    Drag([mod], "Button1", lazy.window.set_position_floating(),
         start=lazy.window.get_position()),
    Drag([mod], "Button3", lazy.window.set_size_floating(),
         start=lazy.window.get_size()),
    Click([mod], "Button2", lazy.window.bring_to_front())
]

dgroups_key_binder = None
dgroups_app_rules = []  # type: List
follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class='confirmreset'),  # gitk
    Match(wm_class='makebranch'),  # gitk
    Match(wm_class='maketag'),  # gitk
    Match(wm_class='ssh-askpass'),  # ssh-askpass
    Match(title='branchdialog'),  # gitk
    Match(title='pinentry'),  # GPG key password entry
])
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "LG3D"


@hook.subscribe.startup_once
def autostart():
    home = os.path.expanduser('~')
    subprocess.call([home + '/.config/qtile/autostart.sh'])
