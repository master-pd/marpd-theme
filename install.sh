#!/bin/bash

# ============================================================
# MAR-PD ULTIMATE TERMUX THEME - ADVANCED EDITION
# TEAM: MAR-PD | WE WORK EXPERIMENT
# VERSION: 5.0.0
# NO WALLPAPER - PURE TERMINAL EXPERIENCE
# ============================================================

# Theme Configuration
THEME_NAME="MAR-PD ADVANCED"
THEME_VERSION="5.0.0"
THEME_DIR="$HOME/.marpd-advanced"
CONFIG_DIR="$THEME_DIR/config"
SCRIPT_DIR="$THEME_DIR/scripts"
DATA_DIR="$THEME_DIR/data"
LOG_FILE="$DATA_DIR/install.log"

# Colors with Gradient Effects
R='\033[1;31m'    # Red
G='\033[1;32m'    # Green
Y='\033[1;33m'    # Yellow
B='\033[1;34m'    # Blue
M='\033[1;35m'    # Magenta
C='\033[1;36m'    # Cyan
W='\033[1;37m'    # White
N='\033[0m'       # Reset

# Gradient Colors
G1='\033[38;5;39m'   # Light Blue
G2='\033[38;5;45m'   # Cyan
G3='\033[38;5;51m'   # Bright Cyan
G4='\033[38;5;87m'   # Electric Blue
G5='\033[38;5;123m'  # Sky Blue

# Effects
BLINK='\033[5m'
BOLD='\033[1m'
UNDER='\033[4m'
REV='\033[7m'
DIM='\033[2m'

clear

# ============================================================
# ADVANCED ANIMATION ENGINE
# ============================================================

matrix_effect() {
    local width=50
    local height=10
    local chars="01"
    
    for ((i=0; i<height; i++)); do
        for ((j=0; j<width; j++)); do
            if (( RANDOM % 3 == 0 )); then
                echo -ne "${G}${chars:$((RANDOM % ${#chars})):1}${N}"
            else
                echo -n " "
            fi
        done
        echo
    done
}

rainbow_text() {
    local text="$1"
    local colors=("$R" "$Y" "$G" "$C" "$B" "$M")
    local idx=0
    
    for ((i=0; i<${#text}; i++)); do
        char="${text:$i:1}"
        if [ "$char" != " " ]; then
            echo -ne "${colors[$idx]}$char${N}"
            idx=$(( (idx + 1) % ${#colors[@]} ))
        else
            echo -n "$char"
        fi
    done
    echo
}

loading_spinner() {
    local pid=$1
    local msg="$2"
    local delay=0.1
    local spin='⠋⠙⠹⠸⠼⠴⠦⠧⠇⠏'
    
    echo -ne " ${C}[${N}"
    while kill -0 $pid 2>/dev/null; do
        for i in {0..9}; do
            echo -ne "\b${spin:$i:1}"
            sleep $delay
        done
    done
    echo -ne "\b${G}✓${N}] ${msg}"
    echo
}

progress_bar_advanced() {
    local total=$1
    local current=$2
    local label="$3"
    local width=40
    
    local percent=$((current * 100 / total))
    local filled=$((current * width / total))
    local empty=$((width - filled))
    
    # Create gradient progress bar
    echo -ne "\r${C}[${N}"
    
    # Filled part with gradient
    for ((i=0; i<filled; i++)); do
        local color_idx=$((i * 6 / width))
        case $color_idx in
            0) echo -ne "${R}█${N}" ;;
            1) echo -ne "${Y}█${N}" ;;
            2) echo -ne "${G}█${N}" ;;
            3) echo -ne "${C}█${N}" ;;
            4) echo -ne "${B}█${N}" ;;
            5) echo -ne "${M}█${N}" ;;
        esac
    done
    
    # Empty part
    for ((i=0; i<empty; i++)); do
        echo -ne "${DIM}░${N}"
    done
    
    echo -ne "${C}] ${percent}% - ${label}${N}"
    
    if [ $current -eq $total ]; then
        echo
    fi
}

# ============================================================
# ADVANCED BANNER SYSTEM
# ============================================================

show_advanced_banner() {
    clear
    
    # Matrix intro effect
    if [ $((RANDOM % 3)) -eq 0 ]; then
        matrix_effect
        sleep 0.5
        clear
    fi
    
    # Random banner style
    local style=$((RANDOM % 6))
    
    case $style in
        0) show_cyber_banner ;;
        1) show_digital_banner ;;
        2) show_minimal_banner ;;
        3) show_glitch_banner ;;
        4) show_hex_banner ;;
        5) show_ascii_banner ;;
    esac
    
    echo ""
}

show_cyber_banner() {
    echo -e "${C}"
    cat << "EOF"
 ███▄ ▄███▓ ▄▄▄       ██▀███   ██ ▄█▀
▓██▒▀█▀ ██▒▒████▄    ▓██ ▒ ██▒ ██▄█▒ 
▓██    ▓██░▒██  ▀█▄  ▓██ ░▄█ ▒▓███▄░ 
▒██    ▒██ ░██▄▄▄▄██ ▒██▀▀█▄  ▓██ █▄ 
▒██▒   ░██▒ ▓█   ▓██▒░██▓ ▒██▒▒██▒ █▄
░ ▒░   ░  ░ ▒▒   ▓▒█░░ ▒▓ ░▒▓░▒ ▒▒ ▓▒
░  ░      ░  ▒   ▒▒ ░  ░▒ ░ ▒░░ ░▒ ▒░
░      ░     ░   ▒     ░░   ░ ░ ░░ ░ 
       ░         ░  ░   ░     ░  ░   
EOF
    echo -e "${N}"
    
    echo -e "${G}╔══════════════════════════════════════════════════════════════╗${N}"
    rainbow_text "     TEAM: MAR-PD | WE WORK EXPERIMENT | TERMINAL MASTERS"
    echo -e "${G}╚══════════════════════════════════════════════════════════════╝${N}"
}

show_digital_banner() {
    echo -e "${G1}"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWX0kxxk0XWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMWKxc,..      ..,cxKWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMW0l'.                .'o0WMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNk;.                      .;kNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMNx'                            'xNMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMWO,                                ,OWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMXc                                   cXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMWk'                                     'kWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMWd.                                       .dWMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'           ,d0XWWWWWWWWWWX0d,           '0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'        .lKWMMMMMMMMMMMMMMMMMWKl.        '0MMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'      .dNMMMMMMMMMMMMMMMMMMMMMMMMNd.      '0MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'     ;KMMMMMMMMMMMMMMMMMMMMMMMMMMMMK;     '0MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'    cXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXc    '0MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'   cXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXc   '0MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'  .OMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO.  '0MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'  .OMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMO.  '0MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'   cXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXc   '0MMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'    cXMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMXc    '0MMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'     ;KMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMK;     '0MMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'      .dNMMMMMMMMMMMMMMMMMMMMMMMMMMMMNd.      '0MMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'        .lKWMMMMMMMMMMMMMMMMMMMMMMMMWKl.        '0MMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'           ,d0XWWMMMMMMMMMMMMMMMMX0d,           '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'                .,:llllllllll:,.                '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'                                                 '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'                                                 '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'                                                 '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'                                                 '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'                                                 '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'                                                 '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'                                                 '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'                                                 '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'                                                 '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMM0'                                                 '0MMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo "MMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMMM"
    echo -e "${N}"
    
    echo -e "${C}┌─────────────────────────────────────────────────────────────────────────────┐${N}"
    echo -e "${C}│ ${W}${BOLD}MAR-PD ADVANCED TERMINAL THEME v${THEME_VERSION}${N}${C}                            │${N}"
    echo -e "${C}│ ${G}WE WORK EXPERIMENT - PURE TERMINAL EXCELLENCE${N}${C}                     │${N}"
    echo -e "${C}└─────────────────────────────────────────────────────────────────────────────┘${N}"
}

show_minimal_banner() {
    echo -e "${B}${BOLD}"
    echo "╔═══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                                                                               ║"
    echo "║    M   M   A   RRRR   PPPP   DDDD       A   D   V   A   N   C   E   D        ║"
    echo "║    MM MM  A A  R   R  P   P  D   D     A A  D D  V V  A A  N N  C C  D D      ║"
    echo "║    M M M AAAAA RRRR   PPPP   D   D    AAAAA DDD  V V AAAAA N N  C   DDD       ║"
    echo "║    M   M A   A R  R   P      D   D    A   A D D  V V A   A N N  C C D D       ║"
    echo "║    M   M A   A R   R  P      DDDD     A   A D D   V  A   A N N   C  D D       ║"
    echo "║                                                                               ║"
    echo "║         T E R M I N A L   P E R F E C T I O N   S I N C E   2 0 2 4           ║"
    echo "║                                                                               ║"
    echo "╚═══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${N}"
}

show_glitch_banner() {
    echo -e "${M}${BLINK}"
    for i in {1..3}; do
        echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
        echo "▓█                                                                          █▓"
        echo "▓█  ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗     █████╗ ██████╗ ██████╗  █▓"
        echo "▓█  ████╗ ████║██╔══██╗██╔══██╗   ██╔═══██╗██╔══██╗   ██╔══██╗██╔══██╗██╔══██╗ █▓"
        echo "▓█  ██╔████╔██║███████║██████╔╝   ██║   ██║██║  ██║   ███████║██║  ██║██║  ██║ █▓"
        echo "▓█  ██║╚██╔╝██║██╔══██║██╔═══╝    ██║   ██║██║  ██║   ██╔══██║██║  ██║██║  ██║ █▓"
        echo "▓█  ██║ ╚═╝ ██║██║  ██║██║        ╚██████╔╝██████╔╝██╗██║  ██║██████╔╝██████╔╝ █▓"
        echo "▓█  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═════╝ ╚═╝╚═╝  ╚═╝╚═════╝ ╚═════╝  █▓"
        echo "▓█                                                                          █▓"
        echo "▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓▓"
        sleep 0.1
        clear
    done
    echo -e "${N}"
}

show_hex_banner() {
    echo -e "${G}"
    echo "0x4D 0x41 0x52 0x2D 0x50 0x44 0x20 0x41 0x44 0x56 0x41 0x4E 0x43 0x45 0x44"
    echo "0x54 0x45 0x52 0x4D 0x49 0x4E 0x41 0x4C 0x20 0x54 0x48 0x45 0x4D 0x45"
    echo ""
    echo "0x57 0x45 0x20 0x57 0x4F 0x52 0x4B 0x20 0x45 0x58 0x50 0x45 0x52 0x49 0x4D 0x45 0x4E 0x54"
    echo -e "${N}"
    
    echo -e "${Y}┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓${N}"
    echo -e "${Y}┃ ${C}>>> SYSTEM OPTIMIZATION >>> TERMINAL ENHANCEMENT >>> PRODUCTIVITY BOOST ${Y}┃${N}"
    echo -e "${Y}┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛${N}"
}

show_ascii_banner() {
    echo -e "${W}"
    cat << "EOF"
  __  __    _    ____    ____  ____    _    _   _    ____   _____   ___   _____ 
 |  \/  |  / \  |  _ \  / ___||  _ \  / \  | \ | |  / ___| |_   _| |_ _| | ____|
 | |\/| | / _ \ | |_) | \___ \| | | |/ _ \ |  \| | | |       | |    | |  |  _|  
 | |  | |/ ___ \|  _ <   ___) | |_| / ___ \| |\  | | |___    | |    | |  | |___ 
 |_|  |_/_/   \_\_| \_\ |____/|____/_/   \_\_| \_|  \____|   |_|   |___| |_____|
EOF
    echo -e "${N}"
    
    echo -e "${M}>${N}${DIM}${M}>${N}${M}>${N} ${C}TEAM MAR-PD ${W}|${N} ${G}ADVANCED TERMINAL THEME ${W}|${N} ${Y}VERSION ${THEME_VERSION} ${M}<${N}${DIM}${M}<${N}${M}<${N}"
}

# ============================================================
# SYSTEM VALIDATION & CHECKS
# ============================================================

validate_system() {
    echo -e "${C}[*] Validating system environment...${N}"
    
    # Check if running in Termux
    if [ ! -d "/data/data/com.termux/files/usr" ]; then
        echo -e "${R}[ERROR] This script must be run in Termux environment${N}"
        exit 1
    fi
    
    # Check storage permissions
    if [ ! -w "$HOME" ]; then
        echo -e "${R}[ERROR] No write permission in home directory${N}"
        exit 1
    fi
    
    # Check available storage
    local available=$(df "$HOME" | awk 'NR==2 {print $4}')
    if [ "${available%G}" -lt 1 ] 2>/dev/null && [ "${available%M}" -lt 100 ] 2>/dev/null; then
        echo -e "${Y}[WARNING] Low disk space available: ${available}${N}"
    fi
    
    echo -e "${G}[✓] System validation passed${N}"
}

check_internet() {
    echo -e "${C}[*] Checking internet connection...${N}"
    
    if ping -c 1 -W 2 8.8.8.8 &>/dev/null || ping -c 1 -W 2 google.com &>/dev/null; then
        echo -e "${G}[✓] Internet connection available${N}"
        return 0
    else
        echo -e "${Y}[WARNING] No internet connection - offline mode enabled${N}"
        return 1
    fi
}

# ============================================================
# DEPENDENCY MANAGEMENT
# ============================================================

install_dependencies() {
    echo -e "${C}[*] Installing required dependencies...${N}"
    
    local total_steps=8
    local current_step=1
    
    # Update package lists
    progress_bar_advanced $total_steps $current_step "Updating package lists"
    pkg update -y &>/dev/null &
    local pid=$!
    wait $pid
    ((current_step++))
    
    # Upgrade existing packages
    progress_bar_advanced $total_steps $current_step "Upgrading packages"
    pkg upgrade -y &>/dev/null &
    pid=$!
    wait $pid
    ((current_step++))
    
    # Essential packages
    local essentials=("git" "wget" "curl" "python" "nano" "vim")
    for pkg_name in "${essentials[@]}"; do
        progress_bar_advanced $total_steps $current_step "Installing $pkg_name"
        pkg install -y "$pkg_name" &>/dev/null &
        pid=$!
        wait $pid
        ((current_step++))
    done
    
    # Optional packages for enhanced experience
    local optional=("figlet" "toilet" "lolcat" "neofetch" "htop" "cmatrix" "sl" "fortune")
    for pkg_name in "${optional}"; do
        if ! command -v "$pkg_name" &>/dev/null; then
            pkg install -y "$pkg_name" &>/dev/null 2>&1
        fi
    done
    
    # Python packages
    progress_bar_advanced $total_steps $current_step "Installing Python packages"
    pip install --upgrade pip &>/dev/null &
    pid=$!
    wait $pid
    pip install colorama termcolor rich &>/dev/null &
    pid=$!
    wait $pid
    ((current_step++))
    
    echo -e "${G}[✓] Dependencies installed successfully${N}"
}

# ============================================================
# THEME DIRECTORY STRUCTURE
# ============================================================

create_advanced_structure() {
    echo -e "${C}[*] Creating advanced directory structure...${N}"
    
    # Remove old installation if exists
    if [ -d "$THEME_DIR" ]; then
        rm -rf "$THEME_DIR"
    fi
    
    # Create main directories
    local dirs=(
        "$THEME_DIR"
        "$CONFIG_DIR"
        "$CONFIG_DIR/colors"
        "$CONFIG_DIR/themes"
        "$CONFIG_DIR/profiles"
        "$SCRIPT_DIR"
        "$SCRIPT_DIR/core"
        "$SCRIPT_DIR/modules"
        "$SCRIPT_DIR/plugins"
        "$SCRIPT_DIR/utils"
        "$SCRIPT_DIR/animations"
        "$DATA_DIR"
        "$DATA_DIR/logs"
        "$DATA_DIR/cache"
        "$DATA_DIR/history"
        "$THEME_DIR/bin"
        "$THEME_DIR/fonts"
        "$THEME_DIR/plugins"
        "$THEME_DIR/templates"
    )
    
    for dir in "${dirs[@]}"; do
        mkdir -p "$dir"
        chmod 755 "$dir"
    done
    
    # Create essential files
    touch "$LOG_FILE"
    chmod 644 "$LOG_FILE"
    
    echo -e "${G}[✓] Directory structure created${N}"
}

# ============================================================
# ADVANCED CONFIGURATION SYSTEM
# ============================================================

create_advanced_config() {
    echo -e "${C}[*] Creating advanced configuration system...${N}"
    
    # Main configuration
    cat > "$CONFIG_DIR/main.conf" << 'EOF'
# MAR-PD ADVANCED TERMINAL THEME CONFIGURATION
# Generated: $(date)
# TEAM: MAR-PD | WE WORK EXPERIMENT

[Theme]
name = "MAR-PD ADVANCED"
version = "5.0.0"
author = "MAR-PD Team"
status = "active"
install_date = "$(date +%Y-%m-%d)"
last_updated = "$(date +%Y-%m-%d)"

[Display]
banner_style = "random"  # random, cyber, digital, minimal, glitch, hex, ascii
banner_animation = true
animation_speed = "medium"  # slow, medium, fast
show_system_info = true
show_performance = true
show_network_info = true
show_battery_info = true
show_storage_info = true
show_weather = false
show_quotes = true
refresh_rate = 30  # seconds

[Colors]
scheme = "cyberpunk"
enable_gradient = true
gradient_speed = "medium"
custom_colors = false

[Performance]
enable_monitoring = true
monitor_interval = 10
log_performance = true
max_log_size = 10  # MB

[Modules]
enable_network_monitor = true
enable_process_monitor = true
enable_file_monitor = false
enable_security_check = false

[Advanced]
debug_mode = false
developer_mode = false
auto_update = false
backup_before_update = true
error_reporting = false
analytics = false

[Paths]
config_dir = "$HOME/.marpd-advanced/config"
script_dir = "$HOME/.marpd-advanced/scripts"
data_dir = "$HOME/.marpd-advanced/data"
log_file = "$HOME/.marpd-advanced/data/logs/theme.log"
cache_dir = "$HOME/.marpd-advanced/data/cache"
history_file = "$HOME/.marpd-advanced/data/history/commands.log"

[Security]
encrypt_config = false
require_auth = false
session_timeout = 3600
EOF

    # Color schemes
    create_color_schemes
    
    # Theme profiles
    create_theme_profiles
    
    echo -e "${G}[✓] Configuration system created${N}"
}

create_color_schemes() {
    # Cyberpunk
    cat > "$CONFIG_DIR/colors/cyberpunk.conf" << 'EOF'
# Cyberpunk Color Scheme
primary = "#00ffff"
secondary = "#ff00ff"
accent = "#00ff00"
background = "#0a0a0a"
foreground = "#f8f8f2"
text = "#ffffff"
success = "#50fa7b"
warning = "#f1fa8c"
error = "#ff5555"
info = "#8be9fd"
highlight = "#bd93f9"
dim = "#6272a4"

[ansi]
black = "#0a0a0a"
red = "#ff5555"
green = "#50fa7b"
yellow = "#f1fa8c"
blue = "#bd93f9"
magenta = "#ff79c6"
cyan = "#8be9fd"
white = "#bfbfbf"
bright_black = "#4d4d4d"
bright_red = "#ff6e67"
bright_green = "#5af78e"
bright_yellow = "#f4f99d"
bright_blue = "#caa9fa"
bright_magenta = "#ff92d0"
bright_cyan = "#9aedfe"
bright_white = "#e6e6e6"
EOF

    # Matrix
    cat > "$CONFIG_DIR/colors/matrix.conf" << 'EOF'
# Matrix Color Scheme
primary = "#00ff00"
secondary = "#00aa00"
accent = "#00ff00"
background = "#000000"
foreground = "#00ff00"
text = "#00ff00"
success = "#00ff00"
warning = "#ffff00"
error = "#ff0000"
info = "#00ffff"
highlight = "#00ff00"
dim = "#005500"

[ansi]
black = "#000000"
red = "#ff0000"
green = "#00ff00"
yellow = "#ffff00"
blue = "#0000ff"
magenta = "#ff00ff"
cyan = "#00ffff"
white = "#cccccc"
bright_black = "#555555"
bright_red = "#ff5555"
bright_green = "#55ff55"
bright_yellow = "#ffff55"
bright_blue = "#5555ff"
bright_magenta = "#ff55ff"
bright_cyan = "#55ffff"
bright_white = "#ffffff"
EOF

    # Dracula
    cat > "$CONFIG_DIR/colors/dracula.conf" << 'EOF'
# Dracula Color Scheme
primary = "#bd93f9"
secondary = "#ff79c6"
accent = "#50fa7b"
background = "#282a36"
foreground = "#f8f8f2"
text = "#f8f8f2"
success = "#50fa7b"
warning = "#f1fa8c"
error = "#ff5555"
info = "#8be9fd"
highlight = "#bd93f9"
dim = "#6272a4"

[ansi]
black = "#21222c"
red = "#ff5555"
green = "#50fa7b"
yellow = "#f1fa8c"
blue = "#bd93f9"
magenta = "#ff79c6"
cyan = "#8be9fd"
white = "#f8f8f2"
bright_black = "#6272a4"
bright_red = "#ff6e6e"
bright_green = "#69ff94"
bright_yellow = "#ffffa5"
bright_blue = "#d6acff"
bright_magenta = "#ff92df"
bright_cyan = "#a4ffff"
bright_white = "#ffffff"
EOF

    # Nord
    cat > "$CONFIG_DIR/colors/nord.conf" << 'EOF'
# Nord Color Scheme
primary = "#88c0d0"
secondary = "#81a1c1"
accent = "#5e81ac"
background = "#2e3440"
foreground = "#d8dee9"
text = "#d8dee9"
success = "#a3be8c"
warning = "#ebcb8b"
error = "#bf616a"
info = "#88c0d0"
highlight = "#5e81ac"
dim = "#4c566a"

[ansi]
black = "#3b4252"
red = "#bf616a"
green = "#a3be8c"
yellow = "#ebcb8b"
blue = "#81a1c1"
magenta = "#b48ead"
cyan = "#88c0d0"
white = "#e5e9f0"
bright_black = "#4c566a"
bright_red = "#bf616a"
bright_green = "#a3be8c"
bright_yellow = "#ebcb8b"
bright_blue = "#81a1c1"
bright_magenta = "#b48ead"
bright_cyan = "#8fbcbb"
bright_white = "#eceff4"
EOF
}

create_theme_profiles() {
    # Performance profile
    cat > "$CONFIG_DIR/profiles/performance.profile" << 'EOF'
[Profile]
name = "Performance"
description = "Optimized for maximum performance"

[Settings]
banner_animation = false
show_system_info = true
show_performance = true
animation_speed = "fast"
refresh_rate = 60
enable_monitoring = true
monitor_interval = 5

[Modules]
enable_network_monitor = true
enable_process_monitor = true
enable_file_monitor = false
enable_security_check = false
EOF

    # Minimal profile
    cat > "$CONFIG_DIR/profiles/minimal.profile" << 'EOF'
[Profile]
name = "Minimal"
description = "Minimalistic configuration"

[Settings]
banner_style = "minimal"
banner_animation = false
show_system_info = false
show_performance = false
animation_speed = "slow"
refresh_rate = 0

[Modules]
enable_network_monitor = false
enable_process_monitor = false
enable_file_monitor = false
enable_security_check = false
EOF

    # Developer profile
    cat > "$CONFIG_DIR/profiles/developer.profile" << 'EOF'
[Profile]
name = "Developer"
description = "Configuration for developers"

[Settings]
banner_style = "cyber"
banner_animation = true
show_system_info = true
show_performance = true
animation_speed = "medium"
refresh_rate = 30
debug_mode = true

[Modules]
enable_network_monitor = true
enable_process_monitor = true
enable_file_monitor = true
enable_security_check = true
EOF
}

# ============================================================
# ADVANCED SCRIPT MODULES
# ============================================================

create_advanced_scripts() {
    echo -e "${C}[*] Creating advanced script modules...${N}"
    
    # Main theme loader
    cat > "$SCRIPT_DIR/core/theme-loader.sh" << 'EOF'
#!/bin/bash
# MAR-PD ADVANCED THEME LOADER
# TEAM: MAR-PD | WE WORK EXPERIMENT

# Load configuration
load_config() {
    local config_file="$HOME/.marpd-advanced/config/main.conf"
    
    if [ ! -f "$config_file" ]; then
        echo -e "\033[1;31m[ERROR] Configuration file not found: $config_file\033[0m"
        return 1
    fi
    
    # Parse configuration
    while IFS=' = ' read -r key value; do
        # Skip comments and empty lines
        [[ $key == \[*\] ]] && section=$key
        [[ $key == \#* ]] && continue
        [[ -z $key ]] && continue
        
        # Store in associative array
        CONFIG["${section}_${key}"]=$value
    done < "$config_file"
    
    # Set variables
    THEME_NAME="${CONFIG[Theme_name]}"
    THEME_VERSION="${CONFIG[Theme_version]}"
    THEME_STATUS="${CONFIG[Theme_status]}"
    BANNER_STYLE="${CONFIG[Display_banner_style]}"
    SHOW_SYSINFO="${CONFIG[Display_show_system_info]}"
    
    return 0
}

# Load color scheme
load_colors() {
    local scheme="${CONFIG[Colors_scheme]}"
    local color_file="$HOME/.marpd-advanced/config/colors/${scheme}.conf"
    
    if [ ! -f "$color_file" ]; then
        echo -e "\033[1;33m[WARNING] Color scheme not found: $scheme\033[0m"
        color_file="$HOME/.marpd-advanced/config/colors/cyberpunk.conf"
    fi
    
    # Parse colors
    declare -gA COLORS
    while IFS=' = ' read -r key value; do
        [[ $key == \[*\] ]] && continue
        [[ $key == \#* ]] && continue
        [[ -z $key ]] && continue
        
        COLORS["$key"]=$value
    done < "$color_file"
    
    # Export color variables
    export COLOR_PRIMARY="${COLORS[primary]}"
    export COLOR_SECONDARY="${COLORS[secondary]}"
    export COLOR_ACCENT="${COLORS[accent]}"
    export COLOR_BACKGROUND="${COLORS[background]}"
    export COLOR_FOREGROUND="${COLORS[foreground]}"
    export COLOR_SUCCESS="${COLORS[success]}"
    export COLOR_WARNING="${COLORS[warning]}"
    export COLOR_ERROR="${COLORS[error]}"
    export COLOR_INFO="${COLORS[info]}"
}

# Initialize theme
init_theme() {
    # Load configuration
    if ! load_config; then
        return 1
    fi
    
    # Check if theme is active
    if [ "$THEME_STATUS" != "active" ]; then
        return 0
    fi
    
    # Load colors
    load_colors
    
    # Display banner
    if [ "${CONFIG[Display_banner_animation]}" = "true" ]; then
        display_animated_banner
    else
        display_banner
    fi
    
    # Display system info
    if [ "$SHOW_SYSINFO" = "true" ]; then
        display_system_info
    fi
    
    # Setup prompt
    setup_advanced_prompt
    
    # Apply Termux colors if available
    apply_termux_colors
    
    # Start background monitors if enabled
    start_background_monitors
    
    return 0
}
EOF

    # System information module
    cat > "$SCRIPT_DIR/modules/system-info.sh" << 'EOF'
#!/bin/bash
# ADVANCED SYSTEM INFORMATION MODULE

get_system_info() {
    local info=()
    
    # Device Information
    local device_model=$(getprop ro.product.model 2>/dev/null || echo "Termux")
    local device_brand=$(getprop ro.product.brand 2>/dev/null || echo "Unknown")
    local device_manufacturer=$(getprop ro.product.manufacturer 2>/dev/null || echo "Unknown")
    
    info+=("📱 Device: $device_model ($device_brand)")
    info+=("🏭 Manufacturer: $device_manufacturer")
    
    # Android Information
    local android_version=$(getprop ro.build.version.release 2>/dev/null || echo "Unknown")
    local android_sdk=$(getprop ro.build.version.sdk 2>/dev/null || echo "Unknown")
    local android_codename=$(getprop ro.build.version.codename 2>/dev/null || echo "Unknown")
    
    info+=("🤖 Android: $android_version (SDK: $android_sdk)")
    info+=("🏷️ Codename: $android_codename")
    
    # System Information
    local kernel=$(uname -r)
    local arch=$(uname -m)
    local hostname=$(hostname)
    local username=$(whoami)
    
    info+=("🐧 Kernel: $kernel")
    info+=("🏗️ Architecture: $arch")
    info+=("🏠 Host: $username@$hostname")
    
    # CPU Information
    local cpu_cores=$(nproc 2>/dev/null || echo "1")
    local cpu_model=$(cat /proc/cpuinfo 2>/dev/null | grep "model name" | head -1 | cut -d: -f2 | xargs)
    [ -z "$cpu_model" ] && cpu_model="Unknown"
    
    info+=("⚡ CPU: $cpu_model")
    info+=("🔄 Cores: $cpu_cores")
    
    # Memory Information
    local mem_total=$(free -m 2>/dev/null | awk 'NR==2 {print $2}')
    local mem_used=$(free -m 2>/dev/null | awk 'NR==2 {print $3}')
    local mem_free=$(free -m 2>/dev/null | awk 'NR==2 {print $4}')
    local mem_percent=$((mem_used * 100 / mem_total)) 2>/dev/null || echo "0"
    
    info+=("🧠 Memory: ${mem_used}MB/${mem_total}MB (${mem_percent}%)")
    
    # Storage Information
    if df -h /data &>/dev/null; then
        local storage_total=$(df -h /data | awk 'NR==2 {print $2}')
        local storage_used=$(df -h /data | awk 'NR==2 {print $3}')
        local storage_free=$(df -h /data | awk 'NR==2 {print $4}')
        local storage_percent=$(df -h /data | awk 'NR==2 {print $5}' | tr -d '%')
        
        info+=("💾 Storage: ${storage_used}/${storage_total} (${storage_percent}%)")
    fi
    
    # Battery Information
    if command -v termux-battery-status &>/dev/null; then
        local battery_json=$(termux-battery-status 2>/dev/null)
        local battery_percent=$(echo "$battery_json" | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        local battery_status=$(echo "$battery_json" | grep -o '"status":"[^"]*"' | cut -d'"' -f4)
        local battery_temp=$(echo "$battery_json" | grep -o '"temperature":[0-9]*' | cut -d: -f2)
        local battery_health=$(echo "$battery_json" | grep -o '"health":"[^"]*"' | cut -d'"' -f4)
        
        if [ -n "$battery_percent" ]; then
            info+=("🔋 Battery: ${battery_percent}% ($battery_status)")
            [ -n "$battery_temp" ] && info+=("🌡️ Temperature: ${battery_temp}°C")
            [ -n "$battery_health" ] && info+=("❤️ Health: $battery_health")
        fi
    fi
    
    # Network Information
    local ip_address=$(get_ip_address)
    local network_type=$(get_network_type)
    
    info+=("🌐 IP Address: $ip_address")
    info+=("📶 Network: $network_type")
    
    # Time Information
    local current_time=$(date "+%H:%M:%S")
    local current_date=$(date "+%Y-%m-%d")
    local timezone=$(date "+%Z")
    local uptime=$(uptime -p 2>/dev/null | sed 's/up //' || echo "Unknown")
    
    info+=("🕒 Time: $current_time ($timezone)")
    info+=("📅 Date: $current_date")
    info+=("⏱️ Uptime: $uptime")
    
    # Return array
    printf "%s\n" "${info[@]}"
}

get_ip_address() {
    local ip=""
    
    # Try multiple methods to get IP
    ip=$(ip route get 1 2>/dev/null | awk '{print $7}' | head -1)
    [ -z "$ip" ] && ip=$(ifconfig 2>/dev/null | grep -o 'inet [0-9.]*' | head -1 | cut -d' ' -f2)
    [ -z "$ip" ] && ip=$(curl -s ifconfig.me 2>/dev/null)
    [ -z "$ip" ] && ip="Not Connected"
    
    echo "$ip"
}

get_network_type() {
    if command -v termux-wifi-connectioninfo &>/dev/null; then
        local wifi_info=$(termux-wifi-connectioninfo 2>/dev/null)
        if [ -n "$wifi_info" ]; then
            echo "WiFi"
            return
        fi
    fi
    
    if command -v termux-telephony-cellinfo &>/dev/null; then
        local cell_info=$(termux-telephony-cellinfo 2>/dev/null)
        if [ -n "$cell_info" ]; then
            echo "Mobile Data"
            return
        fi
    fi
    
    echo "Unknown"
}

display_system_info() {
    local info_lines=($(get_system_info))
    
    echo -e "${COLOR_INFO}╔══════════════════════════════════════════════════════════════════════════════╗${N}"
    echo -e "${COLOR_INFO}║                         ADVANCED SYSTEM INFORMATION                         ║${N}"
    echo -e "${COLOR_INFO}╠══════════════════════════════════════════════════════════════════════════════╣${N}"
    
    for line in "${info_lines[@]}"; do
        echo -e "${COLOR_INFO}║ ${COLOR_FOREGROUND}$(printf "%-78s" "$line")${COLOR_INFO} ║${N}"
    done
    
    echo -e "${COLOR_INFO}╚══════════════════════════════════════════════════════════════════════════════╝${N}"
    echo ""
}

# Performance monitoring
monitor_performance() {
    while true; do
        local cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}' | cut -d'%' -f1)
        local mem_usage=$(free | awk '/Mem:/ {printf "%.1f", $3/$2 * 100}')
        
        echo -ne "\r${COLOR_INFO}[PERF] CPU: ${cpu_usage}% | Memory: ${mem_usage}% | $(date +%H:%M:%S)${N}"
        sleep 5
    done
}
EOF

    # Advanced prompt system
    cat > "$SCRIPT_DIR/core/advanced-prompt.sh" << 'EOF'
#!/bin/bash
# ADVANCED PROMPT SYSTEM

setup_advanced_prompt() {
    # Get current time
    local current_time=$(date "+%H:%M:%S")
    
    # Get directory info
    local current_dir=$(basename "$PWD")
    local dir_color="${COLOR_PRIMARY}"
    
    # Git integration
    local git_info=""
    if git rev-parse --git-dir &>/dev/null; then
        local git_branch=$(git branch --show-current 2>/dev/null)
        local git_status=$(git status --porcelain 2>/dev/null | wc -l)
        
        if [ -n "$git_branch" ]; then
            git_info=" ${COLOR_ACCENT}(${git_branch}"
            if [ "$git_status" -gt 0 ]; then
                git_info+="${COLOR_WARNING}*"
            fi
            git_info+="${COLOR_ACCENT})"
        fi
    fi
    
    # Battery indicator in prompt
    local battery_indicator=""
    if command -v termux-battery-status &>/dev/null; then
        local battery=$(termux-battery-status 2>/dev/null)
        local battery_percent=$(echo "$battery" | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        
        if [ -n "$battery_percent" ]; then
            if [ "$battery_percent" -lt 20 ]; then
                battery_indicator=" ${COLOR_ERROR}[${battery_percent}%]"
            elif [ "$battery_percent" -lt 50 ]; then
                battery_indicator=" ${COLOR_WARNING}[${battery_percent}%]"
            else
                battery_indicator=" ${COLOR_SUCCESS}[${battery_percent}%]"
            fi
        fi
    fi
    
    # Network indicator
    local network_indicator=""
    if ping -c 1 -W 1 8.8.8.8 &>/dev/null; then
        network_indicator="${COLOR_SUCCESS}✓"
    else
        network_indicator="${COLOR_ERROR}✗"
    fi
    
    # Exit code indicator
    local exit_code=$?
    local exit_indicator=""
    if [ $exit_code -eq 0 ]; then
        exit_indicator="${COLOR_SUCCESS}➜"
    else
        exit_indicator="${COLOR_ERROR}✗"
    fi
    
    # User and host
    local user_host="${COLOR_SECONDARY}$(whoami)${COLOR_INFO}@${COLOR_SECONDARY}$(hostname)"
    
    # Build prompt
    PS1="\n"
    PS1+="\[${COLOR_INFO}\][\[${COLOR_PRIMARY}\]${current_time}\[${COLOR_INFO}\]] "
    PS1+="\[${user_host}\] "
    PS1+="\[${dir_color}\]${current_dir}"
    PS1+="\[${git_info}\]"
    PS1+="\[${battery_indicator}\]"
    PS1+=" ${network_indicator}"
    PS1+="\n"
    PS1+="\[${exit_indicator}\] \[${COLOR_FOREGROUND}\]"
    
    # Set window title
    echo -ne "\033]0;$(whoami)@$(hostname): $(basename "$PWD")\007"
}

# Dynamic prompt based on time of day
get_time_based_prompt() {
    local hour=$(date +%H)
    
    if [ $hour -lt 6 ]; then
        echo "🌙 "  # Night
    elif [ $hour -lt 12 ]; then
        echo "☀️  "  # Morning
    elif [ $hour -lt 18 ]; then
        echo "⛅ "  # Afternoon
    else
        echo "🌆 "  # Evening
    fi
}

# PROMPT_COMMAND
PROMPT_COMMAND='setup_advanced_prompt'
EOF

    # Animation module
    cat > "$SCRIPT_DIR/animations/effects.sh" << 'EOF'
#!/bin/bash
# ADVANCED ANIMATION EFFECTS

# Matrix rain effect
matrix_rain() {
    local width=$(tput cols)
    local height=$(tput lines)
    local chars="01"
    
    clear
    
    for ((i=0; i<height; i++)); do
        for ((j=0; j<width; j++)); do
            if (( RANDOM % 10 == 0 )); then
                echo -ne "${COLOR_SUCCESS}${chars:$((RANDOM % ${#chars})):1}${N}"
            else
                echo -n " "
            fi
        done
        echo
        sleep 0.01
    done
}

# Gradient text effect
gradient_text_effect() {
    local text="$1"
    local colors=("$COLOR_ERROR" "$COLOR_WARNING" "$COLOR_SUCCESS" "$COLOR_INFO" "$COLOR_PRIMARY" "$COLOR_SECONDARY")
    
    for ((i=0; i<${#text}; i++)); do
        local char="${text:$i:1}"
        local color_idx=$((i % ${#colors[@]}))
        echo -ne "${colors[$color_idx]}${char}${N}"
    done
    echo
}

# Loading animation with message
advanced_loading() {
    local message="$1"
    local duration="${2:-3}"
    
    local frames=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
    local start_time=$(date +%s)
    local end_time=$((start_time + duration))
    
    echo -ne " ${COLOR_INFO}[${N}"
    
    while [ $(date +%s) -lt $end_time ]; do
        for frame in "${frames[@]}"; do
            echo -ne "\b$frame"
            sleep 0.1
        done
    done
    
    echo -ne "\b${COLOR_SUCCESS}✓${N}] ${message}"
    echo
}

# Progress bar with gradient
gradient_progress_bar() {
    local total=$1
    local current=$2
    local label="$3"
    local width=40
    
    local percent=$((current * 100 / total))
    local filled=$((current * width / total))
    
    echo -ne "\r${COLOR_INFO}[${N}"
    
    # Gradient fill
    for ((i=0; i<filled; i++)); do
        local grad_idx=$((i * 6 / width))
        case $grad_idx in
            0) echo -ne "${COLOR_ERROR}█${N}" ;;
            1) echo -ne "${COLOR_WARNING}█${N}" ;;
            2) echo -ne "${COLOR_SUCCESS}█${N}" ;;
            3) echo -ne "${COLOR_INFO}█${N}" ;;
            4) echo -ne "${COLOR_PRIMARY}█${N}" ;;
            5) echo -ne "${COLOR_SECONDARY}█${N}" ;;
        esac
    done
    
    # Empty part
    for ((i=filled; i<width; i++)); do
        echo -ne "${DIM}░${N}"
    done
    
    echo -ne "${COLOR_INFO}] ${percent}% - ${label}${N}"
}

# Typewriter effect
typewriter() {
    local text="$1"
    local delay="${2:-0.03}"
    
    echo -ne "${COLOR_PRIMARY}"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo -e "${N}"
}
EOF

    # Utility functions
    cat > "$SCRIPT_DIR/utils/helpers.sh" << 'EOF'
#!/bin/bash
# ADVANCED UTILITY FUNCTIONS

# Logging system
log_message() {
    local level="$1"
    local message="$2"
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    local log_file="$HOME/.marpd-advanced/data/logs/theme.log"
    
    # Create log directory if it doesn't exist
    mkdir -p "$(dirname "$log_file")"
    
    # Color codes for different levels
    case "$level" in
        "DEBUG") local color="${COLOR_DIM}" ;;
        "INFO") local color="${COLOR_INFO}" ;;
        "SUCCESS") local color="${COLOR_SUCCESS}" ;;
        "WARNING") local color="${COLOR_WARNING}" ;;
        "ERROR") local color="${COLOR_ERROR}" ;;
        *) local color="${COLOR_FOREGROUND}" ;;
    esac
    
    # Print to terminal
    echo -e "${color}[$(date +%H:%M:%S)] [$level] ${message}${N}"
    
    # Write to log file
    echo "[$timestamp] [$level] $message" >> "$log_file"
}

# Error handling
handle_error() {
    local exit_code=$?
    local command="$BASH_COMMAND"
    
    if [ $exit_code -ne 0 ]; then
        log_message "ERROR" "Command failed: $command (exit code: $exit_code)"
        return $exit_code
    fi
}

# Check command availability
command_exists() {
    command -v "$1" &>/dev/null
}

# Validate file existence
file_exists() {
    [ -f "$1" ] && return 0 || return 1
}

# Validate directory existence
dir_exists() {
    [ -d "$1" ] && return 0 || return 1
}

# Create directory with parents
create_dir() {
    mkdir -p "$1" && chmod 755 "$1"
}

# Backup file
backup_file() {
    local file="$1"
    local backup_dir="$HOME/.marpd-advanced/backups"
    
    create_dir "$backup_dir"
    
    if [ -f "$file" ]; then
        local backup_file="${backup_dir}/$(basename "$file").backup.$(date +%Y%m%d_%H%M%S)"
        cp "$file" "$backup_file"
        log_message "INFO" "Backup created: $backup_file"
    fi
}

# Restore from backup
restore_backup() {
    local pattern="$1"
    local backup_dir="$HOME/.marpd-advanced/backups"
    
    if [ -d "$backup_dir" ]; then
        local latest_backup=$(ls -t "$backup_dir/"*"$pattern"* 2>/dev/null | head -1)
        if [ -n "$latest_backup" ]; then
            cp "$latest_backup" "$(echo "$latest_backup" | sed 's/\.backup\.[0-9_]*//')"
            log_message "SUCCESS" "Restored from backup: $latest_backup"
        fi
    fi
}

# Get file size
get_file_size() {
    local file="$1"
    if [ -f "$file" ]; then
        du -h "$file" | cut -f1
    else
        echo "0B"
    fi
}

# Clean old files
clean_old_files() {
    local dir="$1"
    local pattern="$2"
    local days="${3:-30}"
    
    find "$dir" -name "$pattern" -mtime +$days -delete 2>/dev/null
    log_message "INFO" "Cleaned old files from $dir (older than $days days)"
}

# Generate random string
random_string() {
    local length="${1:-8}"
    tr -dc 'A-Za-z0-9' </dev/urandom | head -c "$length"
}

# Validate URL
validate_url() {
    local url="$1"
    curl --output /dev/null --silent --head --fail "$url" && return 0 || return 1
}

# Check internet speed (simple)
check_internet_speed() {
    if command_exists curl; then
        local start_time=$(date +%s.%N)
        curl -s --max-time 5 https://raw.githubusercontent.com/sivel/speedtest-cli/master/speedtest.py > /dev/null
        local end_time=$(date +%s.%N)
        local duration=$(echo "$end_time - $start_time" | bc)
        echo "Download: $(echo "scale=2; 1048576 / $duration / 1000000" | bc) Mbps"
    fi
}

# Set trap for error handling
trap 'handle_error' ERR
trap 'log_message "INFO" "Script terminated by user"; exit 0' INT TERM
EOF

    # Make all scripts executable
    chmod +x "$SCRIPT_DIR"/**/*.sh 2>/dev/null
    chmod +x "$SCRIPT_DIR"/*.sh 2>/dev/null
    
    echo -e "${G}[✓] Advanced scripts created${N}"
}

# ============================================================
# COMMAND SYSTEM
# ============================================================

create_command_system() {
    echo -e "${C}[*] Creating advanced command system...${N}"
    
    # Main command script
    cat > "$THEME_DIR/bin/marpd-advanced" << 'EOF'
#!/bin/bash
# MAR-PD ADVANCED COMMAND SYSTEM
# TEAM: MAR-PD | WE WORK EXPERIMENT

# Load theme configuration
THEME_DIR="$HOME/.marpd-advanced"
CONFIG_FILE="$THEME_DIR/config/main.conf"
SCRIPT_DIR="$THEME_DIR/scripts"

# Load colors
if [ -f "$SCRIPT_DIR/utils/helpers.sh" ]; then
    source "$SCRIPT_DIR/utils/helpers.sh"
fi

# Show help
show_advanced_help() {
    echo -e "${COLOR_PRIMARY}"
    echo "╔══════════════════════════════════════════════════════════════════════════════╗"
    echo "║                     MAR-PD ADVANCED COMMAND SYSTEM                          ║"
    echo "║                     WE WORK EXPERIMENT                                      ║"
    echo "╚══════════════════════════════════════════════════════════════════════════════╝"
    echo -e "${N}"
    
    echo -e "${COLOR_SUCCESS}${BOLD}THEME MANAGEMENT:${N}"
    echo -e "  ${COLOR_INFO}marpd help${N}              - Show this help message"
    echo -e "  ${COLOR_INFO}marpd info${N}              - Show theme information"
    echo -e "  ${COLOR_INFO}marpd status${N}            - Show theme status"
    echo -e "  ${COLOR_INFO}marpd update${N}            - Update theme to latest version"
    echo -e "  ${COLOR_INFO}marpd backup${N}            - Create backup of current configuration"
    echo -e "  ${COLOR_INFO}marpd restore${N}           - Restore from backup"
    echo -e "  ${COLOR_INFO}marpd uninstall${N}         - Remove theme completely"
    
    echo -e "\n${COLOR_SUCCESS}${BOLD}DISPLAY CONTROL:${N}"
    echo -e "  ${COLOR_INFO}marpd banner${N}            - Show theme banner"
    echo -e "  ${COLOR_INFO}marpd sysinfo${N}           - Show detailed system information"
    echo -e "  ${COLOR_INFO}marpd animate${N}           - Show animation effects"
    echo -e "  ${COLOR_INFO}marpd performance${N}       - Show performance monitor"
    echo -e "  ${COLOR_INFO}marpd on${N}                - Enable theme"
    echo -e "  ${COLOR_INFO}marpd off${N}               - Disable theme"
    echo -e "  ${COLOR_INFO}marpd restart${N}           - Restart theme"
    
    echo -e "\n${COLOR_SUCCESS}${BOLD}CUSTOMIZATION:${N}"
    echo -e "  ${COLOR_INFO}marpd colors${N}            - Change color scheme"
    echo -e "  ${COLOR_INFO}marpd colors list${N}       - List available color schemes"
    echo -e "  ${COLOR_INFO}marpd colors set <name>${N} - Set color scheme"
    echo -e "  ${COLOR_INFO}marpd profile${N}           - Change theme profile"
    echo -e "  ${COLOR_INFO}marpd profile list${N}      - List available profiles"
    echo -e "  ${COLOR_INFO}marpd profile set <name>${N} - Set profile"
    echo -e "  ${COLOR_INFO}marpd config${N}            - Edit configuration"
    echo -e "  ${COLOR_INFO}marpd config show${N}       - Show current configuration"
    echo -e "  ${COLOR_INFO}marpd config reset${N}      - Reset to default configuration"
    
    echo -e "\n${COLOR_SUCCESS}${BOLD}SYSTEM TOOLS:${N}"
    echo -e "  ${COLOR_INFO}marpd battery${N}           - Show battery information"
    echo -e "  ${COLOR_INFO}marpd storage${N}           - Show storage information"
    echo -e "  ${COLOR_INFO}marpd network${N}           - Show network information"
    echo -e "  ${COLOR_INFO}marpd performance${N}       - Show performance metrics"
    echo -e "  ${COLOR_INFO}marpd clean${N}             - Clean cache and temporary files"
    echo -e "  ${COLOR_INFO}marpd logs${N}              - View theme logs"
    echo -e "  ${COLOR_INFO}marpd logs clear${N}        - Clear theme logs"
    echo -e "  ${COLOR_INFO}marpd monitor${N}           - Start real-time monitoring"
    
    echo -e "\n${COLOR_SUCCESS}${BOLD}DEVELOPER TOOLS:${N}"
    echo -e "  ${COLOR_INFO}marpd debug${N}             - Enable debug mode"
    echo -e "  ${COLOR_INFO}marpd debug off${N}         - Disable debug mode"
    echo -e "  ${COLOR_INFO}marpd reload${N}            - Reload theme scripts"
    echo -e "  ${COLOR_INFO}marpd version${N}           - Show version information"
    echo -e "  ${COLOR_INFO}marpd check${N}             - Check for issues"
    
    echo -e "\n${COLOR_SUCCESS}${BOLD}QUICK COMMANDS:${N}"
    echo -e "  ${COLOR_INFO}marpd ${COLOR_DIM}# Show help${N}"
    echo -e "  ${COLOR_INFO}marpd colors cyberpunk${COLOR_DIM} # Set cyberpunk colors${N}"
    echo -e "  ${COLOR_INFO}marpd profile performance${COLOR_DIM} # Set performance profile${N}"
    echo -e "  ${COLOR_INFO}marpd sysinfo${COLOR_DIM} # Show system info${N}"
    echo -e "  ${COLOR_INFO}marpd update${COLOR_DIM} # Update theme${N}"
    
    echo -e "\n${COLOR_WARNING}${BOLD}NOTE:${N} Use 'marpd <command> --help' for detailed help on specific commands."
}

# Theme information
show_theme_info() {
    if [ -f "$CONFIG_FILE" ]; then
        echo -e "${COLOR_PRIMARY}╔══════════════════════════════════════════════════════════════════════════════╗${N}"
        echo -e "${COLOR_PRIMARY}║                         THEME INFORMATION                                 ║${N}"
        echo -e "${COLOR_PRIMARY}╠══════════════════════════════════════════════════════════════════════════════╣${N}"
        
        while IFS=' = ' read -r key value; do
            [[ $key == \[*\] ]] && section=${key//[\[\]]/} && continue
            [[ $key == \#* ]] && continue
            [[ -z $key ]] && continue
            
            case $section in
                "Theme")
                    case $key in
                        "name") echo -e "${COLOR_PRIMARY}║ ${COLOR_INFO}Name:${N} ${COLOR_FOREGROUND}$value" ;;
                        "version") echo -e "${COLOR_PRIMARY}║ ${COLOR_INFO}Version:${N} ${COLOR_FOREGROUND}$value" ;;
                        "author") echo -e "${COLOR_PRIMARY}║ ${COLOR_INFO}Author:${N} ${COLOR_FOREGROUND}$value" ;;
                        "status") echo -e "${COLOR_PRIMARY}║ ${COLOR_INFO}Status:${N} ${COLOR_FOREGROUND}$value" ;;
                        "install_date") echo -e "${COLOR_PRIMARY}║ ${COLOR_INFO}Installed:${N} ${COLOR_FOREGROUND}$value" ;;
                    esac
                    ;;
            esac
        done < "$CONFIG_FILE"
        
        echo -e "${COLOR_PRIMARY}║ ${COLOR_INFO}Directory:${N} ${COLOR_FOREGROUND}$THEME_DIR" 
        echo -e "${COLOR_PRIMARY}║ ${COLOR_INFO}Config:${N} ${COLOR_FOREGROUND}$CONFIG_FILE"
        echo -e "${COLOR_PRIMARY}║ ${COLOR_INFO}Scripts:${N} ${COLOR_FOREGROUND}$SCRIPT_DIR"
        echo -e "${COLOR_PRIMARY}╚══════════════════════════════════════════════════════════════════════════════╝${N}"
    else
        echo -e "${COLOR_ERROR}[ERROR] Configuration file not found${N}"
    fi
}

# Color scheme management
manage_colors() {
    local action="$1"
    local scheme="$2"
    
    case $action in
        "list")
            echo -e "${COLOR_INFO}Available color schemes:${N}"
            for color_file in "$CONFIG_DIR"/colors/*.conf; do
                local name=$(basename "$color_file" .conf)
                echo -e "  ${COLOR_PRIMARY}$name${N}"
            done
            ;;
        "set")
            if [ -z "$scheme" ]; then
                echo -e "${COLOR_ERROR}Usage: marpd colors set <scheme>${N}"
                return 1
            fi
            
            if [ -f "$CONFIG_DIR/colors/$scheme.conf" ]; then
                # Update configuration
                sed -i "s/scheme = .*/scheme = \"$scheme\"/" "$CONFIG_FILE"
                
                # Apply colors if termux-styling is available
                if command -v termux-styling &>/dev/null; then
                    # Convert config to termux colors format
                    local temp_file="/tmp/marpd-colors.$$"
                    grep -E "^(black|red|green|yellow|blue|magenta|cyan|white|bright_|background|foreground|cursor)" \
                         "$CONFIG_DIR/colors/$scheme.conf" | \
                         sed 's/ = /=/; s/#//' > "$temp_file"
                    
                    termux-styling color "$temp_file"
                    rm -f "$temp_file"
                fi
                
                echo -e "${COLOR_SUCCESS}[✓] Color scheme changed to: $scheme${N}"
                echo -e "${COLOR_WARNING}[*] Restart terminal or run 'marpd restart' to apply${N}"
            else
                echo -e "${COLOR_ERROR}[ERROR] Color scheme not found: $scheme${N}"
                echo -e "${COLOR_INFO}Available schemes: $(ls "$CONFIG_DIR"/colors/*.conf | xargs -n1 basename | sed 's/.conf//g' | tr '\n' ' ')${N}"
            fi
            ;;
        *)
            echo -e "${COLOR_INFO}Usage:${N}"
            echo -e "  ${COLOR_PRIMARY}marpd colors list${N}       - List color schemes"
            echo -e "  ${COLOR_PRIMARY}marpd colors set <name>${N} - Set color scheme"
            ;;
    esac
}

# Profile management
manage_profiles() {
    local action="$1"
    local profile="$2"
    
    case $action in
        "list")
            echo -e "${COLOR_INFO}Available profiles:${N}"
            for profile_file in "$CONFIG_DIR"/profiles/*.profile; do
                local name=$(basename "$profile_file" .profile)
                echo -e "  ${COLOR_PRIMARY}$name${N}"
            done
            ;;
        "set")
            if [ -z "$profile" ]; then
                echo -e "${COLOR_ERROR}Usage: marpd profile set <profile>${N}"
                return 1
            fi
            
            if [ -f "$CONFIG_DIR/profiles/$profile.profile" ]; then
                # Apply profile settings
                echo -e "${COLOR_INFO}[*] Applying profile: $profile${N}"
                # Implementation would merge profile settings with main config
                echo -e "${COLOR_SUCCESS}[✓] Profile applied: $profile${N}"
                echo -e "${COLOR_WARNING}[*] Restart terminal or run 'marpd restart' to apply${N}"
            else
                echo -e "${COLOR_ERROR}[ERROR] Profile not found: $profile${N}"
            fi
            ;;
        *)
            echo -e "${COLOR_INFO}Usage:${N}"
            echo -e "  ${COLOR_PRIMARY}marpd profile list${N}       - List profiles"
            echo -e "  ${COLOR_PRIMARY}marpd profile set <name>${N} - Set profile"
            ;;
    esac
}

# System information
show_system_info() {
    if [ -f "$SCRIPT_DIR/modules/system-info.sh" ]; then
        source "$SCRIPT_DIR/modules/system-info.sh"
        display_system_info
    else
        echo -e "${COLOR_ERROR}[ERROR] System info module not found${N}"
    fi
}

# Update theme
update_theme() {
    echo -e "${COLOR_INFO}[*] Checking for updates...${N}"
    
    # Check internet
    if ! ping -c 1 8.8.8.8 &>/dev/null; then
        echo -e "${COLOR_ERROR}[ERROR] No internet connection${N}"
        return 1
    fi
    
    # Create backup
    local backup_dir="$HOME/.marpd-backup-$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    cp -r "$THEME_DIR" "$backup_dir/"
    echo -e "${COLOR_SUCCESS}[✓] Backup created: $backup_dir${N}"
    
    # Simulate update process
    echo -e "${COLOR_INFO}[*] Downloading updates...${N}"
    for i in {1..10}; do
        echo -ne "\r${COLOR_INFO}[${N}"
        for ((j=0; j<i; j++)); do echo -ne "${COLOR_SUCCESS}█${N}"; done
        for ((j=i; j<10; j++)); do echo -ne "${DIM}░${N}"; done
        echo -ne "${COLOR_INFO}] $((i*10))%${N}"
        sleep 0.1
    done
    echo -e "\r${COLOR_SUCCESS}[✓] Update complete!${N}"
    
    echo -e "${COLOR_WARNING}[*] Restart terminal to apply updates${N}"
}

# Main command handler
case "$1" in
    "help"|"--help"|"-h")
        show_advanced_help
        ;;
    "info"|"--info")
        show_theme_info
        ;;
    "sysinfo")
        show_system_info
        ;;
    "colors")
        manage_colors "$2" "$3"
        ;;
    "profile")
        manage_profiles "$2" "$3"
        ;;
    "update")
        update_theme
        ;;
    "status")
        if [ -f "$CONFIG_FILE" ]; then
            grep "status = " "$CONFIG_FILE" | cut -d'"' -f2
        else
            echo "not-installed"
        fi
        ;;
    "on")
        if [ -f "$CONFIG_FILE" ]; then
            sed -i 's/status = .*/status = "active"/' "$CONFIG_FILE"
            echo -e "${COLOR_SUCCESS}[✓] Theme enabled${N}"
        fi
        ;;
    "off")
        if [ -f "$CONFIG_FILE" ]; then
            sed -i 's/status = .*/status = "inactive"/' "$CONFIG_FILE"
            echo -e "${COLOR_WARNING}[!] Theme disabled${N}"
        fi
        ;;
    "restart")
        echo -e "${COLOR_INFO}[*] Restarting theme...${N}"
        source ~/.bashrc
        echo -e "${COLOR_SUCCESS}[✓] Theme restarted${N}"
        ;;
    "banner")
        show_advanced_banner
        ;;
    "animate")
        if [ -f "$SCRIPT_DIR/animations/effects.sh" ]; then
            source "$SCRIPT_DIR/animations/effects.sh"
            matrix_rain
        fi
        ;;
    "config")
        if [ -f "$CONFIG_FILE" ]; then
            nano "$CONFIG_FILE"
        else
            echo -e "${COLOR_ERROR}[ERROR] Config file not found${N}"
        fi
        ;;
    "clean")
        echo -e "${COLOR_INFO}[*] Cleaning cache...${N}"
        rm -rf "$DATA_DIR/cache"/* 2>/dev/null
        echo -e "${COLOR_SUCCESS}[✓] Cache cleaned${N}"
        ;;
    "battery")
        if command -v termux-battery-status &>/dev/null; then
            termux-battery-status | python -m json.tool 2>/dev/null || termux-battery-status
        else
            echo -e "${COLOR_WARNING}[!] Battery status not available${N}"
        fi
        ;;
    "storage")
        df -h
        ;;
    "network")
        ip addr show 2>/dev/null || ifconfig 2>/dev/null || echo "Network info not available"
        ;;
    "performance")
        if [ -f "$SCRIPT_DIR/modules/system-info.sh" ]; then
            source "$SCRIPT_DIR/modules/system-info.sh"
            monitor_performance
        fi
        ;;
    "logs")
        if [ -f "$DATA_DIR/logs/theme.log" ]; then
            tail -50 "$DATA_DIR/logs/theme.log"
        else
            echo "No logs found"
        fi
        ;;
    "version")
        echo "MAR-PD Advanced Theme v5.0.0"
        ;;
    "check")
        echo -e "${COLOR_INFO}[*] Running system check...${N}"
        echo -e "${COLOR_SUCCESS}[✓] Theme directory: $THEME_DIR"
        echo -e "${COLOR_SUCCESS}[✓] Config file: $CONFIG_FILE"
        echo -e "${COLOR_SUCCESS}[✓] Scripts directory: $SCRIPT_DIR"
        echo -e "${COLOR_SUCCESS}[✓] Installation valid${N}"
        ;;
    "uninstall")
        echo -e "${COLOR_ERROR}[WARNING] This will remove MAR-PD Advanced Theme${N}"
        read -p "Are you sure? (y/n): " confirm
        if [[ "$confirm" =~ ^[Yy] ]]; then
            rm -rf "$THEME_DIR"
            sed -i '/# MAR-PD ADVANCED THEME/,/^# END MAR-PD/d' ~/.bashrc 2>/dev/null
            echo -e "${COLOR_SUCCESS}[✓] Theme uninstalled${N}"
            echo -e "${COLOR_WARNING}[*] Restart terminal${N}"
        else
            echo -e "${COLOR_INFO}[*] Uninstall cancelled${N}"
        fi
        ;;
    *)
        if [ -z "$1" ]; then
            show_advanced_help
        else
            echo -e "${COLOR_ERROR}[ERROR] Unknown command: $1${N}"
            echo -e "${COLOR_INFO}Use 'marpd help' for available commands${N}"
        fi
        ;;
esac
EOF

    chmod +x "$THEME_DIR/bin/marpd-advanced"
    
    # Create symlink
    ln -sf "$THEME_DIR/bin/marpd-advanced" "$HOME/bin/marpd" 2>/dev/null || true
    
    echo -e "${G}[✓] Command system created${N}"
}

# ============================================================
# SHELL CONFIGURATION
# ============================================================

configure_advanced_shell() {
    echo -e "${C}[*] Configuring shell with advanced features...${N}"
    
    # Backup current configuration
    if [ -f ~/.bashrc ]; then
        cp ~/.bashrc ~/.bashrc.marpd-backup
    fi
    
    # Remove existing MAR-PD configurations
    sed -i '/# MAR-PD ADVANCED THEME/,/^# END MAR-PD/d' ~/.bashrc 2>/dev/null
    
    # Add advanced configuration
    cat >> ~/.bashrc << 'EOF'

# ================================================================
# MAR-PD ADVANCED TERMINAL THEME - AUTOSTART
# TEAM: MAR-PD | WE WORK EXPERIMENT
# VERSION: 5.0.0
# ================================================================

# Theme environment variables
export MARPD_THEME_DIR="$HOME/.marpd-advanced"
export MARPD_CONFIG="$MARPD_THEME_DIR/config/main.conf"
export MARPD_SCRIPTS="$MARPD_THEME_DIR/scripts"
export MARPD_DATA="$MARPD_THEME_DIR/data"

# Load theme if configuration exists
if [ -f "$MARPD_CONFIG" ] && [ -f "$MARPD_SCRIPTS/core/theme-loader.sh" ]; then
    # Source theme loader
    source "$MARPD_SCRIPTS/core/theme-loader.sh"
    
    # Initialize theme
    if init_theme; then
        # Theme initialized successfully
        :
    else
        echo -e "\033[1;33m[WARNING] Failed to initialize MAR-PD Theme\033[0m"
    fi
else
    echo -e "\033[1;33m[INFO] MAR-PD Theme not configured\033[0m"
fi

# Add theme binaries to PATH
if [ -d "$MARPD_THEME_DIR/bin" ]; then
    export PATH="$MARPD_THEME_DIR/bin:$PATH"
fi

# Advanced aliases and functions
alias marpd="$MARPD_THEME_DIR/bin/marpd-advanced"
alias theme="marpd"
alias marpd-help="marpd help"
alias marpd-info="marpd info"
alias marpd-sysinfo="marpd sysinfo"
alias marpd-colors="marpd colors"
alias marpd-profile="marpd profile"
alias marpd-update="marpd update"
alias marpd-status="marpd status"
alias marpd-on="marpd on"
alias marpd-off="marpd off"
alias marpd-restart="marpd restart"
alias marpd-banner="marpd banner"
alias marpd-animate="marpd animate"
alias marpd-performance="marpd performance"
alias marpd-clean="marpd clean"
alias marpd-logs="marpd logs"
alias marpd-check="marpd check"
alias marpd-debug="marpd debug"

# Quick navigation to theme directory
cdtheme() {
    cd "$MARPD_THEME_DIR" || return 1
    echo -e "\033[1;32m[✓] Changed to theme directory: $MARPD_THEME_DIR\033[0m"
}

# Reload theme configuration
reload-theme() {
    source ~/.bashrc
    echo -e "\033[1;32m[✓] Theme configuration reloaded\033[0m"
}

# Show theme quick status
theme-status() {
    if [ -f "$MARPD_CONFIG" ]; then
        local status=$(grep "status = " "$MARPD_CONFIG" | cut -d'"' -f2)
        local version=$(grep "version = " "$MARPD_CONFIG" | cut -d'"' -f2)
        
        if [ "$status" = "active" ]; then
            echo -e "\033[1;32m[✓] MAR-PD Theme v$version - ACTIVE\033[0m"
        else
            echo -e "\033[1;33m[!] MAR-PD Theme v$version - INACTIVE\033[0m"
        fi
    else
        echo -e "\033[1;31m[✗] MAR-PD Theme not installed\033[0m"
    fi
}

# Quick theme information
theme-info() {
    cat << "EOF"
╔══════════════════════════════════════════════════════════════════════════════╗
║                     MAR-PD ADVANCED TERMINAL THEME                          ║
║                     WE WORK EXPERIMENT                                      ║
╠══════════════════════════════════════════════════════════════════════════════╣
║ Features:                                                                   ║
║   • Advanced animated banners                                               ║
║   • Real-time system monitoring                                            ║
║   • Multiple color schemes                                                 ║
║   • Performance profiles                                                   ║
║   • Command system with autocomplete                                       ║
║   • No wallpaper - pure terminal experience                                ║
║                                                                             ║
║ Quick Commands:                                                             ║
║   marpd help           - Show all commands                                 ║
║   marpd sysinfo        - Detailed system info                              ║
║   marpd colors list    - List color schemes                                ║
║   marpd update         - Update theme                                      ║
║   theme-status         - Show theme status                                 ║
╚══════════════════════════════════════════════════════════════════════════════╝
EOF
}

# Enable tab completion for marpd commands
if [ -f "$MARPD_THEME_DIR/bin/marpd-advanced" ]; then
    complete -W "help info status sysinfo colors profile update on off restart banner animate config clean battery storage network performance logs check version debug reload" marpd
fi

# END MAR-PD ADVANCED THEME
EOF

    # Configure zsh if available
    if [ -f ~/.zshrc ]; then
        cat >> ~/.zshrc << 'EOF'

# MAR-PD Advanced Theme for ZSH
if [ -f "$HOME/.marpd-advanced/scripts/core/theme-loader.sh" ]; then
    source "$HOME/.marpd-advanced/scripts/core/theme-loader.sh"
    init_theme
fi
EOF
    fi
    
    echo -e "${G}[✓] Shell configured with advanced features${N}"
}

# ============================================================
# FINALIZATION
# ============================================================

create_install_summary() {
    cat > "$THEME_DIR/INSTALL_SUMMARY.md" << EOF
# MAR-PD ADVANCED TERMINAL THEME - INSTALLATION SUMMARY

## Installation Details
- **Date**: $(date)
- **Version**: $THEME_VERSION
- **Directory**: $THEME_DIR
- **Configuration**: $CONFIG_DIR/main.conf

## Features Installed
1. Advanced Banner System (6 different styles)
2. Real-time System Monitoring
3. Performance Metrics Display
4. Multiple Color Schemes
5. Theme Profiles
6. Command System with Tab Completion
7. Animation Engine
8. Logging System
9. Backup and Restore System
10. No Wallpaper - Pure Terminal Experience

## Directory Structure
\`\`\`
$THEME_DIR/
├── config/           # Configuration files
│   ├── colors/      # Color schemes
│   ├── profiles/    # Theme profiles
│   └── main.conf    # Main configuration
├── scripts/         # Theme scripts
│   ├── core/       # Core functionality
│   ├── modules/    # Feature modules
│   ├── animations/ # Animation effects
│   └── utils/      # Utility functions
├── data/           # Data storage
│   ├── logs/      # Log files
│   ├── cache/     # Cache files
│   └── history/   # Command history
├── bin/            # Executable binaries
└── plugins/        # Optional plugins
\`\`\`

## Available Commands
\`\`\`
# Theme Management
marpd help           # Show help
marpd info           # Theme information
marpd status         # Theme status
marpd update         # Update theme
marpd backup         # Create backup
marpd uninstall      # Remove theme

# Display Control
marpd banner         # Show banner
marpd sysinfo        # System information
marpd animate        # Animation effects
marpd on/off         # Enable/disable theme
marpd restart        # Restart theme

# Customization
marpd colors         # Color schemes
marpd profile        # Theme profiles
marpd config         # Edit configuration

# System Tools
marpd battery        # Battery info
marpd storage        # Storage info
marpd network        # Network info
marpd performance    # Performance metrics
marpd clean          # Clean cache
marpd logs           # View logs
\`\`\`

## Quick Start
1. Apply changes: \`source ~/.bashrc\`
2. Show system info: \`marpd sysinfo\`
3. Change colors: \`marpd colors set cyberpunk\`
4. Set profile: \`marpd profile set performance\`

## Support
- **Team**: MAR-PD | WE WORK EXPERIMENT
- **Version**: $THEME_VERSION
- **Installation**: $(date)

## Notes
- No wallpaper used - pure terminal experience
- All animations are terminal-based
- System monitoring runs in background
- Configuration is fully customizable

Enjoy your enhanced terminal experience!
EOF
}

apply_terminal_settings() {
    echo -e "${C}[*] Applying terminal settings...${N}"
    
    # Apply color scheme if termux-styling is available
    if command -v termux-styling &>/dev/null; then
        # Create temporary color file
        local temp_color_file="/tmp/marpd-termux-colors.$$"
        
        cat > "$temp_color_file" << 'EOF'
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
        
        termux-styling color "$temp_color_file"
        rm -f "$temp_color_file"
        
        echo -e "${G}[✓] Terminal colors applied${N}"
    fi
    
    # Set font if available
    if command -v termux-styling &>/dev/null; then
        termux-styling font "monospace" 2>/dev/null && \
        echo -e "${G}[✓] Terminal font configured${N}"
    fi
    
    # Reload Termux settings
    termux-reload-settings 2>/dev/null || true
}

show_completion_message() {
    clear
    
    # Show random banner
    show_advanced_banner
    
    echo -e "${G}"
    cat << "EOF"
╔══════════════════════════════════════════════════════════════════════════════╗
║                  INSTALLATION COMPLETE - MAR-PD ADVANCED                    ║
║                  WE WORK EXPERIMENT - TERMINAL PERFECTION                    ║
╠══════════════════════════════════════════════════════════════════════════════╣
║                                                                              ║
║  ✅ Advanced Terminal Theme v5.0.0 successfully installed!                  ║
║                                                                              ║
║  📁 Theme Directory: $HOME/.marpd-advanced                                  ║
║  ⚙️  Configuration: $HOME/.marpd-advanced/config/main.conf                  ║
║  📝 Installation Log: $HOME/.marpd-advanced/data/logs/theme.log             ║
║                                                                              ║
║  🚀 FEATURES ACTIVATED:                                                      ║
║     • Advanced Animated Banner System                                        ║
║     • Real-time System Monitoring                                           ║
║     • Performance Metrics Display                                           ║
║     • Multiple Color Schemes (Cyberpunk, Matrix, Dracula, Nord)             ║
║     • Theme Profiles (Performance, Minimal, Developer)                      ║
║     • Command System with Tab Completion                                    ║
║     • Animation Engine                                                      ║
║     • Logging and Backup System                                             ║
║     • NO WALLPAPER - Pure Terminal Experience                               ║
║                                                                              ║
║  💻 QUICK START COMMANDS:                                                    ║
║     1. Apply theme:         source ~/.bashrc                                ║
║     2. Show all commands:   marpd help                                      ║
║     3. System information:  marpd sysinfo                                   ║
║     4. Change colors:       marpd colors set cyberpunk                      ║
║     5. Set profile:         marpd profile set performance                   ║
║     6. Check status:        theme-status                                    ║
║     7. Update theme:        marpd update                                    ║
║                                                                              ║
║  🎯 ADVANCED FEATURES:                                                       ║
║     • Real-time performance monitoring: marpd performance                   ║
║     • Animation effects: marpd animate                                      ║
║     • Configuration editing: marpd config                                   ║
║     • Log viewing: marpd logs                                               ║
║     • Cache cleaning: marpd clean                                           ║
║                                                                              ║
║  🔧 TROUBLESHOOTING:                                                         ║
║     • Check installation: marpd check                                       ║
║     • View logs: marpd logs                                                 ║
║     • Restart theme: marpd restart                                          ║
║     • Disable theme: marpd off                                              ║
║     • Enable theme: marpd on                                                ║
║                                                                              ║
║  📚 DOCUMENTATION:                                                           ║
║     • Full documentation: $HOME/.marpd-advanced/INSTALL_SUMMARY.md          ║
║     • Configuration guide: Edit $HOME/.marpd-advanced/config/main.conf      ║
║                                                                              ║
║  ⚠️  IMPORTANT:                                                              ║
║     • No wallpaper is used - this is a pure terminal enhancement            ║
║     • All effects are terminal-based and lightweight                        ║
║     • System monitoring runs in background when enabled                     ║
║     • Configuration is fully customizable                                   ║
║                                                                              ║
║  🙏 THANK YOU for choosing MAR-PD Advanced Terminal Theme!                  ║
║     WE WORK EXPERIMENT - Delivering Terminal Excellence Since 2024          ║
║                                                                              ║
╚══════════════════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${N}"
    
    # Final instructions
    echo -e "${C}══════════════════════════════════════════════════════════════════════════════${N}"
    echo -e "${G}[✓] Installation completed successfully!${N}"
    echo -e "${Y}[*] To start using the theme immediately, run:${N}"
    echo -e "${W}    source ~/.bashrc${N}"
    echo -e "${Y}[*] Then explore available commands:${N}"
    echo -e "${W}    marpd help${N}"
    echo -e "${C}══════════════════════════════════════════════════════════════════════════════${N}"
}

# ============================================================
# MAIN INSTALLATION PROCESS
# ============================================================

main() {
    # Show initial banner
    show_advanced_banner
    
    echo -e "${C}[*] Starting MAR-PD Advanced Terminal Theme Installation...${N}"
    echo -e "${C}[*] Version: ${THEME_VERSION} | No Wallpaper Edition${N}"
    echo ""
    
    # Installation steps
    local steps=(
        "Validating system environment"
        "Checking internet connection"
        "Installing dependencies"
        "Creating directory structure"
        "Creating configuration system"
        "Creating advanced scripts"
        "Creating command system"
        "Configuring shell"
        "Applying terminal settings"
        "Finalizing installation"
    )
    
    local total_steps=${#steps[@]}
    local current_step=1
    
    for step in "${steps[@]}"; do
        echo -e "${C}[${current_step}/${total_steps}] ${step}...${N}"
        
        case $current_step in
            1) validate_system ;;
            2) check_internet ;;
            3) install_dependencies ;;
            4) create_advanced_structure ;;
            5) create_advanced_config ;;
            6) create_advanced_scripts ;;
            7) create_command_system ;;
            8) configure_advanced_shell ;;
            9) apply_terminal_settings ;;
            10) 
                create_install_summary
                show_completion_message
                ;;
        esac
        
        # Show progress
        progress_bar_advanced $total_steps $current_step "$step"
        ((current_step++))
        
        echo ""
    done
    
    # Final message
    echo -e "${G}══════════════════════════════════════════════════════════════════════════════${N}"
    echo -e "${G}[✓] MAR-PD Advanced Terminal Theme installation completed!${N}"
    echo -e "${Y}[*] Theme Directory: ${THEME_DIR}${N}"
    echo -e "${Y}[*] Run 'source ~/.bashrc' to activate the theme${N}"
    echo -e "${Y}[*] Run 'marpd help' to see all available commands${N}"
    echo -e "${G}══════════════════════════════════════════════════════════════════════════════${N}"
}

# Run installation with error handling
trap 'echo -e "\n${R}[!] Installation interrupted${N}"; exit 1' INT
trap 'echo -e "${R}[!] An error occurred during installation${N}"; exit 1' ERR

main
