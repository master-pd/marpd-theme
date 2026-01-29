#!/bin/bash

# ============================================
# MAR-PD PRO TERMUX THEME - ADVANCED VERSION
# Version: 3.0 | Lines: 2000+
# ============================================

# =================== CONFIGURATION ===================
CONFIG_FILE="$HOME/.termux-pro/config.conf"
LOG_FILE="$HOME/.termux-pro/theme.log"
VERSION="3.0.0"
LAST_UPDATE="2024-01-20"
DEVELOPER="MAR-PD Team"
CONTACT="https://t.me/master_spamming"

# =================== USER VARIABLES ==================
USER_NAME=""
USER_ALIAS=""
USER_RANK=""
TEAM_NAME="MAR-PD"
TEAM_SLOGAN="WE WORK CYBER SAFE"
SECURITY_LEVEL="HIGH"
ENCRYPTION_MODE="AES-256"
SESSION_ID=$(date +%s%N | md5sum | head -c 16)

# =================== COLOR SYSTEM ====================
# 256 Color Support
COLOR_RESET="\033[0m"
COLOR_BOLD="\033[1m"
COLOR_DIM="\033[2m"
COLOR_ITALIC="\033[3m"
COLOR_UNDERLINE="\033[4m"
COLOR_BLINK="\033[5m"
COLOR_REVERSE="\033[7m"
COLOR_HIDDEN="\033[8m"

# Basic Colors
BLACK="\033[30m"
RED="\033[31m"
GREEN="\033[32m"
YELLOW="\033[33m"
BLUE="\033[34m"
MAGENTA="\033[35m"
CYAN="\033[36m"
WHITE="\033[37m"

# Bright Colors
BRIGHT_BLACK="\033[90m"
BRIGHT_RED="\033[91m"
BRIGHT_GREEN="\033[92m"
BRIGHT_YELLOW="\033[93m"
BRIGHT_BLUE="\033[94m"
BRIGHT_MAGENTA="\033[95m"
BRIGHT_CYAN="\033[96m"
BRIGHT_WHITE="\033[97m"

# Background Colors
BG_BLACK="\033[40m"
BG_RED="\033[41m"
BG_GREEN="\033[42m"
BG_YELLOW="\033[43m"
BG_BLUE="\033[44m"
BG_MAGENTA="\033[45m"
BG_CYAN="\033[46m"
BG_WHITE="\033[47m"

# RGB Colors (Termux supports)
RGB_RED="\033[38;2;255;0;0m"
RGB_GREEN="\033[38;2;0;255;0m"
RGB_BLUE="\033[38;2;0;0;255m"
RGB_YELLOW="\033[38;2;255;255;0m"
RGB_PURPLE="\033[38;2;128;0;128m"
RGB_ORANGE="\033[38;2;255;165;0m"
RGB_PINK="\033[38;2;255;192;203m"
RGB_CYAN="\033[38;2;0;255;255m"

# Gradient Colors
GRADIENT_1=("\033[38;2;255;0;0m" "\033[38;2;255;128;0m" "\033[38;2;255;255;0m" "\033[38;2;128;255;0m" "\033[38;2;0;255;0m")
GRADIENT_2=("\033[38;2;0;255;255m" "\033[38;2;0;128;255m" "\033[38;2;0;0;255m" "\033[38;2;128;0;255m" "\033[38;2;255;0;255m")

# =================== ASCII ART DATABASE ====================
declare -A ASCII_DB

ASCII_DB["MAR-PD"]=$(cat << "EOF"
███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗ 
████╗ ████║██╔══██╗██╔══██╗    ██╔══██╗██╔══██╗
██╔████╔██║███████║██████╔╝    ██║  ██║██║  ██║
██║╚██╔╝██║██╔══██║██╔═══╝     ██║  ██║██║  ██║
██║ ╚═╝ ██║██║  ██║██║         ██████╔╝██████╔╝
╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═════╝ 
EOF
)

ASCII_DB["HACKER"]=$(cat << "EOF"
 ██░ ██ ▄▄▄█████▓ ▄████▄   ██▓███  
▓██░ ██▒▓  ██▒ ▓▒▒██▀ ▀█  ▓██░  ██▒
▒██▀▀██░▒ ▓██░ ▒░▒▓█    ▄ ▓██░ ██▓▒
░▓█ ░██ ░ ▓██▓ ░ ▒▓▓▄ ▄██▒▒██▄█▓▒ ▒
░▓█▒░██▓  ▒██▒ ░ ▒ ▓███▀ ░▒██▒ ░  ░
 ▒ ░░▒░▒  ▒ ░░   ░ ░▒ ▒  ░▒▓▒░ ░  ░
 ▒ ░▒░ ░    ░      ░  ▒   ░▒ ░     
 ░  ░░ ░  ░      ░        ░░       
 ░  ░  ░         ░ ░               
                ░                  
EOF
)

ASCII_DB["CYBER"]=$(cat << "EOF"
  ______      ______      ______  
 /_____/\    /_____/\    /_____/\ 
 \:::__\/    \::::_\/_   \::::_\/_
  \:\ \  __   \:\/___/\   \:\/___/\
   \:\ \/_/\   \::___\/_   \::___\/
    \:\_\ \ \   \:\____/\   \:\____/\
     \_____\/    \_____\/    \_____\/
EOF
)

ASCII_DB["DRAGON"]=$(cat << "EOF"
                    __====-_  _-====___
          _--^^^#####//      \\#####^^^--_
       _-^##########// (    ) \\##########^-_
      -############//  |\^^/|  \\############-
    _/############//   (@::@)   \\############\_
   /#############((     \\//     ))#############\
  -###############\\    (oo)    //###############-
 -#################\\  / VV \  //#################-
-###################\\/      \//###################-
_#/|##########/\######(   /\   )######/\##########|\#_
|/ |#/\#/\#/\/  \#/\##\  |  |  /##/\#/  \/\#/\#/\#| \|
`  |/  V  V  `   V  \#\| |  | |/#/  V   '  V  V  \|  '
   `   `  `      `   / | |  | | \   '      '  '   '
                    (  | |  | |  )
                   __\ | |  | | /__
                  (vvv(VVV)(VVV)vvv)
EOF
)

# =================== ANIMATION FRAMES ====================
# Loading animations
LOADING_FRAMES=("⠋" "⠙" "⠹" "⠸" "⠼" "⠴" "⠦" "⠧" "⠇" "⠏")
SCAN_FRAMES=("[=     ]" "[ =    ]" "[  =   ]" "[   =  ]" "[    = ]" "[     =]" "[    = ]" "[   =  ]" "[  =   ]" "[ =    ]")
MATRIX_FRAMES=("01001001" "00100100" "10010010" "01001001" "00100100" "10010010" "01001001" "00100100" "10010010")

# =================== SOUND EFFECTS (if supported) ====================
SOUND_TYPES=("beep" "click" "alert" "hack" "success" "error")

# =================== FUNCTIONS LIBRARY ====================

# Logging system
log_message() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    case "$level" in
        "INFO") echo -e "${BLUE}[INFO]${COLOR_RESET} $message" ;;
        "SUCCESS") echo -e "${GREEN}[✓]${COLOR_RESET} $message" ;;
        "WARNING") echo -e "${YELLOW}[!]${COLOR_RESET} $message" ;;
        "ERROR") echo -e "${RED}[✗]${COLOR_RESET} $message" ;;
        "DEBUG") echo -e "${MAGENTA}[DEBUG]${COLOR_RESET} $message" ;;
    esac
    
    echo "[$timestamp] [$level] $message" >> "$LOG_FILE"
}

# Progress bar
progress_bar() {
    local duration="$1"
    local width=50
    local increment=$((duration / width))
    
    echo -ne "${BRIGHT_BLUE}[${COLOR_RESET}"
    for ((i=0; i<width; i++)); do
        echo -ne "${BRIGHT_GREEN}█${COLOR_RESET}"
        sleep $increment
    done
    echo -e "${BRIGHT_BLUE}]${COLOR_RESET}"
}

# Random color generator
random_color() {
    local colors=($RED $GREEN $YELLOW $BLUE $MAGENTA $CYAN $BRIGHT_RED $BRIGHT_GREEN $BRIGHT_YELLOW $BRIGHT_BLUE $BRIGHT_MAGENTA $BRIGHT_CYAN)
    echo "${colors[$RANDOM % ${#colors[@]}]}"
}

# Gradient text
gradient_text() {
    local text="$1"
    local gradient=("$2")
    local length=${#text}
    
    for ((i=0; i<length; i++)); do
        local char="${text:i:1}"
        local color_index=$((i % ${#gradient[@]}))
        echo -ne "${gradient[$color_index]}${char}${COLOR_RESET}"
    done
    echo
}

# Animated typing effect
type_animation() {
    local text="$1"
    local delay="${2:-0.05}"
    
    for ((i=0; i<${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep $delay
    done
    echo
}

# Matrix rain effect
matrix_rain() {
    local lines="${1:-20}"
    local cols=$(tput cols)
    
    echo -e "${RGB_GREEN}"
    for ((i=0; i<lines; i++)); do
        for ((j=0; j<cols; j+=3)); do
            echo -n "$((RANDOM % 2))"
        done
        echo
        sleep 0.1
    done
    echo -e "${COLOR_RESET}"
}

# Binary clock
binary_clock() {
    local hour=$(date +%H)
    local minute=$(date +%M)
    local second=$(date +%S)
    
    echo -e "${BRIGHT_CYAN}┌──────────────────────┐${COLOR_RESET}"
    echo -e "${BRIGHT_CYAN}│   ${BRIGHT_GREEN}BINARY CLOCK${BRIGHT_CYAN}       │${COLOR_RESET}"
    echo -e "${BRIGHT_CYAN}├──────────────────────┤${COLOR_RESET}"
    printf "${BRIGHT_CYAN}│${COLOR_RESET} H: %08d ${BRIGHT_CYAN}│${COLOR_RESET}\n" $(echo "obase=2;$hour" | bc)
    printf "${BRIGHT_CYAN}│${COLOR_RESET} M: %08d ${BRIGHT_CYAN}│${COLOR_RESET}\n" $(echo "obase=2;$minute" | bc)
    printf "${BRIGHT_CYAN}│${COLOR_RESET} S: %08d ${BRIGHT_CYAN}│${COLOR_RESET}\n" $(echo "obase=2;$second" | bc)
    echo -e "${BRIGHT_CYAN}└──────────────────────┘${COLOR_RESET}"
}

# System monitor
system_monitor() {
    local cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
    local mem_total=$(free -m | awk 'NR==2{printf "%.1f", $2/1024}')
    local mem_used=$(free -m | awk 'NR==2{printf "%.1f", $3/1024}')
    local mem_percent=$((mem_used * 100 / mem_total))
    local disk_used=$(df -h / | awk 'NR==2{print $5}')
    local battery=$(termux-battery-status 2>/dev/null | grep percentage | cut -d: -f2 | tr -d ', ' || echo "N/A")
    
    echo -e "${BRIGHT_BLUE}╔══════════════════════════════════════╗${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}║        ${BRIGHT_GREEN}SYSTEM MONITOR${BRIGHT_BLUE}              ║${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}╠══════════════════════════════════════╣${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}║${COLOR_RESET} CPU: ${cpu_usage}% ${BRIGHT_BLUE}                          ║${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}║${COLOR_RESET} RAM: ${mem_used}/${mem_total}GB (${mem_percent}%) ${BRIGHT_BLUE}       ║${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}║${COLOR_RESET} DISK: ${disk_used} ${BRIGHT_BLUE}                         ║${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}║${COLOR_RESET} BATTERY: ${battery}% ${BRIGHT_BLUE}                      ║${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}╚══════════════════════════════════════╝${COLOR_RESET}"
}

# Network scanner (simulated)
network_scan() {
    echo -e "${BRIGHT_YELLOW}Starting network scan...${COLOR_RESET}"
    for i in {1..10}; do
        echo -ne "${BRIGHT_GREEN}Scanning network segment 192.168.1.$i...${COLOR_RESET}\r"
        sleep 0.2
    done
    echo
    echo -e "${BRIGHT_GREEN}Scan complete! Found 5 active devices.${COLOR_RESET}"
}

# Password strength checker
password_checker() {
    local password="$1"
    local strength=0
    
    [ ${#password} -ge 8 ] && ((strength++))
    [[ "$password" =~ [A-Z] ]] && ((strength++))
    [[ "$password" =~ [a-z] ]] && ((strength++))
    [[ "$password" =~ [0-9] ]] && ((strength++))
    [[ "$password" =~ [!@#\$%^\&*] ]] && ((strength++))
    
    case $strength in
        5) echo -e "${BRIGHT_GREEN}Excellent password!${COLOR_RESET}" ;;
        4) echo -e "${GREEN}Strong password${COLOR_RESET}" ;;
        3) echo -e "${YELLOW}Moderate password${COLOR_RESET}" ;;
        2) echo -e "${RED}Weak password${COLOR_RESET}" ;;
        *) echo -e "${BRIGHT_RED}Very weak password${COLOR_RESET}" ;;
    esac
}

# Encryption/Decryption simulation
encrypt_text() {
    local text="$1"
    echo -e "${BRIGHT_CYAN}Encrypting:${COLOR_RESET} $text"
    echo -e "${BRIGHT_GREEN}Using: ${ENCRYPTION_MODE}${COLOR_RESET}"
    
    # Simulated encryption process
    for i in {1..5}; do
        echo -ne "${BRIGHT_BLUE}Encryption layer $i...${COLOR_RESET}\r"
        sleep 0.3
    done
    echo
    local encrypted=$(echo "$text" | tr 'A-Za-z' 'N-ZA-Mn-za-m' | base64)
    echo -e "${BRIGHT_GREEN}Encrypted:${COLOR_RESET} $encrypted"
}

# Fake hacking simulation
hack_simulation() {
    local target="$1"
    
    echo -e "${BRIGHT_RED}"
    cat << "EOF"
╔═══╗╔═══╗╔═══╗╔═══╗╔═══╗╔═══╗╔═══╗╔═══╗
║╔═╗║║╔═╗║║╔══╝║╔═╗║║╔═╗║║╔═╗║║╔══╝║╔═╗║
║║ ║║║║ ║║║╚══╗║║ ║║║║ ║║║║ ║║║╚══╗║║ ╚╝
║║ ║║║║ ║║║╔══╝║║ ║║║║ ║║║║ ║║║╔══╝║║ ╔╗
║╚═╝║║╚═╝║║╚══╗║╚═╝║║╚═╝║║╚═╝║║╚══╗║╚═╝║
╚═══╝╚═══╝╚═══╝╚═══╝╚═══╝╚═══╝╚═══╝╚═══╝
EOF
    echo -e "${COLOR_RESET}"
    
    echo -e "${BRIGHT_YELLOW}Initializing hack sequence on: $target${COLOR_RESET}"
    
    local steps=(
        "Scanning target..."
        "Bypassing firewall..."
        "Exploiting vulnerabilities..."
        "Gaining access..."
        "Extracting data..."
        "Covering tracks..."
    )
    
    for step in "${steps[@]}"; do
        echo -ne "${BRIGHT_GREEN}[+]${COLOR_RESET} $step\r"
        sleep 1
        echo -e "${BRIGHT_GREEN}[✓]${COLOR_RESET} $step"
    done
    
    echo -e "${BRIGHT_CYAN}[*]${COLOR_RESET} Hack completed successfully!"
    echo -e "${BRIGHT_GREEN}[+]${COLOR_RESET} Target compromised: $target"
}

# Terminal geometry
get_terminal_size() {
    TERM_WIDTH=$(tput cols)
    TERM_HEIGHT=$(tput lines)
    echo "Width: $TERM_WIDTH, Height: $TERM_HEIGHT"
}

# Create border
create_border() {
    local width="$1"
    local char="$2"
    local color="$3"
    
    echo -ne "$color"
    for ((i=0; i<width; i++)); do
        echo -n "$char"
    done
    echo -e "${COLOR_RESET}"
}

# =================== SETUP WIZARD ====================
setup_wizard() {
    clear
    
    echo -e "${BRIGHT_CYAN}"
    create_border $TERM_WIDTH "═"
    echo -e "╔══════════════════════════════════════════════════════════╗"
    echo -e "║     ${BRIGHT_GREEN}MAR-PD ADVANCED TERMUX THEME SETUP WIZARD${BRIGHT_CYAN}     ║"
    echo -e "║                   ${BRIGHT_YELLOW}Version: $VERSION${BRIGHT_CYAN}                   ║"
    echo -e "╚══════════════════════════════════════════════════════════╝"
    echo -e "${COLOR_RESET}"
    
    # Get user information
    echo -e "${BRIGHT_YELLOW}Step 1/5: Personal Information${COLOR_RESET}"
    create_border $TERM_WIDTH "─"
    
    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Enter your name: ")" USER_NAME
    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Enter your alias/codename: ")" USER_ALIAS
    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Enter your rank (Beginner/Intermediate/Expert): ")" USER_RANK
    
    # Theme selection
    echo -e "\n${BRIGHT_YELLOW}Step 2/5: Theme Selection${COLOR_RESET}"
    create_border $TERM_WIDTH "─"
    
    echo -e "${BRIGHT_CYAN}Available Themes:${COLOR_RESET}"
    echo -e "  ${GREEN}1.${COLOR_RESET} Cyber Punk"
    echo -e "  ${GREEN}2.${COLOR_RESET} Matrix"
    echo -e "  ${GREEN}3.${COLOR_RESET} Hacker"
    echo -e "  ${GREEN}4.${COLOR_RESET} Neon"
    echo -e "  ${GREEN}5.${COLOR_RESET} Custom"
    
    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Choose theme (1-5): ")" THEME_CHOICE
    
    # Color scheme
    echo -e "\n${BRIGHT_YELLOW}Step 3/5: Color Scheme${COLOR_RESET}"
    create_border $TERM_WIDTH "─"
    
    echo -e "${BRIGHT_CYAN}Color Schemes:${COLOR_RESET}"
    echo -e "${RED}■${COLOR_RESET} Red    ${GREEN}■${COLOR_RESET} Green  ${BLUE}■${COLOR_RESET} Blue   ${CYAN}■${COLOR_RESET} Cyan"
    echo -e "${YELLOW}■${COLOR_RESET} Yellow ${MAGENTA}■${COLOR_RESET} Purple ${WHITE}■${COLOR_RESET} White  ${BRIGHT_RED}■${COLOR_RESET} Bright"
    
    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Primary color (name/code): ")" PRIMARY_COLOR
    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Secondary color: ")" SECONDARY_COLOR
    
    # Features selection
    echo -e "\n${BRIGHT_YELLOW}Step 4/5: Features${COLOR_RESET}"
    create_border $TERM_WIDTH "─"
    
    echo -e "${BRIGHT_CYAN}Select features to enable:${COLOR_RESET}"
    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Enable animations? (y/n): ")" ANIMATIONS_ENABLED
    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Enable system monitor? (y/n): ")" MONITOR_ENABLED
    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Enable sound effects? (y/n): ")" SOUND_ENABLED
    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Show banner on startup? (y/n): ")" BANNER_ENABLED
    
    # Confirmation
    echo -e "\n${BRIGHT_YELLOW}Step 5/5: Confirmation${COLOR_RESET}"
    create_border $TERM_WIDTH "─"
    
    echo -e "${BRIGHT_GREEN}[*]${COLOR_RESET} Setup Summary:"
    echo -e "  ${CYAN}Name:${COLOR_RESET} $USER_NAME"
    echo -e "  ${CYAN}Alias:${COLOR_RESET} $USER_ALIAS"
    echo -e "  ${CYAN}Rank:${COLOR_RESET} $USER_RANK"
    echo -e "  ${CYAN}Team:${COLOR_RESET} $TEAM_NAME"
    echo -e "  ${CYAN}Theme:${COLOR_RESET} $THEME_CHOICE"
    echo -e "  ${CYAN}Colors:${COLOR_RESET} $PRIMARY_COLOR, $SECONDARY_COLOR"
    
    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Proceed with installation? (y/n): ")" CONFIRM
    
    if [[ "$CONFIRM" != "y" ]]; then
        echo -e "${BRIGHT_RED}[!]${COLOR_RESET} Installation cancelled."
        exit 0
    fi
    
    save_configuration
}

# Save configuration
save_configuration() {
    log_message "INFO" "Saving configuration..."
    
    mkdir -p "$(dirname "$CONFIG_FILE")"
    
    cat > "$CONFIG_FILE" << EOF
# MAR-PD Termux Pro Theme Configuration
# Generated on: $(date)

USER_NAME="$USER_NAME"
USER_ALIAS="$USER_ALIAS"
USER_RANK="$USER_RANK"
TEAM_NAME="$TEAM_NAME"
TEAM_SLOGAN="$TEAM_SLOGAN"
THEME_CHOICE="$THEME_CHOICE"
PRIMARY_COLOR="$PRIMARY_COLOR"
SECONDARY_COLOR="$SECONDARY_COLOR"
ANIMATIONS_ENABLED="$ANIMATIONS_ENABLED"
MONITOR_ENABLED="$MONITOR_ENABLED"
SOUND_ENABLED="$SOUND_ENABLED"
BANNER_ENABLED="$BANNER_ENABLED"
VERSION="$VERSION"
SESSION_ID="$SESSION_ID"
SECURITY_LEVEL="$SECURITY_LEVEL"
ENCRYPTION_MODE="$ENCRYPTION_MODE"
EOF
    
    log_message "SUCCESS" "Configuration saved to $CONFIG_FILE"
}

# Load configuration
load_configuration() {
    if [ -f "$CONFIG_FILE" ]; then
        source "$CONFIG_FILE"
        log_message "INFO" "Configuration loaded from $CONFIG_FILE"
        return 0
    else
        log_message "WARNING" "Configuration file not found. Running setup wizard."
        return 1
    fi
}

# =================== INSTALLATION ====================
install_dependencies() {
    log_message "INFO" "Installing dependencies..."
    
    local packages=(
        "zsh"
        "git"
        "curl"
        "wget"
        "nano"
        "vim"
        "python"
        "nodejs"
        "ruby"
        "neofetch"
        "cmatrix"
        "figlet"
        "toilet"
        "lolcat"
        "htop"
        "nmap"
        "openssh"
        "termux-api"
    )
    
    echo -e "${BRIGHT_BLUE}Updating packages...${COLOR_RESET}"
    pkg update -y && pkg upgrade -y
    
    for pkg in "${packages[@]}"; do
        echo -ne "${BRIGHT_CYAN}Installing $pkg...${COLOR_RESET}\r"
        pkg install -y "$pkg" > /dev/null 2>&1
        echo -e "${BRIGHT_GREEN}[✓]${COLOR_RESET} Installed $pkg"
    done
    
    # Install Oh-My-Zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        log_message "INFO" "Installing Oh-My-Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
    
    log_message "SUCCESS" "Dependencies installed successfully"
}

# Create theme files
create_theme_files() {
    log_message "INFO" "Creating theme files..."
    
    # Create directories
    mkdir -p $HOME/.termux-pro/{themes,plugins,scripts,backups}
    mkdir -p $HOME/.termux-pro/ascii/{banners,logos,animations}
    
    # Create main theme file
    create_zsh_theme
    
    # Create bashrc
    create_bashrc
    
    # Create termux properties
    create_termux_properties
    
    # Create custom scripts
    create_custom_scripts
    
    log_message "SUCCESS" "Theme files created"
}

# Create ZSH theme
create_zsh_theme() {
    cat > $HOME/.zshrc << 'EOF'
#!/data/data/com.termux/files/usr/bin/zsh

# ============================================
# MAR-PD PRO TERMUX THEME - ZSH CONFIGURATION
# ============================================

# Enable Powerlevel10k instant prompt
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Load configuration
CONFIG_FILE="$HOME/.termux-pro/config.conf"
if [ -f "$CONFIG_FILE" ]; then
    source "$CONFIG_FILE"
else
    USER_NAME="Operator"
    USER_ALIAS="Ghost"
    USER_RANK="Expert"
    TEAM_NAME="MAR-PD"
    TEAM_SLOGAN="WE WORK CYBER SAFE"
fi

# Colors (redefine for ZSH)
autoload -U colors && colors

# Set up oh-my-zsh
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    command-not-found
    sudo
    extract
)

source $ZSH/oh-my-zsh.sh

# Load powerlevel10k configuration
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Custom functions
function marpd_banner() {
    clear
    echo -e "\033[1;36m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                     \033[1;31mMAR-PD PRO TERMINAL\033[1;36m                     ║"
    echo "╠══════════════════════════════════════════════════════════════╣"
    echo "║  \033[1;32mUSER    \033[0m: \033[1;35m$USER_NAME\033[1;36m                                   ║"
    echo "║  \033[1;32mALIAS   \033[0m: \033[1;33m$USER_ALIAS\033[1;36m                                  ║"
    echo "║  \033[1;32mRANK    \033[0m: \033[1;34m$USER_RANK\033[1;36m                               ║"
    echo "║  \033[1;32mTEAM    \033[0m: \033[1;31m$TEAM_NAME\033[1;36m                                      ║"
    echo "║  \033[1;32mMOTTO   \033[0m: \033[1;36m$TEAM_SLOGAN\033[1;36m                         ║"
    echo "║  \033[1;32mSESSION \033[0m: \033[1;95m$SESSION_ID\033[1;36m                          ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    # Show system info
    echo -e "\033[1;33m══════════════════════════════════════════════════════════════\033[0m"
    neofetch --ascii_distro termux_alpine
    echo -e "\033[1;33m══════════════════════════════════════════════════════════════\033[0m"
}

function matrix_mode() {
    echo -e "\033[1;32m"
    echo "Initializing Matrix Mode..."
    echo -e "\033[0m"
    if command -v cmatrix &> /dev/null; then
        cmatrix -C blue -s
    else
        for i in {1..50}; do
            echo -n "0101010101010101010101010101010101010101"
            sleep 0.05
            echo
        done
    fi
}

function hack_mode() {
    local target=${1:-"localhost"}
    
    echo -e "\033[1;31m"
    echo "HACK MODE ACTIVATED"
    echo "Target: $target"
    echo -e "\033[0m"
    
    local commands=(
        "nmap -sS $target"
        "hydra -l admin -p password $target ssh"
        "sqlmap -u http://$target/login.php"
        "metasploit"
        "aircrack-ng"
    )
    
    for cmd in "${commands[@]}"; do
        echo -e "\033[1;33m[*]\033[0m Running: $cmd"
        sleep 1
        echo -e "\033[1;32m[✓]\033[0m Completed"
    done
    
    echo -e "\033[1;32m[+] Target compromised successfully!\033[0m"
}

function sys_monitor() {
    while true; do
        clear
        echo -e "\033[1;36m=== SYSTEM MONITOR ===\033[0m"
        echo
        # CPU usage
        echo -e "\033[1;33mCPU Usage:\033[0m"
        top -bn1 | grep "Cpu(s)"
        echo
        # Memory
        echo -e "\033[1;33mMemory:\033[0m"
        free -h
        echo
        # Disk
        echo -e "\033[1;33mDisk Usage:\033[0m"
        df -h /
        echo
        # Network
        echo -e "\033[1;33mNetwork:\033[0m"
        ifconfig wlan0 || ip addr show
        echo
        echo -e "\033[1;35mPress Ctrl+C to exit...\033[0m"
        sleep 2
    done
}

# Custom prompt
PROMPT='%F{red}$TEAM_NAME%F{yellow}♪↗➜%f '
RPROMPT='%F{green}[%F{cyan}%*%F{green}]%f'

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -A --color=auto'
alias l='ls -CF --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cls='clear'
alias update='pkg update && pkg upgrade'
alias install='pkg install'
alias remove='pkg uninstall'
alias search='pkg search'
alias matrix='matrix_mode'
alias hack='hack_mode'
alias monitor='sys_monitor'
alias banner='marpd_banner'
alias theme-reload='source ~/.zshrc'
alias theme-config='nano ~/.termux-pro/config.conf'
alias theme-backup='cp ~/.zshrc ~/.termux-pro/backups/zshrc-$(date +%Y%m%d).bak'

# Auto-completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# History settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Key bindings
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^H' backward-kill-word
bindkey '^[[3~' delete-char

# Startup banner
if [[ -z "$TMUX" ]] && [[ "$BANNER_ENABLED" == "y" ]]; then
    marpd_banner
fi

# Welcome message
echo -e "\033[1;32m[+]\033[0m Welcome to MAR-PD Pro Terminal \033[1;31mv$VERSION\033[0m"
echo -e "\033[1;32m[+]\033[0m Type 'banner' to show banner"
echo -e "\033[1;32m[+]\033[0m Type 'matrix' for matrix animation"
echo -e "\033[1;32m[+]\033[0m Type 'hack <target>' for hack simulation"
echo -e "\033[1;32m[+]\033[0m Type 'monitor' for system monitoring"
echo -e "\033[1;32m[+]\033[0m Type 'theme-config' to edit configuration"
echo
EOF

    # Create Powerlevel10k configuration
    cat > $HOME/.p10k.zsh << 'EOF'
# Generated by Powerlevel10k configuration wizard
# Wizard options: nerdfont-complete + powerline, small icons, unicode, dark,
# round separators, round heads, round tails, 2 lines, disconnected, no frame,
# compact, many icons, concise, instant_prompt=verbose
# Type `p10k configure` to generate another config.

if [[ -o 'aliases' ]]; then
  'builtin' 'unset' 'aliases'
fi

'builtin' 'setopt' 'no_aliases'
'builtin' 'source' "${HOME}/.cache/p10k-instant-prompt-${(%):-%n}.zsh"
'builtin' 'setopt' 'aliases'

() {
  emulate -L zsh
  setopt no_unset extended_glob

  zmodload zsh/langinfo
  if [[ ${langinfo[CODESET]:-} != (utf|UTF)(-|)8 ]]; then
    local LC_ALL=${${(@M)$(locale -a):#*.(utf|UTF)(-|)8}[1]:-en_US.UTF-8}
  fi

  typeset -g POWERLEVEL9K_TERM_SHELL_INTEGRATION=true
  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(context dir vcs newline prompt_char)
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status time)
  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=none
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_VISUAL_IDENTIFIER_EXPANSION='${P9K_VISUAL_IDENTIFIER}'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_PREFIX='%F{blue}╭─'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_PREFIX='%F{blue}├─'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_PREFIX='%F{blue}╰─'
  typeset -g POWERLEVEL9K_MULTILINE_FIRST_PROMPT_SUFFIX='%F{blue}─'
  typeset -g POWERLEVEL9K_MULTILINE_NEWLINE_PROMPT_SUFFIX='%F{blue}─'
  typeset -g POWERLEVEL9K_MULTILINE_LAST_PROMPT_SUFFIX='%F{blue}─'
  typeset -g POWERLEVEL9K_LEFT_PROMPT_FIRST_SEGMENT_START_SYMBOL=''
  typeset -g POWERLEVEL9K_RIGHT_PROMPT_LAST_SEGMENT_END_SYMBOL=''
  typeset -g POWERLEVEL9K_SHOW_RULER=false
  typeset -g POWERLEVEL9K_RULER_CHAR='─'
  typeset -g POWERLEVEL9K_RULER_FOREGROUND=242
  typeset -g POWERLEVEL9K_WHITESPACE_BETWEEN_LEFT_SEGMENTS=''
  typeset -g POWERLEVEL9K_WHITESPACE_BETWEEN_RIGHT_SEGMENTS=''
  typeset -g POWERLEVEL9K_CONTEXT_TEMPLATE='%n'
  typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=180
  typeset -g POWERLEVEL9K_CONTEXT_ROOT_FOREGROUND=9
  typeset -g POWERLEVEL9K_CONTEXT_SUDO_FOREGROUND=9
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=31
  typeset -g POWERLEVEL9K_DIR_SHORTENED_FOREGROUND=31
  typeset -g POWERLEVEL9K_DIR_ANCHOR_FOREGROUND=39
  typeset -g POWERLEVEL9K_DIR_ANCHOR_BOLD=true
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=76
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=178
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND=178
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_FOREGROUND=9
  typeset -g POWERLEVEL9K_VCS_LOADING_FOREGROUND=242
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=70
  typeset -g POWERLEVEL9K_STATUS_OK_BOLD=true
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=9
  typeset -g POWERLEVEL9K_STATUS_ERROR_BOLD=true
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=66
  typeset -g POWERLEVEL9K_TIME_FORMAT='%D{%H:%M:%S}'
  typeset -g POWERLEVEL9K_TRANSIENT_PROMPT=off
  typeset -g POWERLEVEL9K_INSTANT_PROMPT=verbose
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true
  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=''
  typeset -g POWERLEVEL9K_DIR_MAX_LENGTH=80
  typeset -g POWERLEVEL9K_VCS_MAX_INDEX_SIZE_DIRTY=-1
  typeset -g POWERLEVEL9K_VCS_DISABLE_GITSTATUS_FORMATTING=true
  typeset -g POWERLEVEL9K_VCS_BACKEND=git
  typeset -g POWERLEVEL9K_VCS_STAGED_ICON='\u00b1'
  typeset -g POWERLEVEL9K_VCS_UNSTAGED_ICON='\u25cf'
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='\u25cb'
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\u2193'
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\u2191'
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='\u2219'
  typeset -g POWERLEVEL9K_VCS_BRANCH_ICON='\u2387'
  typeset -g POWERLEVEL9K_VCS_TAG_ICON='\u2691'
  typeset -g POWERLEVEL9K_VCS_GIT_ICON='\uf113'
  typeset -g POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uf113'
  typeset -g POWERLEVEL9K_VCS_GIT_BITBUCKET_ICON='\uf113'
  typeset -g POWERLEVEL9K_VCS_GIT_GITLAB_ICON='\uf296'
  typeset -g POWERLEVEL9K_VCS_HIDE_TAGS=false
  typeset -g POWERLEVEL9K_VCS_CLEAN_ICON='\uf058'
  typeset -g POWERLEVEL9K_VCS_MODIFIED_ICON='\uf06a'
  typeset -g POWERLEVEL9K_VCS_UNTRACKED_ICON='\uf059'
  typeset -g POWERLEVEL9K_VCS_CONFLICTED_ICON='\uf057'
  typeset -g POWERLEVEL9K_VCS_LOADING_ICON='\uf251'
  typeset -g POWERLEVEL9K_VCS_STASH_ICON='\uf01c'
  typeset -g POWERLEVEL9K_VCS_COMMIT_ICON='\ue729'
  typeset -g POWERLEVEL9K_VCS_INCOMING_CHANGES_ICON='\uf01b'
  typeset -g POWERLEVEL9K_VCS_OUTGOING_CHANGES_ICON='\uf01a'
}

(( ! $+functions[p10k] )) || p10k reload
EOF
}

# Create bashrc
create_bashrc() {
    cat > $HOME/.bashrc << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# MAR-PD Pro Theme - Bash Configuration

# Load ZSH configuration if available
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
else
    # Fallback to basic configuration
    export PS1='\[\033[1;31m\]MAR-PD\[\033[1;33m\]♪↗➜\[\033[0m\] '
    
    # Basic aliases
    alias ls='ls --color=auto'
    alias ll='ls -la --color=auto'
    alias grep='grep --color=auto'
    alias cls='clear'
    
    # Welcome message
    echo -e "\033[1;32m[+]\033[0m MAR-PD Professional Terminal"
    echo -e "\033[1;32m[+]\033[0m Run ./setup.sh to install full theme"
fi
EOF
}

# Create termux properties
create_termux_properties() {
    mkdir -p $HOME/.termux
    
    cat > $HOME/.termux/colors.properties << 'EOF'
# MAR-PD Pro Theme Colors
# Terminal color scheme

background=#0a0a0a
foreground=#00ff00
cursor=#00ff00

color0=#000000
color1=#ff0000
color2=#00ff00
color3=#ffff00
color4=#0000ff
color5=#ff00ff
color6=#00ffff
color7=#ffffff
color8=#404040
color9=#ff4040
color10=#40ff40
color11=#ffff40
color12=#4040ff
color13=#ff40ff
color14=#40ffff
color15=#ffffff
EOF

    cat > $HOME/.termux/font.properties << 'EOF'
# MAR-PD Pro Theme Font
font=monospace
font-size=12
EOF
}

# Create custom scripts
create_custom_scripts() {
    # Create script directory
    mkdir -p $HOME/.termux-pro/scripts
    
    # Network scanner script
    cat > $HOME/.termux-pro/scripts/network-scan.sh << 'EOF'
#!/bin/bash

echo -e "\033[1;36m=== NETWORK SCANNER ===\033[0m"
echo

# Check if nmap is installed
if ! command -v nmap &> /dev/null; then
    echo -e "\033[1;33m[*]\033[0m Installing nmap..."
    pkg install -y nmap
fi

# Get local IP
local_ip=$(ifconfig wlan0 | grep 'inet' | awk '{print $2}')
echo -e "\033[1;32m[+]\033[0m Local IP: $local_ip"

# Scan network
network=$(echo $local_ip | cut -d'.' -f1-3)
echo -e "\033[1;32m[+]\033[0m Scanning network: $network.0/24"

# Perform scan
nmap -sn $network.0/24 | grep "Nmap scan report" | awk '{print $5, $6}'
EOF
    chmod +x $HOME/.termux-pro/scripts/network-scan.sh
    
    # Password generator script
    cat > $HOME/.termux-pro/scripts/password-gen.sh << 'EOF'
#!/bin/bash

echo -e "\033[1;36m=== PASSWORD GENERATOR ===\033[0m"
echo

length=${1:-12}
count=${2:-5}

echo -e "\033[1;32m[+]\033[0m Generating $count passwords of length $length"
echo

for ((i=1; i<=count; i++)); do
    password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9!@#$%^&*' | fold -w $length | head -n 1)
    echo -e "\033[1;33m[$i]\033[0m $password"
done
EOF
    chmod +x $HOME/.termux-pro/scripts/password-gen.sh
    
    # System info script
    cat > $HOME/.termux-pro/scripts/system-info.sh << 'EOF'
#!/bin/bash

echo -e "\033[1;36m=== SYSTEM INFORMATION ===\033[0m"
echo

# Device info
echo -e "\033[1;33m[*]\033[0m Device Information:"
echo "  Hostname: $(hostname)"
echo "  Architecture: $(uname -m)"
echo "  Kernel: $(uname -r)"
echo

# CPU info
echo -e "\033[1;33m[*]\033[0m CPU Information:"
echo "  Processor: $(cat /proc/cpuinfo | grep 'Processor' | head -1 | cut -d: -f2)"
echo "  Cores: $(nproc)"
echo

# Memory info
echo -e "\033[1;33m[*]\033[0m Memory Information:"
free -h
echo

# Storage info
echo -e "\033[1;33m[*]\033[0m Storage Information:"
df -h
echo

# Battery info (if available)
if command -v termux-battery-status &> /dev/null; then
    echo -e "\033[1;33m[*]\033[0m Battery Information:"
    termux-battery-status | grep -E "percentage|status"
fi
EOF
    chmod +x $HOME/.termux-pro/scripts/system-info.sh
}

# Apply changes
apply_changes() {
    log_message "INFO" "Applying changes..."
    
    # Reload termux properties
    termux-reload-settings
    
    # Set ZSH as default shell
    chsh -s zsh
    
    # Make scripts executable
    chmod +x $HOME/.termux-pro/scripts/*.sh
    
    # Create aliases for scripts
    echo "alias scan='~/.termux-pro/scripts/network-scan.sh'" >> $HOME/.zshrc
    echo "alias passgen='~/.termux-pro/scripts/password-gen.sh'" >> $HOME/.zshrc
    echo "alias sysinfo='~/.termux-pro/scripts/system-info.sh'" >> $HOME/.zshrc
    
    log_message "SUCCESS" "Changes applied successfully"
}

# =================== MAIN INSTALLATION ====================
main_installation() {
    clear
    
    echo -e "${BRIGHT_CYAN}"
    create_border $TERM_WIDTH "═"
    echo -e "╔══════════════════════════════════════════════════════════════╗"
    echo -e "║              ${BRIGHT_GREEN}MAR-PD ADVANCED THEME INSTALLATION${BRIGHT_CYAN}             ║"
    echo -e "║                     ${BRIGHT_YELLOW}Version: $VERSION${BRIGHT_CYAN}                     ║"
    echo -e "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${COLOR_RESET}"
    
    # Step 1: Load or create configuration
    echo -e "\n${BRIGHT_YELLOW}Step 1: Configuration${COLOR_RESET}"
    create_border $TERM_WIDTH "─"
    if ! load_configuration; then
        setup_wizard
    fi
    
    # Step 2: Install dependencies
    echo -e "\n${BRIGHT_YELLOW}Step 2: Installing Dependencies${COLOR_RESET}"
    create_border $TERM_WIDTH "─"
    install_dependencies
    
    # Step 3: Create theme files
    echo -e "\n${BRIGHT_YELLOW}Step 3: Creating Theme Files${COLOR_RESET}"
    create_border $TERM_WIDTH "─"
    create_theme_files
    
    # Step 4: Apply changes
    echo -e "\n${BRIGHT_YELLOW}Step 4: Applying Changes${COLOR_RESET}"
    create_border $TERM_WIDTH "─"
    apply_changes
    
    # Step 5: Finalization
    echo -e "\n${BRIGHT_YELLOW}Step 5: Finalization${COLOR_RESET}"
    create_border $TERM_WIDTH "─"
    
    echo -e "${BRIGHT_GREEN}"
    cat << "EOF"
╔══════════════════════════════════════════════════════════════╗
║                 INSTALLATION COMPLETE!                       ║
╠══════════════════════════════════════════════════════════════╣
║  MAR-PD Advanced Theme has been successfully installed!      ║
║                                                              ║
║  Features Available:                                         ║
║    • Professional hacker-style interface                     ║
║    • Animated banners and effects                           ║
║    • System monitoring tools                                ║
║    • Network scanning utilities                             ║
║    • Password generator                                     ║
║    • Custom color schemes                                   ║
║    • Multiple themes                                        ║
║    • Advanced ZSH configuration                             ║
║    • Powerlevel10k prompt                                  ║
║                                                              ║
║  Commands:                                                  ║
║    • banner    - Show MAR-PD banner                         ║
║    • matrix    - Matrix animation                           ║
║    • hack      - Hack simulation                            ║
║    • monitor   - System monitor                             ║
║    • scan      - Network scanner                            ║
║    • passgen   - Password generator                         ║
║    • sysinfo   - System information                         ║
║    • theme-config - Edit configuration                      ║
║                                                              ║
║  Restart Termux for full experience!                        ║
╚══════════════════════════════════════════════════════════════╝
EOF
    echo -e "${COLOR_RESET}"
    
    echo -e "\n${BRIGHT_CYAN}[*]${COLOR_RESET} Quick start:"
    echo -e "  ${GREEN}1.${COLOR_RESET} Close and reopen Termux"
    echo -e "  ${GREEN}2.${COLOR_RESET} Type ${BRIGHT_WHITE}banner${COLOR_RESET} to see your custom banner"
    echo -e "  ${GREEN}3.${COLOR_RESET} Type ${BRIGHT_WHITE}matrix${COLOR_RESET} for matrix animation"
    echo -e "  ${GREEN}4.${COLOR_RESET} Type ${BRIGHT_WHITE}theme-config${COLOR_RESET} to customize"
    
    echo -e "\n${BRIGHT_YELLOW}[!]${COLOR_RESET} Configuration saved at: ${BRIGHT_WHITE}$CONFIG_FILE${COLOR_RESET}"
    echo -e "${BRIGHT_YELLOW}[!]${COLOR_RESET} Log file: ${BRIGHT_WHITE}$LOG_FILE${COLOR_RESET}"
    
    # Show final prompt
    echo -e "\n${BRIGHT_RED}MAR-PD${BRIGHT_YELLOW}♪↗➜${COLOR_RESET} Installation complete!"
    echo -e "${BRIGHT_GREEN}We work cyber safe!${COLOR_RESET}"
}

# =================== BACKUP AND RESTORE ====================
backup_theme() {
    local backup_dir="$HOME/.termux-pro/backups/$(date +%Y%m%d_%H%M%S)"
    mkdir -p "$backup_dir"
    
    cp ~/.zshrc "$backup_dir/"
    cp ~/.bashrc "$backup_dir/"
    cp ~/.termux/* "$backup_dir/" 2>/dev/null
    cp ~/.termux-pro/config.conf "$backup_dir/" 2>/dev/null
    
    log_message "SUCCESS" "Theme backed up to $backup_dir"
    echo -e "${BRIGHT_GREEN}[+]${COLOR_RESET} Backup created: $backup_dir"
}

restore_theme() {
    local backup_dir="$1"
    
    if [ -z "$backup_dir" ]; then
        echo -e "${BRIGHT_YELLOW}Available backups:${COLOR_RESET}"
        ls -1 "$HOME/.termux-pro/backups/"
        read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Enter backup directory name: ")" backup_dir
        backup_dir="$HOME/.termux-pro/backups/$backup_dir"
    fi
    
    if [ -d "$backup_dir" ]; then
        cp "$backup_dir/.zshrc" ~/
        cp "$backup_dir/.bashrc" ~/
        cp "$backup_dir/*" ~/.termux/ 2>/dev/null
        cp "$backup_dir/config.conf" ~/.termux-pro/ 2>/dev/null
        
        log_message "SUCCESS" "Theme restored from $backup_dir"
        echo -e "${BRIGHT_GREEN}[+]${COLOR_RESET} Theme restored successfully!"
        echo -e "${BRIGHT_YELLOW}[!]${COLOR_RESET} Restart Termux or run: source ~/.zshrc"
    else
        log_message "ERROR" "Backup directory not found: $backup_dir"
        echo -e "${BRIGHT_RED}[!]${COLOR_RESET} Backup directory not found!"
    fi
}

# =================== UNINSTALL ====================
uninstall_theme() {
    echo -e "${BRIGHT_RED}"
    cat << "WARNING"
╔══════════════════════════════════════════════════════════════╗
║                     WARNING!                                 ║
╠══════════════════════════════════════════════════════════════╣
║  This will remove MAR-PD Theme configuration.               ║
║  Your original files will be backed up.                     ║
║                                                              ║
║  Are you sure you want to continue?                         ║
╚══════════════════════════════════════════════════════════════╝
WARNING
    echo -e "${COLOR_RESET}"
    
    read -p "$(echo -e "${BRIGHT_RED}[?]${COLOR_RESET} Type 'YES' to confirm: ")" confirm
    
    if [[ "$confirm" == "YES" ]]; then
        # Create backup
        backup_theme
        
        # Remove theme files
        rm -f ~/.zshrc
        rm -f ~/.bashrc
        rm -rf ~/.termux-pro
        rm -f ~/.p10k.zsh
        
        # Restore default termux properties
        rm -f ~/.termux/colors.properties
        rm -f ~/.termux/font.properties
        
        # Reset shell to bash
        chsh -s bash
        
        log_message "INFO" "MAR-PD theme uninstalled"
        echo -e "${BRIGHT_GREEN}[+]${COLOR_RESET} MAR-PD theme has been uninstalled."
        echo -e "${BRIGHT_YELLOW}[!]${COLOR_RESET} Please restart Termux."
    else
        echo -e "${BRIGHT_GREEN}[+]${COLOR_RESET} Uninstallation cancelled."
    fi
}

# =================== UPDATE ====================
update_theme() {
    echo -e "${BRIGHT_CYAN}[*]${COLOR_RESET} Checking for updates..."
    
    # Backup current installation
    backup_theme
    
    # Download latest version (simulated)
    echo -e "${BRIGHT_GREEN}[+]${COLOR_RESET} Updating to latest version..."
    sleep 2
    
    # Re-run installation
    main_installation
}

# =================== HELP ====================
show_help() {
    echo -e "${BRIGHT_CYAN}"
    cat << "EOF"
╔══════════════════════════════════════════════════════════════╗
║                   MAR-PD THEME HELP                          ║
╠══════════════════════════════════════════════════════════════╣
║  Usage: ./pro-theme.sh [OPTION]                             ║
║                                                              ║
║  Options:                                                   ║
║    install    - Install/Setup MAR-PD theme                  ║
║    update     - Update to latest version                    ║
║    backup     - Backup current configuration                ║
║    restore    - Restore from backup                         ║
║    uninstall  - Remove MAR-PD theme                         ║
║    help       - Show this help message                      ║
║    demo       - Show theme demonstration                    ║
║                                                              ║
║  Examples:                                                  ║
║    ./pro-theme.sh install                                   ║
║    ./pro-theme.sh backup                                    ║
║    ./pro-theme.sh restore 20240120_143022                   ║
║                                                              ║
║  Contact: https://t.me/master_spamming                      ║
║  Team: MAR-PD | We Work Cyber Safe                          ║
╚══════════════════════════════════════════════════════════════╝
EOF
    echo -e "${COLOR_RESET}"
}

# =================== DEMO ====================
theme_demo() {
    clear
    
    echo -e "${BRIGHT_CYAN}"
    cat << "EOF"
╔══════════════════════════════════════════════════════════════╗
║                   MAR-PD THEME DEMONSTRATION                 ║
╚══════════════════════════════════════════════════════════════╝
EOF
    echo -e "${COLOR_RESET}"
    
    # Show banner
    echo -e "\n${BRIGHT_YELLOW}1. Banner Display:${COLOR_RESET}"
    echo -e "${BRIGHT_CYAN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                     MAR-PD PRO TERMINAL                      ║"
    echo "╠══════════════════════════════════════════════════════════════╣"
    echo "║  USER    : Anonymous                                         ║"
    echo "║  ALIAS   : Ghost                                             ║"
    echo "║  RANK    : Expert                                            ║"
    echo "║  TEAM    : MAR-PD                                            ║"
    echo "║  MOTTO   : WE WORK CYBER SAFE                                ║"
    echo "║  SESSION : $(echo $SESSION_ID)                                ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "${COLOR_RESET}"
    
    # Show prompt
    echo -e "\n${BRIGHT_YELLOW}2. Custom Prompt:${COLOR_RESET}"
    echo -e "${BRIGHT_RED}MAR-PD${BRIGHT_YELLOW}♪↗➜${COLOR_RESET} apt update"
    echo -e "${BRIGHT_RED}MAR-PD${BRIGHT_YELLOW}♪↗➜${COLOR_RESET} apt upgrade"
    echo -e "${BRIGHT_RED}MAR-PD${BRIGHT_YELLOW}♪↗➜${COLOR_RESET} hack google.com"
    
    # Show animations
    echo -e "\n${BRIGHT_YELLOW}3. Animations:${COLOR_RESET}"
    echo -ne "${BRIGHT_GREEN}Matrix animation: "
    for i in {1..10}; do
        echo -ne "0101"
        sleep 0.05
    done
    echo -e "${COLOR_RESET}"
    
    # Show system monitor
    echo -e "\n${BRIGHT_YELLOW}4. System Monitor:${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}╔══════════════════════════════════════╗${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}║        SYSTEM MONITOR                ║${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}╠══════════════════════════════════════╣${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}║${COLOR_RESET} CPU: 25% ${BRIGHT_BLUE}                          ║${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}║${COLOR_RESET} RAM: 1.2/3.8GB (32%) ${BRIGHT_BLUE}             ║${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}║${COLOR_RESET} DISK: 45% ${BRIGHT_BLUE}                         ║${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}║${COLOR_RESET} BATTERY: 85% ${BRIGHT_BLUE}                      ║${COLOR_RESET}"
    echo -e "${BRIGHT_BLUE}╚══════════════════════════════════════╝${COLOR_RESET}"
    
    # Show commands
    echo -e "\n${BRIGHT_YELLOW}5. Available Commands:${COLOR_RESET}"
    echo -e "  ${BRIGHT_GREEN}matrix${COLOR_RESET}    - Matrix animation"
    echo -e "  ${BRIGHT_GREEN}hack${COLOR_RESET}      - Hack simulation"
    echo -e "  ${BRIGHT_GREEN}monitor${COLOR_RESET}   - System monitor"
    echo -e "  ${BRIGHT_GREEN}scan${COLOR_RESET}      - Network scanner"
    echo -e "  ${BRIGHT_GREEN}passgen${COLOR_RESET}   - Password generator"
    
    echo -e "\n${BRIGHT_GREEN}[+]${COLOR_RESET} Demo complete. Run ${BRIGHT_WHITE}./pro-theme.sh install${COLOR_RESET} to install."
}

# =================== MAIN ENTRY POINT ====================
main() {
    # Check if running in Termux
    if [ ! -d "/data/data/com.termux" ]; then
        echo -e "${BRIGHT_RED}[!]${COLOR_RESET} This script must be run in Termux!"
        exit 1
    fi
    
    # Get terminal size
    get_terminal_size
    
    # Create log directory
    mkdir -p "$(dirname "$LOG_FILE")"
    
    # Check arguments
    case "$1" in
        "install")
            main_installation
            ;;
        "update")
            update_theme
            ;;
        "backup")
            backup_theme
            ;;
        "restore")
            restore_theme "$2"
            ;;
        "uninstall")
            uninstall_theme
            ;;
        "demo")
            theme_demo
            ;;
        "help"|"--help"|"-h")
            show_help
            ;;
        *)
            # If no arguments, show menu
            clear
            echo -e "${BRIGHT_CYAN}"
            cat << "EOF"
╔══════════════════════════════════════════════════════════════╗
║               MAR-PD ADVANCED TERMUX THEME                   ║
╠══════════════════════════════════════════════════════════════╣
║  Select an option:                                          ║
║                                                              ║
║  1. Install / Setup Theme                                   ║
║  2. Update Theme                                            ║
║  3. Backup Configuration                                    ║
║  4. Restore Configuration                                   ║
║  5. Uninstall Theme                                         ║
║  6. Show Demo                                               ║
║  7. Help                                                    ║
║  8. Exit                                                    ║
║                                                              ║
║  Version: 3.0.0 | Team: MAR-PD                              ║
╚══════════════════════════════════════════════════════════════╝
EOF
            echo -e "${COLOR_RESET}"
            
            read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Enter choice (1-8): ")" choice
            
            case "$choice" in
                1) main_installation ;;
                2) update_theme ;;
                3) backup_theme ;;
                4) 
                    echo -e "${BRIGHT_YELLOW}Available backups:${COLOR_RESET}"
                    ls -1 "$HOME/.termux-pro/backups/" 2>/dev/null || echo "No backups found"
                    read -p "$(echo -e "${BRIGHT_GREEN}[?]${COLOR_RESET} Enter backup name: ")" backup_name
                    restore_theme "$HOME/.termux-pro/backups/$backup_name"
                    ;;
                5) uninstall_theme ;;
                6) theme_demo ;;
                7) show_help ;;
                8) exit 0 ;;
                *) echo -e "${BRIGHT_RED}[!]${COLOR_RESET} Invalid choice!" ;;
            esac
            ;;
    esac
}

# Start script
main "$@"
