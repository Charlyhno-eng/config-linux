local network_interface = 'wlp0s20f3'

conky.config = {
    update_interval = 1,
    cpu_avg_samples = 5,
    net_avg_samples = 2,
    override_utf8_locale = true,
    double_buffer = true,
    no_buffers = true,
    text_buffer_size = 2048,
    imlib_cache_size = 0,

    own_window = true,
    own_window_type = 'normal',
    own_window_transparent = false,
    own_window_argb_visual = true,
    own_window_argb_value = 0,
    own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',

    alignment = 'top_right',
    gap_x = 15,
    gap_y = 30,
    minimum_height = 300,
    minimum_width = 400,
    maximum_width = 400,

    use_xft = true,
    font = 'Hack:size=12',
    xftalpha = 0.9,
    uppercase = false,
    use_spacer = 'none',
    default_color = '#37d4d1',
    color1 = '#ffffff',
    color2 = '#4295ed',

    draw_shades = false,
    draw_outline = false,
    draw_borders = false,
    draw_graph_borders = true,
    default_shade_color = '#000000',
    default_outline_color = '#000000',
}

conky.text = string.format([[
${font Hack:size=18}${color2}Network${font Hack:size=12}${color}

${color2}Down:${color1} ${downspeed %s}

${downspeedgraph %s 18,400 00ff00 ff0000} 

${color2}Total Down:${color1} ${totaldown %s}
${color2}Up:${color1} ${upspeed %s}

${upspeedgraph %s 18,400 ff0000 00ff00}

${color2}Total Up:${color1} ${totalup %s}

${color2}SSID:${color1} ${wireless_essid %s}
${color2}Signal Strength:${color1} ${wireless_link_qual_perc %s}%%

${color2}IP Address:${color1} ${addr %s}
${color2}Public IP:${color1} ${execi 300 curl -s ipv4.icanhazip.com}
]],
network_interface, network_interface, network_interface,
network_interface, network_interface, network_interface,
network_interface, network_interface, network_interface)

