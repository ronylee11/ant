function abbr_init --description 'Initializes abbreviations'
    abbr -a -- y yay # imported from a universal variable, see `help abbr`
    abbr -a -- p 'sudo pacman' # imported from a universal variable, see `help abbr`
    abbr -a -- s systemctl # imported from a universal variable, see `help abbr`
    abbr -a -- gc 'git clone'
end
