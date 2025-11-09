# Disable access control for the current user.
xhost +SI:localuser:$USER
# Make Java applications aware this is a non-reparenting window manager.
export _JAVA_AWT_WM_NONREPARENTING=1
xrandr --output eDP-1 --mode 1280x800
xrandr --output DP-2 --mode 1280x720
exec emacs
