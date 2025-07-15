#!/bin/bash

sleep 5

killall conky

conky -c ~/widgets_conky/.conkyrc_cpu_mem.lua &
conky -c ~/widgets_conky/.conkyrc_net.lua &
conky -c ~/widgets_conky/.conkyrc_info.lua &

exit 0
