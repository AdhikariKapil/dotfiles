# Environment Variables
set -gx VISUAL nvim
set -gx EDITOR nvim
set -gx LAZYVIM_APPNAME lazyvim

# Paths (use fish_add_path, it prevents duplicates)
fish_add_path ~/bin
fish_add_path ~/.cargo/bin
fish_add_path ~/.local/bin

# FZF
set -gx FZF_DEFAULT_COMMAND "fd --hidden --strip-cwd-prefix --exclude .git"
set -gx FZF_CTRL_T_COMMAND "$FZF_DEFAULT_COMMAND"
set -gx FZF_ALT_C_COMMAND "fd --type=d --hidden --strip-cwd-prefix --exclude .git"
set -gx FZF_DEFAULT_OPTS "--height 50% --layout=default --border --color=hl:#2dd4bf"
set -gx FZF_CTRL_T_OPTS "--preview 'bat --color=always -n --line-range :500 {}'"
set -gx FZF_ALT_C_OPTS "--preview 'eza --icons=always --tree --color=always {} | head -200'"
set -gx FZF_TMUX_OPTS " -p90%,50% "

# FZF Fish integration
command -v fzf &> /dev/null && fzf --fish | source

# General
abbr -a zsh "nvim ~/.zshrc"
abbr -a szsh "source ~/.zshrc"
abbr -a q "exit"
# abbr -a cd "z"
abbr -a update "eos-rankmirrors --verbose; and yay -Syyu; and pipx upgrade-all; and sudo pacman -Syu; and flatpak update"
abbr -a mirror "sudo reflector --protocol https --verbose --latest 25 --sort rate --connection-timeout 20 --download-timeout 60 --save /etc/pacman.d/mirrorlist"

# TUI
abbr -a ff "fastfetch"
abbr -a file "yazi"
abbr -a wifi "wlctl"
abbr -a audio "wiremix"
abbr -a ai "ollama run qwen2.5-coder:7b-instruct"
abbr -a removepackage "sudo pacman -Rns (pacman -Qtdq)"

# RMPC
abbr -a m "rmpc"
abbr -a mt "mpc toggle"

# Tmux
abbr -a t "tmux new -s main"
abbr -a ta "tmux a"
abbr -a tk "tmux kill-server"

# EZA
alias l 'eza --icons --group-directories-first'
alias ll 'eza -lah --icons --git --group-directories-first'
alias ls 'eza -a --icons --group-directories-first'

# ESC ESC - SUDO
function prepend_sudo
    if commandline -b | string match -q 'sudo *'
        commandline -r (string replace 'sudo ' '' (commandline -b))
    else
        commandline -r "sudo "(commandline -b)
    end
    commandline -f end-of-line
end
bind \e\e prepend_sudo

# Override Caelestia's default greeting to remove the ASCII art
function fish_greeting
    if test -n "$TMUX"
    else
        fastfetch
    end
end
