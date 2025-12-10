#!/bin/bash

REPOS=(
"xfce/exo"
"xfce/garcon"
"xfce/libxfce4ui"
"xfce/libxfce4util"
"xfce/libxfce4windowing"
"xfce/thunar"
"thunar-plugins/thunar-archive-plugin"
"thunar-plugins/thunar-media-tags-plugin"
"thunar-plugins/thunar-shares-plugin"
"thunar-plugins/thunar-vcs-plugin"
"xfce/thunar-volman"
"xfce/tumbler"
"apps/catfish"
"apps/gigolo"
"apps/mousepad"
"apps/orage"
"apps/parole"
"apps/ristretto"
"apps/xfburn"
"apps/xfce4-dict"
"apps/xfce4-mixer"
"apps/xfce4-notifyd"
"apps/xfce4-panel-profiles"
"apps/xfce4-screensaver"
"apps/xfce4-screenshooter"
"apps/xfce4-taskmanager"
"apps/xfce4-terminal"
"apps/xfce4-volumed-pulse"
"apps/xfdashboard"
"apps/xfmpc"
"panel-plugins/xfce4-battery-plugin"
"panel-plugins/xfce4-calculator-plugin"
"panel-plugins/xfce4-clipman-plugin"
"panel-plugins/xfce4-cpufreq-plugin"
"panel-plugins/xfce4-cpugraph-plugin"
"panel-plugins/xfce4-datetime-plugin"
"panel-plugins/xfce4-diskperf-plugin"
"panel-plugins/xfce4-docklike-plugin"
"panel-plugins/xfce4-eyes-plugin"
"panel-plugins/xfce4-fsguard-plugin"
"panel-plugins/xfce4-generic-slider"
"panel-plugins/xfce4-genmon-plugin"
"panel-plugins/xfce4-indicator-plugin"
"panel-plugins/xfce4-mailwatch-plugin"
"panel-plugins/xfce4-mount-plugin"
"panel-plugins/xfce4-mpc-plugin"
"panel-plugins/xfce4-netload-plugin"
"panel-plugins/xfce4-notes-plugin"
"panel-plugins/xfce4-places-plugin"
"panel-plugins/xfce4-pulseaudio-plugin"
"panel-plugins/xfce4-sample-plugin"
"panel-plugins/xfce4-sensors-plugin"
"panel-plugins/xfce4-smartbookmark-plugin"
"panel-plugins/xfce4-stopwatch-plugin"
"panel-plugins/xfce4-systemload-plugin"
"panel-plugins/xfce4-time-out-plugin"
"panel-plugins/xfce4-timer-plugin"
"panel-plugins/xfce4-verve-plugin"
"panel-plugins/xfce4-wavelan-plugin"
"panel-plugins/xfce4-weather-plugin"
"panel-plugins/xfce4-whiskermenu-plugin"
"panel-plugins/xfce4-windowck-plugin"
"panel-plugins/xfce4-xkb-plugin"
"xfce/xfce4-appfinder"
"xfce/xfce4-panel"
"xfce/xfce4-power-manager"
"xfce/xfce4-session"
"xfce/xfce4-settings"
"xfce/xfconf"
"xfce/xfdesktop"
"xfce/xfwm4"
)

INSTALL_DIR="/usr/share/locale"
LANG_CODE="th"

set -e

for MODULE in "${REPOS[@]}"; do
    NAME=$(basename "$MODULE")
    PO_URL="https://gitlab.xfce.org/$MODULE/-/raw/main/po/${LANG_CODE}.po"

    echo "======================================="
    echo "[*] Fetching $NAME → $LANG_CODE.po"
    echo "URL: $PO_URL"

    mkdir -p tmp-po
    PO_FILE="tmp-po/${NAME}_${LANG_CODE}.po"

    # download
    if ! curl -fsSL "$PO_URL" -o "$PO_FILE"; then
        echo "   [!] No Thai file found for $NAME (skipped)"
        continue
    fi

    # compile
    MO_FILE="tmp-po/${NAME}.mo"
    echo "   [+] Compiling to $MO_FILE"
    msgfmt "$PO_FILE" -o "$MO_FILE"

    # install
    TARGET_DIR="$INSTALL_DIR/$LANG_CODE/LC_MESSAGES"
    sudo mkdir -p "$TARGET_DIR"
    sudo cp "$MO_FILE" "$TARGET_DIR/$NAME.mo"

    echo "   [+] Installed → $TARGET_DIR/$NAME.mo"
done

echo ""
echo "[✔] Thai translations installed successfully."
