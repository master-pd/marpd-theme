#!/bin/bash

clear

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
MAGENTA='\033[1;95m'
ORANGE='\033[1;38;5;208m'
RESET='\033[0m'

# ASCII Banner with animation
show_banner() {
    echo -e "${CYAN}"
    cat << "EOF"
    ███╗   ███╗ █████╗ ██████╗     ██████╗ ██████╗ 
    ████╗ ████║██╔══██╗██╔══██╗    ██╔══██╗██╔══██╗
    ██╔████╔██║███████║██████╔╝    ██║  ██║██║  ██║
    ██║╚██╔╝██║██╔══██║██╔═══╝     ██║  ██║██║  ██║
    ██║ ╚═╝ ██║██║  ██║██║         ██████╔╝██████╔╝
    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝         ╚═════╝ ╚═════╝ 
EOF
    echo -e "${RESET}"
}

# Matrix animation
matrix_animation() {
    echo -e "${GREEN}"
    for i in {1..10}; do
        echo -n "0101010101010101010101010101010101010101"
        sleep 0.1
        echo -e -n "\r"
    done
    echo -e "${RESET}"
}

# Loading animation
loading_animation() {
    echo -e "${CYAN}[${GREEN}+${CYAN}]${RESET} Setting up theme..."
    local chars="/-\|"
    for i in {1..20}; do
        echo -ne "${CYAN}[${GREEN}${chars:i%4:1}${CYAN}]${RESET} Configuring...\r"
        sleep 0.1
    done
    echo -e "\n${GREEN}[✓]${RESET} Configuration complete!"
}

# User info
USER_NAME=""
TEAM_NAME="MAR-PD"
MOTTO="WE WORK CYBER SAFE"
CONTACT="https://t.me/master_spamming"

# Get user name
get_user_info() {
    echo -e "${CYAN}"
    echo "╔══════════════════════════════════════╗"
    echo "║      TERMUX THEME SETUP WIZARD       ║"
    echo "╚══════════════════════════════════════╝${RESET}"
    echo ""
    echo -e "${YELLOW}[?]${RESET} Enter your name: "
    read -p "    ➤ " USER_NAME
    
    if [ -z "$USER_NAME" ]; then
        USER_NAME="Anonymous"
    fi
    
    echo -e "\n${GREEN}[✓]${RESET} Welcome: ${CYAN}$USER_NAME${RESET}"
    echo -e "${GREEN}[✓]${RESET} Team: ${RED}$TEAM_NAME${RESET}"
    echo -e "${GREEN}[✓]${RESET} Motto: ${BLUE}$MOTTO${RESET}"
    echo -e "${GREEN}[✓]${RESET} Contact: ${PURPLE}$CONTACT${RESET}"
    echo ""
}

# Install requirements
install_requirements() {
    echo -e "\n${CYAN}[*]${RESET} Installing requirements..."
    pkg update -y && pkg upgrade -y
    pkg install -y nano curl wget git neofetch figlet toilet lolcat
    
    # Install zsh if not present
    if ! command -v zsh &> /dev/null; then
        pkg install -y zsh
    fi
}

# Create custom prompt
create_prompt() {
    echo -e "\n${CYAN}[*]${RESET} Creating custom prompt..."
    
    cat > ~/.zshrc << EOL
#!/data/data/com.termux/files/usr/bin/zsh

# Clear screen
clear

# Colors
RED='\033[1;31m'
GREEN='\033[1;32m'
YELLOW='\033[1;33m'
BLUE='\033[1;34m'
PURPLE='\033[1;35m'
CYAN='\033[1;36m'
WHITE='\033[1;37m'
MAGENTA='\033[1;95m'
ORANGE='\033[1;38;5;208m'
RESET='\033[0m'

# Banner function
banner() {
    clear
    echo -e "\${CYAN}"
    echo "╔══════════════════════════════════════════════════════════════╗"
    echo "║                     \${RED}TERMUX PROFESSIONAL THEME\${CYAN}                 ║"
    echo "╠══════════════════════════════════════════════════════════════╣"
    echo "║  \${GREEN}USER    \${RESET}: \${MAGENTA}$USER_NAME\${CYAN}                                   ║"
    echo "║  \${GREEN}TEAM    \${RESET}: \${RED}$TEAM_NAME\${CYAN}                                        ║"
    echo "║  \${GREEN}MOTTO   \${RESET}: \${BLUE}$MOTTO\${CYAN}                         ║"
    echo "║  \${GREEN}CONTACT \${RESET}: \${PURPLE}$CONTACT\${CYAN}  ║"
    echo "╚══════════════════════════════════════════════════════════════╝"
    echo -e "\${RESET}"
    
    # Show system info
    echo -e "\${YELLOW}══════════════════════════════════════════════════════════════\${RESET}"
    neofetch --ascii_distro termux
    echo -e "\${YELLOW}══════════════════════════════════════════════════════════════\${RESET}"
    echo ""
}

# Matrix animation on command not found
matrix_on_error() {
    echo -e "\${GREEN}"
    echo "01101000 01100001 01100011 01101011 00100000 01110100 01101000 01100101 00100000 01110000 01101100 01100001 01101110 01100101 01110100"
    echo -e "\${RESET}"
}

# Custom prompt
PROMPT='%{\$fg[red]%}\$TEAM_NAME%{\$reset_color%}%{\$fg[yellow]%}♪↗➜%{\$reset_color%} '
RPROMPT='%{\$fg[green]%}[%{\$fg[cyan]%}%T%{\$fg[green]%}]%{\$reset_color%}'

# Aliases for colors
alias ls='ls --color=auto'
alias ll='ls -la --color=auto'
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Custom commands
matrix() {
    echo -e "\${GREEN}"
    cmatrix -C blue
    echo -e "\${RESET}"
}

hack() {
    echo -e "\${RED}"
    echo "Initializing hack sequence..."
    sleep 1
    echo "Bypassing firewall..."
    sleep 1
    echo "Access granted!"
    echo -e "\${RESET}"
}

sysinfo() {
    neofetch
}

update-system() {
    echo -e "\${CYAN}[*]\${RESET} Updating system..."
    pkg update && pkg upgrade
}

# Show banner on start
banner

# Welcome message
echo -e "\${GREEN}[+]\${RESET} Welcome to Termux Pro \${RED}$TEAM_NAME\${RESET} Edition"
echo -e "\${GREEN}[+]\${RESET} Type 'matrix' for matrix animation"
echo -e "\${GREEN}[+]\${RESET} Type 'hack' for fun hack animation"
echo -e "\${GREEN}[+]\${RESET} Type 'sysinfo' for system information"
echo ""
EOL
}

# Create bashrc backup
create_bashrc() {
    echo -e "\n${CYAN}[*]${RESET} Creating .bashrc..."
    
    cat > ~/.bashrc << EOL
#!/data/data/com.termux/files/usr/bin/bash

# Show banner
if [ -f ~/.zshrc ]; then
    zsh -c "source ~/.zshrc; banner"
else
    clear
    echo -e "\033[1;36m"
    echo "    MAR-PD Professional Terminal"
    echo -e "\033[0m"
fi

# Custom PS1
PS1='\[\033[1;31m\]$TEAM_NAME\[\033[1;33m\]♪↗➜\[\033[0m\] '
EOL
}

# Create custom commands directory
create_custom_commands() {
    echo -e "\n${CYAN}[*]${RESET} Creating custom commands..."
    
    mkdir -p ~/.termux/commands
    
    # Create hack command
    cat > ~/.termux/commands/hack.sh << 'EOF'
#!/bin/bash
echo -e "\033[1;31m"
echo "╔══════════════════════════════════════╗"
echo "║        HACK MODE ACTIVATED           ║"
echo "╚══════════════════════════════════════╝"
echo -e "\033[1;32m"
for i in {1..5}; do
    echo "[$i] Exploiting vulnerabilities..."
    sleep 0.5
done
echo -e "\033[1;36m"
echo "[+] System compromised successfully!"
echo -e "\033[0m"
EOF
    
    chmod +x ~/.termux/commands/hack.sh
    
    # Create matrix command
    cat > ~/.termux/commands/matrix.sh << 'EOF'
#!/bin/bash
if command -v cmatrix &> /dev/null; then
    cmatrix -C blue
else
    echo -e "\033[1;32m"
    for i in {1..20}; do
        echo "0101010101010101010101010101010101010101"
        sleep 0.1
    done
    echo -e "\033[0m"
fi
EOF
    
    chmod +x ~/.termux/commands/matrix.sh
}

# Change terminal colors
change_terminal_colors() {
    echo -e "\n${CYAN}[*]${RESET} Changing terminal colors..."
    
    # Create termux properties
    cat > ~/.termux/colors.properties << EOL
# Terminal Colors
background=#0a0a0a
foreground=#00ff00
cursor=#00ff00
color0=#000000
color1=#ff0000
color2=#00ff00
color3=#ffff00
color4=#0000ff
color5=#ff00ff
color6=#00ffff
color7=#ffffff
color8=#404040
color9=#ff4040
color10=#40ff40
color11=#ffff40
color12=#4040ff
color13=#ff40ff
color14=#40ffff
color15=#ffffff
EOL
    
    # Create font properties
    cat > ~/.termux/font.properties << EOL
# Terminal Font
font=monospace
font-size=12
EOL
}

# Apply changes
apply_changes() {
    echo -e "\n${CYAN}[*]${RESET} Applying changes..."
    
    # Reload termux properties
    termux-reload-settings
    
    # Make zsh default shell
    chsh -s zsh
    
    # Source the new configuration
    source ~/.zshrc
}

# Main installation
main() {
    show_banner
    matrix_animation
    get_user_info
    loading_animation
    install_requirements
    create_prompt
    create_bashrc
    create_custom_commands
    change_terminal_colors
    apply_changes
    
    echo -e "\n${GREEN}╔══════════════════════════════════════════════════════╗"
    echo -e "║          ${CYAN}THEME INSTALLATION COMPLETE!${GREEN}          ║"
    echo -e "╠══════════════════════════════════════════════════════╣"
    echo -e "║ ${YELLOW}Restart Termux or run:${RESET} ${WHITE}source ~/.zshrc${GREEN}     ║"
    echo -e "║                                                      ║"
    echo -e "║ ${CYAN}Available Commands:${GREEN}                              ║"
    echo -e "║ ${WHITE}• matrix   ${RESET}- Matrix animation${GREEN}                  ║"
    echo -e "║ ${WHITE}• hack     ${RESET}- Fun hack sequence${GREEN}                ║"
    echo -e "║ ${WHITE}• sysinfo  ${RESET}- System information${GREEN}               ║"
    echo -e "║ ${WHITE}• ls/ll    ${RESET}- Colorful listings${GREEN}                ║"
    echo -e "╚══════════════════════════════════════════════════════╝${RESET}"
    
    echo -e "\n${RED}$TEAM_NAME${YELLOW}♪↗➜${RESET} Theme installed successfully!"
    echo -e "${BLUE}Enjoy your professional hacking terminal!${RESET}"
}

# Run main function
main
