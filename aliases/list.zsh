# __________
#/	LIST	\

# permission w/numbers; requires gnu stat #### turned this into a better func
# alias perms='stat -c %N\ %a\ %A\ %U\ %G {*,.*} | sort | column -t'

alias dud='du -d 1 -h'
alias duds='du -d 1 -g | sort -n -r | head -n 30'
alias duf='du -sh'
alias p='ps -f'
alias trea='tree -a -x -C -A -R -L'
alias tred='tree -d -x -C -A -R -L'
[[ $LS_V == gnu ]] && ls="ls --almost-all --color=always --classify --group-directories-first --tabsize=4 -I $ignorels"

if [[ $LS_CMD == exa ]]; then
	# alias exa='exa --all --color=always --color-scale --classify --group-directories-first -I $ignorels'
	alias l="exa --all --color=always --color-scale --classify --group-directories-first -I $ignorels"
	alias lf="l --only-dirs"
	alias lfa="la --only-dirs"
	alias l1="l -1"
	# alias la='l --long --time-style=long-iso --header --git --accessed'
	alias ll='la -@'
	alias lt='la --created --accessed --modified --time-style=long-iso'
	alias lto="lt --sort=oldest"
	alias ltn="lt --sort=newest"
	alias ltm="lt --sort=modified"
	alias lta="lt --sort=accessed"
	alias lS='la --sort=size'
	alias lsym='la --list-dirs --level=1 (*|.*)(@)'
	alias ldot='la --list-dirs --level=1 .*(@)'

elif [[ $LS_V == gnu ]]; then
	alias l1='ls -1'
	# alias la='ls -o --human-readable --time=access'
	alias ll='la -Z'
	alias lf='print -ico *(/D)'
	alias lt='la --full-time'
	alias lto='lt --reverse --sort=creation'
	alias ltn='lt --sort=creation'
	alias ltm='lt --sort=modified'
	alias lta='lt --sort=access'
	alias lS='ls -o -S'
	alias lsym='la --directory (*|.*)(@)'
	alias ldot='la --directory .*'
fi
