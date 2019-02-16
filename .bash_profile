# ls color
alias ls='ls -G'

# colors
RED='\[\e[1;31m\]'
BOLDYELLOW='\[\e[1;33m\]'
GREEN='\[\e[0;32m\]'
BLUE='\[\e[1;34m\]'
DARKBROWN='\[\e[1;33m\]'
DARKGRAY='\[\e[1;30m\]'
CUSTOMCOLORMIX='\[\e[1;30m\]'
DARKCUSTOMCOLORMIX='\[\e[1;32m\]'
LIGHTBLUE="\[\033[1;36m\]"
PURPLE='\[\e[1;35m\]'
NC='\[\e[0m\]'

parse_git_branch() {
 git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export -f parse_git_branch

# set colored bash
PS1="${LIGHTBLUE}\\u ${BOLDYELLOW}[\\w] ${PURPLE}\$(parse_git_branch)${DARKCUSTOMCOLORMIX}\n$ ${NC}"

#for bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  source $(brew --prefix)/etc/bash_completion
fi

# nvm
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
nvm use v10.15.0

# use git
export PATH="/usr/local/Cellar/git/2.20.1/bin:$PATH"

# pipenv
eval "$(pipenv --completion)"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/kokishibata/.sdkman"
[[ -s "/Users/kokishibata/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/kokishibata/.sdkman/bin/sdkman-init.sh"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/kokishibata/develop/tools/google-cloud-sdk/path.bash.inc' ]; then . '/Users/kokishibata/develop/tools/google-cloud-sdk/path.bash.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/kokishibata/develop/tools/google-cloud-sdk/completion.bash.inc' ]; then . '/Users/kokishibata/develop/tools/google-cloud-sdk/completion.bash.inc'; fi
