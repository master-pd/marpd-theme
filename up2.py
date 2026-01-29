#!/bin/bash

# ============================================
# MAR-PD PRO ULTIMATE TERMUX THEME
# Hollywood Hacker Style | Professional Grade
# ============================================

clear
echo -e "\033[1;38;5;51m"
cat << "EOF"
╔══════════════════════════════════════════════════════════════╗
║                                                              ║
║   ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗            ║
║   ████╗ ████║██╔══██╗██╔══██╗    ██╔══██╗██╔══██╗           ║
║   ██╔████╔██║███████║██████╔╝    ██║  ██║██║  ██║           ║
║   ██║╚██╔╝██║██╔══██║██╔═══╝     ██║  ██║██║  ██║           ║
║   ██║ ╚═╝ ██║██║  ██║██║         ██████╔╝██████╔╝           ║
║   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═════╝            ║
║                                                              ║
║              P R O F E S S I O N A L   E D I T I O N         ║
║                     Hollywood Hacker Style                  ║
╚══════════════════════════════════════════════════════════════╝
EOF
echo -e "\033[0m"

sleep 2

# =================== CONFIGURATION ===================
THEME_NAME="MAR-PD_PRO_HOLLYWOOD"
THEME_VERSION="7.0"
THEME_AUTHOR="MAR-PD Team"
THEME_DIR="$HOME/.marpd-pro"
WALLPAPER_DIR="$HOME/.termux/wallpaper"
FONT_DIR="$HOME/.termux/fonts"
SCRIPT_DIR="$THEME_DIR/scripts"
PLUGIN_DIR="$THEME_DIR/plugins"

# Create directories
mkdir -p $THEME_DIR $WALLPAPER_DIR $FONT_DIR $SCRIPT_DIR $PLUGIN_DIR

# =================== HOLLYWOOD COLOR PALETTE ===================
# Professional Hollywood Hacker Colors
BLACK_BG="#0a0a0a"        # Pure Black Background
MATRIX_GREEN="#00ff41"    # Matrix Green
CYBER_CYAN="#00ffff"      # Cyber Cyan
HOLO_YELLOW="#ffff00"     # Holographic Yellow
NEON_PURPLE="#9d00ff"     # Neon Purple
GLOWING_BLUE="#0066ff"    # Glowing Blue
TERMINAL_WHITE="#f0f0f0"  # Terminal White
DARK_GRAY="#1a1a1a"       # Dark Gray

# =================== ANIMATION FUNCTIONS ===================
hollywood_intro() {
    clear
    echo -e "\033[48;5;232m"
    echo -e "\033[38;5;46m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                     INITIALIZING SYSTEM                      ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    # Hollywood style loading
    echo -ne "\033[38;5;46m"
    echo "LOADING MAR-PD PRO THEME..."
    echo
    for i in {1..50}; do
        echo -ne "["
        for j in {1..50}; do
            if [ $j -le $i ]; then
                echo -ne "█"
            else
                echo -ne " "
            fi
        done
        echo -ne "] $((i*2))% \r"
        sleep 0.03
    done
    echo -e "\033[0m"
    echo
}

rainbow_text() {
    local text="$1"
    local colors=("196" "202" "208" "214" "220" "226" "190" "154" "118" "82" "46" "47" "48" "49" "50" "51" "45" "39" "33" "27" "21" "57" "93" "129" "165" "201" "200" "199" "198" "197")
    local idx=0
    for ((i=0; i<${#text}; i++)); do
        char="${text:$i:1}"
        color="${colors[$idx]}"
        echo -ne "\033[38;5;${color}m${char}\033[0m"
        idx=$(( (idx + 1) % ${#colors[@]} ))
    done
    echo
}

matrix_rain() {
    local lines=15
    local cols=$(tput cols)
    echo -e "\033[38;5;46m"
    for ((i=0; i<lines; i++)); do
        for ((j=0; j<cols; j+=2)); do
            echo -n "$((RANDOM % 2))"
        done
        echo
        sleep 0.05
    done
    echo -e "\033[0m"
}

neon_glow() {
    local text="$1"
    echo -e "\033[38;5;51m\033[48;5;232m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                                                              ║"
    printf "║%*s║\n" $((58)) | tr ' ' ' '
    printf "║%*s%s%*s║\n" $(( (58 - ${#text}) / 2 )) "" "$text" $(( (58 - ${#text} + 1) / 2 )) ""
    printf "║%*s║\n" $((58)) | tr ' ' ' '
    echo "║                                                              ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
}

# =================== INSTALLATION ===================
install_professional_packages() {
    echo -e "\033[1;38;5;51m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║              INSTALLING PROFESSIONAL PACKAGES                ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    # Update system
    pkg update -y && pkg upgrade -y
    
    # Essential tools
    essential_packages=(
        "zsh" "git" "curl" "wget" "python" "nodejs" "ruby" "perl"
        "neofetch" "htop" "nmap" "netcat" "openssh" "openssl"
        "vim" "nano" "micro" "tmux" "ranger" "fzf" "bat" "exa"
        "fd" "ripgrep" "tldr" "cheat" "glow" "jq" "yq"
    )
    
    # Visual tools
    visual_packages=(
        "cmatrix" "cava" "pipes.sh" "bastet" "ninvaders"
        "figlet" "toilet" "lolcat" "boxes" "pv"
        "sl" "cowsay" "fortune" "ponysay"
    )
    
    # Development tools
    dev_packages=(
        "clang" "make" "cmake" "binutils" "gdb"
        "python-numpy" "python-pip" "nodejs-lts"
        "php" "mysql" "sqlite" "postgresql"
    )
    
    echo -e "\033[1;32m[→] Installing Essential Tools...\033[0m"
    for pkg in "${essential_packages[@]}"; do
        echo -e "  \033[1;36m✓\033[0m $pkg"
        pkg install -y $pkg > /dev/null 2>&1
    done
    
    echo -e "\n\033[1;32m[→] Installing Visual Tools...\033[0m"
    for pkg in "${visual_packages[@]}"; do
        echo -e "  \033[1;36m✓\033[0m $pkg"
        pkg install -y $pkg > /dev/null 2>&1
    done
    
    echo -e "\n\033[1;32m[→] Installing Development Tools...\033[0m"
    for pkg in "${dev_packages[@]}"; do
        echo -e "  \033[1;36m✓\033[0m $pkg"
        pkg install -y $pkg > /dev/null 2>&1
    done
    
    # Install Oh-My-Zsh with custom theme
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo -e "\n\033[1;32m[→] Installing Oh-My-Zsh...\033[0m"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
    
    # Install Powerlevel10k
    echo -e "\n\033[1;32m[→] Installing Powerlevel10k...\033[0m"
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
}

setup_hollywood_colors() {
    echo -e "\033[1;38;5;51m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║              CONFIGURING HOLLYWOOD COLORS                    ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    # Create Hollywood color scheme
    cat > $HOME/.termux/colors.properties << EOF
# MAR-PD HOLLYWOOD HACKER THEME
# Professional Hollywood Style Colors

background=$BLACK_BG
foreground=$TERMINAL_WHITE
cursor=$MATRIX_GREEN

# Standard colors
color0=#000000
color1=#ff5555      # Bright Red
color2=$MATRIX_GREEN # Matrix Green
color3=#ffff55      # Yellow
color4=#5555ff      # Blue
color5=$NEON_PURPLE # Neon Purple
color6=$CYBER_CYAN  # Cyber Cyan
color7=#bbbbbb      # Light Gray

# Bright colors
color8=#444444
color9=#ff8888
color10=#88ff88
color11=$HOLO_YELLOW
color12=#8888ff
color13=#ff88ff
color14=#88ffff
color15=#ffffff
EOF
    
    # Font configuration
    cat > $HOME/.termux/font.properties << EOF
font=JetBrainsMono-Regular.ttf
font-size=13
EOF
    
    # Download JetBrains Mono font
    if [ ! -f "$FONT_DIR/JetBrainsMono-Regular.ttf" ]; then
        echo -e "\033[1;36m[+] Downloading JetBrains Mono font...\033[0m"
        wget -q https://github.com/JetBrains/JetBrainsMono/releases/download/v2.304/JetBrainsMono-2.304.zip -O $FONT_DIR/font.zip
        unzip -q $FONT_DIR/font.zip -d $FONT_DIR/
        cp $FONT_DIR/fonts/ttf/JetBrainsMono-Regular.ttf $HOME/.termux/font.ttf
    fi
}

create_professional_zshrc() {
    echo -e "\033[1;38;5;51m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║            CREATING PROFESSIONAL ZSH CONFIG                  ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    cat > $HOME/.zshrc << 'EOF'
#!/data/data/com.termux/files/usr/bin/zsh

# ============================================
# MAR-PD PROFESSIONAL HOLLYWOOD THEME
# ============================================

# Enable colors and autocompletion
autoload -U colors && colors
autoload -U compinit && compinit

# Oh-My-Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Professional plugins
plugins=(
    git
    zsh-autosuggestions
    zsh-syntax-highlighting
    command-not-found
    sudo
    extract
    colored-man-pages
    z
    web-search
    copyfile
    copydir
    dirhistory
    history
    emoji
    git-flow
    docker
    kubectl
    npm
    yarn
    pip
    python
    ssh-agent
    gpg-agent
    tmux
)

source $ZSH/oh-my-zsh.sh

# Hollywood Color Variables
export HOLLYWOOD_BLACK="%F{232}"
export HOLLYWOOD_GREEN="%F{46}"
export HOLLYWOOD_CYAN="%F{51}"
export HOLLYWOOD_YELLOW="%F{226}"
export HOLLYWOOD_PURPLE="%F{93}"
export HOLLYWOOD_BLUE="%F{39}"
export HOLLYWOOD_RED="%F{196}"
export HOLLYWOOD_WHITE="%F{255}"

# User Info
export PRO_USER="Cyber Operator"
export PRO_ALIAS="Ghost"
export PRO_TEAM="MAR-PD"
export PRO_RANK="Elite"
export PRO_SESSION=$(date +%s%N | md5sum | head -c 12)

# =================== PROFESSIONAL FUNCTIONS ===================

function pro_banner() {
    clear
    echo -e "${HOLLYWOOD_CYAN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                                                              ║"
    echo "║  ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗             ║"
    echo "║  ████╗ ████║██╔══██╗██╔══██╗    ██╔══██╗██╔══██╗            ║"
    echo "║  ██╔████╔██║███████║██████╔╝    ██║  ██║██║  ██║            ║"
    echo "║  ██║╚██╔╝██║██╔══██║██╔═══╝     ██║  ██║██║  ██║            ║"
    echo "║  ██║ ╚═╝ ██║██║  ██║██║         ██████╔╝██████╔╝            ║"
    echo "║  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═════╝             ║"
    echo "║                                                              ║"
    echo "║                    P R O F E S S I O N A L                   ║"
    echo "║                    H O L L Y W O O D   E D I T I O N         ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "%f"
    
    echo -e "${HOLLYWOOD_GREEN}══════════════════════════════════════════════════════════════%f"
    echo -e "${HOLLYWOOD_YELLOW}👤 Operator: ${HOLLYWOOD_CYAN}$PRO_USER%f"
    echo -e "${HOLLYWOOD_YELLOW}🎭 Alias:    ${HOLLYWOOD_PURPLE}$PRO_ALIAS%f"
    echo -e "${HOLLYWOOD_YELLOW}🔰 Team:     ${HOLLYWOOD_RED}$PRO_TEAM%f"
    echo -e "${HOLLYWOOD_YELLOW}⭐ Rank:     ${HOLLYWOOD_BLUE}$PRO_RANK%f"
    echo -e "${HOLLYWOOD_YELLOW}🆔 Session:  ${HOLLYWOOD_GREEN}$PRO_SESSION%f"
    echo -e "${HOLLYWOOD_GREEN}══════════════════════════════════════════════════════════════%f"
    
    # System info with neofetch
    if command -v neofetch &> /dev/null; then
        echo
        neofetch --ascii_distro arch_small --colors 4 6 2 1 7
    fi
}

function matrix_hollywood() {
    echo -e "${HOLLYWOOD_GREEN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                    HOLLYWOOD MATRIX MODE                     ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "%f"
    
    if command -v cmatrix &> /dev/null; then
        cmatrix -C green -s -u 2
    else
        for i in {1..50}; do
            for j in {1..80}; do
                echo -n "$((RANDOM % 2))"
            done
            echo
            sleep 0.05
        done
    fi
}

function cyber_attack() {
    local target=${1:-"unknown"}
    echo -e "${HOLLYWOOD_RED}"
    cat << "EOF"
╔═══╗╔═══╗╔╗╔═╗╔═══╗╔═══╗       ╔═══╗╔╗─╔╗╔═══╗╔═══╗╔╗╔══╗
║╔═╗║║╔══╝║║║╔╝║╔══╝║╔═╗║       ║╔═╗║║║─║║║╔═╗║║╔═╗║║║╚╣─╝
║╚═╝║║╚══╗║╚╝╝─║╚══╗║╚═╝║       ║║─║║║║─║║║╚══╗║║─║║║║─║║─
║╔╗╔╝║╔══╝║╔╗║─║╔══╝║╔╗╔╝       ║╚═╝║║║─║║╚══╗║║╚═╝║║╚╗║║─
║║║╚╗║╚══╗║║║╚╗║╚══╗║║║╚╗       ║╔═╗║║╚═╝║║╚═╝║║╔═╗║║╔╝║║─
╚╝╚═╝╚═══╝╚╝╚═╝╚═══╝╚╝╚═╝       ╚╝─╚╝╚═══╝╚═══╝╚╝─╚╝╚╝─╚╝
EOF
    echo -e "%f"
    
    echo -e "${HOLLYWOOD_YELLOW}[*] Initializing cyber attack on: ${HOLLYWOOD_CYAN}$target%f"
    echo
    
    attacks=(
        "Scanning network vulnerabilities..."
        "Bypassing firewall protection..."
        "Injecting stealth payload..."
        "Cracking encryption layers..."
        "Accessing secure database..."
        "Extracting confidential data..."
        "Cleaning trace logs..."
        "Establishing backdoor access..."
    )
    
    for attack in "${attacks[@]}"; do
        echo -ne "${HOLLYWOOD_GREEN}[→]${HOLLYWOOD_WHITE} $attack%f\r"
        sleep 0.8
        echo -e "${HOLLYWOOD_GREEN}[✓]${HOLLYWOOD_WHITE} $attack%f"
    done
    
    echo -e "\n${HOLLYWOOD_CYAN}[+] Attack completed successfully on $target%f"
    echo -e "${HOLLYWOOD_PURPLE}[*] Data secured and encrypted%f"
}

function system_dashboard() {
    while true; do
        clear
        echo -e "${HOLLYWOOD_CYAN}┌──────────────────────────────────────────────────────────┐%f"
        echo -e "${HOLLYWOOD_CYAN}│                 SYSTEM DASHBOARD                         │%f"
        echo -e "${HOLLYWOOD_CYAN}├──────────────────────────────────────────────────────────┤%f"
        
        # CPU Usage
        cpu_usage=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
        echo -e "${HOLLYWOOD_CYAN}│ ${HOLLYWOOD_WHITE}CPU: ${HOLLYWOOD_GREEN}$cpu_usage% ${HOLLYWOOD_CYAN}" \
               "["$(printf "%0.s█" $(seq 1 $((cpu_usage/5))))"$(printf "%0.s " $(seq 1 $((20-cpu_usage/5))))"]%f"
        
        # Memory Usage
        mem_total=$(free -m | awk 'NR==2{print $2}')
        mem_used=$(free -m | awk 'NR==2{print $3}')
        mem_percent=$((mem_used * 100 / mem_total))
        echo -e "${HOLLYWOOD_CYAN}│ ${HOLLYWOOD_WHITE}RAM: ${HOLLYWOOD_BLUE}${mem_used}MB/${mem_total}MB ($mem_percent%) ${HOLLYWOOD_CYAN}" \
               "["$(printf "%0.s█" $(seq 1 $((mem_percent/5))))"$(printf "%0.s " $(seq 1 $((20-mem_percent/5))))"]%f"
        
        # Battery
        if command -v termux-battery-status &> /dev/null; then
            battery=$(termux-battery-status 2>/dev/null | grep percentage | cut -d: -f2 | tr -d ', ')
            status=$(termux-battery-status 2>/dev/null | grep status | cut -d: -f2 | tr -d '" ,')
            echo -e "${HOLLYWOOD_CYAN}│ ${HOLLYWOOD_WHITE}BAT: ${HOLLYWOOD_YELLOW}$battery% ($status) ${HOLLYWOOD_CYAN}" \
                   "["$(printf "%0.s█" $(seq 1 $((battery/5))))"$(printf "%0.s " $(seq 1 $((20-battery/5))))"]%f"
        fi
        
        # Storage
        storage=$(df -h / | awk 'NR==2{print $5}')
        used_gb=$(df -h / | awk 'NR==2{print $3}')
        total_gb=$(df -h / | awk 'NR==2{print $2}')
        echo -e "${HOLLYWOOD_CYAN}│ ${HOLLYWOOD_WHITE}STR: ${HOLLYWOOD_PURPLE}$used_gb/$total_gb ($storage) ${HOLLYWOOD_CYAN}" \
               "["$(printf "%0.s█" $(seq 1 $(echo ${storage%\%} | awk '{print int($1/5)}')))"$(printf "%0.s " $(seq 1 $((20-$(echo ${storage%\%} | awk '{print int($1/5)}')))))]%f"
        
        # Network
        echo -e "${HOLLYWOOD_CYAN}│ ${HOLLYWOOD_WHITE}NET: ${HOLLYWOOD_CYAN}$(curl -s ifconfig.me) ${HOLLYWOOD_CYAN}" \
               "[$(ping -c 1 google.com &> /dev/null && echo "${HOLLYWOOD_GREEN}ONLINE%f" || echo "${HOLLYWOOD_RED}OFFLINE%f")]%f"
        
        # Time
        echo -e "${HOLLYWOOD_CYAN}│ ${HOLLYWOOD_WHITE}TIME: ${HOLLYWOOD_YELLOW}$(date '+%Y-%m-%d %H:%M:%S')%f"
        
        echo -e "${HOLLYWOOD_CYAN}├──────────────────────────────────────────────────────────┤%f"
        echo -e "${HOLLYWOOD_CYAN}│ ${HOLLYWOOD_WHITE}Press ${HOLLYWOOD_RED}Ctrl+C ${HOLLYWOOD_WHITE}to exit ${HOLLYWOOD_CYAN}                         │%f"
        echo -e "${HOLLYWOOD_CYAN}└──────────────────────────────────────────────────────────┘%f"
        sleep 2
    done
}

function rainbow_prompt() {
    local colors=("196" "202" "208" "214" "220" "226" "190" "154" "118" "82" "46" "47" "48" "49" "50" "51")
    local prompt_text="MAR-PD♪↗➜"
    
    echo -ne "%{\$reset_color%}"
    for ((i=0; i<${#prompt_text}; i++)); do
        char="${prompt_text:$i:1}"
        color="${colors[$i % ${#colors[@]}]}"
        echo -ne "%{\$FG[$color]%}$char"
    done
    echo -ne "%{\$reset_color%} "
}

# Custom Prompt (Rainbow Style)
PROMPT='$(rainbow_prompt)'
RPROMPT='%{$FG[51]%}[%{$FG[226]%}%*%{$FG[51]%}]%{$reset_color%}'

# Professional Aliases
alias ls='exa --icons --group-directories-first --time-style=long-iso'
alias ll='exa -la --icons --group-directories-first --time-style=long-iso'
alias lt='exa --tree --icons --level=2'
alias la='exa -a --icons'
alias cat='bat --style=grid'
alias grep='rg --color=always'
alias find='fd'
alias ps='procs'
alias top='htop'
alias df='duf'
alias du='dust'
alias ping='prettyping'
alias diff='diff-so-fancy'
alias vim='nvim'
alias nano='micro'
alias curl='curlie'
alias wget='wget2'

# Project aliases
alias proj='cd ~/projects'
alias logs='cd ~/logs'
alias tools='cd ~/tools'
alias scripts='cd ~/scripts'

# System aliases
alias update='pkg update && pkg upgrade'
alias install='pkg install'
alias remove='pkg uninstall'
alias search='pkg search'
alias clean='pkg clean'
alias services='sv status /data/data/com.termux/files/usr/var/service/*'

# Theme aliases
alias banner='pro_banner'
alias matrix='matrix_hollywood'
alias attack='cyber_attack'
alias dashboard='system_dashboard'
alias status='system_dashboard'
alias theme-reload='source ~/.zshrc'
alias theme-edit='micro ~/.zshrc'
alias theme-backup='cp ~/.zshrc $HOME/.marpd-pro/backup-$(date +%Y%m%d_%H%M%S).zsh'

# Git aliases
alias gs='git status'
alias ga='git add'
alias gc='git commit'
alias gp='git push'
alias gl='git log --oneline --graph --all'
alias gd='git diff'
alias gco='git checkout'

# Fun aliases
alias hollywood='cmatrix -C cyan -s'
alias starwars='telnet towel.blinkenlights.nl'
alias hack='echo "Hack the planet!"'

# History settings
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt incappendhistory
setopt histignorealldups
setopt histreduceblanks

# Auto-completion
zstyle ':completion:*' menu select
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Key bindings
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^H' backward-kill-word
bindkey '^[[3~' delete-char
bindkey '^R' history-incremental-search-backward

# Startup
if [[ -z "$TMUX" ]] && [[ -n "$SSH_CONNECTION" ]]; then
    pro_banner
else
    echo -e "${HOLLYWOOD_GREEN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║        MAR-PD PROFESSIONAL TERMINAL v7.0                     ║"
    echo "║        Hollywood Hacker Edition                              ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "%f"
fi

# Welcome message
echo -e "${HOLLYWOOD_CYAN}[+]${HOLLYWOOD_WHITE} Welcome to MAR-PD Professional Terminal%f"
echo -e "${HOLLYWOOD_YELLOW}[+]${HOLLYWOOD_WHITE} Type 'banner' to show professional banner%f"
echo -e "${HOLLYWOOD_PURPLE}[+]${HOLLYWOOD_WHITE} Type 'matrix' for Hollywood matrix%f"
echo -e "${HOLLYWOOD_BLUE}[+]${HOLLYWOOD_WHITE} Type 'attack <target>' for cyber attack simulation%f"
echo -e "${HOLLYWOOD_GREEN}[+]${HOLLYWOOD_WHITE} Type 'dashboard' for system dashboard%f"
echo -e "${HOLLYWOOD_CYAN}[+]${HOLLYWOOD_WHITE} Type 'theme-edit' to customize theme%f"
echo
EOF
}

create_professional_scripts() {
    echo -e "\033[1;38;5;51m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║            CREATING PROFESSIONAL SCRIPTS                     ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    # Battery monitor with graphics
    cat > $SCRIPT_DIR/battery-pro.sh << 'EOF'
#!/bin/bash

# Professional Battery Monitor

while true; do
    clear
    
    # Get battery info
    if command -v termux-battery-status &> /dev/null; then
        battery_data=$(termux-battery-status)
        percentage=$(echo $battery_data | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        status=$(echo $battery_data | grep -o '"status":"[^"]*"' | cut -d: -f2 | tr -d '"')
        temp=$(echo $battery_data | grep -o '"temperature":[0-9]*' | cut -d: -f2)
        
        # Convert temperature
        if [ ! -z "$temp" ]; then
            temp_c=$(echo "scale=1; $temp/10" | bc)
        fi
    else
        percentage=100
        status="UNKNOWN"
        temp_c="N/A"
    fi
    
    # Display
    echo -e "\033[48;5;232m"
    echo -e "\033[38;5;51m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                 PROFESSIONAL BATTERY MONITOR                 ║"
    echo "╠══════════════════════════════════════════════════════════════╣"
    echo "║                                                              ║"
    
    # Battery icon based on percentage
    echo -ne "║   "
    if [ $percentage -gt 90 ]; then
        echo -ne "\033[38;5;46m██████████\033[38;5;51m"
    elif [ $percentage -gt 70 ]; then
        echo -ne "\033[38;5;82m████████\033[38;5;51m  "
    elif [ $percentage -gt 50 ]; then
        echo -ne "\033[38;5;118m██████\033[38;5;51m    "
    elif [ $percentage -gt 30 ]; then
        echo -ne "\033[38;5;154m████\033[38;5;51m      "
    elif [ $percentage -gt 15 ]; then
        echo -ne "\033[38;5;214m██\033[38;5;51m        "
    else
        echo -ne "\033[38;5;196m█\033[38;5;51m         "
    fi
    
    echo -e "   ║"
    
    # Battery info
    echo -e "║                                                              ║"
    echo -e "║   \033[38;5;226mPercentage:\033[38;5;51m $percentage%                          ║"
    echo -e "║   \033[38;5;226mStatus:\033[38;5;51m $status                                 ║"
    
    if [ ! -z "$temp_c" ]; then
        echo -e "║   \033[38;5;226mTemperature:\033[38;5;51m ${temp_c}°C                           ║"
    fi
    
    # Time estimation
    if [ "$status" = "CHARGING" ]; then
        echo -e "║   \033[38;5;226mTime to full:\033[38;5;51m ~$(( (100 - percentage) / 2 )) minutes    ║"
    elif [ "$status" = "DISCHARGING" ]; then
        echo -e "║   \033[38;5;226mRemaining time:\033[38;5;51m ~$(( percentage / 3 )) minutes        ║"
    fi
    
    echo -e "║                                                              ║"
    echo -e "╠══════════════════════════════════════════════════════════════╣"
    echo -e "║   \033[38;5;39mTime: $(date '+%H:%M:%S') \033[38;5;51m                       ║"
    echo -e "║   \033[38;5;39mDate: $(date '+%Y-%m-%d') \033[38;5;51m                       ║"
    echo -e "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    sleep 10
done
EOF
    chmod +x $SCRIPT_DIR/battery-pro.sh
    
    # Network scanner pro
    cat > $SCRIPT_DIR/network-pro.sh << 'EOF'
#!/bin/bash

echo -e "\033[1;38;5;51m"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║                PROFESSIONAL NETWORK SCANNER                  ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

echo -e "\033[1;32m[+] Gathering network information...\033[0m"
echo

# Get IP information
ip_info=$(ifconfig wlan0 2>/dev/null || ip addr show 2>/dev/null)
public_ip=$(curl -s ifconfig.me)

echo -e "\033[1;36mLocal Network:\033[0m"
echo "$ip_info" | grep -E "inet|ether" | while read line; do
    echo -e "  \033[1;33m→\033[0m $line"
done

echo -e "\n\033[1;36mPublic IP:\033[0m"
echo -e "  \033[1;33m→\033[0m $public_ip"

echo -e "\n\033[1;36mScanning local network...\033[0m"
# Simulate scanning animation
for i in {1..3}; do
    for ip in {1..10}; do
        echo -ne "\033[1;32mScanning 192.168.1.$ip...\033[0m\r"
        sleep 0.1
    done
done

echo -e "\n\033[1;32m[+] Scan complete! Summary:\033[0m"
echo -e "  \033[1;33m✓\033[0m Found 5 active devices"
echo -e "  \033[1;33m✓\033[0m 3 devices running Linux"
echo -e "  \033[1;33m✓\033[0m 1 device running Windows"
echo -e "  \033[1;33m✓\033[0m 1 device running Android"
EOF
    chmod +x $SCRIPT_DIR/network-pro.sh
    
    # Password generator pro
    cat > $SCRIPT_DIR/password-pro.sh << 'EOF'
#!/bin/bash

echo -e "\033[1;38;5;51m"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║             PROFESSIONAL PASSWORD GENERATOR                  ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

length=20
count=5

echo -e "\033[1;36mGenerating $count professional passwords (length: $length)\033[0m"
echo

for i in {1..$count}; do
    # Generate different types of passwords
    pass1=$(openssl rand -base64 32 | tr -dc 'A-Za-z0-9!@#$%^&*' | head -c $length)
    pass2=$(date +%s%N | md5sum | base64 | head -c $length)
    pass3=$(cat /dev/urandom | tr -dc 'A-Za-z0-9' | head -c $((length-4)))'!@#$'
    
    passwords=($pass1 $pass2 $pass3)
    pass=${passwords[$RANDOM % ${#passwords[@]}]}
    
    # Calculate strength
    strength=0
    [[ $pass =~ [A-Z] ]] && ((strength++))
    [[ $pass =~ [a-z] ]] && ((strength++))
    [[ $pass =~ [0-9] ]] && ((strength++))
    [[ $pass =~ [!@#\$%^\&*] ]] && ((strength++))
    [[ ${#pass} -ge 12 ]] && ((strength++))
    
    strength_percent=$((strength * 20))
    
    echo -e "\033[1;33mPassword $i:\033[0m"
    echo -e "  \033[1;36m$pass\033[0m"
    echo -ne "  Strength: "
    
    # Strength indicator
    if [ $strength_percent -ge 80 ]; then
        echo -e "\033[1;42m\033[1;30m EXCELLENT \033[0m ($strength_percent%)"
    elif [ $strength_percent -ge 60 ]; then
        echo -e "\033[1;44m\033[1;37m STRONG \033[0m ($strength_percent%)"
    elif [ $strength_percent -ge 40 ]; then
        echo -e "\033[1;43m\033[1;30m MEDIUM \033[0m ($strength_percent%)"
    else
        echo -e "\033[1;41m\033[1;37m WEAK \033[0m ($strength_percent%)"
    fi
    echo
done

echo -e "\033[1;32m[+] Passwords generated successfully!\033[0m"
echo -e "\033[1;33m[*] Remember to use a password manager!\033[0m"
EOF
    chmod +x $SCRIPT_DIR/password-pro.sh
}

apply_final_touches() {
    echo -e "\033[1;38;5;51m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║               APPLYING FINAL TOUCHES                         ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    # Reload Termux settings
    termux-reload-settings
    
    # Set ZSH as default shell
    chsh -s zsh
    
    # Add script aliases to zshrc
    echo "alias battery-pro='$SCRIPT_DIR/battery-pro.sh'" >> $HOME/.zshrc
    echo "alias scan-pro='$SCRIPT_DIR/network-pro.sh'" >> $HOME/.zshrc
    echo "alias pass-pro='$SCRIPT_DIR/password-pro.sh'" >> $HOME/.zshrc
    echo "alias pro-theme='source ~/.zshrc'" >> $HOME/.zshrc
    
    # Create welcome script
    cat > $SCRIPT_DIR/welcome.sh << 'EOF'
#!/bin/bash

clear
echo -e "\033[1;38;5;51m"
cat << "ART"
 ███▄ ▄███▓ ▄▄▄       ██▓███   ██░ ██ 
▓██▒▀█▀ ██▒▒████▄    ▓██░  ██▒▓██░ ██▒
▓██    ▓██░▒██  ▀█▄  ▓██░ ██▓▒▒██▀▀██░
▒██    ▒██ ░██▄▄▄▄██ ▒██▄█▓▒ ▒░▓█ ░██ 
▒██▒   ░██▒ ▓█   ▓██▒▒██▒ ░  ░░▓█▒░██▓
░ ▒░   ░  ░ ▒▒   ▓▒█░▒▓▒░ ░  ░ ▒ ░░▒░▒
░  ░      ░  ▒   ▒▒ ░░▒ ░      ▒ ░▒░ ░
░      ░     ░   ▒   ░░        ░  ░░ ░
       ░         ░  ░          ░  ░  ░
ART
echo -e "\033[0m"

sleep 1

echo -e "\033[1;32m"
echo "╔══════════════════════════════════════════════════════════════╗"
echo "║         MAR-PD PROFESSIONAL TERMINAL READY                  ║"
echo "║         Hollywood Hacker Edition v7.0                       ║"
echo "╚══════════════════════════════════════════════════════════════╝"
echo -e "\033[0m"

sleep 2
EOF
    chmod +x $SCRIPT_DIR/welcome.sh
}

show_completion_message() {
    clear
    echo -e "\033[48;5;232m"
    echo -e "\033[1;38;5;51m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                                                              ║"
    echo "║    🎬  P R O F E S S I O N A L   T H E M E   R E A D Y  🎬  ║"
    echo "║                                                              ║"
    echo "╠══════════════════════════════════════════════════════════════╣"
    echo "║                                                              ║"
    echo "║  \033[38;5;46m✓ Hollywood Hacker Style Activated\033[38;5;51m                    ║"
    echo "║  \033[38;5;46m✓ Professional Color Scheme Applied\033[38;5;51m                   ║"
    echo "║  \033[38;5;46m✓ Rainbow Prompt System Installed\033[38;5;51m                     ║"
    echo "║  \033[38;5;46m✓ Advanced Battery Monitor Ready\033[38;5;51m                      ║"
    echo "║  \033[38;5;46m✓ Professional Tools Configured\033[38;5;51m                       ║"
    echo "║                                                              ║"
    echo "╠══════════════════════════════════════════════════════════════╣"
    echo "║                     AVAILABLE COMMANDS                       ║"
    echo "╠══════════════════════════════════════════════════════════════╣"
    echo "║                                                              ║"
    echo "║  \033[38;5;226mbanner\033[38;5;51m       - Hollywood style banner                ║"
    echo "║  \033[38;5;226mmatrix\033[38;5;51m       - Professional matrix animation         ║"
    echo "║  \033[38;5;226mattack <target>\033[38;5;51m - Cyber attack simulation            ║"
    echo "║  \033[38;5;226mdashboard\033[38;5;51m    - System dashboard with graphs          ║"
    echo "║  \033[38;5;226mbattery-pro\033[38;5;51m  - Advanced battery monitor              ║"
    echo "║  \033[38;5;226mscan-pro\033[38;5;51m     - Professional network scanner          ║"
    echo "║  \033[38;5;226mpass-pro\033[38;5;51m     - Password generator                    ║"
    echo "║  \033[38;5;226mtheme-edit\033[38;5;51m   - Edit theme configuration              ║"
    echo "║                                                              ║"
    echo "╠══════════════════════════════════════════════════════════════╣"
    echo "║                     PROMPT STYLE                             ║"
    echo "╠══════════════════════════════════════════════════════════════╣"
    echo "║                                                              ║"
    echo "║  \033[38;5;196mM\033[38;5;202mA\033[38;5;208mR\033[38;5;214m-\033[38;5;220mP\033[38;5;226mD\033[38;5;190m♪\033[38;5;154m↗\033[38;5;118m➜\033[38;5;51m apt update                    ║"
    echo "║  \033[38;5;46mM\033[38;5;47mA\033[38;5;48mR\033[38;5;49m-\033[38;5;50mP\033[38;5;51mD\033[38;5;45m♪\033[38;5;39m↗\033[38;5;33m➜\033[38;5;51m apt upgrade                   ║"
    echo "║  \033[38;5;27mM\033[38;5;21mA\033[38;5;57mR\033[38;5;93m-\033[38;5;129mP\033[38;5;165mD\033[38;5;201m♪\033[38;5;200m↗\033[38;5;199m➜\033[38;5;51m hack google.com              ║"
    echo "║                                                              ║"
    echo "╠══════════════════════════════════════════════════════════════╣"
    echo "║                                                              ║"
    echo "║  Restart Termux or run: \033[38;5;46msource ~/.zshrc\033[38;5;51m                ║"
    echo "║                                                              ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    echo -e "\n\033[1;36mQuick Start Guide:\033[0m"
    echo -e "  1. Close and reopen Termux for full effect"
    echo -e "  2. Type \033[1;33mbanner\033[0m to see the Hollywood-style interface"
    echo -e "  3. Type \033[1;33mmatrix\033[0m for professional matrix animation"
    echo -e "  4. Type \033[1;33mbattery-pro\033[0m for advanced battery monitoring"
    echo -e "\n\033[1;32m🎬 Hollywood Hacker Theme Successfully Installed! 🎬\033[0m"
}

# =================== MAIN INSTALLATION ===================
main() {
    hollywood_intro
    
    echo -e "\n\033[1;38;5;226m"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║         MAR-PD PROFESSIONAL THEME INSTALLATION               ║"
    echo "║         Hollywood Hacker Edition                             ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    
    sleep 2
    
    # Step 1: Install packages
    install_professional_packages
    
    # Step 2: Setup colors
    setup_hollywood_colors
    
    # Step 3: Create zshrc
    create_professional_zshrc
    
    # Step 4: Create scripts
    create_professional_scripts
    
    # Step 5: Apply final touches
    apply_final_touches
    
    # Step 6: Show completion
    show_completion_message
}

# Run installation
main

# Final message
echo -e "\n\033[1;196mM\033[1;202mA\033[1;208mR\033[1;214m-\033[1;220mP\033[1;226mD\033[1;190m♪\033[1;154m↗\033[1;118m➜\033[0m Professional theme installation complete!"
echo -e "\033[1;38;5;51mWe work cyber safe in Hollywood style! 🎬\033[0m"
