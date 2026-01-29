#!/bin/bash

# ============================================
# MAR-PD NEXUS TERMINAL V9
# TOTALLY UNIQUE DESIGN
# ============================================

# Terminal escape sequences
CYAN='\033[1;36m'
GREEN='\033[1;32m'
RED='\033[1;31m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
MAGENTA='\033[1;35m'
WHITE='\033[1;37m'
NC='\033[0m'

# Unique animation colors
NEXUS_COLORS=(
    '\033[38;5;51m'    # Cyan 1
    '\033[38;5;117m'   # Cyan 2
    '\033[38;5;123m'   # Cyan 3
    '\033[38;5;159m'   # Cyan 4
    '\033[38;5;195m'   # Cyan 5
)

# Print with MAR-PD style
print_nexus() {
    local color_idx=$((RANDOM % ${#NEXUS_COLORS[@]}))
    local color="${NEXUS_COLORS[$color_idx]}"
    echo -e "${CYAN}[${color}●${CYAN}]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[✓]${NC} $1"
}

print_error() {
    echo -e "${RED}[✗]${NC} $1"
}

# Clear and show unique header
clear
echo -e "${CYAN}"
cat << "EOF"
╔═╗╔═╗╔╗╔╔╦╗╔═╗╦═╗  ╔╗╔╔═╗╦ ╦╔═╗╦═╗╔╦╗
╠═╣║ ║║║║ ║║║╣ ╠╦╝  ║║║║ ║║║║║╣ ╠╦╝ ║ 
╩ ╩╚═╝╝╚╝═╩╝╚═╝╩╚═  ╝╚╝╚═╝╚╩╝╚═╝╩╚═ ╩ 
╔═╗╔═╗╔╦╗  ╔╦╗╔═╗╔╗╔╔═╗╦═╗╔╦╗╔═╗╔╦╗
║ ║╠═╝║║║   ║║║ ║║║║║╣ ╠╦╝║║║╠═╣ ║ 
╚═╝╩  ╩ ╩  ═╩╝╚═╝╝╚╝╚═╝╩╚═╩ ╩╩ ╩ ╩ 
╔══════════════════════════════════════╗
║        NEXUS TERMINAL V9             ║
║          MAR-PD EDITION              ║
╚══════════════════════════════════════╝
EOF
echo -e "${NC}"

sleep 1.5

# =================== NEXUS CONFIG ===================
NEXUS_DIR="$HOME/.nexus-terminal"
NEXUS_DATA="$NEXUS_DIR/data"
NEXUS_LOGS="$NEXUS_DIR/logs"
NEXUS_MODS="$NEXUS_DIR/mods"
NEXUS_CACHE="$NEXUS_DIR/cache"
SESSION_ID="NX-$(date +%s%N | md5sum | head -c 6)"

# Create unique directory structure
mkdir -p "$NEXUS_DIR" "$NEXUS_DATA" "$NEXUS_LOGS" "$NEXUS_MODS" "$NEXUS_CACHE"

# Logging function
nexus_log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$NEXUS_LOGS/nexus.log"
}

# =================== UNIQUE ANIMATIONS ===================
show_nexus_loader() {
    clear
    echo -e "${CYAN}"
    cat << "EOF"
╔══════════════════════════════════════╗
║        NEXUS SYSTEM BOOTING          ║
║    INITIALIZING QUANTUM INTERFACE    ║
╚══════════════════════════════════════╝
EOF
    echo -e "${NC}"
    
    frames=(
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
        "∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙∙●∙∙∙∙∙∙∙∙∙∙∙∙∙∙"
    )
    
    for frame in "${frames[@]}"; do
        echo -ne "\r${CYAN}[${frame}]${NC}"
        sleep 0.05
    done
    echo ""
}

show_nexus_grid() {
    echo -e "${CYAN}"
    for i in {1..10}; do
        for j in {1..50}; do
            if (( (i + j) % 3 == 0 )); then
                echo -n "▓▓"
            elif (( (i + j) % 5 == 0 )); then
                echo -n "▒▒"
            else
                echo -n "░░"
            fi
        done
        echo ""
    done
    echo -e "${NC}"
}

# =================== CLEAN INSTALLATION ===================
clean_previous() {
    print_nexus "Cleaning previous installations..."
    
    # Backup and remove existing themes
    backup_dir="$NEXUS_DIR/backup_$(date +%s)"
    mkdir -p "$backup_dir"
    
    targets=(
        "$HOME/.termux"
        "$HOME/.zshrc"
        "$HOME/.bashrc"
        "$HOME/.oh-my-zsh"
        "$HOME/.config/neofetch"
    )
    
    for target in "${targets[@]}"; do
        if [ -e "$target" ]; then
            mv "$target" "$backup_dir/" 2>/dev/null
            print_success "Backed up: $(basename "$target")"
        fi
    done
    
    # Create fresh directories
    mkdir -p "$HOME/.termux" "$HOME/.config"
    
    nexus_log "Previous installations cleaned"
}

install_nexus_deps() {
    print_nexus "Installing Nexus dependencies..."
    
    # Silent package updates
    pkg update -y > /dev/null 2>&1
    pkg upgrade -y > /dev/null 2>&1
    
    # Core packages (essential)
    print_nexus "Installing core packages..."
    pkg install -y zsh git curl wget python neofetch cmatrix figlet toilet > /dev/null 2>&1
    
    # Optional packages (try to install)
    optional_pkgs=("htop" "nmap" "micro" "tree" "ruby" "nodejs")
    for pkg in "${optional_pkgs[@]}"; do
        pkg install -y "$pkg" > /dev/null 2>&1 && print_success "Installed: $pkg" || true
    done
    
    # Install Oh-My-Zsh without prompts
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        print_nexus "Installing Oh-My-Zsh..."
        git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" --depth=1 > /dev/null 2>&1
    fi
    
    print_success "Dependencies installed"
    nexus_log "Dependencies installation completed"
}

# =================== UNIQUE THEME SETUP ===================
setup_nexus_theme() {
    print_nexus "Configuring Nexus theme..."
    
    # Create unique color scheme
    cat > "$HOME/.termux/colors.properties" << 'EOF'
# NEXUS TERMINAL COLOR SCHEME
background=#0a0a12
foreground=#00ffff
cursor=#00ffff

# Unique color palette
color0=#000000
color1=#ff3366
color2=#33ff99
color3=#ffff33
color4=#3366ff
color5=#ff33ff
color6=#00ffff      # Primary Cyan
color7=#cccccc

color8=#333344
color9=#ff6688
color10=#66ffaa
color11=#ffff66
color12=#6688ff
color13=#ff66ff
color14=#66ffff     # Secondary Cyan
color15=#ffffff
EOF
    
    # Font configuration
    cat > "$HOME/.termux/font.properties" << 'EOF'
font=JetBrains Mono
font-size=13
EOF
    
    # Termux settings
    cat > "$HOME/.termux/termux.properties" << 'EOF'
bell-character=ignore
terminal-margin-horizontal=5
terminal-margin-vertical=3
use-black-ui=true
extra-keys=[['ESC','/','-','HOME','UP','END','PGUP'],['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN']]
EOF
    
    print_success "Theme configured"
    nexus_log "Theme setup completed"
}

# =================== TOTALLY DIFFERENT ZSH CONFIG ===================
create_nexus_zshrc() {
    print_nexus "Creating Nexus ZSH configuration..."
    
    cat > "$HOME/.zshrc" << 'EOF'
#!/data/data/com.termux/files/usr/bin/zsh

# ============================================
# MAR-PD NEXUS TERMINAL V9
# ============================================

# Nexus Variables
export NEXUS_ID="NX-$(date +%s)"
export NEXUS_USER="$(whoami)@nexus"
export NEXUS_TIME="$(date '+%H:%M:%S')"
export NEXUS_LEVEL="9"

# Static Cyan Colors
N_CYAN="%F{51}"
N_RESET="%f"

# Unique Banner Function - ALWAYS SHOWS
nexus_banner() {
    clear
    
    # Unique ASCII Art
    echo "${N_CYAN}"
    cat << "NXBANNER"
╭━━━╮╭━━━┳━━━┳━━━╮╭━━━┳━━━╮
┃╭━━╯┃╭━╮┃╭━╮┃╭━╮┃┃╭━╮┃╭━╮┃
┃╰━━╮┃┃╱┃┃┃╱┃┃┃╱╰╯┃┃╱┃┃┃╱┃┃
┃╭━━╯┃┃╱┃┃┃╱┃┃┃╭━╮┃┃╱┃┃┃╱┃┃
┃┃╱╱╱┃╰━╯┃╰━╯┃╰┻━┃┃╰━╯┃╰━╯┃
╰╯╱╱╱╰━━━┻━━━┻━━━╯╰━━━┻━━━╯
╔═══════════════════════════════════════╗
║          NEXUS TERMINAL V9            ║
║            MAR-PD SYSTEM              ║
╚═══════════════════════════════════════╝
NXBANNER
    echo "${N_RESET}"
    
    # System Info Line
    echo "${N_CYAN}══════════════════════════════════════════════════${N_RESET}"
    echo "${N_CYAN}ID: ${NEXUS_ID} | User: ${NEXUS_USER} | Time: ${NEXUS_TIME}${N_RESET}"
    echo "${N_CYAN}══════════════════════════════════════════════════${N_RESET}"
    
    # Quick Status
    nexus_status
}

# Unique Status Display
nexus_status() {
    # Time
    echo "${N_CYAN}🕒 $(date '+%I:%M %p')"
    
    # Storage
    if command -v df > /dev/null; then
        storage=$(df -h /data 2>/dev/null | awk 'NR==2{print $4}')
        echo "${N_CYAN}💾 ${storage:-N/A} free"
    fi
    
    # Battery if available
    if command -v termux-battery-status > /dev/null; then
        battery=$(termux-battery-status 2>/dev/null | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        [ -n "$battery" ] && echo "${N_CYAN}🔋 ${battery}%"
    fi
    
    echo ""
}

# Unique Matrix Effect
nexus_matrix() {
    echo "${N_CYAN}"
    echo "╔══════════════════════════════════════╗"
    echo "║        NEXUS MATRIX ACTIVATED        ║"
    echo "╚══════════════════════════════════════╝"
    echo "${N_RESET}"
    
    for i in {1..30}; do
        for j in {1..60}; do
            rand=$((RANDOM % 100))
            if [ $rand -lt 40 ]; then
                echo -n "${N_CYAN}$((RANDOM % 2))"
            elif [ $rand -lt 70 ]; then
                echo -n "$((RANDOM % 10))"
            else
                echo -n " "
            fi
        done
        echo ""
        sleep 0.05
    done
}

# Unique Hack Simulation
nexus_hack() {
    local target=${1:-"secure-server"}
    
    echo "${N_CYAN}"
    echo "╔══════════════════════════════════════╗"
    echo "║       NEXUS PENETRATION TEST         ║"
    echo "║         Target: $target           ║"
    echo "╚══════════════════════════════════════╝"
    echo "${N_RESET}"
    
    steps=(
        "Establishing connection..."
        "Analyzing protocols..."
        "Finding vulnerabilities..."
        "Exploiting weaknesses..."
        "Gaining access..."
        "Extracting data..."
        "Covering tracks..."
    )
    
    for step in "${steps[@]}"; do
        echo -n "${N_CYAN}[→] ${step}"
        sleep 0.4
        
        # Loading dots
        for i in {1..3}; do
            echo -n "${N_CYAN}."
            sleep 0.1
        done
        echo " ✓"
        sleep 0.2
    done
    
    echo "${N_CYAN}"
    echo "╔══════════════════════════════════════╗"
    echo "║       PENETRATION SUCCESSFUL         ║"
    echo "║       Target compromised: 100%       ║"
    echo "╚══════════════════════════════════════╝"
    echo "${N_RESET}"
}

# TOTALLY DIFFERENT PROMPT
nexus_prompt() {
    local time_now=$(date '+%I:%M:%S %p')
    local dir_short="${PWD/#$HOME/~}"
    
    if [ ${#dir_short} -gt 25 ]; then
        dir_short="...${dir_short: -22}"
    fi
    
    # Unique prompt design
    echo "${N_CYAN}"
    echo "┌─[${dir_short}]"
    echo "└─[${time_now}]─▶ "
    echo -n "${N_RESET}"
}

# Set the prompt
PROMPT='$(nexus_prompt)'

# Unique Aliases
alias nls='ls --color=auto -la'
alias ncls='clear && nexus_banner'
alias nmatrix='nexus_matrix'
alias nhack='nexus_hack'
alias nstatus='nexus_status'
alias nbanner='nexus_banner'
alias nupdate='pkg update && pkg upgrade'
alias ninstall='pkg install'
alias nreload='source ~/.zshrc'
alias nscan='echo "Scanning..." && ip addr show'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# Safety
alias rm='rm -i'
alias cp='cp -i'
alias mv='mv -i'

# History
HISTSIZE=5000
SAVEHIST=5000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory

# Completion
autoload -U compinit && compinit

# Key bindings
bindkey -e
bindkey '^[[A' history-beginning-search-backward
bindkey '^[[B' history-beginning-search-forward

# Show banner on startup
nexus_banner

# Welcome message
echo "${N_CYAN}"
echo "══════════════ NEXUS COMMANDS ═══════════════"
echo "  nmatrix    - Nexus matrix effect"
echo "  nhack      - Penetration test"
echo "  nstatus    - System status"
echo "  ncls       - Clear and show banner"
echo "  nbanner    - Show Nexus banner"
echo "  nreload    - Reload configuration"
echo "══════════════════════════════════════════════"
echo "${N_RESET}"
EOF
    
    print_success "ZSH configuration created"
    nexus_log "ZSH config created"
}

# =================== UNIQUE BASH CONFIG ===================
create_nexus_bashrc() {
    print_nexus "Creating Bash configuration..."
    
    cat > "$HOME/.bashrc" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# NEXUS Bash Configuration

if [ -f ~/.zshrc ]; then
    source ~/.zshrc
else
    # Unique Bash prompt
    PS1='\[\033[1;36m\]┌─[\w]\n└─[\A]─▶ \[\033[0m\]'
    
    # Banner
    clear
    echo -e "\033[1;36m"
    echo "╔══════════════════════════════════════╗"
    echo "║        NEXUS TERMINAL V9             ║"
    echo "║           Bash Mode                  ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "\033[0m"
fi
EOF
    
    print_success "Bash configuration created"
}

# =================== UNIQUE MODULES ===================
create_nexus_modules() {
    print_nexus "Creating Nexus modules..."
    
    # Module 1: Network Analyzer
    cat > "$NEXUS_MODS/network.nx" << 'EOF'
#!/bin/bash

echo -e "\033[1;36m"
echo "╔══════════════════════════════════════╗"
echo "║        NEXUS NETWORK ANALYZER        ║"
echo "╚══════════════════════════════════════╝"
echo -e "\033[0m"

echo -e "\033[0;36m[+] Network Interfaces:\033[0m"
ip addr show 2>/dev/null | grep -E "inet " | head -5

echo -e "\n\033[0;36m[+] Connectivity Test:\033[0m"
if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
    echo -e "\033[1;32m✓ Internet: ONLINE\033[0m"
else
    echo -e "\033[1;33m✗ Internet: OFFLINE\033[0m"
fi

echo -e "\n\033[0;36m[+] Local Ports:\033[0m"
netstat -tulpn 2>/dev/null | grep LISTEN | head -5
EOF
    chmod +x "$NEXUS_MODS/network.nx"
    
    # Module 2: Password Vault
    cat > "$NEXUS_MODS/vault.nx" << 'EOF'
#!/bin/bash

echo -e "\033[1;36m"
echo "╔══════════════════════════════════════╗"
echo "║          NEXUS PASSWORD VAULT        ║"
echo "╚══════════════════════════════════════╝"
echo -e "\033[0m"

generate_password() {
    local length=${1:-16}
    cat /dev/urandom | tr -dc 'A-Za-z0-9!@#$%^&*' | head -c "$length"
}

echo -e "\033[0;36m[+] Generated Passwords:\033[0m\n"

for i in {1..3}; do
    pass=$(generate_password 20)
    echo -e "\033[1;36mVault $i:\033[0m"
    echo -e "\033[0;36m$pass\033[0m"
    echo ""
done
EOF
    chmod +x "$NEXUS_MODS/vault.nx"
    
    print_success "Modules created"
    nexus_log "Modules created"
}

# =================== PERSISTENCE ===================
setup_nexus_persistence() {
    print_nexus "Setting up Nexus persistence..."
    
    # Startup script
    cat > "$NEXUS_DIR/startup.nx" << 'EOF'
#!/bin/bash
# NEXUS Startup Script

sleep 0.5

echo -e "\033[1;36m"
echo "╔══════════════════════════════════════╗"
echo "║        NEXUS SYSTEM ACTIVE           ║"
echo "║           V9 | MAR-PD                ║"
echo "╚══════════════════════════════════════╝"
echo -e "\033[0m"

# Load configuration
[ -f ~/.zshrc ] && source ~/.zshrc || source ~/.bashrc
EOF
    chmod +x "$NEXUS_DIR/startup.nx"
    
    # Add to profiles
    echo "source $NEXUS_DIR/startup.nx" >> "$HOME/.bash_profile"
    echo "source $NEXUS_DIR/startup.nx" >> "$HOME/.profile"
    
    # Boot script
    mkdir -p "$HOME/.termux/boot"
    cat > "$HOME/.termux/boot/nexus.sh" << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
sleep 1
$HOME/.nexus-terminal/startup.nx
EOF
    chmod +x "$HOME/.termux/boot/nexus.sh"
    
    print_success "Persistence configured"
    nexus_log "Persistence setup completed"
}

# =================== FINAL SETUP ===================
finalize_nexus() {
    print_nexus "Finalizing Nexus installation..."
    
    # Set ZSH as default
    chsh -s zsh 2>/dev/null || true
    
    # Reload Termux settings
    command -v termux-reload-settings > /dev/null && termux-reload-settings
    
    # Add module aliases
    echo "alias nscan='$NEXUS_MODS/network.nx'" >> "$HOME/.zshrc"
    echo "alias nvault='$NEXUS_MODS/vault.nx'" >> "$HOME/.zshrc"
    
    print_success "Final setup completed"
}

# =================== COMPLETION MESSAGE ===================
show_nexus_complete() {
    clear
    
    echo -e "${CYAN}"
    cat << "EOF"
╔══════════════════════════════════════╗
║                                      ║
║   ███╗   ██╗███████╗██╗  ██╗██╗   ██╗║
║   ████╗  ██║██╔════╝╚██╗██╔╝██║   ██║║
║   ██╔██╗ ██║█████╗   ╚███╔╝ ██║   ██║║
║   ██║╚██╗██║██╔══╝   ██╔██╗ ██║   ██║║
║   ██║ ╚████║███████╗██╔╝ ██╗╚██████╔╝║
║   ╚═╝  ╚═══╝╚══════╝╚═╝  ╚═╝ ╚═════╝ ║
║                                      ║
║       INSTALLATION COMPLETE          ║
║      NEXUS TERMINAL V9 ACTIVE        ║
║                                      ║
╚══════════════════════════════════════╝
EOF
    echo -e "${NC}"
    
    echo -e "${CYAN}"
    echo "══════════════════════════════════════════════════"
    echo -e "${NC}"
    
    echo -e "${GREEN}✓ NEXUS Terminal V9 installed${NC}"
    echo -e "${GREEN}✓ Unique design and layout${NC}"
    echo -e "${GREEN}✓ Static cyan text color${NC}"
    echo -e "${GREEN}✓ Auto-start enabled${NC}"
    echo -e "${GREEN}✓ Always-show banner${NC}"
    echo -e "${GREEN}✓ Error-free installation${NC}"
    
    echo -e "\n${CYAN}═══════════════════ COMMANDS ═══════════════════${NC}"
    echo -e "${CYAN}  nmatrix    - Unique matrix animation${NC}"
    echo -e "${CYAN}  nhack      - Hack simulation${NC}"
    echo -e "${CYAN}  nstatus    - System status${NC}"
    echo -e "${CYAN}  nscan      - Network analyzer${NC}"
    echo -e "${CYAN}  nvault     - Password generator${NC}"
    echo -e "${CYAN}  ncls       - Clear and show banner${NC}"
    
    echo -e "\n${CYAN}══════════════════ PROMPT ════════════════════${NC}"
    echo -e "${CYAN}┌─[~]"
    echo -e "└─[06:52:20 PM]─▶ ${NC}"
    
    echo -e "\n${GREEN}[✓] Installation successful!${NC}"
    echo -e "${CYAN}[→] Restart Termux or type 'nreload'${NC}"
    echo -e "${CYAN}[→] Type 'ncls' to see the banner${NC}"
}

# =================== MAIN INSTALLATION ===================
main() {
    echo -e "${CYAN}"
    echo "════════════ NEXUS TERMINAL INSTALLATION V9 ════════════"
    echo -e "${NC}"
    
    show_nexus_loader
    clean_previous
    install_nexus_deps
    setup_nexus_theme
    create_nexus_zshrc
    create_nexus_bashrc
    create_nexus_modules
    setup_nexus_persistence
    finalize_nexus
    show_nexus_complete
    
    nexus_log "NEXUS V9 installation completed successfully"
}

# Run with error handling
set -e
trap 'print_error "Installation failed!"; exit 1' ERR
main

# Final message
echo -e "\n${CYAN}"
echo "══════════════════════════════════════════════════"
echo "        MAR-PD NEXUS TERMINAL V9 READY            "
echo "           TOTALLY UNIQUE DESIGN                  "
echo "══════════════════════════════════════════════════"
echo -e "${NC}"
