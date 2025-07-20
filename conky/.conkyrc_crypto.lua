conky.config = {
    update_interval = 60,
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

    alignment = 'bottom_right',
    gap_x = 50,
    gap_y = 30,
    minimum_height = 100,
    minimum_width = 200,
    maximum_width = 300,

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
${font Hack:size=18}${color2}Crypto Prices:${color1}${font Hack:size=12}

${execpi 60 ~/widgets_conky/crypto_prices.sh}
]];

