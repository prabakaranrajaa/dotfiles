#DWM Blocks status bar
PATH="$PATH:/$HOME/.local/bin"	
PATH="$PATH:/$HOME/.local/bin/i3cmds"
PATH="$PATH:/$HOME/.local/bin/statusbar"

# Path to your oh-my-zsh installation.
# Reevaluate the prompt string each time it's displaying a prompt
setopt prompt_subst
zstyle ':completion:*' menu select
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
autoload bashcompinit && bashcompinit
autoload -Uz compinit
compinit

plugins=(git zsh-autosuggestions zsh-syntax-highlighting)
source /home/praba/powerlevel10k/powerlevel10k.zsh-theme
ZSH_THEME="powerlevel10k/powerlevel10k"


source /usr/share/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=yellow'

bindkey '^w' autosuggest-execute       # Execute the suggestion
bindkey '^e' autosuggest-accept        # Accept the suggestion
bindkey '^u' autosuggest-toggle        # Toggle autosuggestions
bindkey '^L' vi-forward-word           # Move forward by one word in vi mode
bindkey '^k' up-line-or-search         # Search up in history
bindkey '^j' down-line-or-search       # Search down in history

bindkey "^a" beginning-of-line
bindkey "^e" end-of-line

# ctrl J & K for going up and down in prev commands
bindkey "^J" history-search-forward
bindkey "^K" history-search-backward
bindkey '^R' fzf-history-widget

# fzf setup
source <(fzf --zsh) # allow for fzf history widget

# You may need to manually set your language environment
export LANG=en_US.UTF-8

# History settings
HISTFILE=~/.zsh_history           # Path to the history file
HISTSIZE=100000                   # Number of commands to keep in memory
SAVEHIST=100000                   # Number of commands to save in the history file
setopt append_history             # Append new history to the file, rather than overwriting
setopt inc_append_history         # Save each command to the history file as it's entered
setopt share_history              # Share history across all Zsh sessions
setopt hist_ignore_all_dups       # Remove all duplicate commands from the history
setopt hist_ignore_dups           # Ignore consecutive duplicates
setopt hist_ignore_space          # Ignore commands that start with a space
setopt hist_verify                # Verify history commands before executing

# Only save successful commands
function zshaddhistory() {
    emulate -L zsh
    [[ $1 != '' && $? -eq 0 ]]  # Only save non-empty, successful commands
}



# Command behavior and convenience
setopt autocd                     # Automatically change directories when typing a path
setopt autopushd                  # Push directory onto the stack with cd
setopt no_clobber                 # Prevent overwriting files with >
setopt complete_in_word           # Autocomplete within a word
setopt extended_glob              # Enable advanced globbing features
setopt correct                    # Attempt to auto-correct commands

# Prompt and other tweaks
setopt no_beep                    # Disable terminal beep on error
setopt prompt_subst               # Enable dynamic prompt evaluation
setopt interactive_comments       # Allow comments (#) in interactive shells
setopt no_flow_control            # Disable Ctrl+S and Ctrl+Q flow control


#GIT
# Core Git Aliases
alias gi="git init"                  # Initialize a new Git repository
alias gib="git init --bare"          # Create a bare Git repository
alias ga="git add ."                 # Stage all changes
alias gadd="git add"                 # Add specific files to the staging area
alias gc="git commit -m"             # Commit changes with a message
alias gca="git commit -a -m"         # Commit all changes with a message
alias gst="git status"               # Show the status of the repository
alias gsr="git status -s"            # Show a summarized status of the repository
alias gl="git log"                   # Display commit logs
alias glog="git log --graph --topo-order --pretty='%w(100,0,6)%C(yellow)%h%C(bold)%C(black)%d %C(cyan)%ar %C(green)%an%n%C(bold)%C(white)%s %N' --abbrev-commit" # Graphical log
alias glpr="git log --pretty=format:\"%C(yellow)%h%Creset - %Cred%d%Creset %s %C(bold green)(%cr)%Creset %C(blue)<%an>\"" # Pretty log format
alias gdiff="git diff"               # Show changes between commits, branches, or working trees

# Branch Management
alias gb="git branch"                # List local branches
alias gba="git branch -a"            # List all branches, including remote ones
alias gcb="git checkout -b"          # Create and switch to a new branch
alias gch="git checkout"             # Switch to another branch
alias gcoall="git checkout -- ."     # Discard changes to all tracked files
alias grb="git branch -d"            # Delete a local branch

# Remote and Merging
alias gr="git remote"                # Manage set of tracked repositories
alias grmt="git remote -v"           # List remote repositories with URLs
alias grso="git remote show origin"  # Show detailed info about the remote 'origin'
alias gm="git merge"                 # Merge the specified branch
alias gpoa="git push -u origin --all" # Push all local branches to remote 'origin'
alias gp="git push origin HEAD"      # Push the current branch to remote 'origin'
alias gpu="git pull origin"          # Pull the latest changes from remote 'origin'

# Reset and Checkout
alias gre="git reset"                # Reset the current HEAD to a specific state
alias gco="git checkout"             # Checkout a branch or paths to the working tree



# Docker Compose Aliases
alias dco="docker compose"     # Simplified 'docker compose' command

# General Docker Aliases
alias dk="docker"                     # Shortcut for Docker command
alias dr="docker run"                 # Run a Docker container
alias drit="docker run -it"           # Run a container interactively
alias dritrm="docker run -it --rm"    # Run and auto-remove a container after exit

# Container Management Aliases
alias dps="docker ps"                 # List running containers
alias dpa="docker ps -a"              # List all containers, including stopped ones
alias dl="docker ps -l -q"            # Get the last used container's ID
alias dpss="docker ps -s"             # Show container sizes
alias dx="docker exec -it"            # Execute commands inside a running container

# Image Management Aliases
alias dimg="docker images"            # List all Docker images
alias drmi="docker rmi"               # Remove a specific image
alias drmiall="docker rmi -f \$(docker images -q)" # Force remove all images

# Container Start/Stop Aliases
alias dstart="docker start"           # Start a stopped container
alias dstop="docker stop"             # Stop a running container
alias drm="docker rm"                 # Remove a specific container
alias drmall="docker rm -f \$(docker ps -a -q)" # Force remove all containers

# Volume Management Aliases
alias dvc="docker volume create"      # Create a new Docker volume
alias dvls="docker volume ls"         # List all Docker volumes
alias dvrm="docker volume rm"         # Remove a specific Docker volume

# Dirs
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias .....="cd ../../../.."
alias ......="cd ../../../../.."


# VIM
alias v="nvim"

#pacman
pacman() {
    command sudo pacman "$@" 2>&1 | lolcat
}

yay(){
  command yay "$@" 2>&1 | lolcat
}

# Nmap
alias nm="nmap -sC -sV -oN nmap"


alias cl='clear'


# HTTP requests with xh!
alias http="xh"

# VI Mode!!!
bindkey jj vi-cmd-mode

# Eza Aliases
alias l="eza -l --icons --git -a"                    # Detailed list with icons, git, and hidden files
alias lt="eza --tree --level=2 --long --icons --git" # Tree view, level 2, with icons and git
alias ltree="eza --tree --level=2 --icons --git"     # Tree view, level 2, with icons and git
alias ls="eza --icons"                               # Simple list with icons
alias ll="eza --long --icons"                        # Long list with icons
alias tree="eza --tree --icons"                      # Tree view with icons

# Replace `cat` with `bat` for better file preview
alias cat="bat"                            # Use bat as a replacement for cat


# Gobuster Alias
alias gobust="gobuster dir --wordlist ~/security/wordlists/diccnoext.txt --wildcard --url" # Directory brute-forcing with wordlist and wildcard support

# Dirsearch Alias
alias dirsearch="python dirsearch.py -w db/dicc.txt -b -u" # Directory searching with Python Dirsearch

# MassDNS Alias
alias massdns="~/hacking/tools/massdns/bin/massdns -r ~/hacking/tools/massdns/lists/resolvers.txt -t A -o S bf-targets.txt -w livehosts.txt -s 4000" # DNS brute-forcing with custom resolvers

# Simple HTTP Server Alias
alias server="python -m http.server 4445" # Run a Python HTTP server on port 4445

# Ngrok Tunnel Alias
alias tunnel="ngrok http 4445" # Create a public HTTP tunnel on port 4445 using ngrok

# FFUF (Fuzz Faster U Fool) Alias
alias fuzz="ffuf -w ~/hacking/SecLists/content_discovery_all.txt -mc all -u" # Web fuzzing with FFUF and SecLists

# gf Patterns Alias
alias gr="~/go/src/github.com/tomnomnom/gf/gf" # Use gf patterns for efficient searches




alias mat='tmux neww "cmatrix"'

#alias mat='osascript -e "tell application \"System Events\" to key code 126 using {command down}" && tmux neww "cmatrix"'

function ranger {
	local IFS=$'\t\n'
	local tempfile="$(mktemp -t tmp.XXXXXX)"
	local ranger_cmd=(
		command
		ranger
		--cmd="map Q chain shell echo %d > "$tempfile"; quitall"
	)

	${ranger_cmd[@]} "$@"
	if [[ -f "$tempfile" ]] && [[ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]]; then
		cd -- "$(cat "$tempfile")" || return
	fi
	command rm -f -- "$tempfile" 2>/dev/null
}
alias rr='ranger'

# navigation
cx() { cd "$@" && l; }
fcd() { cd "$(find . -type d -not -path '*/.*' | fzf)" && l; }
fv() { nvim "$(find . -type f -not -path '*/.*' | fzf)" }


# --- zoxide (better cd)
eval "$(zoxide init zsh)"

#yazi command
function y() {
	local tmp="$(mktemp -t "yazi-cwd.XXXXXX")" cwd
	yazi "$@" --cwd-file="$tmp"
	if cwd="$(command cat -- "$tmp")" && [ -n "$cwd" ] && [ "$cwd" != "$PWD" ]; then
		builtin cd -- "$cwd"
	fi
	rm -f -- "$tmp"
}

# ---- FZF -----

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"

# --- setup fzf theme ---
fg="#CBE0F0"
bg="#011628"
bg_highlight="#143652"
purple="#B388FF"
blue="#06BCE4"
cyan="#2CF9ED"

export FZF_DEFAULT_OPTS="--color=fg:${fg},bg:${bg},hl:${purple},fg+:${fg},bg+:${bg_highlight},hl+:${purple},info:${blue},prompt:${cyan},pointer:${cyan},marker:${cyan},spinner:${cyan},header:${cyan}"

# -- Use fd instead of fzf --

export FZF_DEFAULT_COMMAND="fd --hidden --strip-cwd-prefix --exclude .git"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_ALT_C_COMMAND="fd --type=d --hidden --strip-cwd-prefix --exclude .git"

# Use fd (https://github.com/sharkdp/fd) for listing path candidates.
# - The first argument to the function ($1) is the base path to start traversal
# - See the source code (completion.{bash,zsh}) for the details.
_fzf_compgen_path() {
  fd --hidden --exclude .git . "$1"
}

# Use fd to generate the list for directory completion
_fzf_compgen_dir() {
  fd --type=d --hidden --exclude .git . "$1"
}

source ~/fzf-git.sh/fzf-git.sh

show_file_or_dir_preview="if [ -d {} ]; then eza --tree --color=always {} | head -200; else bat -n --color=always --line-range :500 {}; fi"

export FZF_CTRL_T_OPTS="--preview '$show_file_or_dir_preview'"
export FZF_ALT_C_OPTS="--preview 'eza --tree --color=always {} | head -200'"

# Advanced customization of fzf options via _fzf_comprun function
# - The first argument to the function is the name of the command.
# - You should make sure to pass the rest of the arguments to fzf.
_fzf_comprun() {
  local command=$1
  shift

  case "$command" in
    cd)           fzf --preview 'eza --tree --color=always {} | head -200' "$@" ;;
    export|unset) fzf --preview "eval 'echo \${}'"         "$@" ;;
    ssh)          fzf --preview 'dig {}'                   "$@" ;;
    *)            fzf --preview "$show_file_or_dir_preview" "$@" ;;
  esac
}

# ----- Bat (better cat) -----

#export BAT_THEME=tokyonight_night


# ---- TheFuck -----

# thefuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# ---- Zoxide (better cd) ----
eval "$(zoxide init zsh)"

alias cd="z"


export EDITOR="nvim"
export TERMINAL="wezterm"
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh



#the fuck alias
eval $(thefuck --alias)
eval $(thefuck --alias fk)

# switch between shells
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tozsh="sudo chsh $USER -s /bin/zsh && echo 'Now log out.'"
neofetch | lolcat

export YAZI_CONFIG_HOME="$HOME/.config/yazi"
export YAZI_CONFIG=~/.config/yazi/config.yaml
