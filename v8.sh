#!/bin/bash

# ============================================
# MAR-PD TERMINAL THEME V8
# ============================================

# Function for MAR-PD styled output
print_marpd() {
    echo -e "\033[1;36m[ᴍᴀʀ-ᴘᴅ] $1\033[0m"
}

print_success() {
    echo -e "\033[1;32m[✓] $1\033[0m"
}

print_warning() {
    echo -e "\033[1;33m[!] $1\033[0m"
}

print_error() {
    echo -e "\033[1;31m[✗] $1\033[0m"
}

# Clear screen and show MAR-PD header
clear
echo -e "\033[1;36m"
cat << "EOF"
╭━━━╮╭━━━┳━━━┳━━━╮╭━━━┳━━━╮
┃╭━━╯┃╭━╮┃╭━╮┃╭━╮┃┃╭━╮┃╭━╮┃
┃╰━━╮┃┃╱┃┃┃╱┃┃┃╱╰╯┃┃╱┃┃┃╱┃┃
┃╭━━╯┃┃╱┃┃┃╱┃┃┃╭━╮┃┃╱┃┃┃╱┃┃
┃┃╱╱╱┃╰━╯┃╰━╯┃╰┻━┃┃╰━╯┃╰━╯┃
╰╯╱╱╱╰━━━┻━━━┻━━━╯╰━━━┻━━━╯
╔═══════════════════════════════════════╗
║          MAR-PD TERMINAL V8           ║
║         CYBER TERMINAL THEME          ║
║          ERROR-FREE INSTALLER         ║
╚═══════════════════════════════════════╝
EOF
echo -e "\033[0m"

sleep 1

# =================== MAR-PD CONFIGURATION ===================
MARPD_NAME="MAR-PD"
MARPD_VERSION="V8"
MARPD_DIR="$HOME/.marpd-terminal"
MARPD_BACKUP="$MARPD_DIR/backup"
MARPD_LOG="$MARPD_DIR/install.log"
MARPD_CACHE="$MARPD_DIR/cache"
MARPD_MODULES="$MARPD_DIR/modules"

# MAR-PD Colors (Static Cyan)
MARPD_CYAN="\033[1;36m"
MARPD_CYAN_LIGHT="\033[0;36m"
MARPD_GREEN="\033[1;32m"
MARPD_RED="\033[1;31m"
MARPD_YELLOW="\033[1;33m"
MARPD_BLUE="\033[1;34m"
MARPD_RESET="\033[0m"

# Dynamic colors for effects only
DYNAMIC_COLORS=(
    "\033[38;5;51m"   # Cyan 1
    "\033[38;5;87m"   # Cyan 2
    "\033[38;5;123m"  # Cyan 3
    "\033[38;5;159m"  # Cyan 4
)

# Create MAR-PD directories
mkdir -p "$MARPD_DIR" "$MARPD_BACKUP" "$MARPD_CACHE" "$MARPD_MODULES"
touch "$MARPD_LOG"

# Log function
marpd_log() {
    echo "[$(date '+%Y-%m-%d %H:%M:%S')] $1" >> "$MARPD_LOG"
}

# =================== ERROR-FREE FUNCTIONS ===================
check_command() {
    if command -v "$1" &> /dev/null; then
        return 0
    else
        return 1
    fi
}

safe_delete() {
    if [ -e "$1" ]; then
        cp -r "$1" "$MARPD_BACKUP/" 2>/dev/null
        rm -rf "$1" 2>/dev/null
        marpd_log "Backed up and deleted: $1"
    fi
}

safe_install() {
    pkg install -y "$1" 2>/dev/null | tee -a "$MARPD_LOG"
    return ${PIPESTATUS[0]}
}

# =================== INSTALLATION STEPS ===================
show_marpd_banner() {
    clear
    echo -e "${MARPD_CYAN}"
    cat << "EOF"
┌─────────────────────────────────────────────────────┐
│                                                     │
│   ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗   │
│   ████╗ ████║██╔══██╗██╔══██╗   ██╔═══██╗██╔══██╗  │
│   ██╔████╔██║███████║██████╔╝   ██║   ██║██████╔╝  │
│   ██║╚██╔╝██║██╔══██║██╔═══╝    ██║   ██║██╔═══╝   │
│   ██║ ╚═╝ ██║██║  ██║██║        ╚██████╔╝██║       │
│   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═╝       │
│                                                     │
│              TERMINAL THEME INSTALLER               │
│                    VERSION 8.0                      │
│                                                     │
└─────────────────────────────────────────────────────┘
EOF
    echo -e "${MARPD_RESET}"
}

clean_previous_themes() {
    print_marpd "Cleaning previous themes..."
    
    # List of theme files to clean
    theme_files=(
        "$HOME/.termux/colors.properties"
        "$HOME/.termux/font.properties"
        "$HOME/.zshrc"
        "$HOME/.bashrc"
        "$HOME/.oh-my-zsh"
        "$HOME/.config/neofetch"
        "$PREFIX/etc/motd"
    )
    
    for file in "${theme_files[@]}"; do
        safe_delete "$file"
    done
    
    # Create fresh directories
    mkdir -p "$HOME/.termux"
    mkdir -p "$HOME/.config"
    
    print_success "Previous themes cleaned"
    marpd_log "Previous themes cleaned"
}

install_dependencies() {
    print_marpd "Installing MAR-PD dependencies..."
    
    # Update package list
    pkg update -y 2>&1 | tee -a "$MARPD_LOG"
    if [ ${PIPESTATUS[0]} -ne 0 ]; then
        print_warning "Package update had issues, continuing anyway..."
    fi
    
    # Essential packages
    essential_pkgs=("zsh" "git" "curl" "wget" "python" "neofetch")
    
    for pkg_name in "${essential_pkgs[@]}"; do
        if ! check_command "$pkg_name"; then
            print_marpd "Installing $pkg_name..."
            if safe_install "$pkg_name"; then
                print_success "$pkg_name installed"
            else
                print_warning "$pkg_name installation failed, skipping..."
            fi
        fi
    done
    
    # Optional packages (install if possible)
    optional_pkgs=("cmatrix" "figlet" "toilet" "lolcat" "htop" "nmap")
    
    for pkg_name in "${optional_pkgs[@]}"; do
        if ! check_command "$pkg_name"; then
            safe_install "$pkg_name" 2>/dev/null && print_success "$pkg_name installed" || true
        fi
    done
    
    print_success "Dependencies installed"
    marpd_log "Dependencies installation completed"
}

setup_marpd_theme() {
    print_marpd "Setting up MAR-PD theme colors..."
    
    # Create colors.properties
    cat > "$HOME/.termux/colors.properties" << 'EOF'
# MAR-PD THEME V8 - Static Cyan
background=#0a0a0a
foreground=#00ffff
cursor=#00ffff

# Color Palette
color0=#000000
color1=#ff5555
color2=#50fa7b
color3=#f1fa8c
color4=#bd93f9
color5=#ff79c6
color6=#00ffff      # Cyan
color7=#bfbfbf

color8=#4d4d4d
color9=#ff6e6e
color10=#69ff94
color11=#ffffa5
color12=#d6acff
color13=#ff92d0
color14=#00ffff      # Cyan
color15=#ffffff
EOF
    
    # Create font properties
    cat > "$HOME/.termux/font.properties" << 'EOF'
# MAR-PD Font Settings
font=monospace
font-size=12
EOF
    
    # Create termux properties
    cat > "$HOME/.termux/termux.properties" << 'EOF'
# MAR-PD Terminal Settings
bell-character=ignore
terminal-margin-horizontal=4
terminal-margin-vertical=2
use-black-ui=true
EOF
    
    print_success "Theme colors configured"
    marpd_log "Theme setup completed"
}

create_marpd_zshrc() {
    print_marpd "Creating MAR-PD ZSH configuration..."
    
    # Install Oh-My-Zsh if not present
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        print_marpd "Installing Oh-My-Zsh..."
        git clone https://github.com/ohmyzsh/ohmyzsh.git "$HOME/.oh-my-zsh" --depth=1 2>&1 | tee -a "$MARPD_LOG"
    fi
    
    # Create main .zshrc
    cat > "$HOME/.zshrc" << 'EOF'
#!/data/data/com.termux/files/usr/bin/zsh

# ============================================
# MAR-PD TERMINAL THEME V8
# ============================================

# MAR-PD Variables
export MARPD_USER="$(whoami)"
export MARPD_HOST="$(hostname)"
export MARPD_SESSION="$(date +%s)"
export MARPD_VERSION="8.0"

# Static Cyan Color Variables
MARPD_CYAN="%F{51}"
MARPD_RESET="%f"

# Dynamic Colors (for effects only)
MARPD_GREEN="%F{46}"
MARPD_RED="%F{196}"
MARPD_YELLOW="%F{226}"
MARPD_BLUE="%F{39}"
MARPD_PURPLE="%F{129}"

# Always Show MAR-PD Banner
marpd_banner() {
    clear
    
    # Top Banner - Always Shows
    echo "${MARPD_CYAN}"
    echo '┌─────────────────────────────────────────────────────┐'
    echo '│                                                     │'
    echo '│   ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗   │'
    echo '│   ████╗ ████║██╔══██╗██╔══██╗   ██╔═══██╗██╔══██╗  │'
    echo '│   ██╔████╔██║███████║██████╔╝   ██║   ██║██████╔╝  │'
    echo '│   ██║╚██╔╝██║██╔══██║██╔═══╝    ██║   ██║██╔═══╝   │'
    echo '│   ██║ ╚═╝ ██║██║  ██║██║        ╚██████╔╝██║       │'
    echo '│   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═╝       │'
    echo '│                                                     │'
    echo '│              CYBER TERMINAL V8.0                    │'
    echo '│            WE WORK CYBER SAFE                      │'
    echo '│                                                     │'
    echo '├─────────────────────────────────────────────────────┤'
    echo "│  User: ${MARPD_USER}@${MARPD_HOST}                │"
    echo "│  Session: ${MARPD_SESSION}                        │"
    echo "│  Version: ${MARPD_VERSION}                            │"
    echo '└─────────────────────────────────────────────────────┘'
    echo "${MARPD_RESET}"
    
    # System Status
    marpd_status
}

# System Status Display
marpd_status() {
    echo "${MARPD_CYAN}══ System Status ═══════════════════════════════════${MARPD_RESET}"
    
    # Time
    echo "${MARPD_CYAN}[TIME]${MARPD_RESET} $(date '+%I:%M:%S %p')"
    
    # Battery if available
    if command -v termux-battery-status > /dev/null 2>&1; then
        battery=$(termux-battery-status 2>/dev/null | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        [ -n "$battery" ] && echo "${MARPD_CYAN}[BATTERY]${MARPD_RESET} ${battery}%"
    fi
    
    # Storage
    storage=$(df -h /data 2>/dev/null | awk 'NR==2{print $4 " free"}')
    [ -n "$storage" ] && echo "${MARPD_CYAN}[STORAGE]${MARPD_RESET} ${storage}"
    
    echo ""
}

# Matrix Animation
marpd_matrix() {
    echo "${MARPD_CYAN}"
    echo '┌─────────────────────────────────────────────────────┐'
    echo '│                  MATRIX ACTIVATED                   │'
    echo '└─────────────────────────────────────────────────────┘'
    echo "${MARPD_RESET}"
    
    if command -v cmatrix > /dev/null 2>&1; then
        cmatrix -C cyan
    else
        for i in {1..20}; do
            echo -n "${MARPD_CYAN}"
            for j in {1..50}; do
                echo -n $((RANDOM % 2))
            done
            echo "${MARPD_RESET}"
            sleep 0.1
        done
    fi
}

# Hack Simulation
marpd_hack() {
    local target="${1:-secure-system}"
    
    echo "${MARPD_CYAN}"
    echo '┌─────────────────────────────────────────────────────┐'
    echo "│              HACKING: $target                    │"
    echo '└─────────────────────────────────────────────────────┘'
    echo "${MARPD_RESET}"
    
    steps=(
        "Scanning target..."
        "Bypassing firewall..."
        "Accessing system..."
        "Extracting data..."
        "Cleaning logs..."
    )
    
    for step in "${steps[@]}"; do
        echo "${MARPD_CYAN}[→]${MARPD_RESET} $step"
        sleep 0.5
    done
    
    echo "${MARPD_GREEN}[✓] Target compromised: $target${MARPD_RESET}"
}

# Custom Prompt
marpd_prompt() {
    # Get current time
    local current_time=$(date '+%I:%M:%S %p')
    
    # Get current directory (shortened)
    local current_dir="${PWD/#$HOME/~}"
    if [ ${#current_dir} -gt 20 ]; then
        current_dir="...${current_dir: -17}"
    fi
    
    # Create the prompt
    echo "${MARPD_CYAN}"
    echo "░▒▓ MAR-PD ~ ${current_dir} "
    echo "───────────────────────────────────────── ${current_time}  ▓▒░─╮"
    echo -n "❯ ${MARPD_RESET}"
}

# Set the prompt
PROMPT='$(marpd_prompt)'

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -A --color=auto'
alias cls='clear && marpd_banner'
alias matrix='marpd_matrix'
alias hack='marpd_hack'
alias status='marpd_status'
alias update='pkg update && pkg upgrade'
alias install='pkg install'
alias remove='pkg uninstall'
alias search='pkg search'
alias banner='marpd_banner'
alias reload='source ~/.zshrc'
alias marpd-config='nano ~/.zshrc'

# Navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias ~='cd ~'

# History Settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Auto-completion
autoload -U compinit && compinit
zstyle ':completion:*' menu select

# Key bindings
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Show banner on startup
marpd_banner

# Welcome Message
echo "${MARPD_CYAN}"
echo '════════════════════ MAR-PD Commands ════════════════════'
echo '  matrix    - Matrix animation'
echo '  hack      - Hack simulation'
echo '  status    - System status'
echo '  cls       - Clear and show banner'
echo '  banner    - Show MAR-PD banner'
echo '  reload    - Reload configuration'
echo '══════════════════════════════════════════════════════════'
echo "${MARPD_RESET}"
EOF
    
    print_success "ZSH configuration created"
    marpd_log "ZSH configuration created"
}

create_marpd_bashrc() {
    print_marpd "Creating Bash fallback configuration..."
    
    cat > "$HOME/.bashrc" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# MAR-PD Bash Configuration

# Load ZSH config if available
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
else
    # Fallback configuration
    PS1='\[\033[1;36m\]░▒▓ MAR-PD ~ \w \n───────────────────────────────────────── \t  ▓▒░─╮\n❯\[\033[0m\] '
    
    # Basic banner
    clear
    echo -e "\033[1;36m"
    echo '┌─────────────────────────────────────────────────────┐'
    echo '│                 MAR-PD TERMINAL V8                  │'
    echo '│                Bash Mode Activated                  │'
    echo '└─────────────────────────────────────────────────────┘'
    echo -e "\033[0m"
fi
EOF
    
    print_success "Bash configuration created"
}

create_marpd_modules() {
    print_marpd "Creating MAR-PD modules..."
    
    # Network Scanner Module
    cat > "$MARPD_MODULES/network-scanner.sh" << 'EOF'
#!/bin/bash

echo -e "\033[1;36m"
echo '┌─────────────────────────────────────────────────────┐'
echo '│               NETWORK SCANNER                       │'
echo '└─────────────────────────────────────────────────────┘'
echo -e "\033[0m"

echo -e "\033[0;36m[+] Getting IP information...\033[0m"
ip addr show 2>/dev/null | grep -E "inet " | head -5

echo -e "\n\033[0;36m[+] Testing connectivity...\033[0m"
if ping -c 1 8.8.8.8 > /dev/null 2>&1; then
    echo -e "\033[1;32m[✓] Internet: Connected\033[0m"
else
    echo -e "\033[1;33m[!] Internet: Disconnected\033[0m"
fi

echo -e "\n\033[0;36m[+] Checking open ports...\033[0m"
netstat -tulpn 2>/dev/null | grep LISTEN | head -10
EOF
    chmod +x "$MARPD_MODULES/network-scanner.sh"
    
    # Password Generator Module
    cat > "$MARPD_MODULES/password-gen.sh" << 'EOF'
#!/bin/bash

echo -e "\033[1;36m"
echo '┌─────────────────────────────────────────────────────┐'
echo '│             PASSWORD GENERATOR                      │'
echo '└─────────────────────────────────────────────────────┘'
echo -e "\033[0m"

generate_pass() {
    local length=${1:-12}
    tr -dc 'A-Za-z0-9!@#$%^&*' < /dev/urandom | head -c "$length"
}

echo -e "\033[0;36m[+] Generating passwords:\033[0m\n"

for i in {1..5}; do
    password=$(generate_pass 16)
    echo -e "\033[1;36mPassword $i:\033[0m \033[0;36m$password\033[0m"
done
EOF
    chmod +x "$MARPD_MODULES/password-gen.sh"
    
    print_success "Modules created"
}

setup_persistence() {
    print_marpd "Setting up MAR-PD persistence..."
    
    # Create startup script
    cat > "$MARPD_DIR/startup.sh" << 'EOF'
#!/bin/bash
# MAR-PD Startup Script

sleep 1

# Show MAR-PD banner
echo -e "\033[1;36m"
echo '╔═══════════════════════════════════════╗'
echo '║        MAR-PD TERMINAL V8             ║'
echo '║         Auto-start Enabled            ║'
echo '╚═══════════════════════════════════════╝'
echo -e "\033[0m"

# Load configuration
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
elif [ -f ~/.bashrc ]; then
    source ~/.bashrc
fi
EOF
    chmod +x "$MARPD_DIR/startup.sh"
    
    # Add to shell profiles
    echo "source $MARPD_DIR/startup.sh" >> "$HOME/.bash_profile" 2>/dev/null
    echo "source $MARPD_DIR/startup.sh" >> "$HOME/.profile" 2>/dev/null
    
    # Termux boot script
    mkdir -p "$HOME/.termux/boot"
    cat > "$HOME/.termux/boot/marpd-boot.sh" << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
# MAR-PD Boot Script
sleep 2
$HOME/.marpd-terminal/startup.sh
EOF
    chmod +x "$HOME/.termux/boot/marpd-boot.sh"
    
    print_success "Persistence setup complete"
}

apply_settings() {
    print_marpd "Applying MAR-PD settings..."
    
    # Set ZSH as default shell
    if check_command "chsh" && [ -f "$PREFIX/bin/zsh" ]; then
        chsh -s zsh
    fi
    
    # Reload Termux settings
    if check_command "termux-reload-settings"; then
        termux-reload-settings
    fi
    
    # Add module aliases
    echo "alias scan='$MARPD_MODULES/network-scanner.sh'" >> "$HOME/.zshrc"
    echo "alias passgen='$MARPD_MODULES/password-gen.sh'" >> "$HOME/.zshrc"
    
    print_success "Settings applied"
}

show_completion() {
    clear
    echo -e "${MARPD_CYAN}"
    cat << "EOF"
╔═══════════════════════════════════════╗
║                                       ║
║   ███╗   ███╗ █████╗ ██████╗         ║
║   ████╗ ████║██╔══██╗██╔══██╗        ║
║   ██╔████╔██║███████║██████╔╝        ║
║   ██║╚██╔╝██║██╔══██║██╔═══╝         ║
║   ██║ ╚═╝ ██║██║  ██║██║             ║
║   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝             ║
║      ██████╗ ██████╗                 ║
║     ██╔═══██╗██╔══██╗                ║
║     ██║   ██║██║  ██║                ║
║     ██║   ██║██║  ██║                ║
║     ╚██████╔╝██████╔╝                ║
║      ╚═════╝ ╚═════╝                 ║
║                                       ║
║       INSTALLATION COMPLETE           ║
║        MAR-PD TERMINAL V8             ║
║                                       ║
╚═══════════════════════════════════════╝
EOF
    echo -e "${MARPD_RESET}"
    
    echo -e "${MARPD_CYAN}"
    echo "════════════════════ Installation Summary ════════════════════"
    echo -e "${MARPD_RESET}"
    
    echo -e "${MARPD_GREEN}✓ MAR-PD Theme V8 installed${MARPD_RESET}"
    echo -e "${MARPD_GREEN}✓ Static Cyan text color${MARPD_RESET}"
    echo -e "${MARPD_GREEN}✓ Always-show banner${MARPD_RESET}"
    echo -e "${MARPD_GREEN}✓ Custom MAR-PD prompt${MARPD_RESET}"
    echo -e "${MARPD_GREEN}✓ Error-free installation${MARPD_RESET}"
    echo -e "${MARPD_GREEN}✓ Persistence enabled${MARPD_RESET}"
    
    echo -e "\n${MARPD_CYAN}══════════════════════ Commands ═══════════════════════${MARPD_RESET}"
    echo -e "${MARPD_CYAN}  banner    - Show MAR-PD banner${MARPD_RESET}"
    echo -e "${MARPD_CYAN}  matrix    - Matrix animation${MARPD_RESET}"
    echo -e "${MARPD_CYAN}  hack      - Hack simulation${MARPD_RESET}"
    echo -e "${MARPD_CYAN}  scan      - Network scanner${MARPD_RESET}"
    echo -e "${MARPD_CYAN}  passgen   - Password generator${MARPD_RESET}"
    echo -e "${MARPD_CYAN}  cls       - Clear and show banner${MARPD_RESET}"
    
    echo -e "\n${MARPD_CYAN}═══════════════════ Prompt Preview ════════════════════${MARPD_RESET}"
    echo -e "${MARPD_CYAN}░▒▓ MAR-PD ~ ~"
    echo -e "───────────────────────────────────────── 06:52:20 PM  ▓▒░─╮"
    echo -e "❯${MARPD_RESET}"
    
    echo -e "\n${MARPD_GREEN}[✓] Installation successful!${MARPD_RESET}"
    echo -e "${MARPD_CYAN}[→] Restart Termux or type 'reload'${MARPD_RESET}"
}

# =================== MAIN INSTALLATION ===================
main() {
    echo -e "${MARPD_CYAN}"
    echo "═════════════════ MAR-PD Installation V8 ═════════════════"
    echo -e "${MARPD_RESET}"
    
    # Step-by-step installation with error handling
    show_marpd_banner
    clean_previous_themes
    install_dependencies
    setup_marpd_theme
    create_marpd_zshrc
    create_marpd_bashrc
    create_marpd_modules
    setup_persistence
    apply_settings
    show_completion
    
    # Log completion
    marpd_log "MAR-PD V8 installation completed successfully"
}

# Error handling
trap 'print_error "Installation interrupted"; exit 1' INT

# Run main installation
if main; then
    echo -e "${MARPD_CYAN}"
    echo "════════════════════════════════════════════════════════════"
    echo "           MAR-PD TERMINAL V8 - READY FOR USE               "
    echo "              WE WORK CYBER SAFE                           "
    echo "════════════════════════════════════════════════════════════"
    echo -e "${MARPD_RESET}"
else
    print_error "Installation failed. Check $MARPD_LOG for details."
    exit 1
fi
