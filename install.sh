#!/bin/bash
# ============================================
# MAR-PD TERMUX THEME - INSTALLATION SCRIPT
# GitHub: https://github.com/username/marpd-theme
# ============================================

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
NC='\033[0m'

# Theme Directory
THEME_DIR="$HOME/.marpd-theme"

clear

# Banner
show_banner() {
    echo -e "${CYAN}"
    echo "    ███╗   ███╗ █████╗ ██████╗ ██████╗ ██████╗ "
    echo "    ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██╔══██╗"
    echo "    ██╔████╔██║███████║██████╔╝██████╔╝██║  ██║"
    echo "    ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║  ██║"
    echo "    ██║ ╚═╝ ██║██║  ██║██║     ██║     ██████╔╝"
    echo "    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ "
    echo -e "${NC}"
    echo -e "${GREEN}┌────────────────────────────────────────────────────┐${NC}"
    echo -e "${GREEN}│     ${BLUE}TEAM: ${WHITE}MAR-PD ${YELLOW}• ${CYAN}WE WORK EXPERIMENT         ${GREEN}│${NC}"
    echo -e "${GREEN}└────────────────────────────────────────────────────┘${NC}"
    echo ""
}

# Check dependencies
check_deps() {
    echo -e "${YELLOW}[*] Checking dependencies...${NC}"
    
    if ! command -v git &> /dev/null; then
        echo -e "${RED}[!] Git is not installed${NC}"
        pkg install git -y
    fi
    
    if ! command -v wget &> /dev/null; then
        echo -e "${YELLOW}[!] Installing wget...${NC}"
        pkg install wget -y
    fi
}

# Download theme files
download_theme() {
    echo -e "${YELLOW}[*] Downloading theme files...${NC}"
    
    # Create directory
    rm -rf "$THEME_DIR"
    mkdir -p "$THEME_DIR"
    
    # Download bg.png from GitHub
    echo -e "${BLUE}[*] Downloading background image...${NC}"
    wget -q "https://raw.githubusercontent.com/username/marpd-theme/main/bg.png" \
         -O "$THEME_DIR/bg.png"
    
    # Download theme script
    echo -e "${BLUE}[*] Downloading theme script...${NC}"
    wget -q "https://raw.githubusercontent.com/username/marpd-theme/main/marpd-theme.sh" \
         -O "$THEME_DIR/marpd-theme.sh"
    
    chmod +x "$THEME_DIR/marpd-theme.sh"
}

# Configure shell
configure_shell() {
    echo -e "${YELLOW}[*] Configuring shell...${NC}"
    
    # Backup
    cp ~/.bashrc ~/.bashrc.backup.marpd 2>/dev/null
    
    # Add to bashrc
    cat >> ~/.bashrc << 'EOF'

# ============================================
# MAR-PD TERMUX THEME
# GitHub: https://github.com/username/marpd-theme
# ============================================
if [ -f "$HOME/.marpd-theme/marpd-theme.sh" ]; then
    source "$HOME/.marpd-theme/marpd-theme.sh"
fi

# Theme commands
marpd() {
    case "$1" in
        "help")
            echo -e "\033[1;36mMAR-PD Theme Commands:\033[0m"
            echo "  marpd help     - Show this help"
            echo "  marpd banner   - Show banner"
            echo "  marpd info     - System info"
            echo "  marpd bg       - Set background"
            echo "  marpd update   - Update theme"
            ;;
        "banner")
            clear
            echo -e "\033[1;36m"
            echo "    ███╗   ███╗ █████╗ ██████╗ ██████╗ ██████╗ "
            echo "    ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██╔══██╗"
            echo "    ██╔████╔██║███████║██████╔╝██████╔╝██║  ██║"
            echo "    ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║  ██║"
            echo "    ██║ ╚═╝ ██║██║  ██║██║     ██║     ██████╔╝"
            echo "    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ "
            echo -e "\033[0m"
            echo -e "\033[1;32m┌────────────────────────────────────────────────────┐\033[0m"
            echo -e "\033[1;32m│     \033[1;34mTEAM: \033[1;37mMAR-PD \033[1;33m• \033[1;36mWE WORK EXPERIMENT         \033[1;32m│\033[0m"
            echo -e "\033[1;32m└────────────────────────────────────────────────────┘\033[0m"
            ;;
        "info")
            echo -e "\033[1;36m╔════════════════ SYSTEM INFO ════════════════╗\033[0m"
            echo -e "\033[1;34m│ Device: \033[1;37m$(getprop ro.product.model 2>/dev/null || echo 'Termux')\033[0m"
            echo -e "\033[1;34m│ Android: \033[1;37m$(getprop ro.build.version.release 2>/dev/null || echo 'Unknown')\033[0m"
            echo -e "\033[1;34m│ Host: \033[1;37m$(whoami)@$(hostname)\033[0m"
            echo -e "\033[1;34m│ Battery: \033[1;37m$(termux-battery-status 2>/dev/null | grep -o '"percentage":[0-9]*' | cut -d: -f2)%\033[0m"
            echo -e "\033[1;34m│ Time: \033[1;37m$(date '+%H:%M:%S')\033[0m"
            echo -e "\033[1;36m╚═════════════════════════════════════════════╝\033[0m"
            ;;
        "bg")
            if [ -f "$HOME/.marpd-theme/bg.png" ] && command -v termux-wallpaper &> /dev/null; then
                termux-wallpaper -f "$HOME/.marpd-theme/bg.png"
                echo -e "\033[1;32m[✓] Background set!\033[0m"
            else
                echo -e "\033[1;31m[!] Cannot set background\033[0m"
            fi
            ;;
        "update")
            echo -e "\033[1;33m[*] Updating theme...\033[0m"
            wget -q "https://raw.githubusercontent.com/username/marpd-theme/main/marpd-theme.sh" \
                 -O "$HOME/.marpd-theme/marpd-theme.sh"
            echo -e "\033[1;32m[✓] Updated!\033[0m"
            ;;
        *)
            echo -e "\033[1;33mUsage: marpd [command]\033[0m"
            echo "Commands: help, banner, info, bg, update"
            ;;
    esac
}
EOF
}

# Set Termux colors
set_colors() {
    echo -e "${YELLOW}[*] Setting up colors...${NC}"
    
    # Create color scheme
    cat > /tmp/marpd.colors << 'EOF'
color0=#0a0a0a
color1=#ff5555
color2=#50fa7b
color3=#f1fa8c
color4=#bd93f9
color5=#ff79c6
color6=#8be9fd
color7=#bfbfbf
color8=#4d4d4d
color9=#ff6e67
color10=#5af78e
color11=#f4f99d
color12=#caa9fa
color13=#ff92d0
color14=#9aedfe
color15=#e6e6e6
background=#0a0a0a
foreground=#f8f8f2
cursor=#bd93f9
EOF
    
    if command -v termux-styling &> /dev/null; then
        termux-styling color /tmp/marpd.colors
        echo -e "${GREEN}[✓] Colors applied${NC}"
    fi
}

# Set wallpaper
set_wallpaper() {
    echo -e "${YELLOW}[*] Setting wallpaper...${NC}"
    
    if [ -f "$THEME_DIR/bg.png" ] && command -v termux-wallpaper &> /dev/null; then
        termux-wallpaper -f "$THEME_DIR/bg.png"
        echo -e "${GREEN}[✓] Wallpaper set${NC}"
    fi
}

# Complete installation
complete_install() {
    clear
    show_banner
    
    echo -e "${GREEN}"
    echo "╔══════════════════════════════════════════════╗"
    echo "║          INSTALLATION COMPLETE!              ║"
    echo "║                                              ║"
    echo "║  MAR-PD Theme has been installed.           ║"
    echo "║                                              ║"
    echo "║  Commands:                                  ║"
    echo "║    marpd help     - Show commands           ║"
    echo "║    marpd banner   - Show banner             ║"
    echo "║    marpd info     - System information      ║"
    echo "║    marpd bg       - Set background          ║"
    echo "║    marpd update   - Update theme            ║"
    echo "║                                              ║"
    echo "║  Restart terminal or run:                   ║"
    echo "║        source ~/.bashrc                     ║"
    echo "╚══════════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Main installation
main() {
    show_banner
    
    echo -e "${YELLOW}[*] Starting installation...${NC}"
    echo ""
    
    check_deps
    download_theme
    configure_shell
    set_colors
    set_wallpaper
    complete_install
    
    echo -e "${CYAN}[*] Installation complete!${NC}"
    echo -e "${YELLOW}[*] Run 'source ~/.bashrc' to apply changes.${NC}"
}

# Run
main
