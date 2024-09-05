
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

source $ZSH/oh-my-zsh.sh

# Save completion cache files outside of the main home directory
ZSH_COMPDUMP="$XDG_CACHE_HOME/.zcompdump"

# Add timestamps to history wrapper
HIST_STAMPS="yyyy-mm-dd"

export ZPLUG_HOME=/opt/homebrew/opt/zplug
source $ZPLUG_HOME/init.zsh

# Install plugins if there are plugins that have not been installed
if ! zplug check --verbose; then
    zplug install
fi

# install powerlevel10k
zplug "romkatv/powerlevel10k", as:theme, depth:1
# oh-my-zsh plugins
zplug plugins/git,   from:oh-my-zsh, defer:3
zplug plugins/z,   from:oh-my-zsh
# defer means to load this plugin after all the other plugins
zplug zdharma-continuum/fast-syntax-highlighting, defer:2
# command auto-suggestion based on history
zplug zsh-users/zsh-autosuggestions

# let zplug manage itself
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# Then, source plugins and add commands to $PATH
zplug load
