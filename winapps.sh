#!/usr/bin/env bash

mkdir -p ~/windows
cd ~/windows || exit
cat >docker-compose.yml <<'EOF'
services:
  windows:
    image: dockurr/windows
    container_name: windows
    environment:
      VERSION: "tiny11"
      USERNAME: "Docker"
      PASSWORD: "admin"
      CPU_CORES: "half"
      RAM_SIZE: "half"
      DISK_SIZE: "32G"
      DISK_FMT: "qcow2"
      AUDIO: "Y"
      BALLOONING: "Y"
      BALLOONING_MIN_MEM:	"1G"
    devices:
      - /dev/kvm
      - /dev/net/tun
    cap_add:
      - NET_ADMIN
    ports:
      - 8006:8006
      - 3389:3389/tcp
      - 3389:3389/udp
    volumes:
      - ./windows:/storage
    restart: always
    stop_grace_period: 2m
EOF
sudo docker compose pull
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
