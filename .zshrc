# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH="/home/ricardo/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="robbyrussell"
ZSH_THEME="spaceship"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git bundler extract docker vagrant aws capistrano history ng tmuxinator yarn)

source $ZSH/oh-my-zsh.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit
### End of Zinit's installer chunk

zplugin light zsh-users/zsh-autosuggestions
zplugin light zsh-users/zsh-completions
zplugin light zdharma/fast-syntax-highlighting
zplugin light zsh-users/zsh-history-substring-search
zplugin light buonomo/yarn-completion

# LS_COLORS=$LS_COLORS:'ow=01;34:' ; export LS_COLORS

### Added by Zplugin's installer
SPACESHIP_PROMPT_ORDER=(
  user          # Username section
  dir           # Current directory section
  host          # Hostname section
  git           # Git section (git_branch + git_status)
  hg            # Mercurial section (hg_branch  + hg_status)
  exec_time     # Execution time
  line_sep      # Line break
  vi_mode       # Vi-mode indicator
  jobs          # Background jobs indicator
  exit_code     # Exit code section
  char          # Prompt character
)

SPACESHIP_USER_SHOW="always" # Shows System user name before directory name
SPACESHIP_PROMPT_ADD_NEWLINE=false
# SPACESHIP_PROMPT_SEPARATE_LINE=false # Make the prompt span across two lines
# SPACESHIP_DIR_TRUNC=1 # Shows only the last directory folder name

SPACESHIP_CHAR_SYMBOL="❯"
SPACESHIP_CHAR_SUFFIX=" "

# My custom settings:

# Docker output format to vertical layout.
export DOCKER_FORMAT="\nID\t{{.ID}}\nIMAGE\t{{.Image}}\nCOMMAND\t{{.Command}}\nCREATED\t{{.RunningFor}}\nSTATUS\t{{.Status}}\nPORTS\t{{.Ports}}\nNAMES\t{{.Names}}\n"

# Pry Editor definition
export EDITOR="code"

# Função utilizada para verificar se um parâmetro foi informado.
check_args () {
  if [ $# -eq 0 ]; then
    return 1
  else
    return 0
  fi
}

# Vários aliases para facilitação na execução de comandos.
alias ll='ls -laGh'
alias llg='ls -lah'
alias cls='clear'
alias sshkg='ssh-keygen -t rsa'
alias copyd='cp -av'
alias zs='source ~/.zshrc'
alias sditto='sudo ditto -rsrc'
alias git-key='ssh-add -K'
alias ssh-copy-key='cat ~/.ssh/id_rsa.pub | pbcopy'
alias kp3000='kill -9 $(lsof -i tcp:3000 -t)'
alias kp3301='kill -9 $(lsof -i tcp:3301 -t)'
alias kp8080='kill -9 $(lsof -i tcp:8080 -t)'
alias list-node-modules='find . -name "node_modules" -type d -prune -print | xargs du -chs'
alias remove-node-modules='find . -name "node_modules" -type d -prune -print -exec rm -rf '{}' \;'
alias umountMacOSDisk='sudo umount ~/macOS-HD'


# Monta uma portição do sistema operacional macOS.
mountMacOSDisk () {
  # Verifica se o parâmetro foi informado.
  if ! check_args $1; then
    echo 'Erro: Você precisa informar o caminho do ponto de montagem (ex.: /media/ricardo/BACKUP-MAC).'
    echo ''
    return
  fi

  sudo bindfs -u $(id -u) -g $(id -g) $1 ~/macOS-HD
}

# Definições para o Linux
if [[ "$OSTYPE" == "linux-gnu" ]]; then
  # Verifica quais serviços estão rodando e quais portas estão abertas.
  alias used-ports='netstat -tunlp'

  # Firewall do ubunto com UFW.
  alias ufws='sudo ufw status numbered'
  alias ufwal='sudo ufw allow'
  alias ufwdn='sudo ufw deny'
  alias ufwdel='sudo ufw delete'
  alias ufwdno='sudo ufw deny out'
  alias ufwalf='sudo ufw allow from'
  alias ufwdnf='sudo ufw denu from'

  alias pbcopy='xclip -selection clipboard'
  alias pbpaste='xclip -selection clipboard -o'

  # Definições de ambiente para o banco de dados oracle.
  if [ -d "/opt/oracle" ]; then
    ORACLE_HOME=/opt/oracle
    LD_LIBRARY_PATH=/opt/oracle/instantclient_19_5
    TNS_ADMIN=/opt/oracle/instantclient_19_5/network/admin
    PATH=$PATH:/opt/oracle/instantclient_19_5
    CLASSPATH=$CLASSPATH:$ORACLE_HOME

    export NLS_LANG="BRAZILIAN PORTUGUESE_BRAZIL.WE8MSWIN1252"

    export ORACLE_HOME
    export LD_LIBRARY_PATH
    export TNS_ADMIN
    export PATH
    export CLASSPATH
  fi
fi

# npm aliases.
alias nb='npm run build'
alias nd='npm run dev'
alias nw='npm run watch'
alias nt='npm run test'
alias np='npm run production'
alias ns='npm start'
alias nsv='npm serve'
alias ni='npm install'
alias nid='npm install -D'
alias na='npm add'
alias nad='npm add -D'
alias nr='npm remove'
alias nx='npx'

# pnpm aliases.
alias pb='pnpm build'
alias pd='pnpm dev'
alias pw='pnpm watch'
alias pt='pnpm test'
alias pp='pnpm production'
alias ps='pnpm start'
alias psv='pnpm serve'
alias pi='pnpm install'
alias pa='pnpm add'
alias pad='pnpm add -D'
alias pr='pnpm remove'
alias px='pnpx'

# yarn aliases.
alias yb='yarn build'
alias yd='yarn dev'
alias yw='yarn watch'
alias yt='yarn test'
alias yp='yarn production'
alias ys='yarn start'
alias ysv='yarn serve'
alias ya='yarn add'
alias yad='yarn add -D'
alias yr='yarn remove'


# Docker
alias dk="docker"
alias dr="docker run"
alias drit="docker run -it"
alias dritrm="docker run -it --rm"
alias dps="docker ps"
alias dpsa="docker ps -a"
alias dpsas="docker ps -a -s"
alias dpss="docker ps -s"
alias dpsl="docker ps -l"
alias dimg="docker images"
alias dins="docker inspect"
alias dstart="docker start"
alias dstartia="docker start -i -a"
alias dstop="docker stop"
alias dexec="docker exec"
alias drm="docker rm"
alias drmall="docker rm -f $(docker ps -a -q)"
alias drmi="docker rmi"
alias drmiall="docker rmi -f $(docker images -q)"
alias dvc="docker volume create"
alias dvls="docker volume ls"
alias dvi="docker volume inspect"
alias dvrm="docker volume rm"
alias dvrmi="docker volume rmi"
alias dst="docker_statuses"

# Docker-Compose.
alias dc="docker-compose"
alias dcp="docker-compose pull"
alias dcu="docker-compose up -d"
alias dcd="docker-compose down"
alias dcdrmi="docker-compose down --rmi all"
alias dce="docker-compose exec"
alias dct="docker-compose top"
alias dcstart="docker-compose start"
alias dcstop="docker-compose stop"
alias dcl="docker-compose logs -f"

# GIT
# Inicialização do repositório.
alias {gi,git_init}='git init'
alias {gib,git_init_bare}='git init --bare'

# Gravação de arquivos.
alias {ga,git_add}='git add .'

# Realiza o commit no repositório git.
git_commit () {
  # Verifica se o parâmetro foi informado.
  if ! check_args $1; then
    echo 'Erro: Você não informou a mensagem descrevendo o commit do git.'
    echo ''
    return
  fi

  git commit -am $1
}

alias gc='git_commit'

# Verificação de estados.
alias {gb,git_branch}='git branch'
alias {gba,git_branch_all}='git branch --all'
alias {gs,git_status}='git status'
alias {gsr,git_status_resumed}='git status -s'
alias {gl,git_log}='git log'
alias {glpr,git_log_pretty_resumed}='git log --pretty=format:"%C(yellow)%h%Creset -%Cred%d%Creset %s %C(bold green)(%cr)%Creset %C(blue)<%an>"'
alias {glpo,git_log_pretty_oneline}='git log --pretty=oneline'
alias {glp,git_log_p}='git log -p'
alias {glt,git_log_time}='git log --pretty=format:"%h - %an, %cd : %s"'

# Definição para branchs.
alias {gch,git_checkout}='git checkout'
alias {gcb,git_checkout_new_branch}='git checkout -b'
alias {grb,git_remove_branch}='git branch -d'
alias {gm,git_merge}='git merge'
alias {gbm,git_branch_merged}='git branch --merged'
alias {gbmm,git_branch_merged_master}='git branch --merged master'
alias {gbnm,git_branch_no_merged}='git branch --no-merged'

# Cria um repositório local cujo destino aponta para um link simbólico para a pasta git-repositories do Dropbox.
git_create_local_repo () {
  # Verifica se o parâmetro foi informado.
  if ! check_args $1; then
    echo 'Erro: Você não informou o nome do repositório a ser criado.'
    echo ''
    return
  fi
  echo 'Criando o repositóio em git-repositories - local...'
  current_directory=$(pwd)
  mkdir -p ~/git-repositories/$1.git
  cd ~/git-repositories/$1.git
  git init --bare
  cd "$current_directory"
  echo ''
  echo 'Adicionando o repositório git-repositories - local...'
  git_remote_add_local $1
}

# Consulta de repositórios remotos.
alias {grmt,git_remote}='git remote -v'
alias {grso,git_remote_show_origin}='git remote show origin'
alias {grss,git_remote_show_sect}='git remote show sect'
alias {grsssh,git_remote_show_ssh}='git remote show ssh'
alias {grsl,git_remote_show_local}='git remote show local'
alias {grshd,git_remote_show_hd}='git remote show hd'
alias {grsid,git_remote_show_id}='git remote show id'


# Remoção de repositórios remotos.
alias {grro,git_remote_remove_origin}='git remote rm origin'
alias {grrs,git_remote_remove_sect}='git remote rm sect'
alias {grrssh,git_remote_remove_ssh}='git remote rm ssh'
alias {grrl,git_remote_remove_local}='git remote rm local'
alias {grrhd,git_remote_remove_hd}='git remote rm hd'
alias {grrid,git_remote_remove_id}='git remote rm id'

# Envio de arquivos para o repositório remoto.
alias {gpoa,git_push_origin_all}='git push -u origin --all'
alias {gpsa,git_push_sect_all}='git push -u sect --all'
alias {gpssha,git_push_ssh_all}='git push ssh --all'
alias {gpla,git_push_local_all}='git push local --all'
alias {gphda,git_push_hd_all}='git push hd --all'
alias {gpida,git_push_id_all}='git push id --all'

alias {gpsom,git_push_origin_master}='git push -u origin master'
alias {gpssm,git_push_sect_master}='git push -u sect master'
alias {gpssshm,git_push_ssh_master}='git push ssh master'
alias {gpslm,git_push_local_master}='git push local master'
alias {gpshdm,git_push_hd_master}='git push hd master'
alias {gpsidm,git_push_id_master}='git push id master'

alias {gpso,git_push_origin}='git push -u origin $(git describe --contains --all HEAD)'
alias {gpss,git_push_sect}='git push -u sect $(git describe --contains --all HEAD)'
alias {gpsssh,git_push_ssh}='git push ssh $(git describe --contains --all HEAD)'
alias {gpsl,git_push_local}='git push local $(git describe --contains --all HEAD)'
alias {gpshd,git_push_hd}='git push hd $(git describe --contains --all HEAD)'
alias {gpsid,git_push_id}='git push id $(git describe --contains --all HEAD)'
alias {gp,git_push}='git push'


# Recebimento de arquivos do repositório remoto.
alias {gf,git_fetch}='git fetch'
alias {gfo,git_fetch_origin}='git fetch origin'
alias {gfs,git_fetch_sect}='git fetch sect'
alias {gfssh,git_fetch_ssh}='git fetch ssh'
alias {gfl,git_fetch_local}='git fetch local'
alias {gfhd,git_fetch_hd}='git fetch hd'
alias {gfid,git_fetch_id}='git fetch id'

alias {gplo,git_pull_origin}='git pull origin $(git describe --contains --all HEAD)'
alias {gpls,git_pull_sect}='git pull sect $(git describe --contains --all HEAD)'
alias {gplssh,git_pull_ssh}='git pull ssh $(git describe --contains --all HEAD)'
alias {gpll,git_pull_local}='git pull local $(git describe --contains --all HEAD)'
alias {gplhd,git_pull_hd}='git pull hd $(git describe --contains --all HEAD)'
alias {gplid,git_pull_id}='git pull id $(git describe --contains --all HEAD)'

# Clonar um repositórito para o caminho atual.
alias {gclone,git_clone}='git clone'

# Listar as modificações realizadas em um determinado arquivo.
alias {gd,git_diff}='git diff'
alias {gdro,git_diff_remote_origin}='git diff $(git describe --contains --all HEAD) origin/$(git describe --contains --all HEAD)'
alias {gdrs,git_diff_remote_sect}='git diff $(git describe --contains --all HEAD) sect/$(git describe --contains --all HEAD)'
alias {gdrssh,git_diff_remote_ssh}='git diff $(git describe --contains --all HEAD) ssh/$(git describe --contains --all HEAD)'
alias {gdrl,git_diff_remote_local}='git diff $(git describe --contains --all HEAD) local/$(git describe --contains --all HEAD)'
alias {gdrhd,git_diff_remote_hd}='git diff $(git describe --contains --all HEAD) hd/$(git describe --contains --all HEAD)'
alias {gdrid,git_diff_remote_id}='git diff $(git describe --contains --all HEAD) id/$(git describe --contains --all HEAD)'

# Remove do repositório local um arquivo que tenha sido apagado fisicamente.
alias {gr,git_remove}='git rm'


# Criação de Tags anotadas.
git_create_anoted_tag () {
  # Verifica se o parâmetro foi informado.
  if ! check_args $1; then
    echo 'Erro: Você precisa informar a versão da tag.'
    echo ''
    return
  fi

  # Verifica se o parâmetro foi informado.
  if ! check_args $2; then
    echo 'Erro: Você precisa informar a anotação da tag.'
    echo ''
    return
  fi
  git tag -1 $1 -m $2
}

# Criação de Tags leves.
alias git_create_tag='git tag'

# Listando as tags.
alias {gt,git_tag}='git tag'

# Detalhando uma tag.
alias git_show='git show'

# Sequelize Commands
alias {sqdbc,sequelize_db_create}='yarn sequelize db:create'
alias {sqdbd,sequelize_db_drop}='yarn sequelize db:drop'

alias {sqdbm,sequelize_db_migrate}='yarn sequelize db:migrate'
alias {sqdbms,sequelize_db_migrate_status}='yarn sequelize db:migrate:status'

alias {sqdbsd,sequelize_db_seed}='yarn sequelize db:seed'
alias {sqdbsdu,sequelize_db_seed_undo}='yarn sequelize db:seed:undo'
alias {sqdbsda,sequelize_db_seed_all}='yarn sequelize db:seed:all'
alias {sqdbsdua,sequelize_db_seed_undo_all}='yarn sequelize db:seed:undo:all'

alias {sqdbrb,sequelize_db_rollback}='yarn sequelize db:migrate:undo'
alias {sqdbrba,sequelize_db_rollback_all}='yarn sequelize db:migrate:undo:all'

# Shell shortcuts
alias cdv='cd ~/.vim'
alias cdeb='cd ~/Documents/Estudos\ Bíblicos'

alias cds='cd ~/Desenvolvimento/Sites'
alias cdp='cd ~/Desenvolvimento/Projetos'
alias cdd='cd ~/Dados/Downloads'
alias cddc='cd ~/Desenvolvimento/Projetos/docker'
alias cdr='cd ~/Desenvolvimento/Projetos/rocketseat-projects'
alias cdf='cd ~/Desenvolvimento/Projetos/flutter-projects'
alias cdrg='cd ~/Desenvolvimento/Projetos/rocketseat-projects/gostack-11/projetos'
alias cdss='cd ~/Desenvolvimento/Projetos/search-projects'
alias cdb='cd ~/Desenvolvimento/Projetos/boxapp'
alias cdapi='cd ~/Desenvolvimento/Projetos/apd-project/apd_api'
alias cdcli='cd ~/Desenvolvimento/Projetos/apd-project/apd-client'
alias edv='code ~/.vimrc'
alias edb='code ~/.bash_profile'
alias edz='code ~/.zshrc'
alias edh='code /etc/hosts'
alias ede='code ~/.config/espanso/default.yml'
# alias ede='code ~/.local/share/espanso/default.yml'
alias vimo='vim -O '
alias edt='code ~/.tmuxinator/.'


export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

export JAVA_HOME=/home/ricardo/.sdkman/candidates/java/current
export JDK_HOME=/home/ricardo/.sdkman/candidates/java/current

export PATH=$PATH:~/Applications/android-studio/bin
export ANDROID_HOME=~/Android/Sdk
export ANDROID_SDK_ROOT=~/Android/Sdk
export CAPACITOR_ANDROID_STUDIO_PATH=$ANDROID_HOME

export PATH=$PATH:$ANDROID_HOME/build-tools/30.0.2
export PATH=$PATH:$ANDROID_HOME/emulator
export PATH=$PATH:$ANDROID_HOME/platform-tools
export PATH=$PATH:$ANDROID_HOME/tools
export PATH=$PATH:$ANDROID_HOME/tools/bin

export FVM_HOME=~/fvm
export PATH="$PATH":"$HOME/.pub-cache/bin"
export PATH="$PATH":"$HOME/fvm/default/bin"

export MAVEN_PROFILE=cert.ap

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true

# FIX for FATAL ERROR: Ineffective mark-compacts near heap limit Allocation failed - JavaScript heap out of memory
export NODE_OPTIONS=--max-old-space-size=8192
export ELECTRON_TRASH=gio

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/home/ricardo/.sdkman"
[[ -s "/home/ricardo/.sdkman/bin/sdkman-init.sh" ]] && source "/home/ricardo/.sdkman/bin/sdkman-init.sh"

# Fix espanso
espanso restart
clear

