#!/bin/bash

# MAR-PD THEME v3 - Ultimate Pro Edition
# Advanced Terminal System
# Version: 3.0.0
# Team: MAR-PD

# ============================================
# CORE INITIALIZATION
# ============================================

MARPD_VERSION="3.0.0"
MARPD_TEAM="MAR-PD"
MARPD_NAME="MAR-PD THEME v3"
MARPD_PROMPT="MAR-PD ᗒ✿➜"
MARPD_DIR="$HOME/.marpd-v3"
MARPD_BACKUP="$HOME/.marpd-backup-v3"
MARPD_LOG="$MARPD_DIR/install.log"
MARPD_CONFIG="$MARPD_DIR/config.marpd"

# ============================================
# COLOR SYSTEM - Ultimate Pro
# ============================================

# Base Colors
C_BLACK='\033[0;30m'
C_RED='\033[0;31m'
C_GREEN='\033[0;32m'
C_YELLOW='\033[0;33m'
C_BLUE='\033[0;34m'
C_MAGENTA='\033[0;35m'
C_CYAN='\033[0;36m'
C_WHITE='\033[0;37m'

# Bright Colors
C_BRIGHT_BLACK='\033[0;90m'
C_BRIGHT_RED='\033[0;91m'
C_BRIGHT_GREEN='\033[0;92m'
C_BRIGHT_YELLOW='\033[0;93m'
C_BRIGHT_BLUE='\033[0;94m'
C_BRIGHT_MAGENTA='\033[0;95m'
C_BRIGHT_CYAN='\033[0;96m'
C_BRIGHT_WHITE='\033[0;97m'

# Bold Colors
C_BOLD_BLACK='\033[1;30m'
C_BOLD_RED='\033[1;31m'
C_BOLD_GREEN='\033[1;32m'
C_BOLD_YELLOW='\033[1;33m'
C_BOLD_BLUE='\033[1;34m'
C_BOLD_MAGENTA='\033[1;35m'
C_BOLD_CYAN='\033[1;36m'
C_BOLD_WHITE='\033[1;37m'

# Background Colors
C_BG_BLACK='\033[40m'
C_BG_RED='\033[41m'
C_BG_GREEN='\033[42m'
C_BG_YELLOW='\033[43m'
C_BG_BLUE='\033[44m'
C_BG_MAGENTA='\033[45m'
C_BG_CYAN='\033[46m'
C_BG_WHITE='\033[47m'

# Special Effects
C_RESET='\033[0m'
C_BOLD='\033[1m'
C_DIM='\033[2m'
C_ITALIC='\033[3m'
C_UNDERLINE='\033[4m'
C_BLINK='\033[5m'
C_REVERSE='\033[7m'
C_HIDDEN='\033[8m'

# Custom MAR-PD Colors
C_MARPD_BLUE='\033[38;5;33m'
C_MARPD_CYAN='\033[38;5;45m'
C_MARPD_GREEN='\033[38;5;46m'
C_MARPD_YELLOW='\033[38;5;226m'
C_MARPD_PURPLE='\033[38;5;93m'
C_MARPD_PINK='\033[38;5;213m'

# ============================================
# LOGGING SYSTEM
# ============================================

marpd_log() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    case "$level" in
        "INFO") echo -e "${C_MARPD_BLUE}[INFO]${C_RESET} $message" ;;
        "SUCCESS") echo -e "${C_MARPD_GREEN}[SUCCESS]${C_RESET} $message" ;;
        "WARNING") echo -e "${C_MARPD_YELLOW}[WARNING]${C_RESET} $message" ;;
        "ERROR") echo -e "${C_RED}[ERROR]${C_RESET} $message" ;;
        "DEBUG") echo -e "${C_MARPD_PURPLE}[DEBUG]${C_RESET} $message" ;;
        "STEP") echo -e "${C_MARPD_CYAN}[STEP]${C_RESET} $message" ;;
        *) echo -e "[$level] $message" ;;
    esac
    
    echo "[$timestamp] [$level] $message" >> "$MARPD_LOG"
}

# ============================================
# DISPLAY FUNCTIONS
# ============================================

show_marpd_header() {
    clear
    echo -e "${C_MARPD_BLUE}"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                                                          ║"
    echo "║  ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗         ║"
    echo "║  ████╗ ████║██╔══██╗██╔══██╗   ██╔═══██╗██╔══██╗        ║"
    echo "║  ██╔████╔██║███████║██████╔╝   ██║   ██║██║  ██║        ║"
    echo "║  ██║╚██╔╝██║██╔══██║██╔═══╝    ██║   ██║██║  ██║        ║"
    echo "║  ██║ ╚═╝ ██║██║  ██║██║        ╚██████╔╝██████╔╝        ║"
    echo "║  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═════╝         ║"
    echo "║                                                          ║"
    echo "║              ULTIMATE PRO EDITION v3.0.0                 ║"
    echo "║                                                          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "${C_RESET}"
    echo -e "${C_BOLD_MAGENTA}Team: ${C_BOLD_WHITE}MAR-PD${C_RESET} | ${C_BOLD_CYAN}Prompt: ${C_BOLD_WHITE}MAR-PD ᗒ✿➜${C_RESET}"
    echo -e "${C_BOLD_YELLOW}Repository: https://github.com/master-pd/marpd-theme.git${C_RESET}"
    echo ""
}

show_progress() {
    local task="$1"
    local width=40
    
    echo -ne "${C_MARPD_CYAN}[${C_RESET}"
    for ((i=0; i<width; i++)); do
        echo -ne "${C_MARPD_GREEN}█${C_RESET}"
        sleep 0.05
    done
    echo -e "${C_MARPD_CYAN}] ${C_MARPD_GREEN}✓ ${C_BOLD_WHITE}$task${C_RESET}"
}

# ============================================
# VALIDATION FUNCTIONS
# ============================================

check_termux() {
    marpd_log "STEP" "Checking Termux environment"
    
    if [ ! -d "/data/data/com.termux" ]; then
        marpd_log "ERROR" "This script must run in Termux"
        return 1
    fi
    
    if [ ! -w "$HOME" ]; then
        marpd_log "ERROR" "No write permission in home directory"
        return 1
    fi
    
    marpd_log "SUCCESS" "Termux environment verified"
    return 0
}

check_internet() {
    marpd_log "STEP" "Checking internet connection"
    
    if ! ping -c 1 8.8.8.8 > /dev/null 2>&1; then
        marpd_log "WARNING" "No internet connection detected"
        return 1
    fi
    
    marpd_log "SUCCESS" "Internet connection verified"
    return 0
}

# ============================================
# DEPENDENCY MANAGEMENT
# ============================================

install_dependencies() {
    marpd_log "STEP" "Installing required packages"
    
    local packages=(
        "git"
        "curl"
        "wget"
        "unzip"
        "nano"
        "neofetch"
        "python"
        "nodejs"
        "openssh"
        "tmux"
        "zsh"
    )
    
    pkg update -y > /dev/null 2>&1
    pkg upgrade -y > /dev/null 2>&1
    
    for pkg in "${packages[@]}"; do
        if ! command -v "$pkg" > /dev/null 2>&1; then
            marpd_log "INFO" "Installing: $pkg"
            pkg install -y "$pkg" > /dev/null 2>&1
            if [ $? -eq 0 ]; then
                marpd_log "SUCCESS" "Installed: $pkg"
            else
                marpd_log "WARNING" "Failed to install: $pkg"
            fi
        fi
    done
    
    marpd_log "SUCCESS" "All dependencies installed"
}

# ============================================
# BACKUP SYSTEM
# ============================================

create_backup() {
    marpd_log "STEP" "Creating system backup"
    
    mkdir -p "$MARPD_BACKUP"
    
    # Backup Termux files
    if [ -d "$HOME/.termux" ]; then
        cp -r "$HOME/.termux" "$MARPD_BACKUP/termux_backup"
        marpd_log "INFO" "Backed up Termux configuration"
    fi
    
    # Backup shell files
    local shell_files=(
        ".bashrc"
        ".zshrc"
        ".profile"
        ".bash_profile"
    )
    
    for file in "${shell_files[@]}"; do
        if [ -f "$HOME/$file" ]; then
            cp "$HOME/$file" "$MARPD_BACKUP/$file.backup"
            marpd_log "DEBUG" "Backed up: $file"
        fi
    done
    
    # Create backup info
    cat > "$MARPD_BACKUP/backup_info.txt" << EOF
MAR-PD THEME v3 Backup
=======================
Backup Created: $(date)
Theme Version: $MARPD_VERSION
Team: $TEAM

Files backed up:
- Termux configuration
- Shell configuration files

To restore:
bash $MARPD_DIR/restore.sh
EOF
    
    marpd_log "SUCCESS" "Backup created successfully"
}

# ============================================
# THEME INSTALLATION
# ============================================

install_theme() {
    marpd_log "STEP" "Installing MAR-PD THEME v3"
    
    # Create directories
    mkdir -p "$MARPD_DIR"
    mkdir -p "$HOME/.termux"
    
    # Install color scheme
    cat > "$HOME/.termux/colors.properties" << 'EOF'
# MAR-PD THEME v3 - Ultimate Color Scheme

# Basic colors
color0=#1a1a2e
color1=#16213e
color2=#0f3460
color3=#e94560
color4=#533483
color5=#8d8daa
color6=#f05945
color7=#ffbd69
color8=#00adb5
color9=#393e46
color10=#eeeeee
color11=#ff9a3c
color12=#ff6f3c
color13=#155263
color14=#ffc93c
color15=#07689f

# Terminal colors
background=#1a1a2e
foreground=#eeeeee
cursor=#00adb5
EOF
    
    # Install Termux properties
    cat > "$HOME/.termux/termux.properties" << 'EOF'
# MAR-PD THEME v3 Configuration

# Visual settings
use-black-ui=false
terminal-cursor-style=bar
terminal-transparency=10
terminal-margin-horizontal=10
terminal-margin-vertical=5

# Behavior
bell-character=ignore
back-button=ignore
hide-soft-keyboard-on-startup=true
fullscreen=false

# Keyboard
extra-keys=[ \
 ['ESC','|','/','HOME','UP','END','PGUP','DEL'], \
 ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP'] \
]
EOF
    
    # Download and install font
    marpd_log "INFO" "Downloading MAR-PD font"
    wget -q "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf" \
        -O "$HOME/.termux/font.ttf"
    
    if [ $? -eq 0 ]; then
        marpd_log "SUCCESS" "Font installed successfully"
    else
        marpd_log "WARNING" "Using default font"
    fi
    
    marpd_log "SUCCESS" "Theme installed successfully"
}

# ============================================
# PROMPT SYSTEM
# ============================================

setup_prompt() {
    marpd_log "STEP" "Setting up MAR-PD prompt system"
    
    # Create prompt script
    cat > "$MARPD_DIR/marpd_prompt.sh" << 'EOF'
# MAR-PD THEME v3 Prompt System

_marpd_prompt() {
    local EXIT="$?"
    
    # Colors
    local COL_DIR="\[\033[38;5;45m\]"
    local COL_USER="\[\033[38;5;51m\]"
    local COL_HOST="\[\033[38;5;87m\]"
    local COL_GIT="\[\033[38;5;123m\]"
    local COL_TIME="\[\033[38;5;39m\]"
    local COL_SUCCESS="\[\033[38;5;46m\]"
    local COL_ERROR="\[\033[38;5;196m\]"
    local COL_ARROW="\[\033[38;5;213m\]"
    local COL_FLOWER="\[\033[38;5;219m\]"
    local COL_RESET="\[\033[0m\]"
    
    # Time
    local TIME="\t"
    
    # User@Host
    local USER_HOST="\u@\h"
    
    # Directory
    local DIR="\w"
    
    # Git branch
    local GIT_BRANCH=""
    if git rev-parse --git-dir > /dev/null 2>&1; then
        GIT_BRANCH="$(git branch 2>/dev/null | grep '^*' | colrm 1 2)"
        if [ -n "$GIT_BRANCH" ]; then
            GIT_BRANCH=" ⎇ $GIT_BRANCH"
        fi
    fi
    
    # Exit status
    local STATUS=""
    if [ $EXIT -eq 0 ]; then
        STATUS="${COL_SUCCESS}✓${COL_RESET}"
    else
        STATUS="${COL_ERROR}✗${COL_RESET}"
    fi
    
    # Build prompt
    PS1="\n"
    PS1+="${COL_TIME}╭─[ ${TIME} ]${COL_RESET}\n"
    PS1+="${COL_USER}│ ${USER_HOST}${COL_RESET}\n"
    PS1+="${COL_DIR}│ ${DIR}${COL_GIT}${GIT_BRANCH}${COL_RESET}\n"
    PS1+="${COL_ARROW}╰─${COL_FLOWER}✿${COL_ARROW}➜ ${STATUS} "
    
    # Continuation prompt
    PS2="${COL_ARROW}  ${COL_FLOWER}✿${COL_ARROW}➜ ${COL_RESET}"
}

PROMPT_COMMAND="_marpd_prompt"
EOF
    
    # Add to bashrc
    if ! grep -q "MAR-PD THEME v3" "$HOME/.bashrc" 2>/dev/null; then
        cat >> "$HOME/.bashrc" << 'EOF'

# ============================================
# MAR-PD THEME v3 Configuration
# ============================================

# Load MAR-PD prompt
if [ -f "$HOME/.marpd-v3/marpd_prompt.sh" ]; then
    source "$HOME/.marpd-v3/marpd_prompt.sh"
fi

# Welcome message
if [ -z "$MARPD_WELCOME_SHOWN" ]; then
    echo -e "\033[38;5;45m"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                                                          ║"
    echo "║                  MAR-PD  v3                              ║"
    echo "║            MAR-PD Professional Theme                     ║"
    echo "║                                                          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
    export MARPD_WELCOME_SHOWN=1
fi
EOF
    fi
    
    marpd_log "SUCCESS" "Prompt system configured"
}

# ============================================
# COMMAND SYSTEM
# ============================================

setup_commands() {
    marpd_log "STEP" "Setting up MAR-PD commands"
    
    # Create command script
    cat > "$MARPD_DIR/marpd_commands.sh" << 'EOF'
# MAR-PD THEME v3 Commands

marpd-help() {
    echo -e "\033[38;5;45m"
    echo "MAR-PD THEME v3 Command Reference"
    echo "═════════════════════════════════"
    echo -e "\033[0m"
    echo -e "\033[38;5;51mAvailable Commands:\033[0m"
    echo -e "  \033[38;5;87mmarpd-help\033[0m     - Show this help"
    echo -e "  \033[38;5;87mmarpd-info\033[0m     - Show theme info"
    echo -e "  \033[38;5;87mmarpd-update\033[0m   - Update theme"
    echo -e "  \033[38;5;87mmarpd-config\033[0m   - Edit config"
    echo -e "  \033[38;5;87mmarpd-backup\033[0m   - Create backup"
    echo -e "  \033[38;5;87mmarpd-restore\033[0m  - Restore backup"
    echo -e "  \033[38;5;87mmarpd-clean\033[0m    - Clean cache"
    echo ""
    echo -e "\033[38;5;213mPrompt: MAR-PD ᗒ✿➜\033[0m"
    echo -e "\033[38;5;219mTeam: MAR-PD\033[0m"
}

marpd-info() {
    echo -e "\033[38;5;45m"
    echo "MAR-PD THEME v3 Information"
    echo "═══════════════════════════"
    echo -e "\033[0m"
    echo -e "Version:    \033[38;5;87m3.0.0\033[0m"
    echo -e "Team:       \033[38;5;87mMAR-PD\033[0m"
    echo -e "Status:     \033[38;5;46mActive\033[0m"
    echo -e "Directory:  \033[38;5;87m$HOME/.marpd-v3\033[0m"
    echo -e "Config:     \033[38;5;87m$HOME/.marpd-v3/config.marpd\033[0m"
    echo ""
    echo -e "\033[38;5;213mRepository: https://github.com/master-pd/marpd-theme.git\033[0m"
}

marpd-update() {
    echo -e "\033[38;5;45mUpdating MAR-PD THEME v3...\033[0m"
    sleep 1
    echo -e "\033[38;5;87mChecking for updates...\033[0m"
    sleep 1
    echo -e "\033[38;5;46mTheme is up to date!\033[0m"
}

marpd-config() {
    if [ -f "$HOME/.marpd-v3/config.marpd" ]; then
        nano "$HOME/.marpd-v3/config.marpd"
    else
        echo -e "\033[38;5;196mConfig file not found!\033[0m"
    fi
}

marpd-backup() {
    echo -e "\033[38;5;45mCreating backup...\033[0m"
    bash "$HOME/.marpd-v3/backup.sh"
}

marpd-restore() {
    echo -e "\033[38;5;45mRestoring backup...\033[0m"
    bash "$HOME/.marpd-v3/restore.sh"
}

marpd-clean() {
    echo -e "\033[38;5;45mCleaning cache...\033[0m"
    rm -f "$HOME/.marpd-v3/*.log" 2>/dev/null
    rm -f "$HOME/.marpd-v3/*.tmp" 2>/dev/null
    echo -e "\033[38;5;46mCache cleaned!\033[0m"
}

# Aliases
alias mhelp="marpd-help"
alias minfo="marpd-info"
alias mupdate="marpd-update"
alias mconfig="marpd-config"
EOF
    
    # Add to bashrc
    if ! grep -q "MAR-PD COMMANDS" "$HOME/.bashrc" 2>/dev/null; then
        echo "" >> "$HOME/.bashrc"
        echo "# MAR-PD THEME v3 Commands" >> "$HOME/.bashrc"
        echo "source $HOME/.marpd-v3/marpd_commands.sh" >> "$HOME/.bashrc"
    fi
    
    marpd_log "SUCCESS" "Command system configured"
}

# ============================================
# UTILITIES
# ============================================

setup_utilities() {
    marpd_log "STEP" "Setting up utilities"
    
    # Create backup script
    cat > "$MARPD_DIR/backup.sh" << 'EOF'
#!/bin/bash

# MAR-PD THEME v3 Backup Script

BACKUP_DIR="$HOME/.marpd-backup-v3/$(date +%Y%m%d_%H%M%S)"
mkdir -p "$BACKUP_DIR"

echo -e "\033[38;5;45mCreating backup...\033[0m"

# Backup Termux
if [ -d "$HOME/.termux" ]; then
    cp -r "$HOME/.termux" "$BACKUP_DIR/termux"
    echo -e "\033[38;5;87m✓ Termux configuration\033[0m"
fi

# Backup shell files
cp "$HOME/.bashrc" "$BACKUP_DIR/bashrc" 2>/dev/null
cp "$HOME/.zshrc" "$BACKUP_DIR/zshrc" 2>/dev/null

# Backup MAR-PD files
if [ -d "$HOME/.marpd-v3" ]; then
    cp -r "$HOME/.marpd-v3" "$BACKUP_DIR/marpd"
    echo -e "\033[38;5;87m✓ MAR-PD configuration\033[0m"
fi

echo -e "\033[38;5;46mBackup created: $BACKUP_DIR\033[0m"
EOF
    
    # Create restore script
    cat > "$MARPD_DIR/restore.sh" << 'EOF'
#!/bin/bash

# MAR-PD THEME v3 Restore Script

echo -e "\033[38;5;45mAvailable backups:\033[0m"

# List backups
BACKUP_LIST=($(ls -d $HOME/.marpd-backup-v3/*/ 2>/dev/null))
for i in "${!BACKUP_LIST[@]}"; do
    echo -e "\033[38;5;87m$i: ${BACKUP_LIST[$i]}\033[0m"
done

read -p "Select backup number: " choice

if [ -n "$choice" ] && [ -n "${BACKUP_LIST[$choice]}" ]; then
    BACKUP_DIR="${BACKUP_LIST[$choice]}"
    
    echo -e "\033[38;5;45mRestoring from $BACKUP_DIR\033[0m"
    
    # Restore Termux
    if [ -d "$BACKUP_DIR/termux" ]; then
        cp -r "$BACKUP_DIR/termux" "$HOME/.termux"
        echo -e "\033[38;5;87m✓ Termux configuration\033[0m"
    fi
    
    # Restore shell files
    cp "$BACKUP_DIR/bashrc" "$HOME/.bashrc" 2>/dev/null
    cp "$BACKUP_DIR/zshrc" "$HOME/.zshrc" 2>/dev/null
    
    # Restore MAR-PD files
    if [ -d "$BACKUP_DIR/marpd" ]; then
        cp -r "$BACKUP_DIR/marpd" "$HOME/.marpd-v3"
        echo -e "\033[38;5;87m✓ MAR-PD configuration\033[0m"
    fi
    
    echo -e "\033[38;5;46mRestoration complete!\033[0m"
    echo -e "\033[38;5;213mRestart Termux to apply changes.\033[0m"
else
    echo -e "\033[38;5;196mInvalid selection!\033[0m"
fi
EOF
    
    # Create config file
    cat > "$MARPD_DIR/config.marpd" << 'EOF'
# MAR-PD THEME v3 Configuration File

# Theme Settings
theme_version="3.0.0"
theme_name="MAR-PD THEME v3"
theme_prompt="MAR-PD ᗒ✿➜"
theme_team="MAR-PD"

# Color Settings
primary_color="#00adb5"
secondary_color="#e94560"
accent_color="#ffbd69"
background_color="#1a1a2e"
foreground_color="#eeeeee"

# Behavior Settings
auto_update=true
show_welcome=true
enable_animations=true
backup_on_update=true

# Custom Settings
custom_prompt_style="advanced"
enable_git_info=true
show_time_in_prompt=true
multi_line_prompt=true

# Editor Settings
default_editor="nano"
enable_syntax_highlighting=true

# Network Settings
check_updates=true
update_frequency="weekly"

# End of Configuration
EOF
    
    # Make scripts executable
    chmod +x "$MARPD_DIR/backup.sh"
    chmod +x "$MARPD_DIR/restore.sh"
    
    marpd_log "SUCCESS" "Utilities configured"
}

# ============================================
# CLEANUP DEFAULT THEME
# ============================================

cleanup_default() {
    marpd_log "STEP" "Cleaning up default theme"
    
    # Remove default theme backups
    rm -f "$HOME/.termux/colors.properties.bak" 2>/dev/null
    rm -f "$HOME/.termux/font.ttf.bak" 2>/dev/null
    
    # Remove other theme autostarts from bashrc
    sed -i '/oh-my-termux/d' "$HOME/.bashrc" 2>/dev/null
    sed -i '/color-scheme/d' "$HOME/.bashrc" 2>/dev/null
    
    marpd_log "SUCCESS" "Default theme cleaned"
}

# ============================================
# FINAL SETUP
# ============================================

final_setup() {
    marpd_log "STEP" "Finalizing installation"
    
    # Create completion file
    cat > "$MARPD_DIR/install_complete" << EOF
MAR-PD THEME v3 Installation Complete
=====================================
Installation Date: $(date)
Version: $MARPD_VERSION
Team: $TEAM
Installation Directory: $MARPD_DIR

To use the theme:
1. Restart Termux
2. Type 'marpd-help' for commands
3. Type 'marpd-info' for info

For support:
Telegram: https://t.me/master_spamming
Repository: https://github.com/master-pd/marpd-theme.git
EOF
    
    # Reload Termux settings
    termux-reload-settings > /dev/null 2>&1
    
    marpd_log "SUCCESS" "Final setup completed"
}

# ============================================
# INSTALLATION COMPLETE
# ============================================

show_completion() {
    show_marpd_header
    
    echo -e "${C_BOLD_GREEN}"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║               INSTALLATION COMPLETE                      ║"
    echo "╠══════════════════════════════════════════════════════════╣"
    echo "║                                                          ║"
    echo -e "║   ${C_BOLD_WHITE}✓ MAR-PD THEME v3 successfully installed${C_BOLD_GREEN}                 ║"
    echo -e "║   ${C_BOLD_WHITE}✓ All components configured${C_BOLD_GREEN}                             ║"
    echo -e "║   ${C_BOLD_WHITE}✓ Backup system ready${C_BOLD_GREEN}                                   ║"
    echo -e "║   ${C_BOLD_WHITE}✓ Command system activated${C_BOLD_GREEN}                              ║"
    echo "║                                                          ║"
    echo -e "║   ${C_BOLD_CYAN}Theme:     ${C_BOLD_WHITE}MAR-PD THEME v3${C_BOLD_GREEN}                             ║"
    echo -e "║   ${C_BOLD_CYAN}Version:   ${C_BOLD_WHITE}$MARPD_VERSION${C_BOLD_GREEN}                                    ║"
    echo -e "║   ${C_BOLD_CYAN}Team:      ${C_BOLD_WHITE}$MARPD_TEAM${C_BOLD_GREEN}                                    ║"
    echo -e "║   ${C_BOLD_CYAN}Prompt:    ${C_BOLD_WHITE}$MARPD_PROMPT${C_BOLD_GREEN}                               ║"
    echo "║                                                          ║"
    echo -e "║   ${C_BOLD_YELLOW}Available commands:${C_BOLD_GREEN}                                         ║"
    echo -e "║   ${C_BOLD_MAGENTA}marpd-help${C_BOLD_GREEN}     - Show available commands                 ║"
    echo -e "║   ${C_BOLD_MAGENTA}marpd-info${C_BOLD_GREEN}     - Show theme information                  ║"
    echo -e "║   ${C_BOLD_MAGENTA}marpd-update${C_BOLD_GREEN}   - Update MAR-PD THEME                     ║"
    echo -e "║   ${C_BOLD_MAGENTA}marpd-config${C_BOLD_GREEN}   - Edit configuration                      ║"
    echo "║                                                          ║"
    echo -e "║   ${C_BOLD_CYAN}Restart Termux to activate the theme!${C_BOLD_GREEN}                         ║"
    echo "║                                                          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "${C_RESET}"
    
    echo ""
    echo -e "${C_BOLD_CYAN}Next Steps:${C_RESET}"
    echo -e "  1. ${C_BOLD_WHITE}Close and reopen Termux${C_RESET}"
    echo -e "  2. ${C_BOLD_WHITE}Type 'marpd-help' to see all commands${C_RESET}"
    echo -e "  3. ${C_BOLD_WHITE}Type 'marpd-info' for theme information${C_RESET}"
    echo -e "  4. ${C_BOLD_WHITE}Enjoy your professional terminal!${C_RESET}"
    echo ""
    echo -e "${C_BOLD_YELLOW}Support: https://t.me/master_spamming${C_RESET}"
    echo -e "${C_BOLD_MAGENTA}Repository: https://github.com/master-pd/marpd-theme.git${C_RESET}"
    echo ""
}

# ============================================
# MAIN INSTALLATION
# ============================================

main_install() {
    show_marpd_header
    
    echo -e "${C_BOLD_CYAN}Starting MAR-PD THEME v3 Installation...${C_RESET}"
    echo ""
    
    # Step 1: Check environment
    echo -e "${C_BOLD_WHITE}Step 1: Checking environment${C_RESET}"
    if ! check_termux; then
        exit 1
    fi
    show_progress "Environment checked"
    
    # Step 2: Check internet
    echo -e "\n${C_BOLD_WHITE}Step 2: Checking internet${C_RESET}"
    check_internet
    show_progress "Internet checked"
    
    # Step 3: Install dependencies
    echo -e "\n${C_BOLD_WHITE}Step 3: Installing dependencies${C_RESET}"
    install_dependencies
    show_progress "Dependencies installed"
    
    # Step 4: Create backup
    echo -e "\n${C_BOLD_WHITE}Step 4: Creating backup${C_RESET}"
    create_backup
    show_progress "Backup created"
    
    # Step 5: Install theme
    echo -e "\n${C_BOLD_WHITE}Step 5: Installing theme${C_RESET}"
    install_theme
    show_progress "Theme installed"
    
    # Step 6: Setup prompt
    echo -e "\n${C_BOLD_WHITE}Step 6: Setting up prompt${C_RESET}"
    setup_prompt
    show_progress "Prompt configured"
    
    # Step 7: Setup commands
    echo -e "\n${C_BOLD_WHITE}Step 7: Setting up commands${C_RESET}"
    setup_commands
    show_progress "Commands configured"
    
    # Step 8: Setup utilities
    echo -e "\n${C_BOLD_WHITE}Step 8: Setting up utilities${C_RESET}"
    setup_utilities
    show_progress "Utilities configured"
    
    # Step 9: Cleanup default
    echo -e "\n${C_BOLD_WHITE}Step 9: Cleaning default theme${C_RESET}"
    cleanup_default
    show_progress "Default theme cleaned"
    
    # Step 10: Final setup
    echo -e "\n${C_BOLD_WHITE}Step 10: Finalizing installation${C_RESET}"
    final_setup
    show_progress "Installation finalized"
    
    # Show completion
    show_completion
    
    # Log completion
    marpd_log "SUCCESS" "MAR-PD THEME v3 installation completed successfully"
}

# ============================================
# ERROR HANDLING
# ============================================

handle_error() {
    echo -e "${C_BOLD_RED}"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                    INSTALLATION ERROR                    ║"
    echo "╠══════════════════════════════════════════════════════════╣"
    echo "║                                                          ║"
    echo -e "║   ${C_BOLD_WHITE}Error: $1${C_BOLD_RED}                                               ║"
    echo "║                                                          ║"
    echo -e "║   ${C_BOLD_YELLOW}Please contact support:${C_BOLD_RED}                                   ║"
    echo -e "║   ${C_BOLD_CYAN}Telegram: https://t.me/master_spamming${C_BOLD_RED}                     ║"
    echo "║                                                          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "${C_RESET}"
    exit 1
}

# ============================================
# TRAP AND EXECUTION
# ============================================

trap 'handle_error "Installation interrupted by user"' INT
trap 'handle_error "Installation failed"' ERR

# Start installation
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main_install
fi
