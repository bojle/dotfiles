# Created by newuser for 5.8

PROMPT='%B%F{214}%4~%f %(?.%F{15}λ%f.%F{196}λ%f)%b '
# History Configuration 
HISTFILE=${ZDOTDIR:-$HOME}/.zsh_history
SAVEHIST=5000
HISTSIZE=2000
setopt SHARE_HISTORY
setopt APPEND_HISTORY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY
# expire duplicates first
setopt HIST_EXPIRE_DUPS_FIRST 
# # do not store duplications
setopt HIST_IGNORE_DUPS
# #ignore duplicates when searching
setopt HIST_FIND_NO_DUPS
# # removes blank lines from history
setopt HIST_REDUCE_BLANKS

setopt NO_CASE_GLOB

source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/zsh-z/zsh-z.plugin.zsh
source ~/.zsh/zsh.functions
source ~/.zsh/zsh.alias

## Vi mode
set -o vi
bindkey -M viins "^E" end-of-line
bindkey -M viins "^A" beginning-of-line
bindkey -M viins "^P" up-history
bindkey -M viins "^N" down-history

#[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
