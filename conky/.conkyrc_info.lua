conky.config = {
    update_interval = 1,
    override_utf8_locale = true,
    double_buffer = true,
    no_buffers = true,
    text_buffer_size = 2048,

    own_window = true,
    own_window_type = 'normal',
    own_window_transparent = false,
    own_window_argb_visual = true,
    own_window_argb_value = 0,
    own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',

    alignment = 'top_left',
    gap_x = 50,
    gap_y = 30,
    minimum_height = 150,
    minimum_width = 460,
    maximum_width = 460,

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
};

conky.text = [[
${font Hack:size=60}${color2}${time %H}${color1}:${time %M}${font Hack:size=12}


${color2}Hostname:${color1} $nodename
${color2}Distro:${color1} ${exec lsb_release -d | cut -f2}
${color2}Uptime:${color1} $uptime
${color2}Kernel:${color1} $kernel
${color2}Load:${color1} ${loadavg}

${color2}Disk Usage:${color1}
${color2}Total:${color1} ${fs_used /}/${fs_size /}
${color2}Free:${color1} ${fs_free /}
]]
