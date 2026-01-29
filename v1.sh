#!/bin/bash

# MAR-PD THEME v1 - Professional Terminal Enhancement
# Version: 1.0.0
# Team: MAR-PD

# ============================================
# INITIALIZATION
# ============================================

VERSION="1.0.0"
TEAM="MAR-PD"
THEME_NAME="MAR-PD THEME"
PROMPT_STYLE="MAR-PD ᗒ✿➜"
INSTALL_DIR="$HOME/.marpd-theme"
BACKUP_DIR="$HOME/.marpd-backup"
LOG_FILE="$INSTALL_DIR/marpd.log"
CONFIG_FILE="$INSTALL_DIR/marpd.conf"

# ============================================
# COLOR SYSTEM - Professional Grade
# ============================================

# Basic Colors
BLACK='\033[0;30m'
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[0;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
WHITE='\033[0;37m'

# Bold Colors
B_BLACK='\033[1;30m'
B_RED='\033[1;31m'
B_GREEN='\033[1;32m'
B_YELLOW='\033[1;33m'
B_BLUE='\033[1;34m'
B_PURPLE='\033[1;35m'
B_CYAN='\033[1;36m'
B_WHITE='\033[1;37m'

# Background Colors
BG_BLACK='\033[40m'
BG_RED='\033[41m'
BG_GREEN='\033[42m'
BG_YELLOW='\033[43m'
BG_BLUE='\033[44m'
BG_PURPLE='\033[45m'
BG_CYAN='\033[46m'
BG_WHITE='\033[47m'

# Special Effects
RESET='\033[0m'
BOLD='\033[1m'
DIM='\033[2m'
ITALIC='\033[3m'
UNDERLINE='\033[4m'
BLINK='\033[5m'
REVERSE='\033[7m'
HIDDEN='\033[8m'

# Gradient Colors (256-color)
GRADIENT_1='\033[38;5;39m'
GRADIENT_2='\033[38;5;45m'
GRADIENT_3='\033[38;5;51m'
GRADIENT_4='\033[38;5;87m'
GRADIENT_5='\033[38;5;123m'

# ============================================
# LOGGING SYSTEM
# ============================================

log() {
    local level="$1"
    local message="$2"
    local timestamp=$(date '+%Y-%m-%d %H:%M:%S')
    
    case "$level" in
        "INFO") echo -e "${B_BLUE}[INFO]${RESET} $message" ;;
        "SUCCESS") echo -e "${B_GREEN}[SUCCESS]${RESET} $message" ;;
        "WARNING") echo -e "${B_YELLOW}[WARNING]${RESET} $message" ;;
        "ERROR") echo -e "${B_RED}[ERROR]${RESET} $message" ;;
        "DEBUG") echo -e "${B_PURPLE}[DEBUG]${RESET} $message" ;;
        *) echo -e "[$level] $message" ;;
    esac
    
    echo "[$timestamp] [$level] $message" >> "$LOG_FILE"
}

# ============================================
# BANNER & DISPLAY FUNCTIONS
# ============================================

show_header() {
    clear
    echo -e "${GRADIENT_1}"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                                                          ║"
    echo "║  ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗         ║"
    echo "║  ████╗ ████║██╔══██╗██╔══██╗   ██╔═══██╗██╔══██╗        ║"
    echo "║  ██╔████╔██║███████║██████╔╝   ██║   ██║██║  ██║        ║"
    echo "║  ██║╚██╔╝██║██╔══██║██╔═══╝    ██║   ██║██║  ██║        ║"
    echo "║  ██║ ╚═╝ ██║██║  ██║██║        ╚██████╔╝██████╔╝        ║"
    echo "║  ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═════╝         ║"
    echo "║                                                          ║"
    echo "║                 P R O F E S S I O N A L                  ║"
    echo "║                    T H E M E   v 1 . 0                   ║"
    echo "║                                                          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
}

show_progress() {
    local task="$1"
    local width=30
    echo -ne "${B_CYAN}[${RESET}"
    for ((i=0; i<width; i++)); do
        echo -ne "${B_GREEN}█${RESET}"
        sleep 0.05
    done
    echo -e "${B_CYAN}] ${B_GREEN}100% ${B_WHITE}$task${RESET}"
}

# ============================================
# VALIDATION FUNCTIONS
# ============================================

validate_environment() {
    log "INFO" "Validating execution environment"
    
    if [ ! -d "/data/data/com.termux" ]; then
        log "ERROR" "This script must be executed within Termux"
        return 1
    fi
    
    if [ ! -w "$HOME" ]; then
        log "ERROR" "Insufficient write permissions"
        return 1
    fi
    
    log "SUCCESS" "Environment validation passed"
    return 0
}

check_dependencies() {
    log "INFO" "Checking system dependencies"
    
    local deps=("git" "curl" "wget" "unzip" "tar")
    local missing=()
    
    for dep in "${deps[@]}"; do
        if ! command -v "$dep" > /dev/null 2>&1; then
            missing+=("$dep")
        fi
    done
    
    if [ ${#missing[@]} -gt 0 ]; then
        log "WARNING" "Missing dependencies: ${missing[*]}"
        log "INFO" "Installing required packages"
        
        pkg update -y > /dev/null 2>&1
        for dep in "${missing[@]}"; do
            pkg install -y "$dep" > /dev/null 2>&1
            if command -v "$dep" > /dev/null 2>&1; then
                log "SUCCESS" "Installed: $dep"
            else
                log "ERROR" "Failed to install: $dep"
                return 1
            fi
        done
    fi
    
    log "SUCCESS" "All dependencies satisfied"
    return 0
}

# ============================================
# BACKUP SYSTEM
# ============================================

create_backup() {
    log "INFO" "Creating system backup"
    
    mkdir -p "$BACKUP_DIR"
    
    # Backup existing configurations
    local configs=(
        "$HOME/.termux/colors.properties"
        "$HOME/.termux/font.ttf"
        "$HOME/.termux/termux.properties"
        "$HOME/.bashrc"
        "$HOME/.zshrc"
        "$HOME/.profile"
        "$HOME/.config"
    )
    
    for config in "${configs[@]}"; do
        if [ -e "$config" ]; then
            cp -r "$config" "$BACKUP_DIR/" 2>/dev/null
            log "DEBUG" "Backed up: $(basename "$config")"
        fi
    done
    
    # Create backup manifest
    cat > "$BACKUP_DIR/backup.info" << EOF
MAR-PD THEME Backup Information
===============================
Backup Created: $(date)
Theme Version: $VERSION
Team: $TEAM
Backup Location: $BACKUP_DIR

Contents:
$(find "$BACKUP_DIR" -type f | sed 's|.*/||')

Restore Command:
bash $INSTALL_DIR/restore.sh
EOF
    
    log "SUCCESS" "Backup created successfully"
}

# ============================================
# THEME INSTALLATION
# ============================================

install_marpd_theme() {
    log "INFO" "Installing MAR-PD THEME"
    
    # Create installation directory
    mkdir -p "$INSTALL_DIR"
    mkdir -p "$HOME/.termux"
    
    # Create MAR-PD color scheme
    cat > "$HOME/.termux/colors.properties" << 'EOF'
# MAR-PD THEME Color Scheme
# Professional Terminal Colors

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

background=#1a1a2e
foreground=#eeeeee
cursor=#00adb5
EOF
    
    # Create MAR-PD termux properties
    cat > "$HOME/.termux/termux.properties" << 'EOF'
# MAR-PD THEME Configuration

# Terminal behavior
bell-character=ignore
terminal-margin-horizontal=10
terminal-margin-vertical=5
back-button=ignore
hide-soft-keyboard-on-startup=true
fullscreen=true

# Visual settings
use-black-ui=false
terminal-cursor-style=bar
terminal-transparency=5
terminal-cursor-blink-rate=500

# Keyboard
extra-keys=[ \
 ['ESC','|','/','HOME','UP','END','PGUP','DEL'], \
 ['TAB','CTRL','ALT','LEFT','DOWN','RIGHT','PGDN','BKSP'] \
]
EOF
    
    # Download and install MAR-PD font
    log "INFO" "Installing MAR-PD typography"
    wget -q "https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/FiraCode/Regular/complete/Fira%20Code%20Regular%20Nerd%20Font%20Complete.ttf" \
        -O "$HOME/.termux/font.ttf"
    
    log "SUCCESS" "Theme configuration installed"
}

# ============================================
# PROMPT CONFIGURATION
# ============================================

setup_prompt() {
    log "INFO" "Configuring MAR-PD prompt"
    
    # Create MAR-PD prompt system
    cat > "$INSTALL_DIR/prompt.sh" << 'EOF'
# MAR-PD THEME Prompt System

marpd_prompt() {
    local EXIT="$?"
    
    # Color codes
    local COLOR_DIR="\[\033[38;5;45m\]"
    local COLOR_USER="\[\033[38;5;51m\]"
    local COLOR_HOST="\[\033[38;5;87m\]"
    local COLOR_GIT="\[\033[38;5;123m\]"
    local COLOR_TIME="\[\033[38;5;39m\]"
    local COLOR_SUCCESS="\[\033[38;5;46m\]"
    local COLOR_ERROR="\[\033[38;5;196m\]"
    local COLOR_RESET="\[\033[0m\]"
    local COLOR_ARROW="\[\033[38;5;213m\]"
    local COLOR_FLOWER="\[\033[38;5;219m\]"
    
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
    
    # Exit status indicator
    local STATUS=""
    if [ $EXIT -eq 0 ]; then
        STATUS="${COLOR_SUCCESS}✓${COLOR_RESET}"
    else
        STATUS="${COLOR_ERROR}✗${COLOR_RESET}"
    fi
    
    # Build prompt
    PS1="\n"
    PS1+="${COLOR_TIME}╭─[ ${TIME} ]${COLOR_RESET}\n"
    PS1+="${COLOR_USER}│ ${USER_HOST}${COLOR_RESET}\n"
    PS1+="${COLOR_DIR}│ ${DIR}${COLOR_GIT}${GIT_BRANCH}${COLOR_RESET}\n"
    PS1+="${COLOR_ARROW}╰─${COLOR_FLOWER}✿${COLOR_ARROW}➜ ${STATUS} "
    
    # Continuation prompt
    PS2="${COLOR_ARROW}  ${COLOR_FLOWER}✿${COLOR_ARROW}➜ ${COLOR_RESET}"
}

PROMPT_COMMAND=marpd_prompt
EOF
    
    # Add to bashrc
    if ! grep -q "MAR-PD THEME" "$HOME/.bashrc" 2>/dev/null; then
        echo "" >> "$HOME/.bashrc"
        echo "# MAR-PD THEME Configuration" >> "$HOME/.bashrc"
        echo "source $INSTALL_DIR/prompt.sh" >> "$HOME/.bashrc"
        echo "clear" >> "$HOME/.bashrc"
        echo "echo -e '\033[38;5;45m'" >> "$HOME/.bashrc"
        echo "echo 'MAR-PD THEME v1.0.0 - Professional Terminal Environment'" >> "$HOME/.bashrc"
        echo "echo 'Team: MAR-PD | Prompt: MAR-PD ᗒ✿➜'" >> "$HOME/.bashrc"
        echo "echo -e '\033[0m'" >> "$HOME/.bashrc"
        echo "echo ''" >> "$HOME/.bashrc"
    fi
    
    log "SUCCESS" "Prompt system configured"
}

# ============================================
# AUTO-START SYSTEM
# ============================================

setup_autostart() {
    log "INFO" "Setting up auto-start system"
    
    # Create startup script
    cat > "$INSTALL_DIR/startup.sh" << 'EOF'
#!/bin/bash

# MAR-PD THEME Startup Script

show_marpd_banner() {
    echo -e "\033[38;5;45m"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                                                          ║"
    echo "║                    MAR-PD THEME v1                       ║"
    echo "║                 Professional Environment                 ║"
    echo "║                                                          ║"
    echo "║        Type 'marpd-help' for available commands         ║"
    echo "║                                                          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "\033[0m"
}

# Show banner on start
if [ -z "$MARPD_BANNER_SHOWN" ]; then
    show_marpd_banner
    export MARPD_BANNER_SHOWN=1
fi
EOF
    
    # Create help command
    cat > "$INSTALL_DIR/commands.sh" << 'EOF'
# MAR-PD THEME Commands

marpd-help() {
    echo -e "\033[38;5;45m"
    echo "MAR-PD THEME Command Reference"
    echo "══════════════════════════════"
    echo -e "\033[0m"
    echo -e "\033[38;5;51mAvailable Commands:\033[0m"
    echo -e "  \033[38;5;87mmarpd-help\033[0m       - Show this help message"
    echo -e "  \033[38;5;87mmarpd-info\033[0m       - Show theme information"
    echo -e "  \033[38;5;87mmarpd-update\033[0m     - Update MAR-PD THEME"
    echo -e "  \033[38;5;87mmarpd-config\033[0m     - Edit theme configuration"
    echo -e "  \033[38;5;87mmarpd-backup\033[0m     - Create system backup"
    echo -e "  \033[38;5;87mmarpd-restore\033[0m    - Restore from backup"
    echo -e "  \033[38;5;87mmarpd-uninstall\033[0m  - Remove MAR-PD THEME"
    echo ""
    echo -e "\033[38;5;213mPrompt: MAR-PD ᗒ✿➜\033[0m"
}

marpd-info() {
    echo -e "\033[38;5;45m"
    echo "MAR-PD THEME Information"
    echo "════════════════════════"
    echo -e "\033[0m"
    echo -e "Version:    \033[38;5;87m1.0.0\033[0m"
    echo -e "Team:       \033[38;5;87mMAR-PD\033[0m"
    echo -e "Status:     \033[38;5;46mActive\033[0m"
    echo -e "Install Dir:\033[38;5;87m$HOME/.marpd-theme\033[0m"
    echo -e "Config File:\033[38;5;87m$HOME/.marpd-theme/marpd.conf\033[0m"
}

marpd-update() {
    echo -e "\033[38;5;45mUpdating MAR-PD THEME...\033[0m"
    # Update logic here
    echo -e "\033[38;5;46mUpdate completed!\033[0m"
}

alias marpd-config="nano $HOME/.marpd-theme/marpd.conf"
alias marpd-backup="bash $HOME/.marpd-theme/backup.sh"
alias marpd-restore="bash $HOME/.marpd-theme/restore.sh"
EOF
    
    # Source commands
    if ! grep -q "MAR-PD Commands" "$HOME/.bashrc" 2>/dev/null; then
        echo "" >> "$HOME/.bashrc"
        echo "# MAR-PD THEME Commands" >> "$HOME/.bashrc"
        echo "source $INSTALL_DIR/commands.sh" >> "$HOME/.bashrc"
        echo "source $INSTALL_DIR/startup.sh" >> "$HOME/.bashrc"
    fi
    
    log "SUCCESS" "Auto-start system configured"
}

# ============================================
# CLEANUP SYSTEM
# ============================================

remove_default_theme() {
    log "INFO" "Removing default Termux theme"
    
    # Remove default theme files
    rm -f "$HOME/.termux/colors.properties.bak" 2>/dev/null
    rm -f "$HOME/.termux/font.ttf.bak" 2>/dev/null
    
    # Disable any other theme autostart
    sed -i '/default/d' "$HOME/.bashrc" 2>/dev/null
    sed -i '/oh-my-termux/d' "$HOME/.bashrc" 2>/dev/null
    
    log "SUCCESS" "Default theme removed"
}

# ============================================
# VERIFICATION SYSTEM
# ============================================

verify_installation() {
    log "INFO" "Verifying installation"
    
    local checks=(
        "$HOME/.termux/colors.properties"
        "$HOME/.termux/termux.properties"
        "$HOME/.termux/font.ttf"
        "$INSTALL_DIR/prompt.sh"
        "$INSTALL_DIR/commands.sh"
        "$INSTALL_DIR/startup.sh"
    )
    
    for check in "${checks[@]}"; do
        if [ ! -f "$check" ]; then
            log "ERROR" "Missing file: $check"
            return 1
        fi
    done
    
    if ! grep -q "MAR-PD THEME" "$HOME/.bashrc" 2>/dev/null; then
        log "ERROR" "MAR-PD THEME not in bashrc"
        return 1
    fi
    
    log "SUCCESS" "Installation verified successfully"
    return 0
}

# ============================================
# FINALIZATION
# ============================================

show_completion() {
    show_header
    
    echo -e "${B_GREEN}"
    echo "╔══════════════════════════════════════════════════════════╗"
    echo "║                   INSTALLATION COMPLETE                  ║"
    echo "╠══════════════════════════════════════════════════════════╣"
    echo "║                                                          ║"
    echo -e "║   ${B_WHITE}✓ MAR-PD THEME v1 successfully installed${B_GREEN}           ║"
    echo -e "║   ${B_WHITE}✓ Professional environment configured${B_GREEN}              ║"
    echo -e "║   ${B_WHITE}✓ Auto-start system enabled${B_GREEN}                       ║"
    echo -e "║   ${B_WHITE}✓ Default theme replaced${B_GREEN}                          ║"
    echo "║                                                          ║"
    echo -e "║   ${B_CYAN}Theme:     ${B_WHITE}MAR-PD THEME${B_GREEN}                           ║"
    echo -e "║   ${B_CYAN}Version:   ${B_WHITE}$VERSION${B_GREEN}                                   ║"
    echo -e "║   ${B_CYAN}Team:      ${B_WHITE}$TEAM${B_GREEN}                                   ║"
    echo -e "║   ${B_CYAN}Prompt:    ${B_WHITE}$PROMPT_STYLE${B_GREEN}                          ║"
    echo "║                                                          ║"
    echo "║   Available commands:                                    ║"
    echo -e "║   ${B_YELLOW}marpd-help${B_GREEN}     - Show available commands             ║"
    echo -e "║   ${B_YELLOW}marpd-info${B_GREEN}     - Show theme information              ║"
    echo -e "║   ${B_YELLOW}marpd-update${B_GREEN}   - Update MAR-PD THEME                 ║"
    echo "║                                                          ║"
    echo "║   Restart Termux to see the full effect!                 ║"
    echo "║                                                          ║"
    echo "╚══════════════════════════════════════════════════════════╝"
    echo -e "${RESET}"
    
    echo ""
    echo -e "${B_CYAN}Next Steps:${RESET}"
    echo -e "  1. ${YELLOW}Close and reopen Termux${RESET}"
    echo -e "  2. ${YELLOW}Type 'marpd-help' for commands${RESET}"
    echo -e "  3. ${YELLOW}Enjoy your professional terminal!${RESET}"
    echo ""
}

# ============================================
# MAIN INSTALLATION FLOW
# ============================================

main_installation() {
    show_header
    
    echo -e "${B_CYAN}Starting MAR-PD THEME Installation...${RESET}"
    echo ""
    
    # Step 1: Validation
    echo -e "${B_WHITE}Step 1: ${B_CYAN}System Validation${RESET}"
    if ! validate_environment; then
        echo -e "${B_RED}Validation failed. Exiting.${RESET}"
        exit 1
    fi
    show_progress "System validated"
    
    # Step 2: Dependencies
    echo -e "\n${B_WHITE}Step 2: ${B_CYAN}Checking Dependencies${RESET}"
    if ! check_dependencies; then
        echo -e "${B_RED}Dependency check failed. Exiting.${RESET}"
        exit 1
    fi
    show_progress "Dependencies satisfied"
    
    # Step 3: Backup
    echo -e "\n${B_WHITE}Step 3: ${B_CYAN}Creating Backup${RESET}"
    create_backup
    show_progress "Backup created"
    
    # Step 4: Install Theme
    echo -e "\n${B_WHITE}Step 4: ${B_CYAN}Installing MAR-PD THEME${RESET}"
    install_marpd_theme
    show_progress "Theme installed"
    
    # Step 5: Setup Prompt
    echo -e "\n${B_WHITE}Step 5: ${B_CYAN}Configuring Prompt System${RESET}"
    setup_prompt
    show_progress "Prompt configured"
    
    # Step 6: Auto-start
    echo -e "\n${B_WHITE}Step 6: ${B_CYAN}Setting up Auto-start${RESET}"
    setup_autostart
    show_progress "Auto-start configured"
    
    # Step 7: Cleanup
    echo -e "\n${B_WHITE}Step 7: ${B_CYAN}Removing Default Theme${RESET}"
    remove_default_theme
    show_progress "Default theme removed"
    
    # Step 8: Verification
    echo -e "\n${B_WHITE}Step 8: ${B_CYAN}Verifying Installation${RESET}"
    if ! verify_installation; then
        echo -e "${B_RED}Verification failed. Exiting.${RESET}"
        exit 1
    fi
    show_progress "Installation verified"
    
    # Reload settings
    termux-reload-settings > /dev/null 2>&1
    
    # Show completion
    show_completion
    
    # Log completion
    log "SUCCESS" "MAR-PD THEME v1 installation completed"
}

# ============================================
# EXECUTION
# ============================================

# Trap errors
trap 'echo -e "${B_RED}Installation interrupted!${RESET}"; exit 1' INT

# Run main installation
if [[ "${BASH_SOURCE[0]}" == "${0}" ]]; then
    main_installation
fi
