# TODO: get rid of these hard coded ruby values
if [[ $OS_DISTRO =~ raspbian ]] {
	gempath=$HOME/.gem/ruby/2.5.0/bin

} elif [[ $OS_DISTRO =~ ubuntu ]] {
	gempath=$HOME/.gem/ruby/2.7.0/bin
	path+=($HOME/.local/swift/bin /snap/bin)
	alias g.talisman="~/.talisman/bin/talisman_linux_amd64"
}

path=(
	/usr/lib/ccache
	$PYENV_ROOT/bin
	$HOME/.local/bin
	$HOME/go/bin
	$HOME/.cargo/bin
	$gempath
	/usr/local/bin
	/usr/local/sbin
	/usr/bin
	/usr/sbin
	/bin
	/sbin
	$path
)

fpath=(
	/usr/share/zsh/vendor-completions.zwc
	/usr/share/zsh/functions/*.zwc
	/usr/share/zsh/functions/VCS_Info/Backends.zwc
	$fpath
)

export BROWSER=rdrview
export HELPDIR=/usr/share/zsh/help
export NEEDRESTART_MODE=a
export RDRVIEW_BROWSER="lynx -vikeys" rdrview

# eval $(perl -I ~/perl5/lib/perl5/ -Mlocal::lib)
