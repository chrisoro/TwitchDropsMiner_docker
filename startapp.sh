#!/bin/sh

set -e

ARCH=$(dpkg --print-architecture)

case "$ARCH" in
amd64)
	DOWNLOAD_ARCH="x86_64"
	;;
arm64)
	DOWNLOAD_ARCH="aarch64"
	;;
*)
	echo "Unsupported architecture: $ARCH"
	exit 1
	;;
esac

TMP_DIR=$(mktemp -d)
curl -L -o "$TMP_DIR/tdm.zip" "https://github.com/DevilXD/TwitchDropsMiner/releases/download/dev-build/Twitch.Drops.Miner.Linux.PyInstaller-${DOWNLOAD_ARCH}.zip"
unzip "$TMP_DIR/tdm.zip" -d "$TMP_DIR"

mv "$TMP_DIR/Twitch Drops Miner/Twitch Drops Miner (by DevilXD)" /tdm/tdm
chmod +x /tdm/tdm

rm -rf "$TMP_DIR"

cd /tdm
./tdm
