# ============================================================================ #
# login process: .zshenv ➔ .zprofile ➔ ||> .zshrc <|| ➔ .zlogin ➔ .zlogout		 #
# ============================================================================ #
# uncomment and run zprof to debug
# zmodload zsh/zprof


# =========================== ENVIRONMENT ==================================== #
# shell variables and paths are set here; plugins and shell (exported) functions later

local setEnvVars() {
	#	location of this repo and zsh dotfiles
	export DOTS="$HOME/.dotfiles"
	export ZDOTS="$DOTS/zdots"
	export VISUAL="nvim"


	# eliminate and prevent duplicates in paths
	typeset -gU PATH path
	typeset -gU FPATH fpath
	typeset -gU cdpath


	# ZSH OPTIONS
	. $ZDOTS/env/opts.zsh

	# OS-agnostic here
	. $ZDOTS/env/vars.zsh

	# returns one-word lower-cased OS distribution; i.e. ubuntu, raspbian, darwin
	case $OSTYPE in
	*darwin*)
		export OS_DISTRO="$(print $OSTYPE:gs/[0-9,.]//)"
		. $ZDOTS/env/osxrc.zsh
		;;

	*linux*)
		export OS_DISTRO="$(print ${$(lsb_release -d -s):l} | awk '{print  $1}')"
		. $ZDOTS/env/linuxrc.zsh
		;;
	esac

	# these _must_ be sourced _AFTER_ the preceding block
	fpath=($ZDOTS/env/.{zsh-completions,funcs-my_plugins}.zwc $fpath)
	# NOTE: you cannot edit this file directly. it compiles the concatenation of $ZDOTS/my_plugins/*/funcs/vars*
	. $ZDOTS/env/.vars-my_plugins
	# [git-crypt](https://www.agwa.name/projects/git-crypt/)
	. $DOTS/foobar/mytokens.zsh || echo "no tokens file"
}

setEnvVars || echo "failed to set environment variables"
unfunction setEnvVars

# ====================== OPTIONAL BAIL OUT =================================== #
# $DOTS/notes/bail.md (TLDR: use terminal.app instead of kitty/iterm/alactrity etc. for
# a barebones/fallback shell)
[[ $TERM_PROGRAM != Apple_Terminal ]] || return



# ======================= Plugins & Autoloads ================================ #

# get right in there: instant prompt [powerlevel10k](https://github.com/romkatv/powerlevel10k)
[[ -r $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh ]] && \
	. $XDG_CACHE_HOME/p10k-instant-prompt-${(%):-%n}.zsh

local sourcePlugs() {
	# ZSH MODULES AND COMPINIT
	. $ZDOTS/env/modules.zsh
	. $ZDOTS/comp.zsh

	#  helper functions defined by the distro or me. most of the magic is in here with the dragons.
	autoload -w $ZDOTS/env/.{zsh-completions,funcs-my_plugins}.zwc
	for i in $ZDOTS/lib/*.zsh; do . $i; done

	# 3rd party plugins that are NOT wrappers(highlighting, etc are sourced in .zlogin)
	. $ZDOTS/env/plugins-omz.zsh
	. $ZDOTS/env/plugins-external.zsh

	# TODO: need a lazy loader ... but i am too lazy to write one.
	eval "$(luarocks path)"
}

sourcePlugs || echo "failed to load plugins"
unfunction sourcePlugs

# ======================= VIRTUAL STUFF ======================== #

local initializePyenv() {
	if (( ${+commands[pyenv]} )) {
	eval "$(pyenv init - zsh)" 1>/dev/null
	eval "$(pyenv virtualenv-init - zsh)" 1>/dev/null
	}
}

local initializeNVM() {
	if [[ -e $FOOZ/zsh-nvm/zsh-nvm.plugin.zsh ]] {
	. $FOOZ/zsh-nvm/zsh-nvm.plugin.zsh && \
		. $FOOZ/zsh-better-npm-completion/zsh-better-npm-completion.plugin.zsh
	}
}

initializePyenv || echo "failed to initializePyenv"
unfunction initializePyenv
initializeNVM || echo "failed to initialize NVM"
unfunction initializeNVM

# ================ SHELL APPEARANCE  =========================== #

local snazz() {
	[[ $TERM_PROGRAM == iTerm.app ]] && . ~/.iterm2_shell_integration.zsh
	. $FOOZ/powerlevel10k/powerlevel10k.zsh-theme


	# if [[ $ITERM_PROFILE =~ clear ]] || [[ $SSH_CLIENT ]] {
	# 	# selectively apply transparency and prompt styles, and configure nv terminal and color, then
	# 	# tell nvim not to worry about drawing a background.
	# 	export TRANSPARENT_TERM=true nvim
	# 	. $ZDOTS/p10k/p10krc-lean.zsh

	# } elif [[ $NVIM_LISTEN_ADDRESS ]] {
	if [[ $NVIM_LISTEN_ADDRESS ]] {
	# 	# this is for to nvim embedded/floating terminal. the alias guards against opening a new nvim
	# 	# instance from within the embedded terminal.
	alias nv='nvr -l -O'
	# 	. $ZDOTS/p10k/p10krc-pure.zsh
	# 	pyenv activate neovim3.9
	# 	# export TRANSPARENT_TERM=true nvim
	}

	# } elif [[ $CPUTYPE =~ armv ]] {
	# 	# special treatment for special lil guy
	# 	. $ZDOTS/p10k/p10pi.zsh

	# } else {
	# 	. $ZDOTS/p10k/p10krc-lean.zsh
	# }

	. $ZDOTS/p10k/medium.zsh
	# . $ZDOTS/p10k/lean.zsh
	# . $ZDOTS/p10k/pure.zsh
}

snazz || echo "as you can see, failed to set theme"
unfunction snazz

# there is a some wack shit going on when setting the shell path for macOS.
#	1. little snitch appends an entry with an unescaped space. smh. remove that path and symlink the
#		responsibly named binary into /some/bin/
#  2. extra wack --> asdf is getting added to path twice on one of the macs despite not being
#		installed on any of them
#	3. a duplicate node and an extra ruby version are being added, likely related the underlying
#	    cause of #2.
#	4. perl is a moody bitch.
# this block removes these errant items from path
local macIsWack(){
	if [[ $OSTYPE =~ darwin ]] {
	path[(R)*Snitch*]=() 2>/dev/null
	path[(R)*asdf*]=() 2>/dev/null
	path[(R)*asdf*]=() 2>/dev/null
	path[(R)*v14.6.0*]=() 2>/dev/null
	path[(R)*2.7.0*]=() 2>/dev/null
	}
}

macIsWack || echo "go back to bed"
unfunction macIsWack

#######################
# LOGIN PROCESS
## next, the shell will finish logging in and then source ~/.zlogin
