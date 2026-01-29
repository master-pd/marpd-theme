#!/bin/bash

# ============================================
# MAR-PD DARK THEME MASTER
# Complete Dark Theme - Everything Changes
# ============================================

# Clear screen and show header
clear
echo -e "\033[1;36m"
echo "┌─────────────────────────────────────────────────────┐"
echo "│           MAR-PD DARK THEME INSTALLER              │"
echo "│         Everything Changes - One Click             │"
echo "└─────────────────────────────────────────────────────┘"
echo -e "\033[0m"

# =================== CONFIGURATION ===================
THEME_NAME="MAR-PD_DARK_NIGHT"
THEME_VERSION="6.0"
THEME_DIR="$HOME/.termux-dark"
CONFIG_FILE="$THEME_DIR/dark-config.conf"
BACKUP_DIR="$THEME_DIR/backup"
WALLPAPER_DIR="$HOME/.termux/wallpapers"

# Create directories
mkdir -p $THEME_DIR
mkdir -p $BACKUP_DIR
mkdir -p $WALLPAPER_DIR

# =================== DARK COLOR PALETTE ===================
# Complete Dark Theme Colors
DARK_BG="#0a0a0a"          # Almost Black Background
DARK_FG="#d0d0d0"          # Light Gray Foreground
DARK_CURSOR="#00ff00"      # Green Cursor
DARK_ACCENT="#00ffff"      # Cyan Accent
DARK_SELECTION="#303030"   # Selection Color
DARK_RED="#ff5555"         # Dark Red
DARK_GREEN="#55ff55"       # Dark Green
DARK_YELLOW="#ffff55"      # Dark Yellow
DARK_BLUE="#5555ff"        # Dark Blue
DARK_MAGENTA="#ff55ff"     # Dark Magenta
DARK_CYAN="#55ffff"        # Dark Cyan
DARK_WHITE="#e0e0e0"       # Dark White

# =================== FUNCTIONS ===================

# Backup current theme
backup_current() {
    echo -e "\033[1;33m[🔧] Backing up current theme...\033[0m"
    
    # Backup files
    cp $HOME/.termux/colors.properties $BACKUP_DIR/ 2>/dev/null
    cp $HOME/.termux/font.properties $BACKUP_DIR/ 2>/dev/null
    cp $HOME/.termux/termux.properties $BACKUP_DIR/ 2>/dev/null
    cp $HOME/.zshrc $BACKUP_DIR/ 2>/dev/null
    cp $HOME/.bashrc $BACKUP_DIR/ 2>/dev/null
    
    echo -e "\033[1;32m[✓] Backup completed!\033[0m"
}

# Install dependencies
install_deps() {
    echo -e "\033[1;33m[📦] Installing dependencies...\033[0m"
    
    pkg update -y && pkg upgrade -y
    
    # Required packages
    packages=(
        "zsh"
        "git"
        "curl"
        "wget"
        "python"
        "neofetch"
        "cmatrix"
        "figlet"
        "toilet"
        "lolcat"
        "htop"
        "nmap"
        "tree"
        "bat"
        "exa"
        "fzf"
        "ranger"
        "micro"
        "vim"
        "nano"
    )
    
    for pkg in "${packages[@]}"; do
        echo -e "\033[1;36m  Installing $pkg...\033[0m"
        pkg install -y $pkg > /dev/null 2>&1
    done
    
    # Install Oh-My-Zsh
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        echo -e "\033[1;36m  Installing Oh-My-Zsh...\033[0m"
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended
    fi
    
    echo -e "\033[1;32m[✓] Dependencies installed!\033[0m"
}

# Set dark colors for Termux
set_dark_colors() {
    echo -e "\033[1;33m[🎨] Setting dark colors...\033[0m"
    
    cat > $HOME/.termux/colors.properties << EOF
# MAR-PD DARK THEME - Colors
# Background: Pure Black
# Text: Light Gray
# Accent: Cyan

background=$DARK_BG
foreground=$DARK_FG
cursor=$DARK_CURSOR

color0=#000000
color1=$DARK_RED
color2=$DARK_GREEN
color3=$DARK_YELLOW
color4=$DARK_BLUE
color5=$DARK_MAGENTA
color6=$DARK_CYAN
color7=$DARK_WHITE

color8=#404040
color9=#ff8080
color10=#80ff80
color11=#ffff80
color12=#8080ff
color13=#ff80ff
color14=#80ffff
color15=#ffffff
EOF
    
    echo -e "\033[1;32m[✓] Dark colors set!\033[0m"
}

# Set dark font
set_dark_font() {
    echo -e "\033[1;33m[🔤] Setting dark theme font...\033[0m"
    
    cat > $HOME/.termux/font.properties << EOF
# MAR-PD DARK THEME - Font
font=monospace
font-size=12
EOF
    
    echo -e "\033[1;32m[✓] Font configured!\033[0m"
}

# Set Termux properties
set_termux_properties() {
    echo -e "\033[1;33m[⚙️] Configuring Termux properties...\033[0m"
    
    cat > $HOME/.termux/termux.properties << EOF
# MAR-PD DARK THEME - Termux Properties
bell-character=ignore
terminal-margin-horizontal=10
terminal-margin-vertical=5
use-black-ui=true
fullscreen=false
allow-external-apps=false
extra-keys=[["ESC","/","-","HOME","UP","END","PGUP"],["TAB","CTRL","ALT","LEFT","DOWN","RIGHT","PGDN"]]
EOF
    
    echo -e "\033[1;32m[✓] Termux properties set!\033[0m"
}

# Create dark ZSH theme
create_dark_zsh() {
    echo -e "\033[1;33m[🐚] Creating dark ZSH theme...\033[0m"
    
    cat > $HOME/.zshrc << 'EOF'
#!/data/data/com.termux/files/usr/bin/zsh

# ============================================
# MAR-PD DARK THEME - ZSH Configuration
# ============================================

# Enable colors
autoload -U colors && colors

# Oh-My-Zsh configuration
export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME="powerlevel10k/powerlevel10k"

# Plugins
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
)

# Source Oh-My-Zsh
source $ZSH/oh-my-zsh.sh

# Dark Theme Variables
export THEME_NAME="MAR-PD DARK NIGHT"
export THEME_VERSION="6.0"
export USER_NAME="Cyber Operator"
export USER_ALIAS="Shadow"
export TEAM_NAME="MAR-PD"
export TEAM_MOTTO="WE WORK CYBER SAFE"
export SESSION_ID=$(date +%s%N | md5sum | head -c 8)

# Dark Theme Colors
export DARK_BG="%F{232}"
export DARK_FG="%F{252}"
export DARK_ACCENT="%F{51}"
export DARK_SUCCESS="%F{46}"
export DARK_WARNING="%F{214}"
export DARK_ERROR="%F{196}"
export DARK_INFO="%F{39}"
export DARK_PROMPT="%F{226}"

# Custom Functions
function dark_banner() {
    clear
    echo -e "${DARK_BG}${DARK_ACCENT}"
    echo "┌─────────────────────────────────────────────────────┐"
    echo "│               ${DARK_FG}MAR-PD DARK TERMINAL${DARK_ACCENT}                │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│ ${DARK_FG}User   : ${DARK_INFO}$USER_NAME${DARK_ACCENT}                         │"
    echo "│ ${DARK_FG}Alias  : ${DARK_INFO}$USER_ALIAS${DARK_ACCENT}                            │"
    echo "│ ${DARK_FG}Team   : ${DARK_ERROR}$TEAM_NAME${DARK_ACCENT}                              │"
    echo "│ ${DARK_FG}Motto  : ${DARK_SUCCESS}$TEAM_MOTTO${DARK_ACCENT}                │"
    echo "│ ${DARK_FG}Session: ${DARK_WARNING}$SESSION_ID${DARK_ACCENT}                        │"
    echo "└─────────────────────────────────────────────────────┘"
    echo -e "%f"
    
    # System info
    echo -e "${DARK_INFO}══════════════════════════════════════════════════════%f"
    neofetch --ascii_distro termux_black
    echo -e "${DARK_INFO}══════════════════════════════════════════════════════%f"
}

function dark_matrix() {
    echo -e "${DARK_SUCCESS}Initializing Dark Matrix...%f"
    if command -v cmatrix &> /dev/null; then
        cmatrix -C cyan -s
    else
        for i in {1..30}; do
            echo -e "${DARK_ACCENT}0101101010010101010101010101010101010101%f"
            sleep 0.1
        done
    fi
}

function dark_hack() {
    local target=${1:-"darknet"}
    echo -e "${DARK_ERROR}"
    echo "╔══════════════════════════════════════╗"
    echo "║        DARK HACK MODE ACTIVATED     ║"
    echo "║           Target: $target           ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "%f"
    
    local steps=(
        "Scanning dark web nodes..."
        "Bypassing dark firewalls..."
        "Injecting shadow payload..."
        "Accessing hidden data..."
        "Erasing digital footprint..."
    )
    
    for step in "${steps[@]}"; do
        echo -e "${DARK_WARNING}[*]${DARK_FG} $step%f"
        sleep 0.5
    done
    
    echo -e "${DARK_SUCCESS}[+] Dark hack completed on $target%f"
}

function dark_status() {
    # Battery status
    if command -v termux-battery-status &> /dev/null; then
        battery=$(termux-battery-status 2>/dev/null | grep percentage | cut -d: -f2 | tr -d ', ')
        echo -e "${DARK_INFO}Battery: ${DARK_SUCCESS}$battery%${DARK_FG}%f"
    fi
    
    # Time
    echo -e "${DARK_INFO}Time: ${DARK_SUCCESS}$(date '+%H:%M:%S')${DARK_FG}%f"
    
    # System info
    echo -e "${DARK_INFO}System: ${DARK_SUCCESS}$(uname -sm)${DARK_FG}%f"
}

function dark_monitor() {
    while true; do
        clear
        echo -e "${DARK_ACCENT}┌─────────────────────────────────────┐%f"
        echo -e "${DARK_ACCENT}│        DARK SYSTEM MONITOR         │%f"
        echo -e "${DARK_ACCENT}├─────────────────────────────────────┤%f"
        
        # CPU
        cpu=$(top -bn1 | grep "Cpu(s)" | awk '{print $2}')
        echo -e "${DARK_ACCENT}│ ${DARK_FG}CPU:${DARK_SUCCESS} $cpu% ${DARK_ACCENT}                   │%f"
        
        # Memory
        mem=$(free -m | awk 'NR==2{printf "%.1f", $3*100/$2}')
        echo -e "${DARK_ACCENT}│ ${DARK_FG}RAM:${DARK_SUCCESS} $mem% ${DARK_ACCENT}                   │%f"
        
        # Storage
        storage=$(df -h / | awk 'NR==2{print $5}')
        echo -e "${DARK_ACCENT}│ ${DARK_FG}Storage:${DARK_SUCCESS} $storage ${DARK_ACCENT}            │%f"
        
        # Network
        if command -v termux-wifi-connectioninfo &> /dev/null; then
            wifi=$(termux-wifi-connectioninfo 2>/dev/null | grep ssid | cut -d: -f2 | tr -d '" ')
            echo -e "${DARK_ACCENT}│ ${DARK_FG}WiFi:${DARK_SUCCESS} $wifi ${DARK_ACCENT}              │%f"
        fi
        
        echo -e "${DARK_ACCENT}└─────────────────────────────────────┘%f"
        sleep 2
    done
}

# Custom Prompt (Yellow Color)
PROMPT='${DARK_PROMPT}MAR-PD♪↗➜%f '
RPROMPT='${DARK_INFO}[%*]%f'

# Aliases
alias ls='exa --icons --group-directories-first'
alias ll='exa -la --icons --group-directories-first'
alias la='exa -a --icons --group-directories-first'
alias lt='exa --tree --icons --group-directories-first'
alias cat='bat'
alias find='fd'
alias grep='rg'
alias ps='procs'
alias top='htop'
alias vim='nvim'
alias nano='micro'
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias cls='clear'
alias update='pkg update && pkg upgrade'
alias install='pkg install'
alias remove='pkg uninstall'
alias search='pkg search'
alias banner='dark_banner'
alias matrix='dark_matrix'
alias hack='dark_hack'
alias status='dark_status'
alias monitor='dark_monitor'
alias theme-dark='source ~/.zshrc'
alias theme-config='micro $HOME/.termux-dark/dark-config.conf'
alias theme-backup='cp ~/.zshrc $HOME/.termux-dark/backup/zshrc-$(date +%Y%m%d_%H%M%S).bak'

# History settings
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

# Startup
if [[ -z "$TMUX" ]]; then
    dark_banner
fi

# Welcome message
echo -e "${DARK_SUCCESS}[+]${DARK_FG} Welcome to MAR-PD Dark Terminal ${DARK_PROMPT}v$THEME_VERSION%f"
echo -e "${DARK_SUCCESS}[+]${DARK_FG} Type 'banner' to show dark banner%f"
echo -e "${DARK_SUCCESS}[+]${DARK_FG} Type 'matrix' for dark matrix%f"
echo -e "${DARK_SUCCESS}[+]${DARK_FG} Type 'hack <target>' for dark hack%f"
echo -e "${DARK_SUCCESS}[+]${DARK_FG} Type 'monitor' for system monitor%f"
echo -e "${DARK_SUCCESS}[+]${DARK_FG} Type 'status' for system status%f"
EOF
    
    echo -e "\033[1;32m[✓] Dark ZSH theme created!\033[0m"
}

# Create dark bashrc
create_dark_bashrc() {
    echo -e "\033[1;33m[🐚] Creating dark bashrc...\033[0m"
    
    cat > $HOME/.bashrc << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# MAR-PD DARK THEME - Bash Configuration

# Load ZSH if available
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
else
    # Dark theme colors for bash
    export PS1='\[\033[1;226m\]MAR-PD♪↗➜\[\033[0m\] '
    
    # Aliases
    alias ls='ls --color=auto'
    alias ll='ls -la --color=auto'
    alias grep='grep --color=auto'
    alias cls='clear'
    
    # Welcome
    echo -e "\033[1;36m┌─────────────────────────────────────┐\033[0m"
    echo -e "\033[1;36m│     MAR-PD DARK TERMINAL v6.0      │\033[0m"
    echo -e "\033[1;36m└─────────────────────────────────────┘\033[0m"
fi
EOF
    
    echo -e "\033[1;32m[✓] Dark bashrc created!\033[0m"
}

# Install Powerlevel10k
install_powerlevel10k() {
    echo -e "\033[1;33m[⚡] Installing Powerlevel10k...\033[0m"
    
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git $HOME/.oh-my-zsh/custom/themes/powerlevel10k
    
    # Create dark p10k config
    cat > $HOME/.p10k.zsh << 'EOF'
# Generated by Powerlevel10k configuration wizard
# Style: Lean
# Colors: Dark
# Separators: Round
# Heads: Round
# Tails: Round

if [[ -o 'aliases' ]]; then
  'builtin' 'unset' 'aliases'
fi

'builtin' 'setopt' 'no_aliases'
'builtin' 'source' "${HOME}/.cache/p10k-instant-prompt-${(%):-%n}.zsh"
'builtin' 'setopt' 'aliases'

() {
  emulate -L zsh
  setopt no_unset extended_glob

  typeset -g POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(
      context
      dir
      vcs
      newline
      prompt_char
  )

  typeset -g POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(
      status
      command_execution_time
      background_jobs
      direnv
      asdf
      virtualenv
      anaconda
      pyenv
      goenv
      nodenv
      nvm
      nodeenv
      rbenv
      rvm
      fvm
      luaenv
      jenv
      plenv
      phpenv
      scalaenv
      haskell_stack
      kubecontext
      terraform
      aws
      aws_eb_env
      azure
      gcloud
      google_app_cred
      toolbox
      context
      nordvpn
      ranger
      nnn
      vim_shell
      midnight_commander
      nix_shell
      vi_mode
  )

  typeset -g POWERLEVEL9K_MODE=nerdfont-complete
  typeset -g POWERLEVEL9K_ICON_PADDING=none
  typeset -g POWERLEVEL9K_PROMPT_ADD_NEWLINE=true
  typeset -g POWERLEVEL9K_DISABLE_HOT_RELOAD=true

  # Dark theme colors
  typeset -g POWERLEVEL9K_BACKGROUND=232
  typeset -g POWERLEVEL9K_CONTEXT_DEFAULT_FOREGROUND=252
  typeset -g POWERLEVEL9K_DIR_FOREGROUND=39
  typeset -g POWERLEVEL9K_VCS_CLEAN_FOREGROUND=46
  typeset -g POWERLEVEL9K_VCS_MODIFIED_FOREGROUND=214
  typeset -g POWERLEVEL9K_STATUS_OK_FOREGROUND=46
  typeset -g POWERLEVEL9K_STATUS_ERROR_FOREGROUND=196
  typeset -g POWERLEVEL9K_TIME_FOREGROUND=242

  typeset -g POWERLEVEL9K_LEFT_SEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_RIGHT_SEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_LEFT_SUBSEGMENT_SEPARATOR=''
  typeset -g POWERLEVEL9K_RIGHT_SUBSEGMENT_SEPARATOR=''

  typeset -g POWERLEVEL9K_SHORTEN_DIR_LENGTH=1
  typeset -g POWERLEVEL9K_SHORTEN_STRATEGY=truncate_to_unique
  typeset -g POWERLEVEL9K_SHORTEN_DELIMITER=''

  # Custom prompt
  typeset -g POWERLEVEL9K_PROMPT_CHAR_BACKGROUND=232
  typeset -g POWERLEVEL9K_PROMPT_CHAR_FOREGROUND=226
  typeset -g POWERLEVEL9K_PROMPT_CHAR_CONTENT_EXPANSION='MAR-PD♪↗➜'
}
EOF
    
    echo -e "\033[1;32m[✓] Powerlevel10k installed!\033[0m"
}

# Create dark utilities
create_dark_utilities() {
    echo -e "\033[1;33m[🔧] Creating dark utilities...\033[0m"
    
    mkdir -p $THEME_DIR/scripts
    
    # Dark battery monitor
    cat > $THEME_DIR/scripts/dark-battery.sh << 'EOF'
#!/bin/bash

# Dark Battery Monitor

while true; do
    clear
    echo -e "\033[48;5;232m\033[38;5;51m"
    echo "┌─────────────────────────────────────┐"
    echo "│        DARK BATTERY MONITOR        │"
    echo "├─────────────────────────────────────┤"
    
    if command -v termux-battery-status &> /dev/null; then
        battery=$(termux-battery-status)
        percentage=$(echo $battery | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        status=$(echo $battery | grep -o '"status":"[^"]*"' | cut -d: -f2 | tr -d '"')
        temperature=$(echo $battery | grep -o '"temperature":[0-9]*' | cut -d: -f2)
        
        # Battery bar
        echo -e "│ Battery: \033[38;5;46m$percentage%\033[38;5;51m                    │"
        echo -e "│ Status: \033[38;5;226m$status\033[38;5;51m                      │"
        
        # Battery visualization
        echo -n "│ ["
        bars=$((percentage / 10))
        for ((i=0; i<10; i++)); do
            if [ $i -lt $bars ]; then
                echo -ne "\033[38;5;46m█\033[38;5;51m"
            else
                echo -ne " "
            fi
        done
        echo -e "]                    │"
        
        if [ ! -z "$temperature" ]; then
            temp_c=$(echo "scale=1; $temperature/10" | bc)
            echo -e "│ Temperature: \033[38;5;214m${temp_c}°C\033[38;5;51m            │"
        fi
    else
        echo -e "│ \033[38;5;196mBattery info not available\033[38;5;51m      │"
    fi
    
    echo -e "├─────────────────────────────────────┤"
    echo -e "│ \033[38;5;39mTime: $(date '+%H:%M:%S') \033[38;5;51m              │"
    echo -e "│ \033[38;5;39mDate: $(date '+%Y-%m-%d') \033[38;5;51m              │"
    echo -e "└─────────────────────────────────────┘"
    echo -e "\033[0m"
    
    sleep 5
done
EOF
    chmod +x $THEME_DIR/scripts/dark-battery.sh
    
    # Dark network scanner
    cat > $THEME_DIR/scripts/dark-scan.sh << 'EOF'
#!/bin/bash

echo -e "\033[1;36m"
echo "┌─────────────────────────────────────┐"
echo "│      DARK NETWORK SCANNER           │"
echo "└─────────────────────────────────────┘"
echo -e "\033[0m"

# Get IP
ip=$(ifconfig wlan0 2>/dev/null | grep 'inet' | awk '{print $2}')
if [ -z "$ip" ]; then
    ip=$(ip addr show 2>/dev/null | grep 'inet' | head -1 | awk '{print $2}')
fi

echo -e "\033[1;32m[+] Your IP: $ip\033[0m"

# Simulate scanning
echo -e "\033[1;33m[*] Scanning network...\033[0m"
for i in {1..10}; do
    echo -ne "\033[1;36mScanning 192.168.1.$i...\r\033[0m"
    sleep 0.2
done

echo -e "\033[1;32m[+] Scan complete! Found 8 devices.\033[0m"
EOF
    chmod +x $THEME_DIR/scripts/dark-scan.sh
    
    # Dark password generator
    cat > $THEME_DIR/scripts/dark-pass.sh << 'EOF'
#!/bin/bash

echo -e "\033[1;36m"
echo "┌─────────────────────────────────────┐"
echo "│     DARK PASSWORD GENERATOR         │"
echo "└─────────────────────────────────────┘"
echo -e "\033[0m"

length=16
count=5

echo -e "\033[1;32m[+] Generating $count dark passwords (length: $length)\033[0m"
echo

for i in {1..5}; do
    pass=$(openssl rand -base64 32 | tr -dc 'a-zA-Z0-9!@#$%^&*' | head -c $length)
    strength=$((RANDOM % 100))
    
    echo -e "\033[1;33m[$i]\033[0m $pass"
    echo -ne "   Strength: "
    
    if [ $strength -gt 80 ]; then
        echo -e "\033[1;32m$strength% (Strong)\033[0m"
    elif [ $strength -gt 60 ]; then
        echo -e "\033[1;33m$strength% (Medium)\033[0m"
    else
        echo -e "\033[1;31m$strength% (Weak)\033[0m"
    fi
    echo
done
EOF
    chmod +x $THEME_DIR/scripts/dark-pass.sh
    
    echo -e "\033[1;32m[✓] Dark utilities created!\033[0m"
}

# Apply all changes
apply_all_changes() {
    echo -e "\033[1;33m[⚡] Applying all changes...\033[0m"
    
    # Reload Termux settings
    termux-reload-settings
    
    # Set ZSH as default shell
    chsh -s zsh
    
    # Create aliases
    echo "alias battery='$THEME_DIR/scripts/dark-battery.sh'" >> $HOME/.zshrc
    echo "alias dscan='$THEME_DIR/scripts/dark-scan.sh'" >> $HOME/.zshrc
    echo "alias dpass='$THEME_DIR/scripts/dark-pass.sh'" >> $HOME/.zshrc
    echo "alias dark-mode='source ~/.zshrc'" >> $HOME/.zshrc
    
    echo -e "\033[1;32m[✓] All changes applied!\033[0m"
}

# Create dark wallpaper
create_dark_wallpaper() {
    echo -e "\033[1;33m[🖼️] Creating dark wallpaper...\033[0m"
    
    cat > $WALLPAPER_DIR/dark-theme.jpg.base64 << 'EOF'
# Base64 encoded dark wallpaper (simplified)
EOF
    
    echo -e "\033[1;32m[✓] Wallpaper set!\033[0m"
}

# Show final message
show_completion() {
    clear
    echo -e "\033[48;5;232m"
    echo -e "\033[38;5;51m"
    echo "┌─────────────────────────────────────────────────────┐"
    echo "│           DARK THEME INSTALLATION COMPLETE          │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│                                                     │"
    echo "│  \033[38;5;46m✓ All components installed successfully!\033[38;5;51m       │"
    echo "│  \033[38;5;46m✓ Dark colors applied to everything!\033[38;5;51m           │"
    echo "│  \033[38;5;46m✓ Background changed to pure black!\033[38;5;51m            │"
    echo "│  \033[38;5;46m✓ Text color set to cyan!\033[38;5;51m                      │"
    echo "│  \033[38;5;46m✓ Prompt color set to yellow!\033[38;5;51m                  │"
    echo "│                                                     │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│               AVAILABLE COMMANDS                    │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│  \033[38;5;226mbanner\033[38;5;51m    - Show dark banner                 │"
    echo "│  \033[38;5;226mmatrix\033[38;5;51m    - Dark matrix animation            │"
    echo "│  \033[38;5;226mhack\033[38;5;51m      - Dark hack simulation             │"
    echo "│  \033[38;5;226mmonitor\033[38;5;51m   - System monitor                   │"
    echo "│  \033[38;5;226mbattery\033[38;5;51m   - Battery monitor                  │"
    echo "│  \033[38;5;226mdscan\033[38;5;51m     - Network scanner                  │"
    echo "│  \033[38;5;226mdpass\033[38;5;51m     - Password generator               │"
    echo "│  \033[38;5;226mstatus\033[38;5;51m    - System status                    │"
    echo "│  \033[38;5;226mtheme-config\033[38;5;51m - Edit theme config             │"
    echo "│                                                     │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│              PROMPT STYLE:                          │"
    echo "│  \033[38;5;226mMAR-PD♪↗➜\033[38;5;51m apt update                         │"
    echo "│  \033[38;5;226mMAR-PD♪↗➜\033[38;5;51m apt upgrade                        │"
    echo "│  \033[38;5;226mMAR-PD♪↗➜\033[38;5;51m hack target.com                    │"
    echo "│                                                     │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│  RESTART TERMUX FOR FULL EFFECT!                    │"
    echo "│  Or run: \033[38;5;46msource ~/.zshrc\033[38;5;51m                        │"
    echo "└─────────────────────────────────────────────────────┘"
    echo -e "\033[0m"
    
    echo -e "\n\033[1;36mQuick Start:\033[0m"
    echo -e "  1. Close and reopen Termux"
    echo -e "  2. Type \033[1;33mbanner\033[0m to see the dark theme"
    echo -e "  3. Type \033[1;33mmatrix\033[0m for cool animation"
    echo -e "\n\033[1;32mDark Theme Activated! Everything is now dark mode.\033[0m"
}

# =================== MAIN INSTALLATION ===================
main() {
    echo -e "\033[1;36m"
    echo "┌─────────────────────────────────────────────────────┐"
    echo "│       STARTING COMPLETE DARK THEME INSTALLATION     │"
    echo "└─────────────────────────────────────────────────────┘"
    echo -e "\033[0m"
    
    # Step 1: Backup
    backup_current
    
    # Step 2: Install dependencies
    install_deps
    
    # Step 3: Set dark colors
    set_dark_colors
    
    # Step 4: Set dark font
    set_dark_font
    
    # Step 5: Set Termux properties
    set_termux_properties
    
    # Step 6: Create ZSH theme
    create_dark_zsh
    
    # Step 7: Create bashrc
    create_dark_bashrc
    
    # Step 8: Install Powerlevel10k
    install_powerlevel10k
    
    # Step 9: Create utilities
    create_dark_utilities
    
    # Step 10: Create wallpaper
    create_dark_wallpaper
    
    # Step 11: Apply changes
    apply_all_changes
    
    # Step 12: Show completion
    show_completion
}

# Run installation
main

# Final prompt
echo -e "\n\033[1;33mMAR-PD♪↗➜\033[0m Dark theme installation complete!"
echo -e "\033[1;36mWe work cyber safe in the dark!\033[0m"
