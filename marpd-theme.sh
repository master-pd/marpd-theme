#!/bin/bash
# ============================================
# MAR-PD TERMUX THEME - MAIN SCRIPT
# ============================================

# Colors
C1='\033[1;36m'  # Cyan
C2='\033[1;35m'  # Magenta
C3='\033[1;32m'  # Green
C4='\033[1;31m'  # Red
C5='\033[1;33m'  # Yellow
C6='\033[1;34m'  # Blue
R='\033[0m'      # Reset

# Banner function
marpd_banner() {
    clear
    
    # Random banner style
    local styles=("standard" "box" "simple")
    local style=${styles[$RANDOM % ${#styles[@]}]}
    
    case $style in
        "standard")
            echo -e "${C1}"
            echo "    ███╗   ███╗ █████╗ ██████╗ ██████╗ ██████╗ "
            echo "    ████╗ ████║██╔══██╗██╔══██╗██╔══██╗██╔══██╗"
            echo "    ██╔████╔██║███████║██████╔╝██████╔╝██║  ██║"
            echo "    ██║╚██╔╝██║██╔══██║██╔═══╝ ██╔═══╝ ██║  ██║"
            echo "    ██║ ╚═╝ ██║██║  ██║██║     ██║     ██████╔╝"
            echo "    ╚═╝     ╚═╝╚═╝  ╚═╝╚═╝     ╚═╝     ╚═════╝ "
            ;;
        "box")
            echo -e "${C2}"
            echo "╔══════════════════════════════════════════╗"
            echo "║              M A R - P D                 ║"
            echo "║         WE WORK EXPERIMENT               ║"
            echo "╚══════════════════════════════════════════╝"
            ;;
        "simple")
            echo -e "${C3}"
            echo "▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄▄"
            echo "█▓▒░ MAR-PD TERMINAL THEME v3.0 ░▒▓█"
            echo "▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀▀"
            ;;
    esac
    
    echo -e "${R}"
    echo -e "${C2}┌─────────────────────────────────────────────┐${R}"
    echo -e "${C2}│ ${C6}Device: ${R}$(getprop ro.product.model 2>/dev/null || echo 'Termux')"
    echo -e "${C2}│ ${C6}User: ${R}$(whoami)@$(hostname)"
    echo -e "${C2}│ ${C6}Time: ${R}$(date '+%H:%M:%S') | ${C6}Date: ${R}$(date '+%Y-%m-%d')"
    
    # Battery info
    if command -v termux-battery-status &> /dev/null; then
        local battery=$(termux-battery-status 2>/dev/null | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        if [ -n "$battery" ]; then
            echo -e "${C2}│ ${C6}Battery: ${R}${battery}%"
        fi
    fi
    
    # Storage info
    local storage=$(df -h /data 2>/dev/null | awk 'NR==2 {print $3 "/" $2 " (" $5 ")"}')
    if [ -n "$storage" ]; then
        echo -e "${C2}│ ${C6}Storage: ${R}$storage"
    fi
    
    echo -e "${C2}└─────────────────────────────────────────────┘${R}"
    echo ""
}

# System info function
system_info() {
    echo -e "${C6}╔════════════════ SYSTEM STATUS ════════════════╗${R}"
    
    # Device
    echo -e "${C6}│ ${C3}📱 Device: ${R}$(getprop ro.product.model 2>/dev/null || echo 'Unknown')"
    
    # Android
    echo -e "${C6}│ ${C3}🤖 Android: ${R}$(getprop ro.build.version.release 2>/dev/null || echo 'Unknown')"
    
    # Kernel
    echo -e "${C6}│ ${C3}🐧 Kernel: ${R}$(uname -r)"
    
    # Architecture
    echo -e "${C6}│ ${C3}🏗️  Arch: ${R}$(uname -m)"
    
    # Uptime
    local uptime=$(uptime -p 2>/dev/null | sed 's/up //' || echo 'Unknown')
    echo -e "${C6}│ ${C3}⏱️  Uptime: ${R}$uptime"
    
    # Battery
    if command -v termux-battery-status &> /dev/null; then
        local batt=$(termux-battery-status 2>/dev/null)
        local percent=$(echo "$batt" | grep -o '"percentage":[0-9]*' | cut -d: -f2)
        local status=$(echo "$batt" | grep -o '"status":"[^"]*"' | cut -d'"' -f4)
        if [ -n "$percent" ]; then
            echo -e "${C6}│ ${C3}🔋 Battery: ${R}${percent}% (${status})"
        fi
    fi
    
    # Network
    local ip=$(ip route get 1 2>/dev/null | awk '{print $7}' | head -1)
    [ -z "$ip" ] && ip="Not Connected"
    echo -e "${C6}│ ${C3}🌐 IP: ${R}$ip"
    
    echo -e "${C6}╚═══════════════════════════════════════════════╝${R}"
}

# Prompt function
marpd_prompt() {
    local exit_code=$?
    local dir=$(basename "$PWD")
    local time=$(date "+%H:%M")
    
    # Git branch
    local git_branch=""
    if git rev-parse --git-dir > /dev/null 2>&1; then
        git_branch="($(git branch --show-current)) "
    fi
    
    # Color based on exit code
    if [ $exit_code -eq 0 ]; then
        local prompt_color="${C3}"
    else
        local prompt_color="${C4}"
    fi
    
    # Set PS1
    PS1="\[${C6}\][\[${C1}\]$time\[${C6}\]] \[${prompt_color}\]$dir \[${C5}\]$git_branch\[${C2}\]➜\[${R}\] "
}

# Initialize theme
marpd_init() {
    # Show banner
    marpd_banner
    
    # Show system info (randomly)
    if [ $((RANDOM % 3)) -eq 0 ]; then
        system_info
        echo ""
    fi
    
    # Set prompt
    PROMPT_COMMAND=marpd_prompt
    
    # Set wallpaper if not set
    if [ -f "$HOME/.marpd-theme/bg.png" ] && \
       command -v termux-wallpaper &> /dev/null && \
       [ ! -f "$HOME/.marpd-theme/wallpaper_set" ]; then
        termux-wallpaper -f "$HOME/.marpd-theme/bg.png"
        touch "$HOME/.marpd-theme/wallpaper_set"
    fi
}

# Load theme
marpd_init
