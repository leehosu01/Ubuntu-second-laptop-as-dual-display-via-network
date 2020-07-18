# Ubuntu-second-laptop-as-dual-display-via-network

make vnc and use xrandr to extend the display from the second laptop.

without any virtual port or additional port. It requires only your current monitor port.

example: 1920x1080 -> 3840x1080 by xrandr and vnc with -clip 3840x1080+1920+0

The specific terminal command will be upload tomorrow, KST 7.18 12:00-

>1. find source display (your main display)
> >![image](https://user-images.githubusercontent.com/40295460/87844172-b5270f00-c8f5-11ea-9c3e-141450e1e1dc.png)
> >
> >In this case, remember `eDP`!
>
>2. find server ip
> >find server ip by run `ip addr show | grep "inet"`
> >
> >But, do not use `127.0.0.1`. Remember your ip!
>
>3. consider your display size.
> >In my case, my screen is 1920x1080 and my second laptop is also 1920x1080, both are 15.6 inches.
> >So, I will make eDP as 3840x1080 then it will display only (0, 0, 1920, 1080) area.
>
>4. resize via xrandr and make vcn 
> >I'm not sure, `x11vcn -display:1` will appropriate for others. But, in my case, it works for me.
> >
> >in basic, If your source display is `eDP` run `sh server.sh 'eDP'`
> >
> >in advance, If your source display is not 1920x1080 or further you want to make a difference
> >
> >run `sh server.sh 'eDP' <reshape_col> <reshape_row> <pos_col> <pos_row>`
> >each defualt value is 3840, 1080, 1920, 0
> >
> >![image](https://user-images.githubusercontent.com/40295460/87844622-cffb8280-c8f9-11ea-91c4-86a6f15eaaf9.png)
> >
> >in the last line, `PORT=5900` is your port. Remember it!
>
>5. client (second laptop) vncviewer
> >If your server ip `116.39.231.34` and PORT `5900` then run `sh client.sh 116.39.231.34 5900`
