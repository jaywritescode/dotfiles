#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...

setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_REDUCE_BLANKS
setopt NUMERIC_GLOB_SORT
setopt RM_STAR_WAIT

eval "$(thefuck --alias)"

export EDITOR=emacs
export PATH="/usr/local/opt/python/libexec/bin:$PATH"
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

zplug "zsh-users/zsh-history-substring-search", defer:2
zplug "zsh-users/zsh-completions"
zplug "zsh-users/zsh-syntax-highlighting", defer:1
zplug "modules/git", from:prezto
# zplug "modules/fasd", from:prezto
zplug "modules/osx", from:prezto
zplug "modules/docker", from:prezto
zplug "changyuheng/zsh-interactive-cd"
zplug "chauncey-garrett/zsh-prompt-garrett", use:prompt_garrett_setup, as:theme
zplug "supercrabtree/k"

if ! zplug check --verbose; then
   printf "Install? [y/N]: "
   if read -q; then
      echo; zplug install
   fi
fi

zplug load

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

test -e "${HOME}/.iterm2_shell_integration.zsh" && source "${HOME}/.iterm2_shell_integration.zsh"

alias 'gs=git status'
alias 'ls= ls -lGp'
alias 'cd= cd'
