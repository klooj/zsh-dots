# these are sourced last, in .zlogin, and the recompile script makes use of the variable
export zwraps=(
	$FOOZ/fzf-tab/fzf-tab.plugin.zsh
	$FOOZ/fsh/fast-syntax-highlighting.plugin.zsh
	# $FOOZ/zsh-autosuggestions/zsh-autosuggestions.zsh
	$FOOZ/zsh-history-substring-search/zsh-history-substring-search.zsh
)

for i in $zwraps; do source $i; done
