#!/bin/bash
# ===============================================
# Script: update-xfce-translations.sh
# Purpose: Fetch latest Xfce translations from GitLab
#          and install compiled Thai (.th.po) .mo files
# ===============================================

# === CONFIG ===
REPOS=(
    "https://gitlab.xfce.org/xfce/xfce4-panel.git"
    "https://gitlab.xfce.org/xfce/thunar.git"
    "https://gitlab.xfce.org/xfce/xfdesktop.git"
    "https://gitlab.xfce.org/xfce/xfce4-session.git"
    "https://gitlab.xfce.org/xfce/xfce4-settings.git"
)

INSTALL_DIR="/usr/share/locale"
LANG_CODE="th"   # Thai language code

# === SCRIPT ===
set -e

for REPO_URL in "${REPOS[@]}"; do
    MODULE_NAME=$(basename "$REPO_URL" .git)

    echo "======================================="
    echo "[*] Processing module: $MODULE_NAME"
    echo "======================================="

    # Clone or update repo
    if [ -d "$MODULE_NAME" ]; then
        echo "[*] Updating $MODULE_NAME..."
        cd "$MODULE_NAME"
        git pull
    else
        echo "[*] Cloning $MODULE_NAME..."
        git clone "$REPO_URL"
        cd "$MODULE_NAME"
    fi

    # Check if po directory exists
    if [ ! -d "po" ]; then
        echo "[!] No 'po' directory in $MODULE_NAME, skipping..."
        cd ..
        continue
    fi

    cd po

    po_file="${LANG_CODE}.po"
    if [ -f "$po_file" ]; then
        mo_file="${LANG_CODE}.mo"
        echo "   [+] Compiling $po_file → $mo_file"
        msgfmt "$po_file" -o "$mo_file"

        # Destination path
        dest_dir="$INSTALL_DIR/$LANG_CODE/LC_MESSAGES"
        sudo mkdir -p "$dest_dir"

        echo "   [+] Installing $mo_file → $dest_dir/$MODULE_NAME.mo"
        sudo cp "$mo_file" "$dest_dir/$MODULE_NAME.mo"
    else
        echo "   [!] No Thai translation ($po_file) in $MODULE_NAME"
    fi

    cd ../..  # back to main dir
done

echo ""
echo "[✔] Thai translations installed successfully."
