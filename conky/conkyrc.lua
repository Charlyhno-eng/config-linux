conky.config = {
    -- Config

    update_interval = 1,
    cpu_avg_samples = 5,
    net_avg_samples = 5,
    override_utf8_locale = true,
    double_buffer = true,
    no_buffers = true,
    text_buffer_size = 2048,
    imlib_cache_size = 0,

    -- Windows

    own_window = true,
    own_window_type = 'dock',
    own_window_transparent = false,
    own_window_argb_visual = true,
    own_window_argb_value = 20,
    own_window_hints = 'undecorated,sticky,skip_taskbar,skip_pager,below',

    -- Placement

    alignment = 'top_right',
    gap_x = 15,
    gap_y = 0,
    minimum_height = 550,
    minimum_width = 460,
    maximum_width = 460,

    -- Textual

    use_xft = true,
    font = 'Hack:size=10',
    xftalpha = 0.9,
    uppercase = false,
    use_spacer = 'none',
    default_color = '#37d4d1',
    color1 = '#ea00d9',
    color2 = '#4295ed',

    -- Graphical

    draw_shades = false,
    draw_outline = false,
    draw_borders = false,
    draw_graph_borders = true,
    default_shade_color = '#000000',
    default_outline_color = '#000000',
};

conky.text = [[
${color1}S Y S T E M ${hr 1} ${color}
Hostname: ${alignr}${color2}$nodename ${color}
Distro: ${alignr}${color2}${exec lsb_release -d | cut -f2} ${color}
Kernel: ${alignr}${color2}$kernel ${color}
Uptime: ${alignr}${color2}$uptime ${color}

${color1}P R O C E S S O R S ${hr 1} ${color}
CPU Temp: ${alignr}${color2}${execi 10 sensors | grep 'Package id 0' | awk '{print $4}'} ${color}
History: ${alignr}${color2}${cpu cpu0}% ${cpubar 8,120} ${color}
  CPU Core 1: ${alignr}${color2}${cpu cpu1}% ${cpubar cpu1 8,120} ${color}
  CPU Core 2: ${alignr}${color2}${cpu cpu2}% ${cpubar cpu2 8,120} ${color}
  CPU Core 3: ${alignr}${color2}${cpu cpu3}% ${cpubar cpu3 8,120} ${color}
  CPU Core 4: ${alignr}${color2}${cpu cpu4}% ${cpubar cpu4 8,120} ${color}

${color1}M E M O R Y ${hr 1} ${color}
RAM:${alignr}${color2} $mem/$memmax ${membar 8,120} ${color}

Top Processes ${alignr} CPU%     MEM%
  ${color2}1 - ${top name 1}${alignr}${top cpu 1}%  ${top mem 1}% ${color}
  ${color2}2 - ${top name 2}${alignr}${top cpu 2}%  ${top mem 2}% ${color}
  ${color2}3 - ${top name 3}${alignr}${top cpu 3}%  ${top mem 3}% ${color}
  ${color2}4 - ${top name 4}${alignr}${top cpu 4}%  ${top mem 4}% ${color}
  ${color2}5 - ${top name 5}${alignr}${top cpu 5}%  ${top mem 5}% ${color}

${color1}D R I V E S ${hr 1} ${color}
Root - SSD:${alignr}${color2}${fs_used /}/${fs_size /} ${fs_bar 8,120 /} ${color}
I/O Read:${alignr}${color2}${diskio_read /dev/nvme0n1} ${diskiograph_read /dev/nvme0n1 8,120} ${color}
I/O Write:${alignr}${color2}${diskio_write /dev/nvme0n1} ${diskiograph_write /dev/nvme0n1 8,120} ${color}

${color1}N E T W O R K ${hr 1} ${color}
IP Address: ${alignr}${color2}${addr wlp0s20f3} ${color}
Signal Strength: ${alignr}${color2}${wireless_link_qual_perc wlp0s20f3}% ${color}
Eth Up:${alignr}${color2}${upspeedf wlp0s20f3} ${upspeedgraph wlp0s20f3 8,120} ${color}
Eth Down:${alignr}${color2}${downspeedf wlp0s20f3} ${downspeedgraph wlp0s20f3 8,120} ${color}
]];
