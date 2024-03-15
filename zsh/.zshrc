# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH
autoload bashcompinit
autoload vnc
bashcompinit

# For flutter
export PATH=$HOME/Applications/flutter/bin:$PATH
export PATH=$HOME/Applications/android/cmdline-tools/3.0/bin:$PATH

export ANDROID_SDK_ROOT=$HOME/Applications/Android
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/tools:$PATH
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/tools/bin:$PATH
export PATH=$ANDROID_SDK_ROOT/cmdline-tools/tools/lib:$PATH
export PATH=$ANDROID_SDK_ROOT/platform-tools:$PATH
export PATH=$ANDROID_SDK_ROOT/emulator:$PATH
# Java
export JAVA_HOME=/usr/lib/jvm/java-11-openjdk-amd64
export PATH=$JAVA_HOME/bin:$PATH
export PATH=~/.npm-global/bin:$PATH

# local bin
# export PATH=~/.local/bin:$PATH
export PATH="$HOME/.local/bin:$PATH"

# export PATH="$PATH:`pwd`/flutter/bin"

# Path to your oh-my-zsh installation.
export ZSH="${HOME}/.oh-my-zsh"
# export TERM=screen-256color
# ryan
export TERM="xterm-256color"
export DISPLAY=:0

GLFW_IM_MODULE=ibus

# for neovide
# export LUNARVIM_RUNTIME_DIR="${LUNARVIM_RUNTIME_DIR:-"$HOME/.local/share/lunarvim"}"
# export LUNARVIM_CONFIG_DIR="${LUNARVIM_CONFIG_DIR:-"$HOME/.config/lvim"}"
# export LUNARVIM_CACHE_DIR="${LUNARVIM_CACHE_DIR:-"$HOME/.cache/lvim"}"
# export LUNARVIM_BASE_DIR="${LUNARVIM_BASE_DIR:-"$HOME/.local/share/lunarvim/lvim"}"

# exec neovide -- -u "$LUNARVIM_BASE_DIR/init.lua" "$@"



# ryan
alias tmux="tmux -2"
# export TERM=xterm-256color
# export TERM=screen-256color-bce

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="robbyrussell"
# ZSH_THEME="agnoster"
# ZSH_THEME="powerlevel10k/powerlevel10k"

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
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
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
plugins=(zsh-autosuggestions zsh-syntax-highlighting zsh-completions)
# plugins=(git)
autoload -U compinit && compinit
# bindkey '\e' autosuggest-accept
# bindkey <esc> autosuggest-accept
# bindkey '\e' autosuggest-accept
# bindkey '^ ' autosuggest-accept

source $ZSH/oh-my-zsh.sh
bindkey '^y' autosuggest-accept
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'

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
#
alias ls="ls --color=auto"
alias oebuilddir="cd /home/jungyongchoi/oe-server2/build"
alias builddir="/home/jungyongchoi/build/o22/build-starfish"
alias gtestbuild="/home/jungyongchoi/build/gtest2_build/build-starfish"
alias buildamp='bitbake lib32-audio-adaptation-layer-amplifier -C configure'
alias builddelay='bitbake lib32-audio-adaptation-layer-delay-gain -C configure'
alias buildse='bitbake lib32-audio-adaptation-layer-soundengine -C configure'
alias oeaudiodcode='cd /home/jungyongchoi/oe-server2/codes/audiod-pro'
alias oecode='cd ~/oe-server2/codes'
alias audiodcode='cd /home/jungyongchoi/codes/audiod-pro'
# alias gtestaudiod='cd /home/jungyongchoi/oe-server2/code_jcl4tv/gtest_audiod/audiod-pro'
alias gtestaudiod='cd /home/jungyongchoi/codes/gtest_audiod/audiod-pro'
# alias pulsecode='cd /home/jungyongchoi/oe-server2/code_jcl4tv/pulseaudio-webos'
# alias aodcode='cd /home/jungyongchoi/oe-server2/code_jcl4tv/audiooutputd-pro'
alias aodcode='cd /home/jungyongchoi/codes/audiooutputd-pro'
# alias dockeraudiod='cd /home/jungyongchoi/oe-server2/work/audiod-pro'
# alias dockerumi='cd /home/jungyongchoi/oe-server2/work/umi-pro'
alias testaudiod='cd /home/jungyongchoi/codes/test_audiod/audiod-pro'
# alias testaudiod='cd /home/jungyongchoi/oe-server2/code_jcl4tv/audiod_test/audiod-pro'
alias umicode='cd /home/jungyongchoi/codes/umi-pro'
alias oeumicode='cd /home/jungyongchoi/oe-server2/codes/umicode/umi-pro'
alias pulsecode='cd /home/jungyongchoi/codes/pulseaudio-webos'
# alias umicode='cd /home/jungyongchoi/oe-server2/code_jcl4tv/umicode/umi-pro'
alias log='cd /home/jungyongchoi/log'
alias copylog='cp /home/jungyongchoi/analyser_log/*.py  /home/jungyongchoi/analyser_log/*.sh ./'
alias cpextlog='cp /home/jungyongchoi/analyser_log/extinput/*.py ./'
alias cd....='cd ../..'
alias cd..='cd ..'
# alias python='python3'
# alias pip='python3 -m pip'
# alias python3='python'
alias dev='cd ~/share/dev'
alias algo2='cd ~/share/dev/algorithm_data_structure/c_algorithm_2'
alias moe='source ~/mount-oeserver.sh'
# alias autotest='cd /home/jungyongchoi/oe-server2/automation-tests'
alias autotest='cd /home/jungyongchoi/codes/automation-tests'
alias worklog='cd /home/jungyongchoi/local_share/helperForDevOps'
alias dotfile='cd /home/jungyongchoi/.dotfiles'
#alias vi='~/nvim.appimage'
# alias vi='~/nvim.appimage'
# alias vim='~/nvim.appimage'
# alias vi='nvim'
# alias vi='nvim'
alias lvim='~/.local/bin/lvim'
alias vi='~/.local/bin/lvim'
# alias vi='neovide --neovim-bin ~/.local/bin/lvim --multigrid --maximized --frame none'
alias flake8="python3 -m flake8"

# alias svi='sudo ~/nvim.appimage'
# alias svim='sudo ~/nvim.appimage'
alias gp='git pull'
alias lcov='~/local/bin/lcov'
alias myoe='ssh -p 1804 jungyong.choi@156.147.61.82'
# alias kitty='GLFW_IM_MODULE=ibus exec /usr/bin/kitty'
# alias tmux='tmux -2'

# type emulate >/dev/null 2>/dev/null || alias emulate=true

function push()
{
    git push origin HEAD:refs/for/$1;
}

function comp()
{
    bitbake $1 -C compile;
}

function confi()
{
    bitbake $1 -C configure;
}

function br()
{
    git branch -a | grep $1;
}

function ext()
{
  if [ -f $1.tgz ]
  then
    mkdir $1 && tar -zxvf $1.tgz -C $1 && cd $1
  else
    echo "there was no file"
  fi
}

function extn()
{
  if [ -f $1.tar.gz ]
  then
    mkdir $1 && tar -zxvf $1.tar.gz -C $1 && cd $1
  else
    echo "there was no file"
  fi
}

# function extract
# {
  # echo $1
  # local filename dirname
  # local filename = $1
  # echo $filename
  # echo "$filename"
  # local dirname = $(echo $filename | cut -d'.' -f 1)
  # echo 'dirname: "$(dirname)"'
  # mkdir "./$dirname"
  # tar -xzvf ./"$filename" -C ./"$dirname"
  # cd ./"$dirname"
# }



# function gc()
# {
# 	git checkout $1;
# }
#function gc()
#{
#    # emulate -L ksh
#    # ref=$(git symbolic-ref HEAD 2> /dev/null) || return
#    #
#    # echo $(git checkout "$1")
#	git checkout $1;
#}
alias gc='git checkout'
alias gs='git status'
alias gm='git commit -m'
alias gd='git diff'
alias gma='git commit --amend'
alias gr='git reset --hard HEAD~3 && git pull'
alias gau='git add -u'
alias gaa='git add --all'

function del()
{
   rm -rf *.pyc
}
#source "/home/jungyongchoi/mount-oeserver.sh"
# export EDITOR='~/nvim.appimage'
# export VISUAL='~/nvim.appimage'
# export BAT_THEME="onedark"
# export EDITOR=nvim
# export VISUAL=nvim
export EDITOR='~/.local/bin/lvim'
export VISUAL='~/.local/bin/lvim'

# source /usr/share/powerlevel9k/powerlevel9k.zsh-theme
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status virtualenv)

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
if [ -e /home/jungyongchoi/.nix-profile/etc/profile.d/nix.sh ]; then . /home/jungyongchoi/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
