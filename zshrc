
# load librairies
for lib in ~/.zsh/lib/*; do
  source $lib
done

# load prompt
source ~/.zsh/prompt/zprompt.zsh


# load our own completion functions
fpath=(~/.zsh/completion $fpath)

# completion
autoload -U compinit
compinit

# load custom executable functions
for function in ~/.zsh/functions/*; do
  source $function
done

# extra files in ~/.zsh/configs/pre , ~/.zsh/configs , and ~/.zsh/configs/post
# these are loaded first, second, and third, respectively.
_load_settings() {
  _dir="$1"
  if [ -d "$_dir" ]; then
    if [ -d "$_dir/pre" ]; then
      for config in "$_dir"/pre/**/*(N-.); do
        . $config
      done
    fi

    for config in "$_dir"/**/*(N-.); do
      case "$config" in
        "$_dir"/pre/*)
          :
          ;;
        "$_dir"/post/*)
          :
          ;;
        *)
          if [ -f $config ]; then
            . $config
          fi
          ;;
      esac
    done

    if [ -d "$_dir/post" ]; then
      for config in "$_dir"/post/**/*(N-.); do
        . $config
      done
    fi
  fi
}
_load_settings "$HOME/.zsh/configs"
# makes color constants available
autoload -U colors
colors

# enable colored output from ls, etc
export CLICOLOR=1

# history settings
setopt hist_ignore_all_dups inc_append_history
HISTFILE=~/.zhistory
HISTSIZE=4096
SAVEHIST=4096

# awesome cd movements from zshkit
setopt autocd autopushd pushdminus pushdsilent pushdtohome cdablevars
DIRSTACKSIZE=5

# Enable extended globbing
setopt extendedglob

# Allow [ or ] whereever you want
unsetopt nomatch

# No Beep
setopt NO_BEEP

# vi mode
bindkey -v
bindkey "^F" vi-cmd-mode
bindkey jj vi-cmd-mode

# handy keybindings
bindkey "^A" beginning-of-line
bindkey "^E" end-of-line
bindkey "^R" history-incremental-search-backward
bindkey "^P" history-search-backward
bindkey "^Y" accept-and-hold
bindkey "^N" insert-last-word
bindkey -s "^T" "^[Isudo ^[A" # "t" for "toughguy"

# use vim as the visual editor
export VISUAL=vim
export EDITOR=$VISUAL

# load rbenv if available
#if which rbenv &>/dev/null ; then
#  eval "$(rbenv init - --no-rehash)"
#fi

# load thoughtbot/dotfiles scripts
export PATH=~/bin:/usr/local/bin:/usr/local/share/npm/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/X11/bin:/Users/gabriel/.rvm/bin:/usr/local/sbin
export PYTHONPATH=/usr/local/lib/python2.7/site-packages:$PYTHONPATH
export PATH="$HOME/.bin:$PATH"
#terraform
export ATLAS_TOKEN="YKFKmfh8xzdSs2-PZRqBmHQRZx3Us1sF4WdsCuRuv9asN_TDG85kexo_m6M8wfEdZUY"


# mkdir .git/safe in the root of repositories you trust
export PATH=".git/safe/../../bin:$PATH"

# settings environment variable 
export LANG="en_US.UTF-8"
export LC_COLLATE="en_US.UTF-8"
export LC_CTYPE="en_US.UTF-8"
export LC_MESSAGES="en_US.UTF-8"
export LC_MONETARY="en_US.UTF-8"
export LC_NUMERIC="en_US.UTF-8"
export LC_TIME="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

# Install go
export GOPATH=$HOME/golang
export GOROOT=/usr/local/opt/go/libexec
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:$GOROOT/bin

bindkey -e
bindkey '^[[1;9C' forward-word
bindkey '^[[1;9D' backward-word


#[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm" # This loads RVM into a shell session.
#if [[ -e "./.rvmrc" ]]; then
#  source ".rvmrc"
#fi

# aliases
[[ -f ~/.aliases ]] && source ~/.aliases

# Local pretzo config
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi
