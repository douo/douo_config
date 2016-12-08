
export ALTERNATE_EDITOR=""
export EDITOR="emacsclient -t"                  # $EDITOR should open in terminal
export VISUAL="emacsclient -c -a emacs"         # $VISUAL opens in GUI with non-daemon as alternate

alias emx="emacsclient -t"                      # used to be "emacs -nw"
alias smx="sudo emacsclient -t"                # used to be "sudo emacs -nw"
alias emxc="emacsclient -c -a emacs"           # new - opens the GUI with alternate non-daemon
