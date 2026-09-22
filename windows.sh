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
      - ./shared:/shared
    restart: always
    stop_grace_period: 2m
EOF
docker compose up -d
