display=$1
reshape_col=${2:-3840}
reshape_row=${3:-1080}
pos_col=${4:-1920}
pos_row=${5:-0}
MODE_line=$(cvt $reshape_col $reshape_row | grep -E "Modeline" | cut -f 2- -d " ")
MODE=$(cvt $reshape_col $reshape_row | grep -E "Modeline" | cut -f 2 -d " ")
xrandr --newmode $MODE_line
xrandr --addmode $display $MODE
xrandr --output $display --mode $MODE
clipmode="${reshape_col}x${reshape_row}+${pos_col}+${pos_row}"
x11vnc -display :1 -clip  $clipmode  -repeat -ncache 10
