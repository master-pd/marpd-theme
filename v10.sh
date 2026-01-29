#!/bin/bash

# ============================================
# MAR-PD CYBER TERMINAL V10
# COMPLETELY UNIQUE WITH CORRECT PROMPT
# ============================================

# MAR-PD Colors
MARPD_CYAN='\033[1;36m'
MARPD_GREEN='\033[1;32m'
MARPD_RED='\033[1;31m'
MARPD_YELLOW='\033[1;33m'
MARPD_RESET='\033[0m'

# Print MAR-PD style
print_marpd() {
    echo -e "${MARPD_CYAN}[MAR-PD]${MARPD_RESET} $1"
}

# Show unique MAR-PD header
clear
echo -e "${MARPD_CYAN}"
cat << "EOF"
╔═╗┌─┐┬─┐┌┬┐┌─┐┌┬┐  ╔═╗┌─┐┬ ┬┌─┐
║ ╦├┤ ├┬┘ ││├┤  ││  ╠═╝├─┤│││└─┐
╚═╝└─┘┴└──┴┘└─┘─┴┘  ╩  ┴ ┴└┴┘└─┘
╔══════════════════════════════════════╗
║        CYBER TERMINAL V10            ║
║           MAR-PD EDITION             ║
╚══════════════════════════════════════╝
EOF
echo -e "${MARPD_RESET}"

sleep 1

# =================== MAR-PD CONFIG ===================
MARPD_DIR="$HOME/.marpd-cyber"
MARPD_CACHE="$MARPD_DIR/cache"
MARPD_LOGS="$MARPD_DIR/logs"

# Create directories
mkdir -p "$MARPD_DIR" "$MARPD_CACHE" "$MARPD_LOGS"

# =================== UNIQUE INSTALLATION ===================
print_marpd "Starting MAR-PD installation..."

# Clean previous
print_marpd "Cleaning previous themes..."
rm -rf "$HOME/.termux/colors.properties" 2>/dev/null
rm -rf "$HOME/.termux/font.properties" 2>/dev/null
mkdir -p "$HOME/.termux"

# Install packages quietly
print_marpd "Installing packages..."
pkg update -y > /dev/null 2>&1
pkg install -y zsh git curl neofetch > /dev/null 2>&1

# =================== MAR-PD THEME SETUP ===================
print_marpd "Setting up MAR-PD theme..."

# Colors
cat > "$HOME/.termux/colors.properties" << 'EOF'
# MAR-PD CYBER THEME
background=#0a0a0a
foreground=#00ffff
cursor=#00ffff

color0=#000000
color1=#ff5555
color2=#50fa7b
color3=#f1fa8c
color4=#bd93f9
color5=#ff79c6
color6=#00ffff
color7=#bfbfbf

color8=#4d4d4d
color9=#ff6e6e
color10=#69ff94
color11=#ffffa5
color12=#d6acff
color13=#ff92d0
color14=#00ffff
color15=#ffffff
EOF

# Font
cat > "$HOME/.termux/font.properties" << 'EOF'
font=monospace
font-size=12
EOF

# =================== UNIQUE ZSH CONFIG ===================
print_marpd "Creating MAR-PD configuration..."

cat > "$HOME/.zshrc" << 'EOF'
#!/data/data/com.termux/files/usr/bin/zsh

# ============================================
# MAR-PD CYBER TERMINAL V10
# ============================================

# MAR-PD Variables
export MARPD_USER="$(whoami)"
export MARPD_HOST="$(hostname)"
export MARPD_SESSION="$(date +%s)"

# Colors - STATIC CYAN
M_CYAN="%F{51}"
M_RESET="%f"

# Always show MAR-PD banner
marpd_banner() {
    clear
    
    # Unique MAR-PD ASCII with symbols
    echo "${M_CYAN}"
    echo '╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮'
    echo '│                                         │'
    echo '│  ███╗   ███╗ █████╗ ██████╗            │'
    echo '│  ████╗ ████║██╔══██╗██╔══██╗           │'
    echo '│  ██╔████╔██║███████║██████╔╝           │'
    echo '│  ██║╚██╔╝██║██╔══██║██╔═══╝            │'
    echo '│  ██║ ╚═╝ ██║██║  ██║██║                │'
    echo '│  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝                │'
    echo '│  ██████╗ ██████╗                        │'
    echo '│  ██╔═══██╗██╔══██╗                      │'
    echo '│  ██║   ██║██║  ██║                      │'
    echo '│  ██║   ██║██║  ██║                      │'
    echo '│  ╚██████╔╝██████╔╝                      │'
    echo '│   ╚═════╝ ╚═════╝                       │'
    echo '│                                         │'
    echo '│        CYBER TERMINAL V10               │'
    echo '│         WE WORK CYBER SAFE              │'
    echo '│                                         │'
    echo '╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯'
    echo "${M_RESET}"
    
    # Status line
    echo "${M_CYAN}──────────────────────────────────────────────────${M_RESET}"
    echo "${M_CYAN} User: ${MARPD_USER}@${MARPD_HOST}"
    echo "${M_CYAN} Time: $(date '+%I:%M:%S %p')"
    echo "${M_CYAN}──────────────────────────────────────────────────${M_RESET}"
    echo ""
}

# Matrix effect
marpd_matrix() {
    echo "${M_CYAN}"
    echo '╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮'
    echo '│          MAR-PD MATRIX MODE             │'
    echo '╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯'
    echo "${M_RESET}"
    
    for i in {1..25}; do
        for j in {1..60}; do
            echo -n "${M_CYAN}$((RANDOM % 2))"
        done
        echo ""
        sleep 0.05
    done
}

# Hack simulation
marpd_hack() {
    local target=${1:-"secure-system"}
    
    echo "${M_CYAN}"
    echo '╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮'
    echo "│       HACKING: $target                  │"
    echo '╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯'
    echo "${M_RESET}"
    
    steps=("Scanning" "Accessing" "Extracting" "Cleaning")
    for step in "${steps[@]}"; do
        echo -n "${M_CYAN}[→] ${step}..."
        sleep 0.5
        echo " ✓"
    done
    echo "${M_CYAN}[✓] Target compromised${M_RESET}"
}

# =================== YOUR EXACT PROMPT ===================
# This is the exact prompt you requested:
marpd_prompt() {
    local current_time=$(date '+%I:%M:%S %p')
    local current_dir="${PWD/#$HOME/~}"
    
    # Truncate long directory names
    if [ ${#current_dir} -gt 20 ]; then
        current_dir="...${current_dir: -17}"
    fi
    
    # YOUR EXACT PROMPT DESIGN
    echo "${M_CYAN}"
    echo "░▒▓ MAR-PD ~ ${current_dir} "
    echo "───────────────────────────────────────── ${current_time}  ▓▒░─╮"
    echo -n "❯ ${M_RESET}"
}

# Set the prompt
PROMPT='$(marpd_prompt)'

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la'
alias cls='clear && marpd_banner'
alias matrix='marpd_matrix'
alias hack='marpd_hack'
alias banner='marpd_banner'
alias update='pkg update && pkg upgrade'
alias reload='source ~/.zshrc'

# History
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history

# Auto-completion
autoload -U compinit && compinit

# Key bindings
bindkey -e

# Show banner on startup
marpd_banner

# Help message
echo "${M_CYAN}"
echo '━━━━━━━━━━━━━━ MAR-PD COMMANDS ━━━━━━━━━━━━━━━'
echo '  matrix    - Matrix animation'
echo '  hack      - Hack simulation'
echo '  banner    - Show MAR-PD banner'
echo '  cls       - Clear and show banner'
echo '  reload    - Reload configuration'
echo '━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━'
echo "${M_RESET}"
EOF

# =================== BASH CONFIG ===================
cat > "$HOME/.bashrc" << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# MAR-PD Bash Configuration
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
else
    PS1='\[\033[1;36m\]░▒▓ MAR-PD ~ \w \n───────────────────────────────────────── \t  ▓▒░─╮\n❯\[\033[0m\] '
    
    clear
    echo -e "\033[1;36m"
    echo '╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮'
    echo '│         MAR-PD TERMINAL V10             │'
    echo '│           Bash Mode Active              │'
    echo '╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯'
    echo -e "\033[0m"
fi
EOF

# =================== STARTUP SCRIPT ===================
print_marpd "Setting up auto-start..."

cat > "$MARPD_DIR/startup.sh" << 'EOF'
#!/bin/bash
# MAR-PD Startup Script

sleep 0.5

echo -e "\033[1;36m"
echo '╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮'
echo '│      MAR-PD TERMINAL ACTIVE V10         │'
echo '╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯'
echo -e "\033[0m"

[ -f ~/.zshrc ] && source ~/.zshrc || true
EOF
chmod +x "$MARPD_DIR/startup.sh"

# Add to profiles
echo "source $MARPD_DIR/startup.sh" >> "$HOME/.bash_profile"
echo "source $MARPD_DIR/startup.sh" >> "$HOME/.profile"

# Boot script
mkdir -p "$HOME/.termux/boot"
cat > "$HOME/.termux/boot/marpd.sh" << 'EOF'
#!/data/data/com.termux/files/usr/bin/sh
sleep 1
$HOME/.marpd-cyber/startup.sh
EOF
chmod +x "$HOME/.termux/boot/marpd.sh"

# =================== FINAL SETUP ===================
print_marpd "Finalizing setup..."

# Set ZSH as default
chsh -s zsh 2>/dev/null

# Reload settings
command -v termux-reload-settings > /dev/null && termux-reload-settings

# =================== COMPLETION MESSAGE ===================
clear
echo -e "${MARPD_CYAN}"
cat << "EOF"
╭━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╮
│                                         │
│  ███╗   ███╗ █████╗ ██████╗            │
│  ████╗ ████║██╔══██╗██╔══██╗           │
│  ██╔████╔██║███████║██████╔╝           │
│  ██║╚██╔╝██║██╔══██║██╔═══╝            │
│  ██║ ╚═╝ ██║██║  ██║██║                │
│  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝                │
│  ██████╗ ██████╗                        │
│  ██╔═══██╗██╔══██╗                      │
│  ██║   ██╗██║  ██║                      │
│  ██║   ██╗██║  ██║                      │
│  ╚██████╔╝██████╔╝                      │
│   ╚═════╝ ╚═════╝                       │
│                                         │
│      INSTALLATION COMPLETE V10          │
│                                         │
╰━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━╯
EOF
echo -e "${MARPD_RESET}"

echo -e "${MARPD_CYAN}"
echo "══════════════════════════════════════════════════"
echo -e "${MARPD_RESET}"

echo -e "${MARPD_GREEN}✓ MAR-PD Terminal V10 installed${MARPD_RESET}"
echo -e "${MARPD_GREEN}✓ Your exact prompt design${MARPD_RESET}"
echo -e "${MARPD_GREEN}✓ Static cyan text color${MARPD_RESET}"
echo -e "${MARPD_GREEN}✓ Auto-start enabled${MARPD_RESET}"
echo -e "${MARPD_GREEN}✓ Always-show banner${MARPD_RESET}"

echo -e "\n${MARPD_CYAN}═══════════════ YOUR PROMPT ═══════════════${MARPD_RESET}"
echo -e "${MARPD_CYAN}░▒▓ MAR-PD ~ ~"
echo -e "───────────────────────────────────────── 06:52:20 PM  ▓▒░─╮"
echo -e "❯${MARPD_RESET}"

echo -e "\n${MARPD_CYAN}════════════════ COMMANDS ════════════════${MARPD_RESET}"
echo -e "${MARPD_CYAN}  matrix    - Matrix animation${MARPD_RESET}"
echo -e "${MARPD_CYAN}  hack      - Hack simulation${MARPD_RESET}"
echo -e "${MARPD_CYAN}  banner    - Show MAR-PD banner${MARPD_RESET}"
echo -e "${MARPD_CYAN}  cls       - Clear and show banner${MARPD_RESET}"
echo -e "${MARPD_CYAN}  reload    - Reload configuration${MARPD_RESET}"

echo -e "\n${MARPD_GREEN}[✓] Installation successful!${MARPD_RESET}"
echo -e "${MARPD_CYAN}[→] Restart Termux or type 'reload'${MARPD_RESET}"
echo -e "${MARPD_CYAN}[→] Type 'cls' to see the banner${MARPD_RESET}"

echo -e "\n${MARPD_CYAN}══════════════════════════════════════════════════${MARPD_RESET}"
echo -e "${MARPD_CYAN}         WE WORK CYBER SAFE | MAR-PD V10           ${MARPD_RESET}"
echo -e "${MARPD_CYAN}══════════════════════════════════════════════════${MARPD_RESET}"
