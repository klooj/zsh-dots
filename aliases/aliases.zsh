# unsorted
alias s="cds"
alias a="cda"
alias mmi='make; make install'
alias handy='HandBrakeCLI'

## dyslexic fat fingers
alias dc=cd

# this solves the sudden bootstrapping type of problem created when a typo in one func prevents them all
# from loading
alias sh.fx='shell.recompile || source $DOTS/zdots/my_plugins/zsh/funcs/shell.recompile'

alias pls="print -l"

## be very careful. this does exactly what it says **to all file/dir names without creating a backup**
alias remove.spaces='for a in ./ ** / * \ * (Dod); do mv $a ${a:h}/${a:t:gs/ /_}; done'

alias x=extract
alias cl='clear'
# alias h='history'
alias h='hist'
alias tmas='\tmux attach-session'

alias f.sizeDirs="print *(/) | xargs du -skh | sort -rn"
alias f.sizeBars="print *(.) | xargs du -skh | sort -rn"
alias f.sizeAll="print {,.}* | xargs du -skh | sort -rn"

alias f.uniqPerl="perl -MList::Util=uniq -e 'print uniq <>'"


# project/parent/repo group?
alias tagout='rm ./tags 2>/dev/null; ctags -R -n --tag-relative=no --sort=yes --output-format=u-ctags --links=yes --exclude=node_modules --exclude=.git --exclude=.zwc --exclude=cache --exclude=package-lock.json --guess-language-eagerly --extras=+F'

# ______________________
#/ 	INFO and INTERNET 	\

alias goog="web-search google"
alias stacko="web-search stacko"

alias get.cpuArch='echo $CPUTYPE'

# os specific
case $OSTYPE in
	*darwin*)
		alias pbp=pbpaste
		alias pbc=pbcopy

		alias g.talisman="~/.talisman/bin/talisman_darwin_amd64"

		alias get.cpuSpec='sysctl -n machdep.cpu.brand_string'
		alias get.distv='uname -sr'


		alias crashdoc='echo "$(pbpaste)" >> ~/Desktop/debug/Crashes/"$(date +%y-%m-%d).txt"; ${=EDITOR} ~/Desktop/debug/Crashes/"$(date +%y-%m-%d).txt"'
		alias -s pdf='/Applications/PDF\ Expert.app'
		alias ofd='open $PWD'
		alias apps='cds /Applications'

		# ansible plays
		alias A.up="ansible-playbook -v ~/ansible/plays/updates/playbook.yml"

		# these are prefixed with an m. so tab complete popups up with helpful but obscure mac funcs
		# launchctl
		alias m.lchC.svcReg='/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister'
		alias m.lchC.list='launchctl list'
		alias m.lchC.load='launchctl load'
		alias m.lchC.unload='launchctl unload'
		alias m.lchC.getenv='launchctl getenv'
		alias m.lchC.start='launchctl start'
		alias m.lchC.stop='launchctl stop'

		# spotlight
		alias m.slight.exclShow='sudo defaults read /.Spotlight-V100/VolumeConfiguration.plist Exclusions'
		alias m.slight.exclAdd='sudo defaults write /.Spotlight-V100/VolumeConfiguration.plist Exclusions -array-add '
		alias m.slight.idxStop='sudo launchctl stop com.apple.metadata.mds'
		alias m.slight.idxStart='sudo launchctl start com.apple.metadata.md'
		alias m.slight.idxRestart='spotlight.indexing.stop && spotlight.indexing.start'

		# music
		alias m.love='osascript ~/bin/AppleScripts/music-love.scpt'
		alias m.hate='osascript ~/bin/AppleScripts/music-hate.scpt'
		alias m.song='music playing'

		# other
		alias m.ql='qlmanage -p'
		alias m.ic='cds ~/Library/Mobile\ Documents/com~apple~CloudDocs'
		alias m.ic-push='ckksctl push'
		alias m.sleep="pmset displaysleepnow"
		alias m.battery='pmset -g batt'
		alias m.dds='rm ./**/.DS_Store'
		alias m.sublset='cds ~/Library/Application\ Support/Sublime\ Text\ 3 && open'

		;;
	*linux*)
		alias get.distv='hostnamectl | rg operating'
		# alias get.cpu.spec='sysctl -n machdep.cpu.brand_string'

		alias open='xdg_open'

		alias rdrview='rdrview --template=title,body'

		alias ad='sudo apt update'
		alias au='sudo apt dist-upgrade'
		alias ai='sudo apt install --install-suggests'
		alias ady='ad --assume-yes'
		alias auy='au --assume-yes'
		alias aiy='sudo apt install --install-suggests --assume-yes'
		alias aduy='ady && auy'
		;;
esac

# __________________
#/	FILE HANDLING	\
alias zrc='${EDITOR} ~/.zshrc'
alias zvar='${EDITOR} $ZDOTS/env/vars.zsh'
alias myakas='${EDITOR} ${ZDOTS}/aliases/aliases.zsh'
alias osxrc='${EDITOR} ${ZDOTS}/env/osxrc.zsh'
alias lxrc='${EDITOR} ${ZDOTS}/env/linuxrc.zsh'

alias b='bat'
alias c='bat -pp'
alias rdem='bat README.md'

alias md='mkdir -p'
alias rm='trash'
alias rd='rmdir'
alias rmAF='sudo rm -rf '
# for each element *: each element therein <EITHER>  -: follow links AND @: resolve to a link D: match leading dots <OR> ^: not /: directory F: with contents
alias clean.path='rm -- $^path/*(-@D,/^F) $^fpath/*(-@D,/^F) 2>& /dev/null'
alias clean.AF='rm -- ./**(-@D,/^F)'

alias rcopy='rsync -azh --info=progress2'
alias rcopyNew='rsync -azuh --info=progress2'
alias rcopyCleanThere='rsync -azunh --delete-excluded --info=progress2; echo "if this is what you want, run:\vrsync -azuh --delete-excluded info=progress2h"'
alias rmove='rsync -ahz --info=progress2 --remove-source-files'
alias rmoveNew='rsync -azhu --info=progress2 --remove-source-files'

alias sort.csv='~/bin/SortByFieldCSV.awk'

# ______________
#/	NAVIGATION	\

## directories
#  (set in opts.zsh) setopt pushdminus 			# switch meaning of ‘+’ and ‘-’ when used with a number to specify a directory in the stack
alias -g ...='../..'
alias -g ....='../../..'
alias -g .....='../../../..'
alias -g ......='../../../../..'
alias 1='cd -'
alias 2='cd -2'
alias 3='cd -3'
alias 4='cd -4'
alias 5='cd -5'
alias 6='cd -6'
alias 7='cd -7'
alias 8='cd -8'
alias 9='cd -9'

alias jk="cd ~ && fz.cd"
alias jz="cds $ZDOTS"
alias jd="cds $DOTS"
alias jv="cds $FOONV"


alias jja="cds ~/ansible && fz.cd"
alias jjb='cds ~/bin'
alias jjdt="cds && ~/Desktop && fz.cd"
alias jjf='cds $DOTS/foobar'
alias jjg='cds $GITS'
alias jjm='cds ~/my-man'
alias jjoh='cds ~/.oh-my-zsh'
alias jjpa="cds ~/.local/share/nvim/site/pack/packer"
alias jjr="cds ~/repos && fz.cd"
alias jjs='cds ${DOTS}/setup'
alias jjsh='cds ~/Desktop/Shell'
alias jjt='cds ~/tmp'
alias jjun='cds ~/Desktop/unclutter'
alias fwk='cds ~/_workspace'
alias jjw='cds ~/Desktop/info'
alias jjnv="cds ~/.local/share/nvim && fz.cd"

alias xbin='cds ~/.local/bin'
alias dxdg='cda ${DOTS}/.config'
alias xdg='cds ~/.config'
alias docs='cds ~/Documents'
alias downs='cda ~/Downloads'
alias fooz='cds $FOOZ'

# alias x.b="$XDG_BIN"
# alias x.B="$XDG_BIN"
# alias x.ca="$XDG_CACHE_HOME"
# alias x.CA="$XDG_CACHE_HOME"
# alias x.c="$XDG_CONFIG_HOME"
# alias x.c="$XDG_CONFIG_HOME"
# alias x.DD="$XDG_DATA_DIRS"
# alias x.dh="$XDG_DATA_HOME"
# alias x.DH="$XDG_DATA_HOME"
# alias x.m="$XDG_MAN"
# alias x.M="$XDG_MAN"


# ______________
#/	SEARCHING	\
alias hsi='history | grep -i'
# alias hrg='fc -il 0 | rg'

alias s.f="fd -type f"
alias s.d="fd -type d"
alias loc='locate -i'

alias rg.nc="rg --no-config"
alias rg.h='fc -il 0 | rg'
