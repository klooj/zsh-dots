
# __________
#/ 	FZF 	\
alias fp="fzf --bind='enter:execute(nvim {})'"

# alias -g fZ='| fzf'

# history
# alias fh="print -z $( ([ -n $ZSH_NAME ] && fc -l 1 || history) | fzf +s --tac | sed -r 's/ *[0-9]*\*? *//' | sed -r 's/\\/\\\\/g')"
alias hfz='fc -il 0 | fzf'
