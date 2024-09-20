
## Bind right arrow key to forward-char like in fish

# Remove "forward-char" widgets from "ACCEPT".
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#forward-char}")
ZSH_AUTOSUGGEST_ACCEPT_WIDGETS=("${(@)ZSH_AUTOSUGGEST_ACCEPT_WIDGETS:#vi-forward-char}")

# Add "forward-char" widgets to "PARTIAL_ACCEPT".
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(forward-char)
ZSH_AUTOSUGGEST_PARTIAL_ACCEPT_WIDGETS+=(vi-forward-char)

# Add a custom widget to complete partially.
autosuggest_partial_charwise() {
    zle forward-char
}

#zle -N autosuggest_partial_charwise 
bindkey "${terminfo[kcuf1]}" autosuggest_partial_charwise

# Add "autosuggest_partial_charwise" to "IGNORE".
ZSH_AUTOSUGGEST_IGNORE_WIDGETS+=(autosuggest_partial_charwise)

# Keybinding for Alt+s prepend sudo
bindkey -M emacs "^[s" sudo-command-line

##

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load --- can set to "random"
ZSH_THEME="robbyrussell"

# Uncomment the following line to use case-sensitive completion.
CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
zstyle ':omz:update' frequency 13

# Aliases
alias c="clear"
alias cl="clear"

# Import oh-my-zsh plugins
plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting zsh-abbr)

source $ZSH/oh-my-zsh.sh

# Tab for auto complete
bindkey '^I'   autosuggest-accept

# >>> conda initialize >>>
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/opt/anaconda3/bin/conda' 'shell.bash' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/opt/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/opt/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/opt/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup
# <<< conda initialize <<<
