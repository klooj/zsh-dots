# these are sourced after my own plugins in .zshrc, and the recompile script makes use of the variable.
# for this to work, you need to have omz cloned locally. otherwise, clone the individual plugins to $FOOZ
# and specify them in "plugins-external.zsh"

local omzdir="~/.oh-my-zsh/plugins"
export omzplugs=(
	alias-finder
	gpg-agent
)
# thefuck

for i in $omzplugs; do
	if [[ -e $omzdir/$i/$i.plugin.zsh ]] {
		# fpath+=(~/.oh-my-zsh/plugins/$i)
		. ~/.oh-my-zsh/plugins/$i/$i.plugin.zsh
	}
done

###################################
# eval $changed_pvars
# NOTE: you need to manually export omzplugs after a change if you want the change to take effect on the very next login.
# [[ $ZDOTS/env/.plugins-omz -nt ~/.oh-my-zsh/plugins/$^omzplugs/*.zsh(om[1]) ]] || \
# 	cat ~/.oh-my-zsh/plugins/$^omzplugs/*.zsh(N) > $ZDOTS/env/.plugins-omz
# zrecompile -p $ZDOTS/env/.plugins-omz
