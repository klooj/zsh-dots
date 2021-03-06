#! /usr/bin/env zsh

link_deez() {
	if (( $# != 2 )) {
		echo "arg 1 is source file, arg 2 is destination folder"
		return 1
	}
	if [[ ! -d $2 ]] {
		echo "dest is not a directory: $2"
		return 2
	}

	foobar=${1:P}
	bar=${foobar:t}
	dest=${2:P}'/'
	dbar="${dest}${bar}"


	if [[ -e $dbar && ! -L $dbar ]] {
		[[ $LS_V == gnu ]] && ln -s --backup=numbered $foobar $dest
	} else {
		ln -sf $foobar $dest
	}
}

local z_links=(
	$ZDOTS/.zshrc
	$ZDOTS/.zprofile
	$ZDOTS/.zshenv
	$ZDOTS/.zlogin
	$ZDOTS/.zlogout
	$DOTS/home/*(.)
	$DOTS/foobar/.gitconfig
	$DOTS/foobar/.gitignore

)
for i in $z_links; do link_deez $i ~/ ; done

# xdg (not sure why i'm treating files and dirs seperately)
for i in $DOTS/.config/*(.) ; do link_deez $i ~/.config/ ; done
for i in $DOTS/.config/*(/) ; do link_deez $i ~/.config/ ; done

link_deez $DOTS/foobar/cargo/config.toml $CARGO_HOME/

# neovim build cmake args
if [[ ! $OS_DISTRO =~ raspb ]] {
	# link_deez $DOTS/pi-local.mk ~/build/neovim/local.mk
# } else {
	link_deez $DOTS/local.mk ~/build/neovim/
}


if [[ $OSTYPE =~ darwin ]] {
	link_deez $DOTS/.luarocks/config-5.1.lua ~/.luarocks/
	link_deez $DOTS/.brew-aliases ~/
	link_deez /Applications/Little\ Snitch.app/Contents/Components/littlesnitch /usr/local/bin/ 2>/dev/null
	link_deez /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/
	link_deez $DOTS/foobar/osx/gpg-agent.conf ~/.gnupg/
}


# if [[ $OSTYPE =~ linux ]] {
	# link_deez $DOTS/foobar/lx/gpg-agent.conf ~/.gnupg/
# }
# link_deez ~/.local/share/nvim/site ~/.vim
