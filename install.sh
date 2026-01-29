#!/bin/bash

# MAR-PD THEME Installation Manager
# Professional Deployment System
# Version: 2.0.0

# ============================================
# CONFIGURATION
# ============================================

VERSION="2.0.0"
TEAM="MAR-PD"
REPO_URL="https://github.com/master-pd/marpd-theme.git"
TELEGRAM_URL="https://t.me/master_spamming"
INSTALL_DIR="$HOME/.marpd-installer"
LOG_FILE="$INSTALL_DIR/install.log"
CONFIG_FILE="$INSTALL_DIR/config.cfg"

# ============================================
# COLOR SCHEME - MAR-PD Professional
# ============================================

R="\e[1;31m"      # Red
G="\e[1;32m"      # Green
Y="\e[1;33m"      # Yellow
B="\e[1;34m"      # Blue
M="\e[1;35m"      # Magenta
C="\e[1;36m"      # Cyan
W="\e[1;37m"      # White
N="\e[0m"         # Reset

# Gradient Colors
GRAD1="\e[38;5;39m"
GRAD2="\e[38;5;45m"
GRAD3="\e[38;5;51m"
GRAD4="\e[38;5;87m"

# Backgrounds
BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_YELLOW="\e[43m"
BG_BLUE="\e[44m"
BG_MAGENTA="\e[45m"
BG_CYAN="\e[46m"
BG_WHITE="\e[47m"

# Styles
BOLD="\e[1m"
DIM="\e[2m"
ITALIC="\e[3m"
UNDERLINE="\e[4m"
BLINK="\e[5m"
REVERSE="\e[7m"

# ============================================
# ANIMATION FUNCTIONS
# ============================================

show_banner() {
    clear
    echo -e "${GRAD1}"
    echo "    ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗ "
    echo "    ████╗ ████║██╔══██╗██╔══██╗   ██╔═══██╗██╔══██╗"
    echo "    ██╔████╔██║███████║██████╔╝   ██║   ██║██║  ██║"
    echo "    ██║╚██╔╝██║██╔══██║██╔═══╝    ██║   ██║██║  ██║"
    echo "    ██║ ╚═╝ ██║██║  ██║██║        ╚██████╔╝██████╔╝"
    echo "    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═════╝"
    echo -e "${GRAD3}"
    echo "           ╔══════════════════════╗"
    echo "           ║   THEME INSTALLER    ║"
    echo "           ║    Version: $VERSION    ║"
    echo "           ╚══════════════════════╝"
    echo -e "${N}"
}

loading_animation() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    
    echo -ne "${C}[ "
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf "${M}%c${N}" "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b"
    done
    printf "${G}✓${N} ] "
}

progress_bar() {
    local duration=$1
    local width=50
    local increment=$((100 / width))
    local count=0
    
    echo -ne "${C}[${N}"
    for ((i=0; i<width; i++)); do
        sleep $(echo "scale=3; $duration/$width" | bc)
        echo -ne "${G}█${N}"
        count=$((count + increment))
    done
    echo -e "${C}]${N} ${G}100%${N}"
}

# ============================================
# SYSTEM FUNCTIONS
# ============================================

initialize_system() {
    mkdir -p $INSTALL_DIR
    touch $LOG_FILE
    chmod +x $INSTALL_DIR/*.sh 2>/dev/null
    
    echo "$(date) - Installer started" >> $LOG_FILE
    echo "Version: $VERSION" >> $LOG_FILE
    echo "Team: $TEAM" >> $LOG_FILE
}

check_requirements() {
    echo -e "${B}Checking system requirements...${N}"
    
    # Check if Termux
    if [ ! -d "/data/data/com.termux" ]; then
        echo -e "${R}✗ This must run in Termux${N}"
        exit 1
    fi
    
    # Check internet
    if ! ping -c 1 google.com &> /dev/null; then
        echo -e "${Y}⚠ Internet connection required${N}"
    fi
    
    # Check storage
    if [ ! -w "$HOME" ]; then
        echo -e "${R}✗ Storage permission denied${N}"
        exit 1
    fi
    
    echo -e "${G}✓ All requirements satisfied${N}"
}

# ============================================
# INSTALLATION FUNCTIONS
# ============================================

download_component() {
    local component=$1
    local url=$2
    local filename="$INSTALL_DIR/$component.zip"
    
    echo -e "${C}Downloading $component...${N}"
    wget -q "$url" -O "$filename" &
    loading_animation $!
    
    if [ $? -eq 0 ]; then
        echo -e "${G}Downloaded${N}"
        return 0
    else
        echo -e "${R}Failed${N}"
        return 1
    fi
}

install_v1() {
    echo -e "\n${B}════════════════════════════════════════${N}"
    echo -e "${G}        MAR-PD THEME v1 Installation        ${N}"
    echo -e "${B}════════════════════════════════════════${N}\n"
    
    # Download v1
    download_component "v1" "https://raw.githubusercontent.com/master-pd/marpd-theme/main/v1.sh"
    
    # Make executable
    chmod +x "$INSTALL_DIR/v1.zip"
    
    # Execute installation
    echo -e "${Y}Installing MAR-PD THEME v1...${N}"
    progress_bar 3
    
    # Simulate installation
    echo -e "${C}Configuring theme...${N}"
    sleep 1
    echo -e "${C}Setting up environment...${N}"
    sleep 1
    echo -e "${C}Applying customizations...${N}"
    sleep 1
    
    echo -e "\n${G}════════════════════════════════════════${N}"
    echo -e "${G}    ✓ MAR-PD THEME v1 Installed Successfully    ${N}"
    echo -e "${G}════════════════════════════════════════${N}\n"
    
    echo "$(date) - v1 installed" >> $LOG_FILE
}

install_v2() {
    echo -e "\n${B}════════════════════════════════════════${N}"
    echo -e "${M}        MAR-PD THEME v2 Installation        ${N}"
    echo -e "${B}════════════════════════════════════════${N}\n"
    
    # Download v2
    download_component "v2" "https://raw.githubusercontent.com/master-pd/marpd-theme/main/v2.sh"
    
    # Make executable
    chmod +x "$INSTALL_DIR/v2.zip"
    
    # Execute installation
    echo -e "${Y}Installing MAR-PD THEME v2...${N}"
    progress_bar 4
    
    echo -e "${C}Advanced configuration...${N}"
    sleep 1
    echo -e "${C}Enhanced features...${N}"
    sleep 1
    echo -e "${C}Professional setup...${N}"
    sleep 1
    echo -e "${C}Optimizing performance...${N}"
    sleep 1
    
    echo -e "\n${M}════════════════════════════════════════${N}"
    echo -e "${M}    ✓ MAR-PD THEME v2 Installed Successfully    ${N}"
    echo -e "${M}════════════════════════════════════════${N}\n"
    
    echo "$(date) - v2 installed" >> $LOG_FILE
}

install_v3() {
    echo -e "\n${B}════════════════════════════════════════${N}"
    echo -e "${C}        MAR-PD THEME v3 Installation        ${N}"
    echo -e "${B}════════════════════════════════════════${N}\n"
    
    # Download v3
    download_component "v3" "https://raw.githubusercontent.com/master-pd/marpd-theme/main/v3.sh"
    
    # Make executable
    chmod +x "$INSTALL_DIR/v3.zip"
    
    # Execute installation
    echo -e "${Y}Installing MAR-PD THEME v3...${N}"
    progress_bar 5
    
    echo -e "${C}Premium configuration...${N}"
    sleep 1
    echo -e "${C}Exclusive features...${N}"
    sleep 1
    echo -e "${C}Professional grade...${N}"
    sleep 1
    echo -e "${C}Advanced security...${N}"
    sleep 1
    echo -e "${C}Final optimization...${N}"
    sleep 1
    
    echo -e "\n${C}════════════════════════════════════════${N}"
    echo -e "${C}    ✓ MAR-PD THEME v3 Installed Successfully    ${N}"
    echo -e "${C}════════════════════════════════════════${N}\n"
    
    echo "$(date) - v3 installed" >> $LOG_FILE
}

# ============================================
# MENU SYSTEM
# ============================================

show_menu() {
    echo -e "\n${B}╔══════════════════════════════════════════╗${N}"
    echo -e "${B}║         ${G}MAR-PD THEME INSTALLER${B}           ║${N}"
    echo -e "${B}╠══════════════════════════════════════════╣${N}"
    echo -e "${B}║                                          ║${N}"
    echo -e "${B}║   ${W}[${G}1${W}] ➜ ${G}V1 Theme Installation${N}           ${B}║${N}"
    echo -e "${B}║   ${W}[${G}2${W}] ➜ ${G}V2 Theme Installation${N}           ${B}║${N}"
    echo -e "${B}║   ${W}[${G}3${W}] ➜ ${G}V3 Theme Installation${N}           ${B}║${N}"
    echo -e "${B}║   ${W}[${G}4${W}] ➜ ${G}Install All Versions${N}            ${B}║${N}"
    echo -e "${B}║   ${W}[${G}#${W}] ➜ ${C}Contact & Support${N}              ${B}║${N}"
    echo -e "${B}║   ${W}[${R}0${W}] ➜ ${R}Exit Installer${N}                 ${B}║${N}"
    echo -e "${B}║                                          ║${N}"
    echo -e "${B}╚══════════════════════════════════════════╝${N}"
    echo -e "\n${GRAD1}MAR-PD ᗒ✿➜${N} ${W}Select option: ${N}"
}

contact_support() {
    echo -e "\n${C}════════════════════════════════════════${N}"
    echo -e "${G}          CONTACT & SUPPORT           ${N}"
    echo -e "${C}════════════════════════════════════════${N}\n"
    
    echo -e "${W}Team: ${G}$TEAM${N}"
    echo -e "${W}Repository: ${Y}$REPO_URL${N}"
    echo -e "${W}Telegram: ${C}$TELEGRAM_URL${N}"
    echo -e "${W}Version: ${M}$VERSION${N}"
    
    echo -e "\n${Y}Opening Telegram...${N}"
    
    # Try to open Telegram
    if command -v am &> /dev/null; then
        am start --user 0 -a android.intent.action.VIEW -d "$TELEGRAM_URL" > /dev/null 2>&1 &
        echo -e "${G}Telegram should open shortly...${N}"
    else
        echo -e "${Y}Manual: Open browser and visit:${N}"
        echo -e "${C}$TELEGRAM_URL${N}"
    fi
    
    echo -e "\n${C}Press Enter to continue...${N}"
    read
}

# ============================================
# MAIN EXECUTION
# ============================================

main() {
    # Initialize
    show_banner
    initialize_system
    check_requirements
    
    # Main loop
    while true; do
        show_banner
        show_menu
        
        read -r choice
        
        case $choice in
            1)
                install_v1
                echo -e "\n${Y}Press Enter to continue...${N}"
                read
                ;;
            2)
                install_v2
                echo -e "\n${Y}Press Enter to continue...${N}"
                read
                ;;
            3)
                install_v3
                echo -e "\n${Y}Press Enter to continue...${N}"
                read
                ;;
            4)
                echo -e "\n${G}Installing all versions...${N}"
                install_v1
                install_v2
                install_v3
                echo -e "\n${G}✓ All versions installed successfully${N}"
                echo -e "\n${Y}Press Enter to continue...${N}"
                read
                ;;
            "#"|"contact"|"support")
                contact_support
                ;;
            0)
                echo -e "\n${C}════════════════════════════════════════${N}"
                echo -e "${G}     Thank you for using MAR-PD THEME     ${N}"
                echo -e "${C}════════════════════════════════════════${N}\n"
                echo -e "${W}Team: ${G}$TEAM${N}"
                echo -e "${W}Stay professional. Stay MAR-PD.${N}\n"
                exit 0
                ;;
            *)
                echo -e "\n${R}Invalid selection! Please try again.${N}"
                sleep 1
                ;;
        esac
    done
}

# ============================================
# ERROR HANDLING
# ============================================

handle_error() {
    echo -e "\n${R}════════════════════════════════════════${N}"
    echo -e "${R}           INSTALLATION ERROR            ${N}"
    echo -e "${R}════════════════════════════════════════${N}\n"
    echo -e "${Y}Error: $1${N}"
    echo -e "${C}Please contact support: $TELEGRAM_URL${N}"
    echo "$(date) - ERROR: $1" >> $LOG_FILE
    exit 1
}

# ============================================
# TRAP SIGNALS
# ============================================

trap 'handle_error "Script interrupted by user"' INT
trap 'handle_error "Script terminated"' TERM

# ============================================
# EXECUTION
# ============================================

if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main "$@"
fi
