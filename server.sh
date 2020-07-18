display=$1
MODE_line=$(cvt 3840 1080 | grep -E "Modeline" | cut -f 2- -d " ")
MODE=$(cvt 3840 1080 | grep -E "Modeline" | cut -f 2 -d " ")
xrandr --newmode $MODE_line
xrandr --addmode $display $MODE
xrandr --output $display --mode $MODE
x11vnc -display :1 -clip 3840x1080+1920+0 -repeat -ncache 10
