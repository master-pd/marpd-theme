#!/data/data/com.termux/files/usr/bin/bash

# MAR-PD ULTRA PRO MAX TERMUX THEME INSTALLER
# Version: 5.0.0 (Quantum Edition)

# ==================== CONFIGURATION ====================
THEME_NAME="MAR-PD-ULTRA"
THEME_VERSION="5.0.0"
REPO_URL="https://github.com/master-pd/marpd-ultra-theme.git"
TELEGRAM_CHANNEL="https://t.me/master_spamming"
TEAM_NAME="MAR-PD"
SLOGAN="WE WORK CYBER SAFE"
# ======================================================

# ---------- ADVANCED COLOR SYSTEM ----------
BLACK="\e[0;30m"
RED="\e[1;91m"
GREEN="\e[1;92m"
YELLOW="\e[1;93m"
BLUE="\e[1;94m"
PURPLE="\e[1;95m"
CYAN="\e[1;96m"
WHITE="\e[1;97m"
BG_BLACK="\e[40m"
BG_RED="\e[41m"
BG_GREEN="\e[42m"
BG_BLUE="\e[44m"
RESET="\e[0m"
BOLD="\e[1m"
UNDERLINE="\e[4m"
BLINK="\e[5m"
REVERSE="\e[7m"
HIDDEN="\e[8m"

# ---------- ANIMATION FUNCTIONS ----------
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
    already_done() { for ((done=0; done<$elapsed; done++)); do printf "▇"; done }
    remaining() { for ((remain=$elapsed; remain<$duration; remain++)); do printf " "; done }
    percentage() { printf "| %s%%" $(( (($elapsed)*100)/($duration)*100/100 )); }
    clean_line() { printf "\r"; }
    for (( elapsed=1; elapsed<=$duration; elapsed++ )); do
        clean_line
        printf "${CYAN}["
        already_done; remaining; percentage
        printf "]${RESET}"
        sleep 0.1
    done
    printf "\n"
}

# ---------- QUANTUM BANNER ----------
show_banner() {
    clear
    cat << "EOF"
    
    ${BLUE}╔══════════════════════════════════════════════════════════╗
    ║${RED}   ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗        ${BLUE}║
    ║${GREEN}   ████╗ ████║██╔══██╗██╔══██╗    ██╔══██╗██╔══██╗       ${BLUE}║
    ║${YELLOW}   ██╔████╔██║███████║██████╔╝    ██║  ██║██║  ██║       ${BLUE}║
    ║${PURPLE}   ██║╚██╔╝██║██╔══██║██╔═══╝     ██║  ██║██║  ██║       ${BLUE}║
    ║${CYAN}   ██║ ╚═╝ ██║██║  ██║██║         ██████╔╝██████╔╝       ${BLUE}║
    ║${WHITE}   ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═════╝        ${BLUE}║
    ╠══════════════════════════════════════════════════════════╣
    ║${GREEN}        🚀 ULTRA PRO MAX TERMUX THEME v5.0.0            ${BLUE}║
    ║${YELLOW}          🔐 WE WORK CYBER SAFE                         ${BLUE}║
    ║${CYAN}          📞 Contact: https://t.me/master_spamming        ${BLUE}║
    ╚══════════════════════════════════════════════════════════╝${RESET}
    
EOF
}

# ---------- SYSTEM CHECK ----------
check_system() {
    printf "${CYAN}[*] Checking system requirements...${RESET}\n"
    
    # Check Termux
    if [ ! -d /data/data/com.termux ]; then
        printf "${RED}[!] This script must run in Termux${RESET}\n"
        exit 1
    fi
    
    # Check storage permission
    if [ ! -w /data/data/com.termux/files/home ]; then
        termux-setup-storage
    fi
    
    # Check Internet
    if ! ping -c 1 google.com &> /dev/null; then
        printf "${RED}[!] Internet connection required${RESET}\n"
        exit 1
    fi
}

# ---------- DEPENDENCIES INSTALLATION ----------
install_dependencies() {
    printf "${CYAN}[*] Installing quantum dependencies...${RESET}\n"
    progress_bar 20
    
    pkg update -y && pkg upgrade -y
    
    # Core packages
    pkg install -y git wget curl python python-pip nodejs ruby \
        cmatrix figlet toilet neofetch nano vim ncurses-utils \
        jq proot-distro fish zsh
    
    # Python modules
    pip install requests colorama rich pyfiglet cryptography \
        numpy pandas pillow
    
    # Ruby gems
    gem install lolcat paint pastel
    
    # Node modules
    npm install -g chalk figlet-cli gradient-string
    
    printf "${GREEN}[✓] Dependencies installed successfully${RESET}\n"
}

# ---------- THEME ENGINE INSTALLATION ----------
install_theme_engine() {
    printf "${CYAN}[*] Installing MAR-PD Quantum Theme Engine...${RESET}\n"
    
    # Backup original files
    mkdir -p ~/.marpd-backup
    cp ~/.bashrc ~/.marpd-backup/bashrc.backup 2>/dev/null
    cp ~/.zshrc ~/.marpd-backup/zshrc.backup 2>/dev/null
    
    # Create theme directory
    THEME_DIR="$HOME/.marpd-theme"
    mkdir -p $THEME_DIR/{core,modules,assets,data,logs}
    
    # Download theme files
    git clone $REPO_URL $THEME_DIR/temp_repo
    
    # Copy core files
    cp -r $THEME_DIR/temp_repo/core/* $THEME_DIR/core/
    cp -r $THEME_DIR/temp_repo/modules/* $THEME_DIR/modules/
    cp -r $THEME_DIR/temp_repo/assets/* $THEME_DIR/assets/
    
    # Set permissions
    chmod +x $THEME_DIR/core/*.sh
    chmod +x $THEME_DIR/modules/**/*.sh
    
    # Create launcher
    cat > $THEME_DIR/launcher <<EOF
#!/data/data/com.termux/files/usr/bin/bash
# MAR-PD Theme Launcher - AUTO LOAD

export MARPD_THEME_ENABLED=1
export MARPD_VERSION="$THEME_VERSION"
export MARPD_TEAM="$TEAM_NAME"

# Load theme engine
source \$HOME/.marpd-theme/core/theme-engine.sh

# Show banner
marpd_banner

# Load prompt
marpd_prompt

# Start background services
marpd_start_services
EOF
    
    chmod +x $THEME_DIR/launcher
    
    # Replace bashrc
    cat > ~/.bashrc <<EOF
#!/data/data/com.termux/files/usr/bin/bash
# MAR-PD ULTRA PRO MAX THEME - AUTO LOAD

# Clear default termux welcome
clear

# Load MAR-PD Theme
if [ -f ~/.marpd-theme/launcher ]; then
    source ~/.marpd-theme/launcher
else
    # If theme not found, install it
    echo -e "\e[1;31m[!] MAR-PD Theme not found! Installing...\e[0m"
    git clone https://github.com/master-pd/marpd-ultra-theme.git ~/.marpd-install
    bash ~/.marpd-install/scripts/install.sh
fi

# Custom prompt
export PS1='\[\e[1;91m\]\u\[\e[1;97m\]@\[\e[1;92m\]MAR-PD\[\e[1;93m\]♪↗➜ \[\e[1;96m\]\w \[\e[1;95m\]\$ \[\e[0m\]'

# Aliases
alias update-theme='bash ~/.marpd-theme/scripts/update.sh'
alias uninstall-theme='bash ~/.marpd-theme/scripts/uninstall.sh'
alias marpd-matrix='bash ~/.marpd-theme/modules/matrix-module/matrix-3d.sh'
alias marpd-hack='bash ~/.marpd-theme/modules/hacking-module/port-scan.sh'
alias marpd-ai='bash ~/.marpd-theme/modules/ai-module/chat-gpt.sh'
alias marpd-backup='bash ~/.marpd-theme/scripts/backup.sh'

# Environment variables
export PATH="\$PATH:\$HOME/.marpd-theme/core"
export MARPD_MODE="ULTRA_PRO_MAX"
export TERMUX_STYLING="MARPD_QUANTUM"

# Welcome message
echo -e "\e[1;36m┌─────────────────────────────────────────────┐"
echo -e "│     \e[1;32mMAR-PD ULTRA PRO MAX THEME v5.0.0\e[1;36m     │"
echo -e "│      \e[1;33mWE WORK CYBER SAFE\e[1;36m                  │"
echo -e "└─────────────────────────────────────────────┘\e[0m"
EOF
    
    # Also setup for zsh
    cat > ~/.zshrc <<EOF
# MAR-PD Theme for ZSH
source ~/.bashrc
autoload -Uz compinit && compinit
EOF
}

# ---------- POST-INSTALLATION ----------
post_install() {
    printf "${CYAN}[*] Finalizing installation...${RESET}\n"
    
    # Create update script
    cat > ~/.marpd-theme/scripts/update.sh <<EOF
#!/data/data/com.termux/files/usr/bin/bash
# Auto-update script

cd ~/.marpd-theme
git pull origin main

if [ \$? -eq 0 ]; then
    echo -e "\e[1;32m[✓] Theme updated successfully!\e[0m"
    echo -e "\e[1;36m[*] Restart Termux to apply changes\e[0m"
else
    echo -e "\e[1;31m[!] Update failed! Check internet connection\e[0m"
fi
EOF
    
    chmod +x ~/.marpd-theme/scripts/update.sh
    
    # Create config file
    cat > ~/.marpd-theme/data/config.ini <<EOF
[theme]
name = MAR-PD ULTRA PRO MAX
version = 5.0.0
install_date = $(date)
team = MAR-PD
contact = https://t.me/master_spamming
slogan = WE WORK CYBER SAFE

[settings]
auto_update = true
animation_level = ultra
prompt_style = hacker
color_scheme = quantum

[modules]
matrix = enabled
hacking_tools = enabled
ai_assistant = enabled
cyber_tools = enabled
EOF
    
    # Set up cron for auto-update
    crontab -l > /tmp/marpd_cron 2>/dev/null
    echo "0 12 * * * bash ~/.marpd-theme/scripts/update.sh >/dev/null 2>&1" >> /tmp/marpd_cron
    crontab /tmp/marpd_cron
}

# ---------- INSTALLATION SUCCESS ----------
show_success() {
    show_banner
    printf "${GREEN}"
    figlet "INSTALLATION COMPLETE"
    printf "${RESET}"
    
    cat << EOF
    
    ${YELLOW}══════════════════════════════════════════════════════════
    ${GREEN}✅ MAR-PD ULTRA PRO MAX THEME INSTALLED SUCCESSFULLY!
    ${YELLOW}══════════════════════════════════════════════════════════
    
    ${CYAN}🚀 Features Enabled:
    ${WHITE}  • Quantum Theme Engine
    ${WHITE}  • 3D Matrix Animations
    ${WHITE}  • AI-Powered Assistant
    ${WHITE}  • Hacking Tools Suite
    ${WHITE}  • Auto-Update System
    ${WHITE}  • Multi-Shell Support
    
    ${PURPLE}📟 Available Commands:
    ${GREEN}  marpd-matrix   ${WHITE}- Launch 3D Matrix animation
    ${GREEN}  marpd-hack     ${WHITE}- Ethical hacking tools
    ${GREEN}  marpd-ai       ${WHITE}- AI Assistant
    ${GREEN}  update-theme   ${WHITE}- Update theme
    ${GREEN}  uninstall-theme${WHITE}- Remove theme
    
    ${BLUE}🔧 Technical Info:
    ${WHITE}  Version:      ${THEME_VERSION}
    ${WHITE}  Install Path: ~/.marpd-theme/
    ${WHITE}  Config File:  ~/.marpd-theme/data/config.ini
    ${WHITE}  Team:         ${TEAM_NAME}
    ${WHITE}  Contact:      ${TELEGRAM_CHANNEL}
    
    ${RED}⚠️  IMPORTANT: Close and reopen Termux to activate theme!
    ${YELLOW}══════════════════════════════════════════════════════════${RESET}
EOF
}

# ---------- MAIN EXECUTION ----------
main() {
    show_banner
    printf "${CYAN}[*] Starting MAR-PD Quantum Installation...${RESET}\n\n"
    
    check_system
    install_dependencies
    install_theme_engine
    post_install
    show_success
    
    # Final message
    printf "\n${BLINK}${GREEN}[*] Please restart Termux NOW to activate theme!${RESET}\n"
    printf "${CYAN}[*] Press Enter to exit...${RESET}"
    read
}

# Run main function
main
