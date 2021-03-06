# required; these are used throughout my dotfiles
# ===============================
export FOOZ=$HOME/.zsh			# shell specific repos, helpers, themes, etc.; see ./plugins-wrappers.zsh for example
export GITS=$HOME/gits			# default for git repos that are not involved in building the shell environment.
export MY_PLUGINS=$ZDOTS/my_plugins # i do not think this is used

## referenced by update func
typeset -aU REPOS
export REPOS=(${DOTS:a} ${FOONV:a} ~/.tmux $FOOZ/*/.git(/:h:a) $GITS/*/.git(/:h:a) ~/build/*/.git(/:h:a) ~/repos/*/.git(/:h:a))

## ignore things easier by passing these as params; listing funcs reference these
export ignorels='\*.zwc\*\|\*.DS_Store\|\*.zcompdump\*\|.git\*\|.cache\*'
export IGNORES="*.zwc*|*.DS_Store|*.zcompdump*|.git*|.cache*|node_modules*"
export MOSTLY="**~*($IGNORES)*"		# perform glob expansion on parameter $~MOSTLY


# editor
# ===============================
export EDITOR="nvim" # [mysetup](https://github.com/klooj/nvimrc-lua)
export FOONV=$HOME/.config/nvim
export VISUAL="nvim"


# terminal
# ===============================
# [[ -n "$WINDOW" ]] && SCREEN_NO="%B$WINDOW%b " || SCREEN_NO=""
export COLORTERM=truecolor
export LSCOLORS=auto
export TIMEFMT='user=%U system=%S cpu=%P total=%*E'
export LANG=en_US.UTF-8
# LC_COLLATE=C # [encoding]($TIPS/encoding.md)
# export LSCOLORS="Gxfxcxdxbxegedabagacad"


# XDG, CACHES, DATA
# ===============================
# [xdg](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html)
export XDG_CACHE_HOME=$HOME/.cache
export XDG_CONFIG_HOME=$HOME/.config
export XDG_DATA_DIRS=/usr/local/share:/usr/share
export XDG_DATA_HOME=$HOME/.local/share
# these are not actually XDG; just easy to remember and infer.
export XDG_BIN=$HOME/.local/bin
export XDG_MAN=$XDG_DATA_HOME/man

# export ZSH_COMPDUMP="$ZSH_CACHE_DIR/.zcompdump"


# app configs
# ===============================
export CHTSH_CONF=$XDG_CONFIG_HOME/cht.conf # see https://github.com/chubin/cheat.sh
export FZF_BASE=$FOOZ/fzf
export FZF_BIBTEX_CACHEDIR=$HOME/.cache/bibtex
export FZF_TMUX=1
export FZF_TMUX_OPTS='-p 50%,80%'
export PIP_CONFIG_FILE=$XDG_CONFIG_HOME/pip/pip.conf
export RIPGREP_CONFIG_PATH=$XDG_CONFIG_HOME/ripgreprc


# git stuff
# ===============================
export DELTA_NAVIGATE=1 git diff hub gh
export GIT_EDITOR=nvim
export GPG_TTY=$TTY
export TALISMAN_HOME="$HOME/.talisman/bin"
# export GLAMOUR_STYLE=dark


# package managers and languages
# ===============================
[[ $OSTYPE =~ linux ]] && export GOROOT=$HOME/.local
export CARGO_HOME=$HOME/.cargo
export CMAKE_EXPORT_COMPILE_COMMANDS=true
export GOBIN=$GOPATH/bin
export GOPATH=$HOME/go
export NVM_COMPLETION=true
export NVM_DIR="$XDG_CONFIG_HOME/nvm"
export PYENV_ROOT=$HOME/.pyenv
# export NVM_LAZY_LOAD=true
# export NVM_LAZY_LOAD_EXTRA_COMMANDS=('vim', 'nv', 'nvim', 'trash', 'rm', 'brew', 'apt', 'cd')
# export ZSH_NVM_DIR=${XDG_CACHE_HOME}/zsh-nvm


# misc
# ===============================
# export TIPS=$DOTS/info
# export ZSH_ALIAS_FINDER_AUTOMATIC=true
# export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=#aa00aa'
# export ZSH_AUTOSUGGEST_STRATEGY=(completion match_prev_cmd history)
# export ZSH_AUTOSUGGEST_USE_ASYNC=1
# ZSH_AUTOSUGGEST_MANUAL_REBIND=true
