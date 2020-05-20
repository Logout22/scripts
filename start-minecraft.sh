#!/bin/bash
set -o errexit
set -o nounset

minecraft-launcher
cd
tar czf Nextcloud/Minecraft/backup.tar.gz .minecraft
