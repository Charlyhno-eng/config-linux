conky.config = {
    background = false,
    update_interval = 1,
    cpu_avg_samples = 2,
    net_avg_samples = 2,
    override_utf8_locale = true,
    double_buffer = true,
    no_buffers = true,
    text_buffer_size = 2048,
    imlib_cache_size = 0,

    -- Window
    own_window = true,
    own_window_type = 'normal',
    own_window_transparent = false,
    own_window_argb_visual = false,
    own_window_argb_value = 0,
    own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',
    alignment = 'top_right',
    gap_x = 30,
    gap_y = 30,
    minimum_width = 300,
    minimum_height = 0,

    -- Background color (fond violet foncé)
    own_window_colour = '#1a1032',

    -- Font
    use_xft = true,
    font = 'Hack:size=10',
    xftalpha = 0.8,

    -- Colors
    default_color = '#0abdc6',
    color1 = '#ea00d9',
    color2 = '#f57800',
    color3 = '#00ff00',
    color4 = '#321959',
    color5 = '#0b2956',

    -- Border
    draw_shades = false,
    draw_outline = false,
    draw_borders = false,
    draw_graph_borders = true,

    -- Misc
    uppercase = false,
    use_spacer = 'none',
};

conky.text = [[
${color1}CYBERPUNK SYSTEM MONITOR
${color}${hr}

${color1}Time: ${color}${time %H:%M:%S}   ${color1}Uptime:${color} $uptime
${color1}Hostname: ${color}$nodename   ${color1}Kernel: ${color}$kernel

${color1}CPU ${color}${cpu cpu0}% ${color3}${cpubar cpu0 10,200}
${color1}Core 1: ${color}${cpu cpu1}%  ${color2}${cpubar cpu1 8,100}
${color1}Core 2: ${color}${cpu cpu2}%  ${color2}${cpubar cpu2 8,100}

${color1}RAM: ${color}$mem / $memmax ${color3}${membar 8,200}
${color1}Swap: ${color}$swap / $swapmax ${swapbar 8,200}

${color1}Disk Root: ${color}${fs_used /} / ${fs_size /} ${fs_bar 8,200 /}

${color1}Net ↓ ${color}${downspeedf wlp0s20f3} KiB/s ${color1}↑ ${color}${upspeedf wlp0s20f3} KiB/s
${downspeedgraph wlp0s20f3 32,150 ff0000 00ff00} ${upspeedgraph wlp0s20f3 32,150 00ff00 ff0000}

${color}${hr}
]];
