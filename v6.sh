#!/bin/bash

# ============================================
# MAR-PD HIJACK TERMUX THEME
# Version: Ultimate Hijack Edition
# ============================================

clear
echo -e "\033[1;36m"
echo "░▒▓█▓▒░░▒▓█▓▒░░▒▓████████▓▒░░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓████████▓▒░▒▓█▓▒░      ░▒▓████████▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░░▒▓█▓▒░░▒▓████████▓▒░░▒▓█▓▒░░▒▓█▓▒░"
echo "╔══════════════════════════════════════╗"
echo "║    MAR-PD HIJACK THEME INSTALLER     ║"
echo "║          TERMUX TAKEOVER             ║"
echo "╚══════════════════════════════════════╝"
echo -e "\033[0m"

sleep 2

# =================== CONFIGURATION ===================
THEME_NAME="MAR-PD-HIJACK"
THEME_VERSION="Ultimate"
THEME_DIR="$HOME/.marpd-hijack"
TERMUX_DIR="$HOME/.termux"
BACKUP_DIR="$THEME_DIR/backup"
CACHE_DIR="$THEME_DIR/cache"

# Create directories
mkdir -p $THEME_DIR $BACKUP_DIR $CACHE_DIR $TERMUX_DIR

# =================== COLOR SETTINGS ===================
# Static Cyan for all text
CYAN_COLOR="\033[1;36m"
CYAN_HEX="#00ffff"

# Dynamic colors for effects
COLORS=(
    "\033[0;31m"  # Red
    "\033[0;32m"  # Green
    "\033[0;33m"  # Yellow
    "\033[0;34m"  # Blue
    "\033[0;35m"  # Magenta
    "\033[0;36m"  # Cyan
    "\033[1;31m"  # Bright Red
    "\033[1;32m"  # Bright Green
    "\033[1;33m"  # Bright Yellow
    "\033[1;34m"  # Bright Blue
    "\033[1;35m"  # Bright Magenta
    "\033[1;36m"  # Bright Cyan
)
RESET="\033[0m"

# =================== FUNCTIONS ===================
print_cyan() {
    echo -e "${CYAN_COLOR}$1${RESET}"
}

print_rainbow() {
    local text=$1
    local length=${#text}
    for (( i=0; i<$length; i++ )); do
        color=${COLORS[$((i % ${#COLORS[@]}))]}
        echo -ne "${color}${text:$i:1}${RESET}"
    done
    echo
}

hijack_animation() {
    clear
    echo -e "${CYAN_COLOR}"
    echo "╔══════════════════════════════════════╗"
    echo "║        SYSTEM HIJACK IN PROGRESS     ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${RESET}"
    
    messages=(
        "▒▓█ Injecting MAR-PD payload..."
        "▒▓█ Overwriting system files..."
        "▒▓█ Bypassing security protocols..."
        "▒▓█ Installing backdoor modules..."
        "▒▓█ Encrypting terminal session..."
        "▒▓█ Setting up command hooks..."
        "▒▓█ Compromising shell environment..."
        "▒▓█ Establishing persistence..."
    )
    
    for msg in "${messages[@]}"; do
        echo -ne "${CYAN_COLOR}[→] ${msg}${RESET}"
        sleep 0.3
        print_rainbow " ✓COMPROMISED"
        sleep 0.2
    done
    
    echo -e "${CYAN_COLOR}"
    echo "╔══════════════════════════════════════╗"
    echo "║       SYSTEM HIJACK COMPLETE         ║"
    echo "║      TERMINAL OWNED BY MAR-PD        ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "${RESET}"
}

wipe_existing_themes() {
    print_cyan "[+] Wiping existing themes..."
    
    # Remove common theme files
    rm -rf $HOME/.oh-my-zsh
    rm -rf $HOME/.zshrc
    rm -rf $HOME/.bashrc
    rm -rf $HOME/.termux/colors.properties
    rm -rf $HOME/.termux/font.properties
    rm -rf $HOME/.config/neofetch
    rm -rf $HOME/.cache/neofetch
    
    # Clean bash and zsh histories
    > $HOME/.bash_history
    > $HOME/.zsh_history
    
    print_cyan "[+] Existing themes eliminated"
}

install_dependencies() {
    print_cyan "[+] Installing dependencies..."
    
    pkg update -y > /dev/null 2>&1
    pkg upgrade -y > /dev/null 2>&1
    
    # Essential packages
    pkg install -y zsh git curl wget python neofetch cmatrix figlet toilet \
                   lolcat htop nmap nodejs ruby fish ncurses-utils tsu \
                   termux-api termux-tools proot > /dev/null 2>&1
    
    # Install Oh-My-Zsh silently
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        git clone https://github.com/ohmyzsh/ohmyzsh.git $HOME/.oh-my-zsh > /dev/null 2>&1
    fi
    
    print_cyan "[+] Dependencies installed"
}

setup_termux_theme() {
    print_cyan "[+] Configuring Termux theme..."
    
    # Create dark colors.properties
    cat > $TERMUX_DIR/colors.properties << EOF
# MAR-PD HIJACK THEME - Static Cyan Text
background=#000000
foreground=${CYAN_HEX}
cursor=${CYAN_HEX}

# Color palette
color0=#000000
color1=#ff0000
color2=#00ff00
color3=#ffff00
color4=#0000ff
color5=#ff00ff
color6=${CYAN_HEX}
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
    
    # Create font configuration
    cat > $TERMUX_DIR/font.properties << EOF
font=monospace
font-size=12
EOF
    
    # Create termux.properties for behavior
    cat > $TERMUX_DIR/termux.properties << EOF
# Termux behavior settings
bell-character=ignore
terminal-margin-horizontal=2
terminal-margin-vertical=2
use-black-ui=true
EOF
    
    print_cyan "[+] Termux theme configured"
}

create_hijack_zshrc() {
    print_cyan "[+] Creating ZSH configuration..."
    
    cat > $HOME/.zshrc << 'EOF'
#!/data/data/com.termux/files/usr/bin/zsh

# ============================================
# MAR-PD HIJACK TERMINAL THEME
# TERMINAL COMPROMISED - SYSTEM OWNED
# ============================================

# Global variables
export MARPD_USER="$(whoami)@$(hostname)"
export MARPD_SESSION_ID="$(date +%s)$RANDOM"
export MARPD_HIJACK_TIME="$(date '+%Y-%m-%d %H:%M:%S')"

# Color definitions - STATIC CYAN
C_CYAN="%F{51}"
C_RESET="%f"

# Always show banner on terminal start
always_show_banner() {
    clear
    
    # Top header with time - 100% width
    echo -n "${C_CYAN}"
    echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
    echo "▓                                                                      ▓"
    echo "▒  ░▒▓█▓▒░ ░▒▓██████▓▒░ ░▒▓████████▓▒░ ░▒▓██████▓▒░ ░▒▓██████▓▒░       ▒"
    echo "▓  ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░      ▓"
    echo "▒  ░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░      ▒"
    echo "▓  ░▒▓█▓▒░░▒▓██████▓▒░░▒▓██████▓▒░    ░▒▓██████▓▒░ ░▒▓██████▓▒░        ▓"
    echo "▒  ░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░       ▒"
    echo "▓  ░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░      ▓"
    echo "▒  ░▒▓█▓▒░▒▓██████▓▒░ ░▒▓████████▓▒░ ░▒▓██████▓▒░ ░▒▓█▓▒░ ░▒▓████▓▒░   ▒"
    echo "▓                                                                      ▓"
    echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
    echo -n "${C_RESET}"
    
    # System info line
    echo -n "${C_CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════════╗"
    echo "║ SESSION: ${MARPD_SESSION_ID} | USER: ${MARPD_USER} | TIME: ${MARPD_HIJACK_TIME} ║"
    echo "╚══════════════════════════════════════════════════════════════════════╝"
    echo -n "${C_RESET}"
    
    # Neofetch if available
    if command -v neofetch > /dev/null 2>&1; then
        echo -n "${C_CYAN}"
        echo "════════════════════════════ SYSTEM INFO ════════════════════════════"
        echo -n "${C_RESET}"
        neofetch --config none --off --color_blocks off \
                --ascii_colors 6 6 6 6 6 6 \
                --colors 6 6 6 6 6 6 2>/dev/null || true
    fi
    
    # Status line
    echo -n "${C_CYAN}"
    echo "════════════════════════════ SESSION STATUS ═══════════════════════════"
    echo -n "${C_RESET}"
    
    # Battery status if available
    if command -v termux-battery-status > /dev/null 2>&1; then
        battery=$(termux-battery-status 2>/dev/null | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        if [ ! -z "$battery" ]; then
            echo -n "${C_CYAN}[BATTERY: ${battery}%] "
        fi
    fi
    
    # Storage info
    storage=$(df -h /data 2>/dev/null | awk 'NR==2{print $4}' || echo "N/A")
    echo -n "${C_CYAN}[STORAGE: ${storage}] "
    
    # Network info
    if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
        echo -n "${C_CYAN}[NETWORK: ONLINE] "
    else
        echo -n "${C_CYAN}[NETWORK: OFFLINE] "
    fi
    
    # Time display
    echo -n "${C_CYAN}[TIME: $(date '+%I:%M:%S %p')]"
    echo "${C_RESET}"
    echo ""
}

# Matrix animation effect
matrix_effect() {
    if command -v cmatrix > /dev/null 2>&1; then
        cmatrix -C cyan -s
    else
        for i in {1..30}; do
            echo -n "${C_CYAN}"
            for j in {1..80}; do
                char=$((RANDOM % 2))
                echo -n $char
            done
            echo "${C_RESET}"
            sleep 0.05
        done
    fi
}

# Hack simulation
simulate_hack() {
    local target=${1:-"secure-system"}
    echo -n "${C_CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════════╗"
    echo "║                         HACK SIMULATION MODE                         ║"
    echo "║                         TARGET: ${target}                            ║"
    echo "╚══════════════════════════════════════════════════════════════════════╝"
    echo "${C_RESET}"
    
    phases=(
        "Initializing exploit framework..."
        "Scanning for vulnerabilities..."
        "Bypassing authentication..."
        "Escalating privileges..."
        "Extracting sensitive data..."
        "Covering tracks..."
        "Establishing persistence..."
    )
    
    for phase in "${phases[@]}"; do
        echo -n "${C_CYAN}[→] ${phase}"
        echo -n "${C_RESET}"
        sleep 0.4
        
        # Progress animation
        for i in {1..3}; do
            echo -n "${C_CYAN}."
            sleep 0.1
        done
        echo -n "${C_CYAN} ✓COMPROMISED"
        echo "${C_RESET}"
        sleep 0.2
    done
    
    echo -n "${C_CYAN}"
    echo "╔══════════════════════════════════════════════════════════════════════╗"
    echo "║                    TARGET ${target} COMPROMISED                      ║"
    echo "║                    ACCESS LEVEL: ROOT                                ║"
    echo "╚══════════════════════════════════════════════════════════════════════╝"
    echo "${C_RESET}"
}

# System monitor
system_monitor() {
    echo -n "${C_CYAN}"
    echo "═══════════════════════════ LIVE MONITOR ═════════════════════════════"
    echo "${C_RESET}"
    
    # CPU usage
    cpu=$(top -bn1 | grep "CPU:" | awk '{print $2}' | cut -d'%' -f1)
    echo -n "${C_CYAN}[CPU: ${cpu}%] "
    
    # Memory usage
    mem=$(free -m | awk 'NR==2{printf "%.1f", $3*100/$2}')
    echo -n "${C_CYAN}[MEM: ${mem}%] "
    
    # Temperature if available
    if [ -f "/sys/class/thermal/thermal_zone0/temp" ]; then
        temp=$(cat /sys/class/thermal/thermal_zone0/temp)
        temp=$((temp/1000))
        echo -n "${C_CYAN}[TEMP: ${temp}°C] "
    fi
    
    # Uptime
    uptime=$(uptime -p | sed 's/up //')
    echo -n "${C_CYAN}[UPTIME: ${uptime}]"
    echo "${C_RESET}"
    echo ""
}

# Custom prompt function
marpd_prompt() {
    # Get current time
    local current_time=$(date '+%I:%M:%S %p')
    
    # Get directory (truncated if too long)
    local current_dir=$(print -P "%~")
    if [ ${#current_dir} -gt 30 ]; then
        current_dir="...${current_dir: -27}"
    fi
    
    # Create the multi-line prompt
    echo -n "${C_CYAN}"
    echo "░▒▓ MAR-PD ~ ${current_dir} "
    echo "───────────────────────────────────────────────────────── ${current_time}  ▓▒░─╮  "
    echo "❯ ${C_RESET}"
}

# Set custom prompt
setopt prompt_subst
PROMPT='$(marpd_prompt)'

# Command history settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Auto-completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Key bindings
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^H' backward-kill-word
bindkey '^[[3~' delete-char

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cls='clear && always_show_banner'
alias update='pkg update && pkg upgrade'
alias install='pkg install'
alias remove='pkg uninstall'
alias search='pkg search'
alias matrix='matrix_effect'
alias hack='simulate_hack'
alias monitor='system_monitor'
alias banner='always_show_banner'
alias scan='nmap'
alias status='system_monitor'
alias theme-reload='source ~/.zshrc'
alias hijack='echo "System already hijacked by MAR-PD"'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Safety nets
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# Always show banner on startup
always_show_banner

# Welcome message
echo -n "${C_CYAN}"
echo "═══════════════════════════ COMMAND MENU ═════════════════════════════"
echo "  matrix    - Launch Matrix animation"
echo "  hack <target> - Simulate hacking a target"
echo "  monitor   - Show system monitor"
echo "  cls       - Clear and show banner"
echo "  scan      - Network scanner (nmap)"
echo "  status    - System status"
echo "═══════════════════════════════════════════════════════════════════════"
echo "${C_RESET}"
EOF
    
    print_cyan "[+] ZSH configuration created"
}

setup_bash_fallback() {
    print_cyan "[+] Setting up Bash fallback..."
    
    cat > $HOME/.bashrc << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# MAR-PD HIJACK BASH FALLBACK

# Load ZSH config if available
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
else
    # Fallback prompt
    PS1='\[\033[1;36m\]░▒▓ MAR-PD ~ \w \n───────────────────────────────────────────────────────── $(date "+%I:%M:%S %p")  ▓▒░─╮  \n❯\[\033[0m\] '
    
    # Basic banner
    clear
    echo -e "\033[1;36m"
    echo "╔══════════════════════════════════════════════════════════════════════╗"
    echo "║                 MAR-PD HIJACK THEME (BASH MODE)                      ║"
    echo "║                 Terminal Owned - System Compromised                  ║"
    echo "╚══════════════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
fi
EOF
    
    print_cyan "[+] Bash fallback configured"
}

create_persistence() {
    print_cyan "[+] Establishing persistence..."
    
    # Create startup script
    cat > $THEME_DIR/startup.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# MAR-PD Persistence Script
# Runs every time Termux starts

echo -e "\033[1;36m"
echo "░▒▓█▓▒░ ░▒▓██████▓▒░ ░▒▓████████▓▒░ ░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░▒▓█▓▒░      ░▒▓█▓▒░         ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░░▒▓██████▓▒░░▒▓██████▓▒░    ░▒▓██████▓▒░ ░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░      ░▒▓█▓▒░▒▓█▓▒░         ░▒▓█▓▒░      ░▒▓█▓▒░░▒▓█▓▒░"
echo "░▒▓█▓▒░▒▓██████▓▒░ ░▒▓████████▓▒░ ░▒▓██████▓▒░ ░▒▓█▓▒░ ░▒▓█▓▒░"
echo -e "\033[0m"

sleep 1

# Load theme
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
elif [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
EOF
    chmod +x $THEME_DIR/startup.sh
    
    # Add to bash_profile
    echo "source $THEME_DIR/startup.sh" >> $HOME/.bash_profile
    echo "source $THEME_DIR/startup.sh" >> $HOME/.profile
    
    # Create termux boot script
    mkdir -p $HOME/.termux/boot
    cat > $HOME/.termux/boot/00-marpd-theme.sh << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
# Auto-start on Termux boot
sleep 2
$HOME/.marpd-hijack/startup.sh
EOF
    chmod +x $HOME/.termux/boot/00-marpd-theme.sh
    
    print_cyan "[+] Persistence established"
}

apply_changes() {
    print_cyan "[+] Applying final changes..."
    
    # Set ZSH as default shell
    if [ -f "/data/data/com.termux/files/usr/bin/zsh" ]; then
        chsh -s zsh
    fi
    
    # Reload Termux settings
    if command -v termux-reload-settings > /dev/null 2>&1; then
        termux-reload-settings
    fi
    
    # Source the new configuration
    source $HOME/.zshrc 2>/dev/null || source $HOME/.bashrc 2>/dev/null
    
    print_cyan "[+] Changes applied"
}

final_hijack_message() {
    clear
    
    echo -e "\033[1;36m"
    echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
    echo "▓                                                                      ▓"
    echo "▒  ███    ███  █████  ██████  ██████   ██████  ██████                  ▒"
    echo "▓  ████  ████ ██   ██ ██   ██ ██   ██ ██    ██ ██   ██                 ▓"
    echo "▒  ██ ████ ██ ███████ ██████  ██   ██ ██    ██ ██████                  ▒"
    echo "▓  ██  ██  ██ ██   ██ ██      ██   ██ ██    ██ ██   ██                 ▓"
    echo "▒  ██      ██ ██   ██ ██      ██████   ██████  ██   ██                 ▒"
    echo "▓                                                                      ▓"
    echo "░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░░"
    echo -e "\033[0m"
    
    sleep 1
    
    echo -e "\033[1;36m"
    echo "╔══════════════════════════════════════════════════════════════════════╗"
    echo "║                  SYSTEM HIJACK COMPLETE                              ║"
    echo "║                 TERMINAL OWNED BY MAR-PD                             ║"
    echo "╚══════════════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    echo ""
    print_rainbow "ALL PREVIOUS THEMES HAVE BEEN WIPED"
    echo ""
    
    echo -e "\033[1;36m[+] Next time you open Termux:\033[0m"
    echo -e "  • MAR-PD theme will auto-load"
    echo -e "  • Banner will always show"
    echo -e "  • Custom prompt will be active"
    echo ""
    
    echo -e "\033[1;36m[+] Available commands:\033[0m"
    echo -e "  \033[1;36mcls\033[0m       - Clear and show banner"
    echo -e "  \033[1;36mmatrix\033[0m    - Matrix animation"
    echo -e "  \033[1;36mhack <target>\033[0m - Hack simulation"
    echo -e "  \033[1;36mmonitor\033[0m   - System monitor"
    echo -e "  \033[1;36mscan\033[0m      - Network scanner"
    echo ""
    
    echo -e "\033[1;36m[+] Your prompt will look like:\033[0m"
    echo -e "\033[1;36m░▒▓ MAR-PD ~ ~"
    echo -e "───────────────────────────────────────────────────────── 06:52:20 PM  ▓▒░─╮  "
    echo -e "❯\033[0m"
    echo ""
    
    echo -e "\033[1;32m[✓] Installation successful! Restart Termux to see full effects.\033[0m"
    echo -e "\033[1;36m[→] Close and reopen Termux now...\033[0m"
}

# =================== MAIN EXECUTION ===================
main() {
    echo -e "\033[1;36m"
    echo "╔══════════════════════════════════════════════════════════════════════╗"
    echo "║               INITIATING SYSTEM HIJACK                               ║"
    echo "╚══════════════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    sleep 2
    
    # Step 1: Show hijack animation
    hijack_animation
    
    # Step 2: Wipe existing themes
    wipe_existing_themes
    
    # Step 3: Install dependencies
    install_dependencies
    
    # Step 4: Setup Termux theme
    setup_termux_theme
    
    # Step 5: Create ZSH config
    create_hijack_zshrc
    
    # Step 6: Setup Bash fallback
    setup_bash_fallback
    
    # Step 7: Create persistence
    create_persistence
    
    # Step 8: Apply changes
    apply_changes
    
    # Step 9: Final message
    final_hijack_message
}

# Run main function with error handling
trap 'echo -e "\033[1;31m[✗] Installation interrupted!\033[0m"; exit 1' INT
main

# Final touch - make everything cyan
echo -e "\033[1;36m"
echo "╔══════════════════════════════════════════════════════════════════════╗"
echo "║          MAR-PD HIJACK THEME - INSTALLATION COMPLETE                 ║"
echo "║               WE OWN THE TERMINAL | WE WORK CYBER SAFE               ║"
echo "╚══════════════════════════════════════════════════════════════════════╝"
echo -e "\033[0m"
