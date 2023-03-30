# Tab for auto complete
bindkey '\t' autosuggest-accept

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

zle -N autosuggest_partial_charwise 
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

# IBM DB2
if [ -f /home/cleff/sqllib/db2profile ]; then
    . /home/cleff/sqllib/db2profile
fi

# Import oh-my-zsh plugins
plugins=(git sudo zsh-autosuggestions zsh-syntax-highlighting zsh-abbr)

source $ZSH/oh-my-zsh.sh
