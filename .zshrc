# --------------------------------------------------
# Live autocompletion (must be sourced FIRST, before compinit)
# --------------------------------------------------
source /usr/share/zsh/plugins/zsh-autocomplete/zsh-autocomplete.plugin.zsh
zstyle ':autocomplete:*' min-input 1
zstyle ':autocomplete:*' delay 0.05

zstyle ':autocomplete:*' list-lines 2
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Grayscale completion colors
zstyle ':completion:*' list-colors \
  '=(#b)*(=0)=38;5;250' \
  '=(#b)*(=1)=38;5;255' \
  '=(#b)*(=2)=38;5;245' \
  '=(#b)*(=3)=38;5;240'

# Dim group headers
zstyle ':completion:*:descriptions' format '%F{8}-- %d --%f'

# ==================================================
# 1. ENVIRONMENT VARIABLES & PATH
# ==================================================
export PATH=$HOME/bin:/usr/bin/:/usr/local/bin:$PATH
export PATH=$HOME/.cargo/bin:$PATH
export PATH=$HOME/.local/bin:$PATH

export VISUAL=nvim
export EDITOR=nvim
export LAZYVIM_APPNAME='lazyvim'

zstyle ':autocomplete:*' min-input 1
zstyle ':autocomplete:*' delay 0.05

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

# Grayscale completion colors
zstyle ':completion:*' list-colors \
  '=(#b)*(=0)=38;5;250' \
  '=(#b)*(=1)=38;5;255' \
  '=(#b)*(=2)=38;5;245' \
  '=(#b)*(=3)=38;5;240'

# Dim group headers
zstyle ':completion:*:descriptions' format '%F{8}-- %d --%f'

# ==================================================
# 2. OH MY ZSH & PLUGINS
# ==================================================
export ZSH="$HOME/.oh-my-zsh"
# Disabled theme since we aren't using Starship.
# If you want an Oh My Zsh theme, change this line later.
# ZSH_THEME="eastwood"

plugins=(
    git
    zsh-autosuggestions
    # zsh-system-clipboard
)

source $ZSH/oh-my-zsh.sh

# ==================================================
# 3. KEYBINDINGS & HISTORY
# ==================================================
# Standard Emacs mode (no Vi mode)
bindkey -e

# Ctrl+J accepts autosuggestions
bindkey '^A' autosuggest-accept

# History Settings (from whothis)
HISTFILE="$HOME/.zsh_history"
HISTSIZE=10000
SAVEHIST=10000
setopt APPEND_HISTORY
setopt SHARE_HISTORY
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS

# ==================================================
# 4. EZA CONFIG
# ==================================================
export EZA_COLORS="uu=bright-black:gu=bright-black:da=bright-black:ur=white:uw=bright-black:ux=white:ue=bright-black:gr=bright-black:gw=bright-black:gx=white:tr=bright-black:fi=white:di=bright-white:ln=bright-black:pi=bright-black:so=bright-black:bd=bright-black:cd=bright-black:or=bright-black:mi=bright-black:ex=white"

alias ls='eza --icons'
alias ll='eza -lah --icons --git'
alias la='eza -a --icons'
alias lt='eza --tree --icons'

# ==================================================
# 5. FZF CONFIG
# ==================================================
eval "$(fzf --zsh)"
export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git "
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"
export FZF_DEFAULT_OPTS="--height 50% --layout=default --border --color=hl:#2dd4bf"
export FZF_CTRL_T_OPTS="--preview 'bat --color=always -n --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'eza --icons=always --tree --color=always {} | head -200'"
export FZF_TMUX_OPTS=" -p90%,50% "

bindkey -r '^T'
bindkey '^F' fzf-file-widget

# ==================================================
# 6. ZSH SYNTAX HIGHLIGHTING
# ==================================================
source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

ZSH_HIGHLIGHT_STYLES[command]='fg=white'
ZSH_HIGHLIGHT_STYLES[builtin]='fg=white'
ZSH_HIGHLIGHT_STYLES[function]='fg=white'
ZSH_HIGHLIGHT_STYLES[alias]='fg=white'
ZSH_HIGHLIGHT_STYLES[path]='fg=245'
ZSH_HIGHLIGHT_STYLES[comment]='fg=240'
ZSH_HIGHLIGHT_STYLES[unknown-token]='fg=245'

# ==================================================
# 7. CUSTOM FUNCTIONS
# ==================================================
# Esc Esc to prepend sudo
sudo-command-line() {
    [[ -z $BUFFER ]] && zle up-history
    if [[ $BUFFER == sudo\ * ]]; then
        BUFFER="${BUFFER#sudo }"
    else
        BUFFER="sudo $BUFFER"
    fi
    zle end-of-line
}
zle -N sudo-command-line

# Bind Esc Esc (^[^[) to the function
bindkey -M emacs '^[^[' sudo-command-line
bindkey -M viins '^[^[' sudo-command-line
# ==================================================
# 8. ZOXIDE, DIRENV, STARSHIP
# ==================================================
eval "$(zoxide init zsh)"
eval "$(direnv hook zsh)"
eval "$(starship init zsh)"

# ==================================================
# 9. ALIASES
# ==================================================
## General alias
alias zsh="nvim ~/.zshrc"
alias szsh="source ~/.zshrc"
alias q="exit"
alias cd="z"
alias update="eos-rankmirrors --verbose && yay -Syyu && pipx upgrade-all && sudo pacman -Syu && flatpak update"
alias mirror="sudo reflector --protocol https --verbose --latest 25 --sort rate --connection-timeout 20 --download-timeout 60 --save /etc/pacman.d/mirrorlist"

## TUI alias
alias ff="fastfetch"
alias file="yazi"
alias wifi="wlctl"
alias audio="wiremix"
alias ai="ollama run qwen2.5-coder:7b-instruct"
alias removepackage="sudo pacman -Rns $(pacman -Qtdq)"

## RMPC alias
alias m="rmpc"
alias mt="mpc toggle"

## Tmux alias
alias t="tmux new -s main"
alias ta="tmux a"
alias tk="tmux kill-server"


# ==================================================
# 10. 4WPR THEME CONTROLLER (Must be at the end)
# ==================================================
theme() { python3 "$HOME/.config/43pr/bin/theme.py" "$@" }
