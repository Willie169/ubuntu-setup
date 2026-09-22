#!/usr/bin/env bash

mkdir -p ~/.config/winapps
cd ~/.config/winapps || exit
cat >winapps.conf <<'EOF'
##################################
#   WINAPPS CONFIGURATION FILE   #
##################################

# [WINDOWS USERNAME]
RDP_USER="Docker"

# [WINDOWS PASSWORD]
RDP_PASS="admin"
RDP_ASKPASS=""

# [WINDOWS DOMAIN]
RDP_DOMAIN=""

# [WINDOWS IPV4 ADDRESS]
RDP_IP="127.0.0.1"

# [RDP PORT]
RDP_PORT="3389"

# [WINAPPS BACKEND]
WAFLAVOR="docker"

# [DISPLAY SCALING FACTOR]
RDP_SCALE="100"

# [MOUNTING REMOVABLE PATHS FOR FILES]
REMOVABLE_MEDIA="/run/media"

# [ADDITIONAL FREERDP FLAGS & ARGUMENTS]
RDP_FLAGS="/cert:tofu /sound /microphone +home-drive"

# [NON FULL WINDOWS RDP FLAGS]
RDP_FLAGS_NON_WINDOWS=""

# [FULL WINDOWS RDP FLAGS]
RDP_FLAGS_WINDOWS=""

# [DEBUG WINAPPS]
DEBUG="true"

# [AUTOMATICALLY PAUSE WINDOWS]
AUTOPAUSE="off"

# [FREERDP COMMAND]
FREERDP_COMMAND=""

# [TIMEOUTS]
PORT_TIMEOUT="5"
RDP_TIMEOUT="30"
APP_SCAN_TIMEOUT="60"
BOOT_TIMEOUT="120"
HIDEF="on"
EOF
curl https://raw.githubusercontent.com/winapps-org/winapps/main/setup.sh | bash -s -- --user
