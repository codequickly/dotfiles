#PROMPT='%{$fg[magenta]%}%n%{$reset_color%} at %{$fg[yellow]%}%m%{$reset_color%}' # default prompt
PROMPT='%F{magenta}%~%f$ ' # default prompt
#RPROMPT='%F{magenta}[%n@%m]%f' # right prompt

#uses emacs
bindkey -e

# uses vi key binding. 
#export EDITOR="vi"
# either export or bindkey -v 
#bindkey -v
# However, using vi binding breaks Ctrl-R
# Fix:
# bindkey -M viins '^r' history-incremental-search-backward
# bindkey -M vicmd '^r' history-incremental-search-backward
# OR
# bindkey '^r' history-incremental-search-backward

#aliases
alias ls="ls -GF"
##zsh specific options

