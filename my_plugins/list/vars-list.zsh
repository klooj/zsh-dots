#### LS CONFIGURATION ####
# export ignorels="'*.zwc*|*.DS_Store|*.zcompdump*|.git*'"

# the order here is v important.

alias sed='sed --follow-symlinks'

[[ -e /usr/local/bin/gls ]] && {
	export LS_V="gnu"
	# unalias sed; alias sed='gsed --follow-symlinks'
	# alias awk=gawk
}

if (( ${+commands[exa]} )) {
	export LS_CMD="exa"
	[[ $OSTYPE =~ linux ]] && export LS_V="gnu"
	[[ -z $LS_V ]] &&  export LS_V="bsd"

} elif [[ $LS_V == gnu ]] {
	export LS_CMD="gls"

} elif [[ $OSTYPE =~ linux ]] {
	export LS_V="gnu"
	export LS_CMD="ls"

} else {
	export LS_V="bsd"
	export LS_CMD="ls"
}
