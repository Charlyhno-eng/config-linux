conky.config = {
    update_interval = 1,
    cpu_avg_samples = 2,
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

    alignment = 'bottom_left',
    gap_x = 50,
    gap_y = 30,
    minimum_height = 450,
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
    draw_graph_borders = true,
    default_shade_color = '#000000',
    default_outline_color = '#000000',
};

conky.text = [[
${color2}CPU:${color1} ${cpu cpu0}%${alignr}${cpugraph 14,240}
${color2}CPU Temp:${color1} ${execi 10 sensors | grep 'Package id 0' | awk '{print $4}'} 

${color2}CPU Core 1:${color1}  |${cpu cpu1}%| ${alignr}${color2}CPU Core 2:${color1}  |${cpu cpu2}%|
${color2}CPU Core 3:${color1}  |${cpu cpu3}%| ${alignr}${color2}CPU Core 4:${color1}  |${cpu cpu4}%|
${color2}CPU Core 5:${color1}  |${cpu cpu5}%| ${alignr}${color2}CPU Core 6:${color1}  |${cpu cpu6}%|
${color2}CPU Core 7:${color1}  |${cpu cpu7}%| ${alignr}${color2}CPU Core 8:${color1}  |${cpu cpu8}%|

${color2}RAM:${color1} $mem/$memmax${alignr}${membar 14,240}

${color2}Top CPU Processes ${alignr}   PID     CPU%      MEM%
${color1}${top name 1}${alignr}${top pid 1}   ${top cpu 1}    ${top mem 1}
${color1}${top name 2}${alignr}${top pid 2}   ${top cpu 2}    ${top mem 2}
${color1}${top name 3}${alignr}${top pid 3}   ${top cpu 3}    ${top mem 3}
${color1}${top name 4}${alignr}${top pid 4}   ${top cpu 4}    ${top mem 4}
${color1}${top name 5}${alignr}${top pid 5}   ${top cpu 5}    ${top mem 5}
${color1}${top name 6}${alignr}${top pid 6}   ${top cpu 6}    ${top mem 6}
${color1}${top name 7}${alignr}${top pid 7}   ${top cpu 7}    ${top mem 7}
${color1}${top name 8}${alignr}${top pid 8}   ${top cpu 8}    ${top mem 8}

${color2}Top Memory Processes ${alignr}   PID      MEM%      CPU%
${color1}${top_mem name 1}${alignr}${top_mem pid 1}    ${top_mem mem 1}    ${top_mem cpu 1}
${color1}${top_mem name 2}${alignr}${top_mem pid 2}    ${top_mem mem 2}    ${top_mem cpu 2}
${color1}${top_mem name 3}${alignr}${top_mem pid 3}    ${top_mem mem 3}    ${top_mem cpu 3}
${color1}${top_mem name 4}${alignr}${top_mem pid 4}    ${top_mem mem 4}    ${top_mem cpu 4}
${color1}${top_mem name 5}${alignr}${top_mem pid 5}    ${top_mem mem 5}    ${top_mem cpu 5}
${color1}${top_mem name 6}${alignr}${top_mem pid 6}    ${top_mem mem 6}    ${top_mem cpu 6}
${color1}${top_mem name 7}${alignr}${top_mem pid 7}    ${top_mem mem 7}    ${top_mem cpu 7}
${color1}${top_mem name 8}${alignr}${top_mem pid 8}    ${top_mem mem 8}    ${top_mem cpu 8}
]]

