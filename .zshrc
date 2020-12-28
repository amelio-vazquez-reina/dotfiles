# Please note that we set HISTFILE in this file (.zshrc) because somehow if we set it in .my_zshenv it doesn't work
DROPBOX=$HOME/Dropbox/meli
HISTFILE="$DROPBOX/config_files/.zhistory_${MACHINE_NAME}"
echo "HISTFILE is "$HISTFILE

# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
################################################################
# https://htr3n.github.io/2018/07/faster-zsh/
# Helping profile this file
zmodload zsh/zprof

################################################################
# +++++++++ NOTE ++++++++++++++++
# Between .zshenv and .zshrc, OS X calls /etc/.zprofile which calls path_helper, which itself 
# recreates PATH using /etc/paths and /etc/paths.d

# As a result, we reload PATH again
source ~/.zshrc.paths
################################################################

# https://github.com/conda/conda/issues/7267
unset SUDO_UID SUDO_GID SUDO_USER

export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
# ZSH_THEME="ys_avazquez"
# source /usr/local/opt/powerlevel9k@0.6.3/powerlevel9k.zsh-theme
ZSH_THEME="powerlevel9k/powerlevel9k"
POWERLEVEL9K_PROMPT_ON_NEWLINE=true

# Advanced `vcs` color customization
POWERLEVEL9K_VCS_CLEAN_FOREGROUND='blue'
POWERLEVEL9K_VCS_CLEAN_BACKGROUND='black'
POWERLEVEL9K_VCS_UNTRACKED_FOREGROUND='yellow'
POWERLEVEL9K_VCS_UNTRACKED_BACKGROUND='black'
POWERLEVEL9K_VCS_MODIFIED_FOREGROUND='red'
POWERLEVEL9K_VCS_MODIFIED_BACKGROUND='black'

POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(anaconda context dir vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status root_indicator background_jobs history time)
POWERLEVEL9K_ANACONDA_BACKGROUND='yellow'

POWERLEVEL9K_MODE="nerdfont-complete"

# echo " "
# echo $PATH | tr ':' '\n'
# ZSH_THEME=ys
# ZSH_THEME="powerlevel9k/powerlevel9k"

# Set list of themes to load
# Setting this variable when ZSH_THEME=random
# cause zsh load theme from this variable instead of
# looking in ~/.oh-my-zsh/themes/
# An empty array have no effect
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

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
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
# plugins=(
#   git
# )

################################################################
# We use antibody as the Zsh package manager
################################################################
# I installed antibody using brew, more specifically:
# brew install getantibody/tap/antibody
# https://getantibody.github.io/
# Loading plugins:
# This step can technically be done separately
# Remember antibody doesn't require pre-downloading anything. 
# FIRST DO: antibody bundle < ~/.zsh_plugins > ~/.zsh_plugins.sh
source $HOME/.zsh_plugins.sh

plugins=(
    git
## git-prompt
    autojump
    z
    gitignore
    command-not-found
    history-substring-search
    git-extras
    mvn
    pep8
    # Remember that this extension needs to be installed with 
    # git clone https://github.com/zsh-users/zsh-syntax-highlighting
    zsh-syntax-highlighting
    zsh-autosuggestions
    extract
)
################################################################

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

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# unalias run-help
# autoload run-help
# HELPDIR=/usr/local/share/zsh/help



# Using Z (dir navigation)
# https://github.com/rupa/z/issues/229
  . /usr/local/etc/profile.d/z.sh

# For AutoJump (For some reason brew doesn't work in .zshenv)
[[ -s $(brew --prefix)/etc/profile.d/autojump.sh ]] && . $(brew --prefix)/etc/profile.d/autojump.sh

compinit -d ~/.cache/zsh/zcompdump-$ZSH_VERSION

# These aliases are defined in .zshenv
pgh
# dxgh
export TERM="xterm-256color"
alias code="code-insiders"


################################################################
# Shell options in genearl
################################################################
#allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# Changes definition how things are split in parameters (variables)
# See the zsh guide in 2003 for a food example!
# ZSH does not automatically split unless we enable the above....
setopt shwordsplit

autoload -U select-word-style
# select-word-style shell
select-word-style bash # Split between directories

## keep background processes at full speed
setopt NOBGNICE
## restart running processes on exit
#setopt HUP

autoload run-help
setopt NO_BEEP
setopt AUTO_PUSHD

# Remember, we don't symlink this file, we just point directly to the repo
HISTSIZE=SAVEHIST=100000
#setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY

setopt SHARE_HISTORY
setopt EXTENDED_HISTORY
setopt HIST_IGNORE_DUPS

# Extended globbing:
setopt EXTENDED_GLOB

## never ever beep ever
setopt NO_BEEP

## automatically decide when to page a list of completions
#LISTMAX=0

## disable mail checking
#MAILCHECK=0

# Display CPU usage stats for commands taking more than 10 seconds
REPORTTIME=10

# Calc
autoload -U zcalc

# ################################################################################
# Prompt and colors: Make sure we don't have anything like auto prompt enabled!
# ################################################################################

# Enable easy colors in shell
autoload -U colors
colors

### NOTE that we do this again BECAUSE we just updated paths again!
# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$($CONDA'/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    echo "Running conda_setup (again, as part of .my_zshenv)"
    eval "$__conda_setup"
else
    if [ -f "$CONDA_ROOT/etc/profile.d/conda.sh" ]; then
        . "$CONDA_ROOT/etc/profile.d/conda.sh"
    else
        export PATH="$CONDA:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<

# Note that we are in .zshrc, and we are currently not issuing this command in .zshenv or .my_zshenv
conda activate py38