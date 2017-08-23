#!/bin/bash
set -o errexit
set -o nounset

java -jar "$HOME/Downloads/Minecraft.jar"
cd "$HOME/.minecraft"
tar czf "$HOME/Dropbox/Minecraft/backup.tar.gz" launcher_profiles.json options.txt saves screenshots
