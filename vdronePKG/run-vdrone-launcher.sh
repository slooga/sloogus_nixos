#! /bin/bash

echo "test"
install_dir="{XDG_DATA_HOME:-$HOME/Games/velocidrone"

mkdir -p "$install_dir"
cp -a "$MY_DATA_DIR"/. "$install_dir"/

cd "$install_dir"
ls
#UNITY_DISABLE_PLUGINS=1 SDL_VIDEO_FULLSCREEN_HEAD=0 SDL_VIDEO_FULLSCREEN_DISPLAY=0  SDL_VIDEODRIVER=x11  QT_QPA_PLATFORM=xcb steam-run Launcher  -screen-width 1280 -screen-height 720
