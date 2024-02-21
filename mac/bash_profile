# ----------------------------------------------------------------------------
# Setting command prompt and ls colors
# ----------------------------------------------------------------------------
# Set prompt to format
# <user>@<host> <directory> (<git branch>)
# >
PS1='\u@\h \[\e[32m\]\W \[\e[91m\]$(parse_git_branch)\[\e[00m\]\n\[\e[38;5;208m\]>\[\e[00m\] '
export CLICOLOR=1 # Make `ls` show colors
export LSCOLORS=Gxfxcxdxbxegedabagacad # Color settings
export BASH_SILENCE_DEPRECATION_WARNING=1 # Prevent warning message about zsh
export ANDROID_HOME='/Users/pete/Library/Android/sdk/'
export ELEARNING_REPO_PATH='/Users/pete/git/tlc/elearning-platform'
export WWW_PATH='/Applications/MAMP/htdocs'

# ----------------------------------------------------------------------------
# Bash Completion
# ----------------------------------------------------------------------------
[ -f /usr/local/etc/bash_completion ] && . /usr/local/etc/bash_completion
[ -f ~/.git-completion.bash ] && . ~/.git-completion.bash

# ----------------------------------------------------------------------------
# PATHs
# ----------------------------------------------------------------------------
# In order to call `subl` from the command line
export PATH="/Applications/Sublime Text.app/Contents/SharedSupport/bin:$PATH"
export PATH="/Applications/MAMP/bin/php/php7.4.33/bin/:$PATH"
# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
    PATH="$HOME/bin:$PATH"
fi

# ----------------------------------------------------------------------------
# Functions
# ----------------------------------------------------------------------------
# Get git branch of current working directory repo
parse_git_branch() {
     git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}

# ----------------------------------------------------------------------------
# Node Version Manager (NVM)
# ----------------------------------------------------------------------------
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Load Angular CLI autocompletion.
source <(ng completion script)

# ----------------------------------------------------------------------------
# Aliases
# ----------------------------------------------------------------------------
alias ls='ls -G' # enable colorized output by default
alias ll='ls -lah' # l: long format, a: include hidden dot files, h: use unit suffixes
alias cdelearning='cd ~/git/tlc/elearning-platform'
alias cdrepaircafe='cd ~/git/personal/RepairCafeMobile'
alias cdtrcapp='cd ~/git/personal/trc-app'
# alias docker-rmi-dangling="docker rmi $(docker images -qa -f 'dangling=true')"