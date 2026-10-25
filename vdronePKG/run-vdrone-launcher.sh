#! /bin/bash

echo "test"
UNITY_DISABLE_PLUGINS=1 SDL_VIDEO_FULLSCREEN_HEAD=0 SDL_VIDEO_FULLSCREEN_DISPLAY=0  SDL_VIDEODRIVER=x11  QT_QPA_PLATFORM=xcb steam-run "$MY_DATA_DIR/production-launcher-debian/Launcher"  -screen-width 1280 -screen-height 720
