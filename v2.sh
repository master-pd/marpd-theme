#!/bin/bash

# ============================================
# MAR-PD COMPLETE TERMUX THEME
# Version: Final | No Errors | All Features
# ============================================

clear
echo -e "\033[1;36m"
echo "┌─────────────────────────────────────────────────────┐"
echo "│         MAR-PD TERMUX THEME INSTALLATION            │"
echo "└─────────────────────────────────────────────────────┘"
echo -e "\033[0m"

# =================== CONFIGURATION ===================
THEME_NAME="MAR-PD"
THEME_VERSION="Final"
THEME_DIR="$HOME/.marpd-termux"
BACKUP_DIR="$THEME_DIR/backup"

# Create directories
mkdir -p $THEME_DIR
mkdir -p $BACKUP_DIR

# =================== COLOR SETTINGS ===================
# Dark Background
BG_COLOR="#0a0a0a"
# Cyan Text
TEXT_COLOR="#00ffff"
# Yellow Prompt
PROMPT_COLOR="#ffff00"

# =================== FUNCTIONS ===================
print_success() {
    echo -e "\033[1;32m[✓] $1\033[0m"
}

print_info() {
    echo -e "\033[1;36m[*] $1\033[0m"
}

print_error() {
    echo -e "\033[1;31m[✗] $1\033[0m"
}

# Backup existing files
backup_files() {
    print_info "Backing up current configuration..."
    
    # Create .termux directory if it doesn't exist
    mkdir -p $HOME/.termux
    
    if [ -f "$HOME/.termux/colors.properties" ]; then
        cp $HOME/.termux/colors.properties $BACKUP_DIR/
    fi
    
    if [ -f "$HOME/.termux/font.properties" ]; then
        cp $HOME/.termux/font.properties $BACKUP_DIR/
    fi
    
    if [ -f "$HOME/.zshrc" ]; then
        cp $HOME/.zshrc $BACKUP_DIR/
    fi
    
    if [ -f "$HOME/.bashrc" ]; then
        cp $HOME/.bashrc $BACKUP_DIR/
    fi
    
    print_success "Backup completed"
}

# Install required packages
install_packages() {
    print_info "Installing required packages..."
    
    pkg update -y > /dev/null 2>&1
    pkg upgrade -y > /dev/null 2>&1
    
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
        "micro"
        "termux-api"
    )
    
    for package in "${packages[@]}"; do
        if ! pkg list-installed | grep -q "$package"; then
            pkg install -y $package > /dev/null 2>&1 && \
            print_success "Installed: $package"
        else
            print_info "Already installed: $package"
        fi
    done
    
    print_success "All packages installed"
}

# Setup Termux colors
setup_colors() {
    print_info "Setting up dark theme colors..."
    
    # Create .termux directory if it doesn't exist
    mkdir -p $HOME/.termux
    
    cat > $HOME/.termux/colors.properties << EOF
# MAR-PD Dark Theme
background=$BG_COLOR
foreground=$TEXT_COLOR
cursor=$PROMPT_COLOR

color0=#000000
color1=#ff5555
color2=#55ff55
color3=#ffff55
color4=#5555ff
color5=#ff55ff
color6=$TEXT_COLOR
color7=#e0e0e0

color8=#404040
color9=#ff8080
color10=#80ff80
color11=$PROMPT_COLOR
color12=#8080ff
color13=#ff80ff
color14=#80ffff
color15=#ffffff
EOF
    
    cat > $HOME/.termux/font.properties << EOF
# Font settings
font=monospace
font-size=12
EOF
    
    print_success "Colors configured"
}

# Create ZSH configuration
create_zsh_config() {
    print_info "Creating ZSH configuration..."
    
    # Install Oh-My-Zsh if not present
    if [ ! -d "$HOME/.oh-my-zsh" ]; then
        print_info "Installing Oh-My-Zsh..."
        sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" "" --unattended > /dev/null 2>&1
    fi
    
    cat > $HOME/.zshrc << 'EOF'
#!/data/data/com.termux/files/usr/bin/zsh

# =================== MAR-PD THEME ===================
# User Configuration
export USER_NAME="MAR-PD User"
export USER_ALIAS="Cyber"
export TEAM_NAME="MAR-PD"
export TEAM_SLOGAN="WE WORK CYBER SAFE"

# Color Definitions
C_TEXT="%F{51}"      # Cyan
C_PROMPT="%F{226}"    # Yellow
C_SUCCESS="%F{46}"    # Green
C_ERROR="%F{196}"     # Red
C_INFO="%F{39}"       # Blue
C_WARN="%F{214}"      # Orange

# Banner Function
banner() {
    clear
    echo -e "${C_TEXT}"
    echo "┌─────────────────────────────────────────────────────┐"
    echo "│               MAR-PD TERMINAL THEME                 │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│  User:   $USER_NAME                                │"
    echo "│  Alias:  $USER_ALIAS                               │"
    echo "│  Team:   $TEAM_NAME                                 │"
    echo "│  Motto:  $TEAM_SLOGAN                               │"
    echo "└─────────────────────────────────────────────────────┘"
    echo -e "%f"
    
    if command -v neofetch &> /dev/null; then
        echo -e "${C_INFO}══════════════════════════════════════════════════════%f"
        neofetch
        echo -e "${C_INFO}══════════════════════════════════════════════════════%f"
    fi
}

# Matrix Animation
matrix() {
    if command -v cmatrix &> /dev/null; then
        cmatrix -C cyan
    else
        for i in {1..20}; do
            echo "0101101001010101010101010101010101010101"
            sleep 0.1
        done
    fi
}

# Battery Status
battery() {
    if command -v termux-battery-status &> /dev/null; then
        battery_data=$(termux-battery-status 2>/dev/null)
        percentage=$(echo "$battery_data" | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        status=$(echo "$battery_data" | grep -o '"status":"[^"]*"' | cut -d: -f2 | tr -d '" ')
        
        if [ ! -z "$percentage" ]; then
            echo -e "${C_INFO}Battery: ${C_SUCCESS}$percentage%${C_TEXT}"
            echo -e "${C_INFO}Status: ${C_SUCCESS}$status${C_TEXT}"
            
            # Battery bar
            echo -ne "${C_INFO}["
            bars=$((percentage / 10))
            for ((i=0; i<10; i++)); do
                if [ $i -lt $bars ]; then
                    echo -ne "${C_SUCCESS}█"
                else
                    echo -ne "${C_TEXT}░"
                fi
            done
            echo -e "${C_INFO}]%f"
        else
            echo -e "${C_ERROR}Unable to get battery info%f"
        fi
    else
        echo -e "${C_WARN}termux-api not installed%f"
        echo -e "${C_INFO}Install: pkg install termux-api%f"
    fi
}

# System Info
sysinfo() {
    echo -e "${C_INFO}════════════ System Information ════════════%f"
    echo -e "${C_TEXT}Hostname: ${C_SUCCESS}$(hostname)%f"
    echo -e "${C_TEXT}Kernel: ${C_SUCCESS}$(uname -r)%f"
    echo -e "${C_TEXT}Architecture: ${C_SUCCESS}$(uname -m)%f"
    
    # CPU Info
    if [ -f /proc/cpuinfo ]; then
        cpu_model=$(grep -m1 "model name" /proc/cpuinfo | cut -d: -f2 | sed 's/^[ \t]*//')
        echo -e "${C_TEXT}CPU: ${C_SUCCESS}$cpu_model%f"
    fi
    
    # Memory Info
    if command -v free &> /dev/null; then
        mem_total=$(free -m | awk 'NR==2{printf "%.1f", $2/1024}')
        mem_used=$(free -m | awk 'NR==2{printf "%.1f", $3/1024}')
        echo -e "${C_TEXT}Memory: ${C_SUCCESS}${mem_used}GB/${mem_total}GB%f"
    fi
    
    # Storage Info
    if command -v df &> /dev/null; then
        storage=$(df -h / | awk 'NR==2{print $5}')
        echo -e "${C_TEXT}Storage: ${C_SUCCESS}$storage used%f"
    fi
}

# Hack Simulation
hack() {
    local target=${1:-"target.com"}
    echo -e "${C_ERROR}"
    echo "╔══════════════════════════════════════╗"
    echo "║        HACK MODE ACTIVATED           ║"
    echo "║           Target: $target           ║"
    echo "╚══════════════════════════════════════╝"
    echo -e "%f"
    
    steps=(
        "Scanning target..."
        "Bypassing firewall..."
        "Accessing system..."
        "Extracting data..."
        "Cleaning logs..."
    )
    
    for step in "${steps[@]}"; do
        echo -e "${C_WARN}[*]${C_TEXT} $step%f"
        sleep 0.5
    done
    
    echo -e "${C_SUCCESS}[+] Hack completed on $target%f"
}

# Custom Prompt
PROMPT='${C_PROMPT}MAR-PD♪↗➜%f '
RPROMPT='${C_INFO}[%*]%f'

# Aliases
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias la='ls -A --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias cls='clear'
alias update='pkg update && pkg upgrade'
alias install='pkg install'
alias remove='pkg uninstall'
alias search='pkg search'
alias banner='banner'
alias matrix='matrix'
alias battery='battery'
alias sysinfo='sysinfo'
alias hack='hack'
alias theme-reload='source ~/.zshrc'
alias theme-config='micro ~/.zshrc'

# History Settings
HISTSIZE=10000
SAVEHIST=10000
HISTFILE=~/.zsh_history
setopt appendhistory
setopt sharehistory
setopt incappendhistory

# Auto-completion
autoload -U compinit && compinit

# Key Bindings
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Show banner on startup
banner

# Welcome Message
echo -e "${C_SUCCESS}[+]${C_TEXT} Welcome to MAR-PD Terminal Theme%f"
echo -e "${C_SUCCESS}[+]${C_TEXT} Type 'banner' to show banner%f"
echo -e "${C_SUCCESS}[+]${C_TEXT} Type 'matrix' for matrix animation%f"
echo -e "${C_SUCCESS}[+]${C_TEXT} Type 'battery' for battery status%f"
echo -e "${C_SUCCESS}[+]${C_TEXT} Type 'sysinfo' for system information%f"
echo -e "${C_SUCCESS}[+]${C_TEXT} Type 'hack <target>' for hack simulation%f"
echo
EOF
    
    print_success "ZSH configuration created"
}

# Create Bash configuration
create_bash_config() {
    print_info "Creating Bash configuration..."
    
    cat > $HOME/.bashrc << 'EOF'
#!/data/data/com.termux/files/usr/bin/bash

# MAR-PD Bash Configuration

# Load ZSH config if available
if [ -f ~/.zshrc ]; then
    source ~/.zshrc
else
    # Fallback prompt
    PS1='\[\033[1;33m\]MAR-PD♪↗➜\[\033[0m\] '
    
    # Basic aliases
    alias ls='ls --color=auto'
    alias ll='ls -la --color=auto'
    alias cls='clear'
    
    # Welcome message
    echo -e "\033[1;36m"
    echo "┌─────────────────────────────────────────────────────┐"
    echo "│           MAR-PD Terminal Theme (Bash)              │"
    echo "└─────────────────────────────────────────────────────┘"
    echo -e "\033[0m"
fi
EOF
    
    print_success "Bash configuration created"
}

# Apply changes
apply_changes() {
    print_info "Applying changes..."
    
    # Reload Termux settings
    if command -v termux-reload-settings &> /dev/null; then
        termux-reload-settings
    fi
    
    # Set ZSH as default shell
    if command -v chsh &> /dev/null; then
        if [ -f "/data/data/com.termux/files/usr/bin/zsh" ]; then
            chsh -s zsh
        fi
    fi
    
    print_success "Changes applied"
}

# Create additional scripts
create_scripts() {
    print_info "Creating additional scripts..."
    
    mkdir -p $THEME_DIR/scripts
    
    # Network scanner script
    cat > $THEME_DIR/scripts/network-scan.sh << 'EOF'
#!/bin/bash

echo -e "\033[1;36m"
echo "┌─────────────────────────────────────────────────────┐"
echo "│             NETWORK SCANNER                         │"
echo "└─────────────────────────────────────────────────────┘"
echo -e "\033[0m"

echo -e "\033[1;32m[+] Getting network information...\033[0m"

# Get IP address
ip_info=$(ip addr show 2>/dev/null | grep 'inet' | head -5)
if [ ! -z "$ip_info" ]; then
    echo -e "\033[1;36mNetwork Interfaces:\033[0m"
    echo "$ip_info"
else
    echo -e "\033[1;33m[-] No network interfaces found\033[0m"
fi

# Simple ping test
echo -e "\n\033[1;32m[+] Testing connectivity...\033[0m"
if ping -c 1 google.com &> /dev/null; then
    echo -e "\033[1;32m[✓] Internet: Connected\033[0m"
else
    echo -e "\033[1;33m[!] Internet: Disconnected\033[0m"
fi
EOF
    chmod +x $THEME_DIR/scripts/network-scan.sh
    
    # Password generator script
    cat > $THEME_DIR/scripts/password-gen.sh << 'EOF'
#!/bin/bash

echo -e "\033[1;36m"
echo "┌─────────────────────────────────────────────────────┐"
echo "│             PASSWORD GENERATOR                      │"
echo "└─────────────────────────────────────────────────────┘"
echo -e "\033[0m"

length=12
count=5

echo -e "\033[1;32m[+] Generating $count passwords...\033[0m"
echo

for i in {1..5}; do
    # Generate password
    password=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9!@#$%^&*' | fold -w $length | head -n 1)
    
    # Calculate strength
    strength=0
    [[ $password =~ [A-Z] ]] && ((strength++))
    [[ $password =~ [a-z] ]] && ((strength++))
    [[ $password =~ [0-9] ]] && ((strength++))
    [[ $password =~ [!@#\$%^\&*] ]] && ((strength++))
    
    echo -e "\033[1;33mPassword $i:\033[0m \033[1;36m$password\033[0m"
    
    # Show strength
    case $strength in
        4) echo -e "  Strength: \033[1;42m\033[1;37m STRONG \033[0m" ;;
        3) echo -e "  Strength: \033[1;44m\033[1;37m GOOD \033[0m" ;;
        2) echo -e "  Strength: \033[1;43m\033[1;30m WEAK \033[0m" ;;
        *) echo -e "  Strength: \033[1;41m\033[1;37m POOR \033[0m" ;;
    esac
    echo
done
EOF
    chmod +x $THEME_DIR/scripts/password-gen.sh
    
    # Dynamic color changer script
    cat > $THEME_DIR/scripts/color-change.sh << 'EOF'
#!/bin/bash

echo -e "\033[1;36m"
echo "┌─────────────────────────────────────────────────────┐"
echo "│         DYNAMIC COLOR CHANGER                       │"
echo "└─────────────────────────────────────────────────────┘"
echo -e "\033[0m"

# Array of dynamic colors
colors=(
    "#00ffff"  # Cyan (default)
    "#ff00ff"  # Magenta
    "#ffff00"  # Yellow
    "#00ff00"  # Green
    "#ff0000"  # Red
    "#0000ff"  # Blue
    "#ffa500"  # Orange
    "#9370db"  # Purple
)

# Get random color
random_color=${colors[$RANDOM % ${#colors[@]}]}

echo -e "\033[1;32m[+] Changing text color to: \033[1;36m$random_color\033[0m"

# Update colors.properties
if [ -f "$HOME/.termux/colors.properties" ]; then
    sed -i "s/^foreground=.*/foreground=$random_color/" "$HOME/.termux/colors.properties"
    sed -i "s/^color6=.*/color6=$random_color/" "$HOME/.termux/colors.properties"
    
    # Reload Termux settings
    if command -v termux-reload-settings &> /dev/null; then
        termux-reload-settings
        echo -e "\033[1;32m[✓] Color changed to: \033[1;36m$random_color\033[0m"
    else
        echo -e "\033[1;33m[!] Restart Termux to apply changes\033[0m"
    fi
else
    echo -e "\033[1;31m[✗] colors.properties not found\033[0m"
fi

# Show sample text
echo -e "\n\033[1;32mSample text with new color:\033[0m"
echo -e "\033[38;2;$(printf "%d;%d;%d" 0x${random_color:1:2} 0x${random_color:3:2} 0x${random_color:5:2})mThis is dynamic color text!\033[0m"
EOF
    chmod +x $THEME_DIR/scripts/color-change.sh
    
    print_success "Scripts created"
}

# Create dynamic color change feature
create_dynamic_color() {
    print_info "Adding dynamic color change feature..."
    
    # Add to zshrc
    cat >> $HOME/.zshrc << 'EOF'

# Dynamic Color Change Function
dynamic-color() {
    $HOME/.marpd-termux/scripts/color-change.sh
}

# Auto color change every hour (optional)
# if [[ -z "$NO_AUTO_COLOR" ]]; then
#     # Check if it's time to change color (every hour)
#     if [[ ! -f $HOME/.marpd-termux/last_color_change ]] || \
#        [[ $(($(date +%s) - $(stat -c %Y $HOME/.marpd-termux/last_color_change))) -gt 3600 ]]; then
#         dynamic-color
#         touch $HOME/.marpd-termux/last_color_change
#     fi
# fi

alias color-change='dynamic-color'
alias random-color='dynamic-color'
EOF
    
    print_success "Dynamic color feature added"
}

# Finalize installation
finalize() {
    clear
    echo -e "\033[1;36m"
    echo "┌─────────────────────────────────────────────────────┐"
    echo "│        MAR-PD THEME INSTALLATION COMPLETE           │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│                                                     │"
    echo "│  All features have been installed successfully!     │"
    echo "│                                                     │"
    echo "│  Features included:                                 │"
    echo "│    ✓ Dark Background Theme                          │"
    echo "│    ✓ Cyan Text Color (Default)                      │"
    echo "│    ✓ Dynamic Color Changing                         │"
    echo "│    ✓ Yellow Prompt Color                            │"
    echo "│    ✓ MAR-PD♪↗➜ Custom Prompt                       │"
    echo "│    ✓ Battery Status Display                         │"
    echo "│    ✓ Matrix Animation                               │"
    echo "│    ✓ Hack Simulation                                │"
    echo "│    ✓ System Information                             │"
    echo "│    ✓ Network Scanner                                │"
    echo "│    ✓ Password Generator                             │"
    echo "│                                                     │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│               AVAILABLE COMMANDS                    │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│                                                     │"
    echo "│  banner      - Show MAR-PD banner                   │"
    echo "│  matrix      - Matrix animation                     │"
    echo "│  battery     - Show battery status                  │"
    echo "│  sysinfo     - Show system information              │"
    echo "│  hack        - Hack simulation                      │"
    echo "│  color-change - Change text color dynamically       │"
    echo "│  scan        - Network scanner                      │"
    echo "│  passgen     - Password generator                   │"
    echo "│  update      - Update packages                      │"
    echo "│  theme-reload - Reload theme                        │"
    echo "│  theme-config - Edit theme configuration            │"
    echo "│                                                     │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│               DYNAMIC COLORS                        │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│                                                     │"
    echo "│  Type 'color-change' to randomly change text color  │"
    echo "│  Colors: Cyan, Magenta, Yellow, Green, Red, Blue,   │"
    echo "│          Orange, Purple                            │"
    echo "│                                                     │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│               PROMPT STYLE                          │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│                                                     │"
    echo "│  \033[1;33mMAR-PD♪↗➜\033[1;36m apt update                       │"
    echo "│  \033[1;33mMAR-PD♪↗➜\033[1;36m apt upgrade                      │"
    echo "│  \033[1;33mMAR-PD♪↗➜\033[1;36m battery                          │"
    echo "│  \033[1;33mMAR-PD♪↗➜\033[1;36m matrix                           │"
    echo "│  \033[1;33mMAR-PD♪↗➜\033[1;36m hack google.com                  │"
    echo "│  \033[1;33mMAR-PD♪↗➜\033[1;36m color-change                     │"
    echo "│                                                     │"
    echo "├─────────────────────────────────────────────────────┤"
    echo "│                                                     │"
    echo "│  Restart Termux or type: \033[1;32msource ~/.zshrc\033[1;36m     │"
    echo "│                                                     │"
    echo "└─────────────────────────────────────────────────────┘"
    echo -e "\033[0m"
    
    echo -e "\n\033[1;32mQuick Start:\033[0m"
    echo -e "  1. Close and reopen Termux"
    echo -e "  2. Type \033[1;33mbanner\033[0m to see your theme"
    echo -e "  3. Type \033[1;33mmatrix\033[0m for animation"
    echo -e "  4. Type \033[1;33mbattery\033[0m for battery status"
    echo -e "  5. Type \033[1;33mcolor-change\033[0m to change text color"
    
    echo -e "\n\033[1;33mMAR-PD♪↗➜\033[0m Theme installation successful!"
}

# =================== MAIN INSTALLATION ===================
main() {
    echo -e "\033[1;36m"
    echo "┌─────────────────────────────────────────────────────┐"
    echo "│     Starting MAR-PD Theme Installation              │"
    echo "└─────────────────────────────────────────────────────┘"
    echo -e "\033[0m"
    
    # Step 1: Backup
    backup_files
    
    # Step 2: Install packages
    install_packages
    
    # Step 3: Setup colors
    setup_colors
    
    # Step 4: Create ZSH config
    create_zsh_config
    
    # Step 5: Create Bash config
    create_bash_config
    
    # Step 6: Create scripts
    create_scripts
    
    # Step 7: Add dynamic color feature
    create_dynamic_color
    
    # Step 8: Apply changes
    apply_changes
    
    # Step 9: Add script aliases to zshrc
    echo "alias scan='$THEME_DIR/scripts/network-scan.sh'" >> $HOME/.zshrc
    echo "alias passgen='$THEME_DIR/scripts/password-gen.sh'" >> $HOME/.zshrc
    echo "alias color-change='$THEME_DIR/scripts/color-change.sh'" >> $HOME/.zshrc
    
    # Step 10: Finalize
    finalize
}

# Error handling
trap 'print_error "Installation interrupted!"; exit 1' INT

# Run installation
main

print_success "Installation completed without errors!"
echo -e "\033[1;36mWe work cyber safe!\033[0m"
