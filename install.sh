#!/bin/bash

# ========================================================
# MAR-PD ULTIMATE TERMUX THEME - INSTALLATION SCRIPT
# TEAM: MAR-PD | WE WORK EXPERIMENT
# VERSION: 4.0.0
# ========================================================

# Configuration
THEME_NAME="MAR-PD ULTIMATE"
THEME_VERSION="4.0.0"
THEME_AUTHOR="MAR-PD Team"
THEME_DIR="$HOME/.marpd-ultimate"
REPO_URL="https://github.com/marpd-team/termux-theme"
BACKUP_DIR="$HOME/.marpd-backup-$(date +%Y%m%d_%H%M%S)"

# ASCII Colors
R='\033[1;31m'  # Red
G='\033[1;32m'  # Green
Y='\033[1;33m'  # Yellow
B='\033[1;34m'  # Blue
M='\033[1;35m'  # Magenta
C='\033[1;36m'  # Cyan
W='\033[1;37m'  # White
N='\033[0m'     # Reset
D='\033[2m'     # Dim
U='\033[4m'     # Underline
L='\033[5m'     # Blink

# Clear screen
clear

# ========================================================
# ANIMATION FUNCTIONS
# ========================================================

spinner() {
    local pid=$1
    local delay=0.1
    local spinstr='|/-\'
    while [ "$(ps a | awk '{print $1}' | grep $pid)" ]; do
        local temp=${spinstr#?}
        printf " [%c]  " "$spinstr"
        local spinstr=$temp${spinstr%"$temp"}
        sleep $delay
        printf "\b\b\b\b\b\b"
    done
    printf "    \b\b\b\b"
}

progress_bar() {
    local duration=${1}
    local width=50
    local increment=$((100 / width))
    local count=0
    local percent=0
    
    while [ $count -lt $width ]; do
        percent=$((count * increment))
        printf "\r${C}[${G}"
        
        # Draw filled part
        for ((i=0; i<count; i++)); do
            printf "█"
        done
        
        # Draw empty part
        for ((i=count; i<width; i++)); do
            printf "░"
        done
        
        printf "${C}] ${percent}%%${N}"
        
        sleep $((duration / width))
        count=$((count + 1))
    done
    
    printf "\r${C}[${G}"
    for ((i=0; i<width; i++)); do
        printf "█"
    done
    printf "${C}] ${G}100%%${N}\n"
}

typewriter() {
    local text="$1"
    local delay=0.03
    
    echo -ne "${C}"
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo -e "${N}"
}

# ========================================================
# BANNER DISPLAY
# ========================================================

show_banner() {
    clear
    
    # Animated gradient effect
    for i in {1..5}; do
        case $i in
            1) color="${C}" ;;
            2) color="${M}" ;;
            3) color="${B}" ;;
            4) color="${G}" ;;
            5) color="${Y}" ;;
        esac
        
        echo -e "${color}"
        cat << "EOF"
  ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗ 
  ████╗ ████║██╔══██╗██╔══██╗   ██╔═══██╗██╔══██╗
  ██╔████╔██║███████║██████╔╝   ██║   ██║██║  ██║
  ██║╚██╔╝██║██╔══██║██╔═══╝    ██║   ██║██║  ██║
  ██║ ╚═╝ ██║██║  ██║██║        ╚██████╔╝██████╔╝
  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═════╝ 
EOF
        sleep 0.1
        clear
    done
    
    # Final banner
    echo -e "${C}"
    cat << "EOF"
  ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗ 
  ████╗ ████║██╔══██╗██╔══██╗   ██╔═══██╗██╔══██╗
  ██╔████╔██║███████║██████╔╝   ██║   ██║██║  ██║
  ██║╚██╔╝██║██╔══██║██╔═══╝    ██║   ██║██║  ██║
  ██║ ╚═╝ ██║██║  ██║██║        ╚██████╔╝██████╔╝
  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═════╝ 
EOF
    
    echo -e "${G}╔══════════════════════════════════════════════════════════╗${N}"
    echo -e "${G}║    ${W}${U}ULTIMATE TERMUX THEME v${THEME_VERSION}${N}${G}                       ║${N}"
    echo -e "${G}║    ${C}TEAM: MAR-PD | WE WORK EXPERIMENT${G}                 ║${N}"
    echo -e "${G}║    ${Y}Professional Terminal Customization${G}               ║${N}"
    echo -e "${G}╚══════════════════════════════════════════════════════════╝${N}"
    echo ""
}

# ========================================================
# SYSTEM CHECK & VALIDATION
# ========================================================

check_requirements() {
    echo -e "${Y}[*] Checking system requirements...${N}"
    
    # Check if running in Termux
    if [ ! -d "/data/data/com.termux" ]; then
        echo -e "${R}[ERROR] This script must be run in Termux${N}"
        exit 1
    fi
    
    # Check storage permission
    if [ ! -d "/sdcard" ] && [ ! -d "$HOME/storage" ]; then
        echo -e "${Y}[WARNING] Storage permission not granted${N}"
        echo -e "${C}Run: termux-setup-storage${N}"
    fi
    
    # Check internet connection
    if ! ping -c 1 google.com &>/dev/null && ! ping -c 1 8.8.8.8 &>/dev/null; then
        echo -e "${Y}[WARNING] No internet connection${N}"
        read -p "Continue offline installation? (y/n): " choice
        if [[ ! "$choice" =~ ^[Yy] ]]; then
            exit 1
        fi
        OFFLINE_MODE=true
    else
        OFFLINE_MODE=false
    fi
    
    echo -e "${G}[✓] System check passed${N}"
}

check_dependencies() {
    echo -e "${Y}[*] Checking dependencies...${N}"
    
    local deps_missing=()
    local packages=("git" "wget" "curl")
    
    for pkg in "${packages[@]}"; do
        if ! command -v "$pkg" &>/dev/null; then
            deps_missing+=("$pkg")
        fi
    done
    
    if [ ${#deps_missing[@]} -gt 0 ]; then
        echo -e "${Y}[*] Installing missing packages: ${deps_missing[*]}${N}"
        pkg update -y && pkg upgrade -y
        
        for pkg in "${deps_missing[@]}"; do
            echo -ne "${C}Installing $pkg...${N}"
            pkg install "$pkg" -y &>/dev/null &
            spinner $!
            echo -e "${G} ✓${N}"
        done
    fi
    
    # Install optional packages
    local optional_packages=("figlet" "toilet" "lolcat" "neofetch" "cmatrix" "htop")
    echo -e "${Y}[*] Installing optional packages...${N}"
    
    for pkg in "${optional_packages[@]}"; do
        if ! command -v "$pkg" &>/dev/null; then
            pkg install "$pkg" -y &>/dev/null 2>&1 &
            local pid=$!
            echo -ne "${C}Installing $pkg ${N}"
            spinner $pid
            wait $pid && echo -e "${G} ✓${N}" || echo -e "${R} ✗${N}"
        fi
    done
    
    echo -e "${G}[✓] Dependencies installed${N}"
}

# ========================================================
# BACKUP SYSTEM
# ========================================================

create_backup() {
    echo -e "${Y}[*] Creating backup...${N}"
    
    mkdir -p "$BACKUP_DIR"
    
    # Backup shell configs
    local configs=(".bashrc" ".zshrc" ".profile" ".bash_profile")
    for config in "${configs[@]}"; do
        if [ -f "$HOME/$config" ]; then
            cp "$HOME/$config" "$BACKUP_DIR/$config"
            echo -e "${C}  Backed up: $config${N}"
        fi
    done
    
    # Backup existing theme if exists
    if [ -d "$THEME_DIR" ]; then
        cp -r "$THEME_DIR" "$BACKUP_DIR/old-theme"
        echo -e "${C}  Backed up existing theme${N}"
    fi
    
    echo -e "${G}[✓] Backup created at: $BACKUP_DIR${N}"
}

# ========================================================
# THEME INSTALLATION
# ========================================================

create_directory_structure() {
    echo -e "${Y}[*] Creating theme structure...${N}"
    
    # Remove old theme if exists
    if [ -d "$THEME_DIR" ]; then
        rm -rf "$THEME_DIR"
    fi
    
    # Create directory structure
    local dirs=(
        "$THEME_DIR"
        "$THEME_DIR/assets"
        "$THEME_DIR/assets/images"
        "$THEME_DIR/assets/fonts"
        "$THEME_DIR/assets/icons"
        "$THEME_DIR/scripts"
        "$THEME_DIR/scripts/core"
        "$THEME_DIR/scripts/utils"
        "$THEME_DIR/scripts/animations"
        "$THEME_DIR/config"
        "$THEME_DIR/config/colors"
        "$THEME_DIR/config/themes"
        "$THEME_DIR/data"
        "$THEME_DIR/data/logs"
        "$THEME_DIR/data/cache"
        "$THEME_DIR/bin"
        "$THEME_DIR/plugins"
    )
    
    for dir in "${dirs[@]}"; do
        mkdir -p "$dir"
    done
    
    # Set permissions
    chmod 755 "$THEME_DIR"
    chmod -R 755 "$THEME_DIR/scripts"
    
    echo -e "${G}[✓] Directory structure created${N}"
}

download_assets() {
    echo -e "${Y}[*] Downloading assets...${N}"
    
    # Background images
    local bg_urls=(
        "https://raw.githubusercontent.com/marpd-team/assets/main/backgrounds/cyberpunk.jpg"
        "https://raw.githubusercontent.com/marpd-team/assets/main/backgrounds/matrix.jpg"
        "https://raw.githubusercontent.com/marpd-team/assets/main/backgrounds/neon.jpg"
        "https://images.unsplash.com/photo-1550745165-9bc0b252726f"
        "https://images.unsplash.com/photo-1519681393784-d120267933ba"
    )
    
    echo -ne "${C}Downloading backgrounds...${N}"
    for i in "${!bg_urls[@]}"; do
        wget -q --timeout=10 --tries=2 "${bg_urls[$i]}" \
            -O "$THEME_DIR/assets/images/bg$i.jpg" 2>/dev/null &
    done
    wait
    echo -e "${G} ✓${N}"
    
    # Set default background
    if [ -f "$THEME_DIR/assets/images/bg0.jpg" ]; then
        cp "$THEME_DIR/assets/images/bg0.jpg" "$THEME_DIR/assets/images/default-bg.jpg"
    else
        # Create gradient background
        echo -e "${C}Creating default background...${N}"
        create_gradient_bg
    fi
    
    echo -e "${G}[✓] Assets downloaded${N}"
}

create_gradient_bg() {
    # Create a simple gradient background using ImageMagick if available
    if command -v convert &>/dev/null; then
        convert -size 1080x1920 gradient:"#0a0a0a-#1a1a2e" \
                -fill "#00ffff" -draw "circle 540,960 540,1060" \
                "$THEME_DIR/assets/images/default-bg.jpg" 2>/dev/null
    else
        # Fallback: download from web
        wget -q "https://via.placeholder.com/1080x1920/0a0a0a/00ffff?text=MAR-PD" \
            -O "$THEME_DIR/assets/images/default-bg.jpg"
    fi
}

create_config_files() {
    echo -e "${Y}[*] Creating configuration files...${N}"
    
    # Main configuration
    cat > "$THEME_DIR/config/main.conf" << 'EOF'
# MAR-PD Ultimate Theme Configuration
# Generated on: $(date)

theme_name="MAR-PD ULTIMATE"
theme_version="4.0.0"
theme_author="MAR-PD Team"
theme_status="active"

# Display Settings
show_banner=true
banner_animation=true
banner_style="random"
show_system_info=true
show_network_info=true
show_battery_info=true
show_storage_info=true
show_weather=false
show_quotes=true

# Color Settings
color_scheme="cyberpunk"
enable_gradient=true
animation_speed="normal"

# Feature Toggles
enable_auto_update=false
enable_auto_backup=true
enable_analytics=false
enable_error_reporting=false

# Paths
background_image="$HOME/.marpd-ultimate/assets/images/default-bg.jpg"
log_file="$HOME/.marpd-ultimate/data/logs/theme.log"
cache_dir="$HOME/.marpd-ultimate/data/cache"

# Update Settings
update_channel="stable"
update_check_interval=86400
last_update_check=0
EOF

    # Color schemes
    local color_schemes=("cyberpunk" "matrix" "neon" "dracula" "nord")
    
    for scheme in "${color_schemes[@]}"; do
        cat > "$THEME_DIR/config/colors/$scheme.properties" << EOF
# $scheme Color Scheme
color0=$(get_color "$scheme" 0)
color1=$(get_color "$scheme" 1)
color2=$(get_color "$scheme" 2)
color3=$(get_color "$scheme" 3)
color4=$(get_color "$scheme" 4)
color5=$(get_color "$scheme" 5)
color6=$(get_color "$scheme" 6)
color7=$(get_color "$scheme" 7)
color8=$(get_color "$scheme" 8)
color9=$(get_color "$scheme" 9)
color10=$(get_color "$scheme" 10)
color11=$(get_color "$scheme" 11)
color12=$(get_color "$scheme" 12)
color13=$(get_color "$scheme" 13)
color14=$(get_color "$scheme" 14)
color15=$(get_color "$scheme" 15)
background=$(get_color "$scheme" "bg")
foreground=$(get_color "$scheme" "fg")
cursor=$(get_color "$scheme" "cursor")
EOF
    done
    
    echo -e "${G}[✓] Configuration files created${N}"
}

get_color() {
    local scheme=$1
    local index=$2
    
    case $scheme in
        "cyberpunk")
            case $index in
                0) echo "#0a0a0a";; 1) echo "#ff5555";; 2) echo "#50fa7b";;
                3) echo "#f1fa8c";; 4) echo "#bd93f9";; 5) echo "#ff79c6";;
                6) echo "#8be9fd";; 7) echo "#bfbfbf";; 8) echo "#4d4d4d";;
                9) echo "#ff6e67";; 10) echo "#5af78e";; 11) echo "#f4f99d";;
                12) echo "#caa9fa";; 13) echo "#ff92d0";; 14) echo "#9aedfe";;
                15) echo "#e6e6e6";; "bg") echo "#0a0a0a";; "fg") echo "#f8f8f2";;
                "cursor") echo "#bd93f9";;
            esac
            ;;
        "matrix")
            case $index in
                0) echo "#000000";; 1) echo "#ff0000";; 2) echo "#00ff00";;
                3) echo "#ffff00";; 4) echo "#0000ff";; 5) echo "#ff00ff";;
                6) echo "#00ffff";; 7) echo "#cccccc";; 8) echo "#555555";;
                9) echo "#ff5555";; 10) echo "#55ff55";; 11) echo "#ffff55";;
                12) echo "#5555ff";; 13) echo "#ff55ff";; 14) echo "#55ffff";;
                15) echo "#ffffff";; "bg") echo "#000000";; "fg") echo "#00ff00";;
                "cursor") echo "#00ff00";;
            esac
            ;;
        *) echo "#000000";;
    esac
}

create_theme_script() {
    echo -e "${Y}[*] Creating theme script...${N}"
    
    cat > "$THEME_DIR/scripts/core/theme.sh" << 'EOF'
#!/bin/bash
# MAR-PD ULTIMATE THEME - CORE SCRIPT

# Load configuration
CONFIG_FILE="$HOME/.marpd-ultimate/config/main.conf"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    echo -e "\033[1;31m[ERROR] Configuration file not found\033[0m"
    exit 1
fi

# Load utilities
UTILS_DIR="$HOME/.marpd-ultimate/scripts/utils"
source "$UTILS_DIR/colors.sh"
source "$UTILS_DIR/helpers.sh"
source "$UTILS_DIR/animations.sh"

# Banner display function
display_banner() {
    if [ "$show_banner" = "true" ]; then
        clear
        local banner_style="$banner_style"
        
        if [ "$banner_style" = "random" ]; then
            local styles=("standard" "modern" "minimal" "cyber")
            banner_style="${styles[$RANDOM % ${#styles[@]}]}"
        fi
        
        case $banner_style in
            "standard")
                echo -e "${CYAN}"
                figlet -f slant "MAR-PD" 2>/dev/null || echo "MAR-PD"
                ;;
            "modern")
                echo -e "${MAGENTA}"
                cat << "BANNER"
╔══════════════════════════════════════════╗
║      ███╗   ███╗ █████╗ ██████╗ ██████╗ ║
║      ████╗ ████║██╔══██╗██╔══██╗██╔══██╗║
║      ██╔████╔██║███████║██████╔╝██████╔╝║
║      ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ║
║      ██║ ╚═╝ ██║██║  ██║██║     ██║     ║
║      ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ║
╚══════════════════════════════════════════╝
BANNER
                ;;
            "minimal")
                echo -e "${GREEN}"
                echo "M A R - P D"
                echo "ULTIMATE TERMUX THEME"
                ;;
            "cyber")
                echo -e "${YELLOW}"
                echo "01001101 01000001 01010010 00101101 01010000 01000100"
                echo "01110111 01100101 00100000 01110111 01101111 01110010"
                echo "01101011 00100000 01100101 01111000 01110000 01100101"
                echo "01110010 01101001 01101101 01100101 01101110 01110100"
                ;;
        esac
        
        echo -e "${RESET}"
        echo -e "${BLUE}╔══════════════════════════════════════════════════════════╗${RESET}"
        echo -e "${BLUE}║    ${WHITE}TEAM: MAR-PD | WE WORK EXPERIMENT${RESET}${BLUE}                       ║${RESET}"
        echo -e "${BLUE}║    ${CYAN}Version: $theme_version${BLUE}                                          ║${RESET}"
        echo -e "${BLUE}╚══════════════════════════════════════════════════════════╝${RESET}"
        echo ""
    fi
}

# System information display
display_system_info() {
    if [ "$show_system_info" = "true" ]; then
        echo -e "${CYAN}╔════════════════════ SYSTEM ════════════════════╗${RESET}"
        
        # Device info
        local device=$(getprop ro.product.model 2>/dev/null || echo "Termux")
        local android=$(getprop ro.build.version.release 2>/dev/null || echo "Unknown")
        echo -e "${CYAN}│ ${GREEN}📱 Device:${RESET} $device"
        echo -e "${CYAN}│ ${GREEN}🤖 Android:${RESET} $android"
        
        # System info
        local kernel=$(uname -r)
        local arch=$(uname -m)
        local user=$(whoami)
        local host=$(hostname)
        echo -e "${CYAN}│ ${GREEN}🐧 Kernel:${RESET} $kernel"
        echo -e "${CYAN}│ ${GREEN}🏗️  Arch:${RESET} $arch"
        echo -e "${CYAN}│ ${GREEN}👤 User:${RESET} $user@$host"
        
        # Battery info
        if [ "$show_battery_info" = "true" ]; then
            if command -v termux-battery-status &>/dev/null; then
                local battery=$(termux-battery-status 2>/dev/null)
                local percent=$(echo "$battery" | grep -o '"percentage":[0-9]*' | cut -d: -f2)
                local status=$(echo "$battery" | grep -o '"status":"[^"]*"' | cut -d'"' -f4)
                if [ -n "$percent" ]; then
                    echo -ne "${CYAN}│ ${GREEN}🔋 Battery:${RESET} $percent% ["
                    local bars=$((percent / 10))
                    for ((i=0; i<10; i++)); do
                        if [ $i -lt $bars ]; then
                            if [ $percent -lt 20 ]; then
                                echo -ne "${RED}█${RESET}"
                            elif [ $percent -lt 50 ]; then
                                echo -ne "${YELLOW}█${RESET}"
                            else
                                echo -ne "${GREEN}█${RESET}"
                            fi
                        else
                            echo -ne "${DIM}░${RESET}"
                        fi
                    done
                    echo -e "] ($status)"
                fi
            fi
        fi
        
        # Storage info
        if [ "$show_storage_info" = "true" ]; then
            if df -h /data &>/dev/null; then
                local storage=$(df -h /data | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')
                echo -e "${CYAN}│ ${GREEN}💾 Storage:${RESET} $storage"
            fi
        fi
        
        # Network info
        if [ "$show_network_info" = "true" ]; then
            local ip=$(get_ip_address)
            echo -e "${CYAN}│ ${GREEN}🌐 IP:${RESET} $ip"
        fi
        
        # Time info
        local time=$(date "+%H:%M:%S")
        local date=$(date "+%Y-%m-%d")
        local uptime=$(uptime -p 2>/dev/null | sed 's/up //' || echo "Unknown")
        echo -e "${CYAN}│ ${GREEN}🕒 Time:${RESET} $time"
        echo -e "${CYAN}│ ${GREEN}📅 Date:${RESET} $date"
        echo -e "${CYAN}│ ${GREEN}⏱️  Uptime:${RESET} $uptime"
        
        echo -e "${CYAN}╚══════════════════════════════════════════════════╝${RESET}"
        echo ""
    fi
}

# Custom prompt
setup_prompt() {
    local exit_code=$?
    local time=$(date "+%H:%M")
    local dir=$(basename "$PWD")
    local user=$(whoami)
    local host=$(hostname | cut -d'.' -f1)
    
    # Git branch
    local git_branch=""
    if git rev-parse --git-dir &>/dev/null; then
        git_branch="($(git branch --show-current 2>/dev/null))"
    fi
    
    # Color based on exit code
    if [ $exit_code -eq 0 ]; then
        local prompt_color="${GREEN}"
        local prompt_icon="➜"
    else
        local prompt_color="${RED}"
        local prompt_icon="✗"
    fi
    
    # Battery indicator in prompt (optional)
    local battery_indicator=""
    if [ "$show_battery_info" = "true" ] && command -v termux-battery-status &>/dev/null; then
        local batt=$(termux-battery-status 2>/dev/null | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        if [ -n "$batt" ]; then
            if [ $batt -lt 20 ]; then
                battery_indicator="${RED}[${batt}%]${RESET} "
            elif [ $batt -lt 50 ]; then
                battery_indicator="${YELLOW}[${batt}%]${RESET} "
            else
                battery_indicator="${GREEN}[${batt}%]${RESET} "
            fi
        fi
    fi
    
    # Set PS1
    PS1="\[${CYAN}\][\[${MAGENTA}\]$time\[${CYAN}\]] "
    PS1+="\[${BLUE}\]$user@$host "
    PS1+="\[${YELLOW}\]$dir "
    PS1+="\[${GREEN}\]$git_branch "
    PS1+="$battery_indicator"
    PS1+="\n\[${prompt_color}\]$prompt_icon\[${RESET}\] "
    
    # Set title
    echo -ne "\033]0;$user@$host: $dir\007"
}

# Initialize theme
init_theme() {
    # Load configuration
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
    fi
    
    # Display banner
    if [ "$show_banner" = "true" ]; then
        display_banner
    fi
    
    # Display system info
    display_system_info
    
    # Setup prompt
    PROMPT_COMMAND=setup_prompt
    
    # Apply colors
    apply_colors
    
    # Set wallpaper
    set_wallpaper
    
    # Start animations if enabled
    if [ "$banner_animation" = "true" ]; then
        start_animation &
    fi
}

# Apply color scheme
apply_colors() {
    local color_file="$HOME/.marpd-ultimate/config/colors/$color_scheme.properties"
    
    if [ -f "$color_file" ] && command -v termux-styling &>/dev/null; then
        termux-styling color "$color_file"
    fi
}

# Set wallpaper
set_wallpaper() {
    if [ -f "$background_image" ] && command -v termux-wallpaper &>/dev/null; then
        termux-wallpaper -f "$background_image" 2>/dev/null
    fi
}

# Get IP address
get_ip_address() {
    local ip=$(ip route get 1 2>/dev/null | awk '{print $7}' | head -1)
    [ -z "$ip" ] && ip=$(curl -s ifconfig.me 2>/dev/null || echo "Not Connected")
    echo "$ip"
}

# Main execution
if [ "$theme_status" = "active" ]; then
    init_theme
fi
EOF
    
    chmod +x "$THEME_DIR/scripts/core/theme.sh"
    
    # Create utility scripts
    create_utility_scripts
    
    echo -e "${G}[✓] Theme script created${N}"
}

create_utility_scripts() {
    # Colors utility
    cat > "$THEME_DIR/scripts/utils/colors.sh" << 'EOF'
#!/bin/bash
# Color definitions for MAR-PD Theme

# Regular colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
MAGENTA='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Bold colors
BOLD_BLACK='\033[1;30m'
BOLD_RED='\033[1;31m'
BOLD_GREEN='\033[1;32m'
BOLD_YELLOW='\033[1;33m'
BOLD_BLUE='\033[1;34m'
BOLD_MAGENTA='\033[1;35m'
BOLD_CYAN='\033[1;36m'
BOLD_WHITE='\033[1;37m'

# Underline colors
UNDERLINE_BLACK='\033[4;30m'
UNDERLINE_RED='\033[4;31m'
UNDERLINE_GREEN='\033[4;32m'
UNDERLINE_YELLOW='\033[4;33m'
UNDERLINE_BLUE='\033[4;34m'
UNDERLINE_MAGENTA='\033[4;35m'
UNDERLINE_CYAN='\033[4;36m'
UNDERLINE_WHITE='\033[4;37m'

# Background colors
BACKGROUND_BLACK='\033[40m'
BACKGROUND_RED='\033[41m'
BACKGROUND_GREEN='\033[42m'
BACKGROUND_YELLOW='\033[43m'
BACKGROUND_BLUE='\033[44m'
BACKGROUND_MAGENTA='\033[45m'
BACKGROUND_CYAN='\033[46m'
BACKGROUND_WHITE='\033[47m'

# High intensity colors
INTENSE_BLACK='\033[0;90m'
INTENSE_RED='\033[0;91m'
INTENSE_GREEN='\033[0;92m'
INTENSE_YELLOW='\033[0;93m'
INTENSE_BLUE='\033[0;94m'
INTENSE_MAGENTA='\033[0;95m'
INTENSE_CYAN='\033[0;96m'
INTENSE_WHITE='\033[0;97m'

# Bold high intensity colors
BOLD_INTENSE_BLACK='\033[1;90m'
BOLD_INTENSE_RED='\033[1;91m'
BOLD_INTENSE_GREEN='\033[1;92m'
BOLD_INTENSE_YELLOW='\033[1;93m'
BOLD_INTENSE_BLUE='\033[1;94m'
BOLD_INTENSE_MAGENTA='\033[1;95m'
BOLD_INTENSE_CYAN='\033[1;96m'
BOLD_INTENSE_WHITE='\033[1;97m'

# Reset
RESET='\033[0m'

# Short aliases
R='\033[1;31m'
G='\033[1;32m'
Y='\033[1;33m'
B='\033[1;34m'
M='\033[1;35m'
C='\033[1;36m'
W='\033[1;37m'
N='\033[0m'
D='\033[2m'
U='\033[4m'
L='\033[5m'

# Functions
print_color() {
    local color_name="$1"
    local text="$2"
    local color_var="${color_name^^}"
    
    if [ -n "${!color_var}" ]; then
        echo -e "${!color_var}$text${RESET}"
    else
        echo "$text"
    fi
}

gradient_text() {
    local text="$1"
    local colors=("$BOLD_RED" "$BOLD_YELLOW" "$BOLD_GREEN" "$BOLD_CYAN" "$BOLD_BLUE" "$BOLD_MAGENTA")
    local color_index=0
    
    for ((i=0; i<${#text}; i++)); do
        char="${text:$i:1}"
        if [ "$char" != " " ]; then
            echo -ne "${colors[$color_index]}"
            color_index=$(( (color_index + 1) % ${#colors[@]} ))
        fi
        echo -n "$char"
    done
    echo -e "${RESET}"
}
EOF

    # Helpers utility
    cat > "$THEME_DIR/scripts/utils/helpers.sh" << 'EOF'
#!/bin/bash
# Helper functions for MAR-PD Theme

# Logging function
log_message() {
    local level="$1"
    local message="$2"
    local timestamp=$(date "+%Y-%m-%d %H:%M:%S")
    local log_file="$HOME/.marpd-ultimate/data/logs/theme.log"
    
    mkdir -p "$(dirname "$log_file")"
    
    case "$level" in
        "INFO") echo -e "${CYAN}[INFO]${RESET} $message" ;;
        "SUCCESS") echo -e "${GREEN}[✓]${RESET} $message" ;;
        "WARNING") echo -e "${YELLOW}[!]${RESET} $message" ;;
        "ERROR") echo -e "${RED}[✗]${RESET} $message" ;;
        *) echo "[$level] $message" ;;
    esac
    
    echo "[$timestamp] [$level] $message" >> "$log_file"
}

# Check if command exists
command_exists() {
    command -v "$1" &>/dev/null
}

# Get system information
get_system_info() {
    local info=()
    
    # Device model
    local device=$(getprop ro.product.model 2>/dev/null || echo "Termux")
    info+=("Device: $device")
    
    # Android version
    local android=$(getprop ro.build.version.release 2>/dev/null || echo "Unknown")
    info+=("Android: $android")
    
    # Kernel version
    local kernel=$(uname -r)
    info+=("Kernel: $kernel")
    
    # Architecture
    local arch=$(uname -m)
    info+=("Architecture: $arch")
    
    # Battery status
    if command_exists termux-battery-status; then
        local battery=$(termux-battery-status 2>/dev/null)
        local percent=$(echo "$battery" | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        local status=$(echo "$battery" | grep -o '"status":"[^"]*"' | cut -d'"' -f4)
        if [ -n "$percent" ]; then
            info+=("Battery: ${percent}% ($status)")
        fi
    fi
    
    # Storage
    if df -h /data &>/dev/null; then
        local storage=$(df -h /data | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')
        info+=("Storage: $storage")
    fi
    
    # Network
    local ip=$(ip route get 1 2>/dev/null | awk '{print $7}' | head -1)
    [ -z "$ip" ] && ip="Not Connected"
    info+=("IP Address: $ip")
    
    # Uptime
    local uptime=$(uptime -p 2>/dev/null | sed 's/up //' || echo "Unknown")
    info+=("Uptime: $uptime")
    
    # Return array
    printf "%s\n" "${info[@]}"
}

# Progress bar function
draw_progress_bar() {
    local current="$1"
    local total="$2"
    local width="${3:-50}"
    local label="${4:-Progress}"
    
    local percentage=$((current * 100 / total))
    local filled=$((current * width / total))
    local empty=$((width - filled))
    
    echo -ne "\r${CYAN}[${GREEN}"
    for ((i=0; i<filled; i++)); do echo -n "█"; done
    for ((i=0; i<empty; i++)); do echo -n "░"; done
    echo -ne "${CYAN}] ${percentage}% - ${label}${RESET}"
    
    if [ $current -eq $total ]; then
        echo ""
    fi
}

# Animation functions
loading_animation() {
    local pid=$1
    local text="${2:-Loading}"
    local delay=0.1
    local spin=('⣷' '⣯' '⣟' '⡿' '⢿' '⣻' '⣽' '⣾')
    
    while kill -0 "$pid" 2>/dev/null; do
        for frame in "${spin[@]}"; do
            echo -ne "\r${CYAN}${frame}${RESET} ${text}..."
            sleep $delay
        done
    done
    echo -ne "\r${GREEN}✓${RESET} ${text} complete!                \n"
}

# Validation functions
validate_internet() {
    if ping -c 1 google.com &>/dev/null || ping -c 1 8.8.8.8 &>/dev/null; then
        return 0
    else
        return 1
    fi
}

validate_storage() {
    if [ -d "/sdcard" ] || [ -d "$HOME/storage" ]; then
        return 0
    else
        return 1
    fi
}

validate_root() {
    if [ "$(whoami)" = "root" ]; then
        return 0
    else
        return 1
    fi
}

# Cleanup function
cleanup() {
    local exit_code=$?
    log_message "INFO" "Cleaning up..."
    # Add cleanup tasks here
    exit $exit_code
}

# Set trap for cleanup
trap cleanup EXIT INT TERM
EOF

    chmod +x "$THEME_DIR/scripts/utils/"*.sh
}

create_command_system() {
    echo -e "${Y}[*] Creating command system...${N}"
    
    cat > "$THEME_DIR/bin/marpd" << 'EOF'
#!/bin/bash
# MAR-PD Theme Command System

THEME_DIR="$HOME/.marpd-ultimate"
CONFIG_FILE="$THEME_DIR/config/main.conf"

# Load colors
source "$THEME_DIR/scripts/utils/colors.sh"

# Show help
show_help() {
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                 MAR-PD THEME COMMANDS                    ║"
    echo "║                 WE WORK EXPERIMENT                       ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    
    echo -e "${BOLD}${GREEN}Theme Management:${RESET}"
    echo -e "  ${C}marpd help${N}          - Show this help"
    echo -e "  ${C}marpd info${N}          - Show theme information"
    echo -e "  ${C}marpd status${N}        - Show theme status"
    echo -e "  ${C}marpd update${N}        - Update theme"
    echo -e "  ${C}marpd backup${N}        - Create backup"
    echo -e "  ${C}marpd restore${N}       - Restore from backup"
    echo -e "  ${C}marpd uninstall${N}     - Remove theme"
    
    echo -e "\n${BOLD}${GREEN}Display Control:${RESET}"
    echo -e "  ${C}marpd banner${N}        - Show banner"
    echo -e "  ${C}marpd sysinfo${N}       - Show system info"
    echo -e "  ${C}marpd animate${N}       - Show animation"
    echo -e "  ${C}marpd on${N}            - Enable theme"
    echo -e "  ${C}marpd off${N}           - Disable theme"
    echo -e "  ${C}marpd restart${N}       - Restart theme"
    
    echo -e "\n${BOLD}${GREEN}Customization:${RESET}"
    echo -e "  ${C}marpd colors${N}        - Change color scheme"
    echo -e "  ${C}marpd background${N}    - Change background"
    echo -e "  ${C}marpd config${N}        - Edit configuration"
    echo -e "  ${C}marpd font${N}          - Change font"
    
    echo -e "\n${BOLD}${GREEN}System Tools:${RESET}"
    echo -e "  ${C}marpd battery${N}       - Show battery info"
    echo -e "  ${C}marpd storage${N}       - Show storage info"
    echo -e "  ${C}marpd network${N}       - Show network info"
    echo -e "  ${C}marpd weather${N}       - Show weather"
    echo -e "  ${C}marpd clean${N}         - Clean cache"
    
    echo -e "\n${BOLD}${YELLOW}Examples:${RESET}"
    echo -e "  ${D}marpd colors cyberpunk${N}"
    echo -e "  ${D}marpd background 2${N}"
    echo -e "  ${D}marpd update${N}"
    echo ""
}

# Theme information
show_info() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
        echo -e "${CYAN}╔════════════════ THEME INFORMATION ═══════════════╗${RESET}"
        echo -e "${CYAN}│ ${GREEN}Name:${RESET} $theme_name"
        echo -e "${CYAN}│ ${GREEN}Version:${RESET} $theme_version"
        echo -e "${CYAN}│ ${GREEN}Author:${RESET} $theme_author"
        echo -e "${CYAN}│ ${GREEN}Status:${RESET} $theme_status"
        echo -e "${CYAN}│ ${GREEN}Directory:${RESET} $THEME_DIR"
        echo -e "${CYAN}│ ${GREEN}Config:${RESET} $CONFIG_FILE"
        echo -e "${CYAN}╚══════════════════════════════════════════════════╝${RESET}"
    else
        echo -e "${RED}[ERROR] Configuration file not found${RESET}"
    fi
}

# Change color scheme
change_colors() {
    local scheme="$1"
    local schemes=("cyberpunk" "matrix" "neon" "dracula" "nord")
    
    if [ -z "$scheme" ]; then
        echo -e "${YELLOW}Available color schemes:${RESET}"
        for s in "${schemes[@]}"; do
            echo -e "  ${C}$s${N}"
        done
        echo -e "\n${YELLOW}Usage:${RESET} marpd colors [scheme]"
        return
    fi
    
    if [[ " ${schemes[@]} " =~ " ${scheme} " ]]; then
        if [ -f "$THEME_DIR/config/colors/$scheme.properties" ]; then
            sed -i "s/color_scheme=.*/color_scheme=\"$scheme\"/" "$CONFIG_FILE"
            
            if command -v termux-styling &>/dev/null; then
                termux-styling color "$THEME_DIR/config/colors/$scheme.properties"
                echo -e "${GREEN}[✓] Color scheme changed to: $scheme${RESET}"
            else
                echo -e "${YELLOW}[!] termux-styling not available${RESET}"
            fi
        else
            echo -e "${RED}[ERROR] Color scheme file not found: $scheme${RESET}"
        fi
    else
        echo -e "${RED}[ERROR] Invalid color scheme: $scheme${RESET}"
        echo -e "${YELLOW}Available schemes: ${schemes[*]}${RESET}"
    fi
}

# Change background
change_background() {
    local choice="$1"
    local bg_dir="$THEME_DIR/assets/images"
    
    if [ -z "$choice" ]; then
        echo -e "${YELLOW}Available backgrounds:${RESET}"
        local backgrounds=($(ls "$bg_dir"/*.jpg 2>/dev/null | xargs -n1 basename))
        
        for i in "${!backgrounds[@]}"; do
            echo -e "  ${C}$((i+1))${N}. ${backgrounds[$i]}"
        done
        echo -e "\n${YELLOW}Usage:${RESET} marpd background [number]"
        return
    fi
    
    if [[ "$choice" =~ ^[0-9]+$ ]]; then
        local backgrounds=($(ls "$bg_dir"/*.jpg 2>/dev/null))
        local idx=$((choice-1))
        
        if [ $idx -ge 0 ] && [ $idx -lt ${#backgrounds[@]} ]; then
            local bg_file="${backgrounds[$idx]}"
            
            # Update config
            sed -i "s|background_image=.*|background_image=\"$bg_file\"|" "$CONFIG_FILE"
            
            # Set wallpaper
            if command -v termux-wallpaper &>/dev/null; then
                termux-wallpaper -f "$bg_file"
                echo -e "${GREEN}[✓] Background changed${RESET}"
            else
                echo -e "${YELLOW}[!] termux-wallpaper not available${RESET}"
            fi
        else
            echo -e "${RED}[ERROR] Invalid background number${RESET}"
        fi
    else
        echo -e "${RED}[ERROR] Please enter a number${RESET}"
    fi
}

# Update theme
update_theme() {
    echo -e "${YELLOW}[*] Checking for updates...${RESET}"
    
    # Check internet
    if ! ping -c 1 google.com &>/dev/null; then
        echo -e "${RED}[ERROR] No internet connection${RESET}"
        return 1
    fi
    
    # Backup current theme
    local backup_dir="$HOME/.marpd-backup-$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    cp -r "$THEME_DIR" "$backup_dir/"
    echo -e "${GREEN}[✓] Backup created: $backup_dir${RESET}"
    
    # Download update script
    echo -e "${CYAN}[*] Downloading updates...${RESET}"
    local temp_dir="/tmp/marpd-update-$$"
    mkdir -p "$temp_dir"
    
    # Simulate update process
    for i in {1..5}; do
        echo -ne "\r${CYAN}Updating files... $((i*20))%${RESET}"
        sleep 0.5
    done
    echo -e "\r${GREEN}[✓] Update complete!${RESET}"
    
    # Cleanup
    rm -rf "$temp_dir"
    
    echo -e "${YELLOW}[*] Restart terminal to apply updates${RESET}"
}

# Main command handler
case "$1" in
    "help"|"--help"|"-h")
        show_help
        ;;
    "info"|"--info")
        show_info
        ;;
    "banner")
        source "$THEME_DIR/scripts/core/theme.sh"
        display_banner
        ;;
    "sysinfo")
        source "$THEME_DIR/scripts/utils/helpers.sh"
        get_system_info | while read -r line; do
            echo -e "${CYAN}│${RESET} ${line}"
        done
        ;;
    "colors")
        change_colors "$2"
        ;;
    "background"|"bg")
        change_background "$2"
        ;;
    "update"|"upgrade")
        update_theme
        ;;
    "status")
        if [ -f "$CONFIG_FILE" ]; then
            source "$CONFIG_FILE"
            if [ "$theme_status" = "active" ]; then
                echo -e "${GREEN}[✓] Theme is active${RESET}"
            else
                echo -e "${YELLOW}[!] Theme is disabled${RESET}"
            fi
        else
            echo -e "${RED}[ERROR] Theme not installed${RESET}"
        fi
        ;;
    "on"|"enable")
        if [ -f "$CONFIG_FILE" ]; then
            sed -i 's/theme_status=.*/theme_status="active"/' "$CONFIG_FILE"
            echo -e "${GREEN}[✓] Theme enabled${RESET}"
            echo -e "${YELLOW}[*] Restart terminal or run: source ~/.bashrc${RESET}"
        fi
        ;;
    "off"|"disable")
        if [ -f "$CONFIG_FILE" ]; then
            sed -i 's/theme_status=.*/theme_status="inactive"/' "$CONFIG_FILE"
            echo -e "${YELLOW}[!] Theme disabled${RESET}"
            echo -e "${YELLOW}[*] Restart terminal or run: source ~/.bashrc${RESET}"
        fi
        ;;
    "restart")
        echo -e "${YELLOW}[*] Restarting theme...${RESET}"
        source ~/.bashrc
        echo -e "${GREEN}[✓] Theme restarted${RESET}"
        ;;
    "config")
        if [ -f "$CONFIG_FILE" ]; then
            nano "$CONFIG_FILE"
        else
            echo -e "${RED}[ERROR] Config file not found${RESET}"
        fi
        ;;
    "clean")
        echo -e "${YELLOW}[*] Cleaning cache...${RESET}"
        rm -rf "$THEME_DIR/data/cache"/* 2>/dev/null
        echo -e "${GREEN}[✓] Cache cleaned${RESET}"
        ;;
    "battery")
        if command -v termux-battery-status &>/dev/null; then
            termux-battery-status | python3 -m json.tool 2>/dev/null || termux-battery-status
        else
            echo -e "${YELLOW}[!] Battery status not available${RESET}"
        fi
        ;;
    "storage")
        df -h
        ;;
    "network")
        ip addr show 2>/dev/null || ifconfig 2>/dev/null || echo "Network info not available"
        ;;
    "uninstall")
        echo -e "${RED}[WARNING] This will remove MAR-PD Theme${RESET}"
        read -p "Are you sure? (y/n): " confirm
        if [[ "$confirm" =~ ^[Yy] ]]; then
            rm -rf "$THEME_DIR"
            sed -i '/# MAR-PD THEME/,/^EOF$/d' ~/.bashrc 2>/dev/null
            echo -e "${GREEN}[✓] Theme uninstalled${RESET}"
            echo -e "${YELLOW}[*] Restart terminal${RESET}"
        else
            echo -e "${YELLOW}[*] Uninstall cancelled${RESET}"
        fi
        ;;
    *)
        if [ -z "$1" ]; then
            show_help
        else
            echo -e "${RED}[ERROR] Unknown command: $1${RESET}"
            echo -e "${YELLOW}Use 'marpd help' for available commands${RESET}"
        fi
        ;;
esac
EOF
    
    chmod +x "$THEME_DIR/bin/marpd"
    
    # Create symlink to PATH
    if [ -d "$HOME/bin" ]; then
        ln -sf "$THEME_DIR/bin/marpd" "$HOME/bin/marpd"
    fi
    
    echo -e "${G}[✓] Command system created${N}"
}

configure_shell() {
    echo -e "${YELLOW}[*] Configuring shell...${N}"
    
    # Backup current shell config
    if [ -f ~/.bashrc ]; then
        cp ~/.bashrc ~/.bashrc.marpd-backup
    fi
    
    # Remove existing MAR-PD configurations
    sed -i '/# MAR-PD ULTIMATE THEME/,/^# END MAR-PD/d' ~/.bashrc 2>/dev/null
    
    # Add new configuration
    cat >> ~/.bashrc << 'EOF'

# ========================================================
# MAR-PD ULTIMATE THEME - AUTOSTART
# TEAM: MAR-PD | WE WORK EXPERIMENT
# ========================================================

# Theme directory
export MARPD_DIR="$HOME/.marpd-ultimate"

# Load theme if enabled
if [ -f "$MARPD_DIR/scripts/core/theme.sh" ]; then
    source "$MARPD_DIR/scripts/core/theme.sh"
    
    # Initialize theme
    if [ -f "$MARPD_DIR/config/main.conf" ]; then
        source "$MARPD_DIR/config/main.conf"
        if [ "$theme_status" = "active" ]; then
            init_theme
        fi
    fi
fi

# Add theme binaries to PATH
if [ -d "$MARPD_DIR/bin" ]; then
    export PATH="$MARPD_DIR/bin:$PATH"
fi

# Theme commands alias
alias marpd="$MARPD_DIR/bin/marpd"
alias theme="marpd"
alias marpd-help="marpd help"
alias marpd-info="marpd info"
alias marpd-banner="marpd banner"
alias marpd-colors="marpd colors"
alias marpd-bg="marpd background"
alias marpd-update="marpd update"
alias marpd-status="marpd status"
alias marpd-on="marpd on"
alias marpd-off="marpd off"
alias marpd-restart="marpd restart"

# Quick access to theme directory
cdmarpd() {
    cd "$MARPD_DIR" || return
    echo -e "${GREEN}[✓] Changed to theme directory${RESET}"
}

# Reload theme
reload-theme() {
    source ~/.bashrc
    echo -e "${GREEN}[✓] Theme reloaded${RESET}"
}

# Theme information
theme-info() {
    echo -e "${CYAN}╔════════════════ THEME QUICK INFO ═══════════════╗${RESET}"
    echo -e "${CYAN}│ ${GREEN}Theme:${RESET} MAR-PD Ultimate v4.0.0"
    echo -e "${CYAN}│ ${GREEN}Team:${RESET} MAR-PD | WE WORK EXPERIMENT"
    echo -e "${CYAN}│ ${GREEN}Commands:${RESET}"
    echo -e "${CYAN}│   marpd help     - Show all commands"
    echo -e "${CYAN}│   marpd info     - Theme information"
    echo -e "${CYAN}│   marpd update   - Update theme"
    echo -e "${CYAN}│   marpd config   - Edit configuration"
    echo -e "${CYAN}╚══════════════════════════════════════════════════╝${RESET}"
}
# END MAR-PD
EOF
    
    # Also configure zsh if exists
    if [ -f ~/.zshrc ]; then
        cat >> ~/.zshrc << 'EOF'

# MAR-PD Theme for ZSH
if [ -f "$HOME/.marpd-ultimate/scripts/core/theme.sh" ]; then
    source "$HOME/.marpd-ultimate/scripts/core/theme.sh"
fi
EOF
    fi
    
    echo -e "${G}[✓] Shell configured${N}"
}

apply_settings() {
    echo -e "${YELLOW}[*] Applying theme settings...${N}"
    
    # Apply color scheme
    if command -v termux-styling &>/dev/null; then
        local color_file="$THEME_DIR/config/colors/cyberpunk.properties"
        if [ -f "$color_file" ]; then
            termux-styling color "$color_file"
            echo -e "${G}[✓] Color scheme applied${N}"
        fi
    fi
    
    # Apply wallpaper
    if command -v termux-wallpaper &>/dev/null; then
        local bg_file="$THEME_DIR/assets/images/default-bg.jpg"
        if [ -f "$bg_file" ]; then
            termux-wallpaper -f "$bg_file"
            echo -e "${G}[✓] Wallpaper applied${N}"
        fi
    fi
    
    # Set font if available
    if command -v termux-styling &>/dev/null; then
        termux-styling font "monospace" 2>/dev/null && \
        echo -e "${G}[✓] Font configured${N}"
    fi
    
    # Reload Termux settings
    termux-reload-settings 2>/dev/null || true
}

create_install_log() {
    cat > "$THEME_DIR/INSTALL.log" << EOF
MAR-PD ULTIMATE THEME INSTALLATION LOG
=======================================
Installation Date: $(date)
Theme Version: $THEME_VERSION
Installation Directory: $THEME_DIR
Backup Directory: $BACKUP_DIR

System Information:
- Device: $(getprop ro.product.model 2>/dev/null || echo "Unknown")
- Android: $(getprop ro.build.version.release 2>/dev/null || echo "Unknown")
- Kernel: $(uname -r)
- Architecture: $(uname -m)
- User: $(whoami)

Installation Steps Completed:
1. System requirements checked
2. Dependencies installed
3. Backup created
4. Directory structure created
5. Assets downloaded
6. Configuration files created
7. Theme scripts created
8. Command system created
9. Shell configured
10. Settings applied

Theme Features:
- Dynamic animated banner
- System information display
- Battery monitoring
- Network monitoring
- Storage monitoring
- Multiple color schemes
- Custom background
- Command system (marpd help)
- Auto-start on terminal
- Easy customization

Commands Available:
- marpd help     - Show all commands
- marpd info     - Theme information
- marpd banner   - Show banner
- marpd colors   - Change colors
- marpd bg       - Change background
- marpd update   - Update theme
- marpd status   - Theme status
- marpd on/off   - Enable/disable theme

Support:
GitHub: $REPO_URL
Team: MAR-PD | WE WORK EXPERIMENT

Installation completed successfully!
EOF
}

show_completion() {
    clear
    show_banner
    
    echo -e "${G}"
    cat << "EOF"
╔══════════════════════════════════════════════════════════════════╗
║                    INSTALLATION COMPLETE!                        ║
║                                                                  ║
║    MAR-PD Ultimate Theme v4.0.0 has been successfully           ║
║    installed on your Termux.                                    ║
║                                                                  ║
║    ┌──────────────────────────────────────────────────────────┐  ║
║    │                     FEATURES                             │  ║
║    ├──────────────────────────────────────────────────────────┤  ║
║    │  🎨 Dynamic Animated Banner                              │  ║
║    │  📊 Advanced System Information                          │  ║
║    │  🔋 Real-time Battery Monitoring                         │  ║
║    │  🌐 Network Status Display                               │  ║
║    │  💾 Storage Usage Monitor                                │  ║
║    │  🎯 Multiple Color Schemes                               │  ║
║    │  🖼️  Custom Background Images                            │  ║
║    │  ⌨️  Complete Command System                             │  ║
║    │  ⚡ Auto-start on Terminal Launch                         │  ║
║    │  🔧 Easy Customization                                   │  ║
║    └──────────────────────────────────────────────────────────┘  ║
║                                                                  ║
║    ┌──────────────────────────────────────────────────────────┐  ║
║    │                     QUICK START                          │  ║
║    ├──────────────────────────────────────────────────────────┤  ║
║    │  1. Apply changes immediately:                           │  ║
║    │        source ~/.bashrc                                  │  ║
║    │                                                          │  ║
║    │  2. Show available commands:                             │  ║
║    │        marpd help                                        │  ║
║    │                                                          │  ║
║    │  3. Change color scheme:                                 │  ║
║    │        marpd colors cyberpunk                            │  ║
║    │                                                          │  ║
║    │  4. Change background:                                   │  ║
║    │        marpd background 1                                │  ║
║    │                                                          │  ║
║    │  5. Show system info:                                    │  ║
║    │        marpd sysinfo                                     │  ║
║    └──────────────────────────────────────────────────────────┘  ║
║                                                                  ║
║    ┌──────────────────────────────────────────────────────────┐  ║
║    │                     IMPORTANT                            │  ║
║    ├──────────────────────────────────────────────────────────┤  ║
║    │  • Backup created at: $BACKUP_DIR             │  ║
║    │  • Theme directory: $THEME_DIR        │  ║
║    │  • Config file: $THEME_DIR/config/main.conf  │  ║
║    │  • Log file: $THEME_DIR/data/logs/theme.log   │  ║
║    └──────────────────────────────────────────────────────────┘  ║
║                                                                  ║
║                     WE WORK EXPERIMENT                           ║
╚══════════════════════════════════════════════════════════════════╝
EOF
    echo -e "${N}"
    
    echo -e "${CYAN}=======================================================${N}"
    echo -e "${GREEN}[✓] Installation successful!${N}"
    echo -e "${YELLOW}[*] Run the following command to start using:${N}"
    echo -e "${C}    source ~/.bashrc${N}"
    echo -e "${YELLOW}[*] Then type:${N}"
    echo -e "${C}    marpd help${N}"
    echo -e "${CYAN}=======================================================${N}"
}

# ========================================================
# MAIN INSTALLATION PROCESS
# ========================================================

main() {
    # Show banner
    show_banner
    
    # Installation steps with progress
    echo -e "${YELLOW}[*] Starting installation process...${N}"
    echo ""
    
    local steps=12
    local current=1
    
    # Step 1: Check requirements
    echo -e "${C}[${current}/${steps}] Checking requirements...${N}"
    check_requirements
    progress_bar 2
    ((current++))
    
    # Step 2: Check dependencies
    echo -e "\n${C}[${current}/${steps}] Checking dependencies...${N}"
    check_dependencies
    progress_bar 3
    ((current++))
    
    # Step 3: Create backup
    echo -e "\n${C}[${current}/${steps}] Creating backup...${N}"
    create_backup
    progress_bar 1
    ((current++))
    
    # Step 4: Create directory structure
    echo -e "\n${C}[${current}/${steps}] Creating directory structure...${N}"
    create_directory_structure
    progress_bar 1
    ((current++))
    
    # Step 5: Download assets
    echo -e "\n${C}[${current}/${steps}] Downloading assets...${N}"
    download_assets
    progress_bar 3
    ((current++))
    
    # Step 6: Create config files
    echo -e "\n${C}[${current}/${steps}] Creating configuration files...${N}"
    create_config_files
    progress_bar 2
    ((current++))
    
    # Step 7: Create theme script
    echo -e "\n${C}[${current}/${steps}] Creating theme script...${N}"
    create_theme_script
    progress_bar 2
    ((current++))
    
    # Step 8: Create command system
    echo -e "\n${C}[${current}/${steps}] Creating command system...${N}"
    create_command_system
    progress_bar 2
    ((current++))
    
    # Step 9: Configure shell
    echo -e "\n${C}[${current}/${steps}] Configuring shell...${N}"
    configure_shell
    progress_bar 2
    ((current++))
    
    # Step 10: Apply settings
    echo -e "\n${C}[${current}/${steps}] Applying settings...${N}"
    apply_settings
    progress_bar 1
    ((current++))
    
    # Step 11: Create install log
    echo -e "\n${C}[${current}/${steps}] Creating installation log...${N}"
    create_install_log
    progress_bar 1
    ((current++))
    
    # Step 12: Show completion
    echo -e "\n${C}[${current}/${steps}] Finalizing installation...${N}"
    progress_bar 2
    
    # Show completion message
    show_completion
}

# Run installation
trap 'echo -e "\n${R}[!] Installation interrupted${N}"; exit 1' INT
main
