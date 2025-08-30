# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Save completion cache files outside of the main home directory
ZSH_COMPDUMP="$XDG_CACHE_HOME/.zcompdump"

# Add timestamps to history wrapper
HIST_STAMPS="yyyy-mm-dd"

source $ZSH/oh-my-zsh.sh

export ZPLUG_HOME="$HOME/.zplug"
source $ZPLUG_HOME/init.zsh

# This speeds up pasting w/ autosuggest
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish

# install powerlevel10k
zplug "romkatv/powerlevel10k", as:theme, depth:1
# oh-my-zsh plugins
zplug plugins/git,   from:oh-my-zsh, defer:3
zplug plugins/z,   from:oh-my-zsh, defer:3
zplug plugins/direnv,   from:oh-my-zsh, defer:3
# defer means to load this plugin after all the other plugins
zplug zdharma-continuum/fast-syntax-highlighting, defer:2
# command auto-suggestion based on history
zplug zsh-users/zsh-autosuggestions, defer:3

# let zplug manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    zplug install
fi

# Then, source plugins and add commands to $PATH
zplug load
