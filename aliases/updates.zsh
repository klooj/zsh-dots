
# __________
#/	UPDATES	\
[[ $OSTYPE =~ darwin ]] && alias up.db='sudo /usr/local/gnubin/updatedb 2> /dev/null'
if [[ $OSTYPE =~ linux ]] {
  alias up.hole='pihole-updatelists'
	[[ $CPUTYPE =~ armv ]] && alias up.db='sudo /usr/bin/updatedb.findutils 2> /dev/null' || \
		alias up.db='sudo /usr/bin/updatedb 2> /dev/null'
}
alias up.tex='sudo tlmgr update --self; sudo tlmgr update --all --verify-repo=all'
