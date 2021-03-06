# these are sourced after my own plugins in .zshrc, and the recompile script makes use of the variable.

export externalplugs=(
	$FOOZ/forgit/forgit.plugin.zsh
	$FOOZ/z.lua/z.lua.plugin.zsh
	$FOOZ/fzf/shell/completion.zsh
)
	# $FOOZ/zsh-nvm/zsh-nvm.plugin.zsh
	# $FOOZ/zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh

for i in $externalplugs; do source $i; done


#########################
# [[ $ZDOTS/env/.plugins-external -nt $externalplugs(om[1]) ]] || \
# 	cat $externalplugs > $ZDOTS/env/.plugins-external
# zrecompile -p $ZDOTS/env/.plugins-external
