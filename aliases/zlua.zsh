# __________
#/ 	Z-LUA	\
## adding an "f" runs the same command as above but pipes output to fzf
alias j="z"
alias jj="z -I"
# alias zf='z -I'


# cd to  parent.
alias jp="z -l"
alias jh="z -b"
alias jjh='z -b -I'
# alias zp='z -b'
# alias zpf='z -b -I'
# alias zcf='z -b -I'


# cd to children
alias jl="z -c"
# alias zc='z -c'


# cd to most recently accessed match
alias jr='z -t'
alias jjr='z -t -I .'
# alias zlf='z -t -I .'
# alias ztf='z -t -I'


# NOTE:	zp usage
# `zb` = project root; nearest parent containing a $_ZL_ROOT_MARKERS
# `zb $1` = closest parent STARTING with $1; fallback is CONTAINING $1.
# `zb $1 $2` = cd from 4/2/0/ to 4/1/0/; substitute $1 for $2 in `pwd`.
##	roughly equivalent effect as cd $(pwd | sed 's/'"$2"'/'"$1"'/')
