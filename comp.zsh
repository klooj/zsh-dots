# ============== COMP STYLE ================= #
# Completion Module Options
#
# https://grml.org/zsh/zsh-lovers.html#_completion
# Using zstyle: <https://unix.stackexchange.com/a/214699>
# zstyle [context] [style] [value]
#
# - context may be a pattern matching the form:
#		`:completion:func:completer:cmd:arg:tag`
# in which:
#	- completion = literal string always used by completion functions
#	- func = name of directly called widget; blank for contextual completion
#	- completer =  method of completion e.g. complete
#	- cmd = name of command being completed, or special command context
#	- arg = for standard parsing: `arg-n` for nth argument; `option-opt-n` for nth argument of option opt
#	- tag = indication of type of thing to be completed at this point
# meta config: describe matches and group them

WORDCHARS=''
set GLOB_COMPLETE

zstyle :compinstall filename "$ZDOTS/comp.zsh"
zstyle ':completion:*:cdr:*:*:*' sort false
zstyle ':completion:*:*:cdr:*:*' menu selection

zstyle ":completion:*:git-checkout:*" sort false
zstyle ':completion:*' completer _complete _match _history _expand
zstyle ':completion:*' expand prefix suffix
zstyle ':completion:*' glob 'NUMERIC == 4'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' accept-exact continue
zstyle ':completion:*' ignore-parents parent pwd
zstyle ':completion:*' insert-unambiguous true
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}	# might need double-quotes
zstyle ':completion:*' list-prompt %SAt %p: TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{[:lower:]}={[:upper:]} r:|[._-]=** r:|=**' 'l:|=* r:|=*'
zstyle ':completion:*' max-errors 1
zstyle ':completion:*' menu select=1
zstyle ':completion:*' original false
zstyle ':completion:*' preserve-prefix '//[^/]##/'
zstyle ':completion:*' prompt 'errors:%e'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' special-dirs true   		 # complete . and .. special directories
zstyle ':completion:*' squeeze-slashes true
zstyle ':completion:*' substitute 'NUMERIC == 4'
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:*:*:*:processes' command "ps -u $USER -o pid,user,comm -w -w"
zstyle ':completion:*:*:-redirect-,2>,*:*' file-patterns '*.log'
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters 	# completion element sorting
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:*:cdr:*:*' menu selection
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;34=0=01'
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'
zstyle ':completion:*:cd:*' tag-order local-directories directory-stack path-directories	# disable named-directories autocompletion
zstyle ':completion:*:corrections' format ' %F{green}-- %d (errors: %e) --%f'
zstyle ':completion:*:default' list-prompt '%S%M matches%s'
zstyle ':completion:*:descriptions' format '[%d]'
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:matches' group yes
zstyle ':completion:*:messages' format ' %F{purple} -- %d --%f'
zstyle ':completion:*:options' auto-description '%d'
zstyle ':completion:*:options' description yes
zstyle ':completion:*:warnings' format ' %F{red}-- no matches found --%f'
zstyle ':completion::complete:*' cache-path $XDG_CACHE_HOME/
zstyle ':completion::complete:*' use-cache yes	# Use caching so that commands like apt and dpkg complete are useable
zstyle ':completion:complete:*:options' sort false

zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup
zstyle ':fzf-tab:*' fzf-commandzstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:(kill|ps):argument-rest' fzf-flags --preview-window=down:3:wrap
zstyle ':fzf-tab:complete:_zlua:*' query-string input
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
zstyle ':fzf-tab:complete:cd:*' popup-pad 30 0
zstyle ':fzf-tab:complete:cd:*' ftb-tmux-popup

zstyle -e ':completion:*:(ssh|scp|sftp|rsync):hosts' hosts 'reply=(${=${${(f)"$(cat {/etc/ssh_,~/.ssh/known_}hosts(|2)(N) /dev/null)"}%%[# ]*}//,/ })'
zstyle -e ':completion: * :approximate: * ' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

zstyle ':chpwd:*' recent-dirs-file ~/.chpwd-recent-dirs recent-dirs-max 30 recent-dirs-default true recent-dirs-insert true

zle -N insert-last-word smart-insert-last-word
zstyle :insert-last-word match '.*([[:digit:]]?|[[:alpha:]/\\])*'

#{{{ zstyle ':completion:*' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*:descriptions' format ' %F{yellow}-- %d --%f'
# zstyle ':completion:*' completions 1
# zstyle ':completion:*' format '%d'
# zstyle ':completion:*' max-errors 2
# zstyle ':completion:*:approximate:*' max-errors 4 numeric}}}
#{{{ Try completion a second time to trigger these ones. from the zsh8 guide:
# This uses the HISTNO parameter and the BUFFER and CURSOR special parameters that
# are available inside zle and completion widgets to find out if the command line
# hasn’t changed since the last time completion was tried. Only then are the
# _ignored, _correct and _approximate completers called.}}}
zstyle -e ':completion:*'completer '
	if [[ $_last_try != "$HISTNO$BUFFER$CURSOR" ]]; then
		_last_try="$HISTNO$BUFFER$CURSOR"
		reply=(_complete _match _prefix)
	else
		reply=(_ignored _correct _approximate)
	fi'

# ======= IGNORE THINGS ======== #
zstyle ':completion:*' ignored-patterns '*.zwc*'
zstyle ':completion:*:functions' ignored-patterns '(_*|pre(cmd|exec)|prompt_*)'       # ignores unavailable commands
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other 	# ignore multiple entries
zstyle ':completion:*:rm:*' file-patterns '*:all-files'
zstyle ':completion: * :(all-|)files' ignored-patterns '(| * /)CVS'
zstyle ':completion: * :cd: * ' ignored-patterns '( * /)#CVS'

## Don't complete uninteresting users
zstyle ':completion:*:*:*:users' ignored-patterns \
	adm amanda apache at avahi avahi-autoipd beaglidx bin cacti canna \
	clamav daemon dbus distcache dnsmasq dovecot fax ftp games gdm \
	gkrellmd gopher hacluster haldaemon halt hsqldb ident junkbust kdm \
	ldap lp mail mailman mailnull man messagebus mldonkey mysql nagios \
	named netdump news nfsnobody nobody nscd ntp nut nx obsrun openvpn \
	operator pcap polkitd postfix postgres privoxy pulse pvm quagga radvd \
	rpc rpcuser rpm rtkit scard shutdown squid sshd statd svn sync tftp \
	usbmux uucp vcsa wwwrun xfs '_*'

### ... unless we really want to.
zstyle '*' single-ignored show

## wrap it up
add-zsh-hook -Uz zsh_directory_name zsh_directory_name_cdr
add-zsh-hook -Uz chpwd chpwd_recent_dirs

# =================== COMP FIX then COMP INIT ============ #

# taken from omz
# Handle completion insecurities (i.e., completion-dependent directories with
# insecure ownership or permissions) by Human-readably notifying the user of these insecurities.
# List of the absolute paths of all unique insecure directories.

local -aU insecure_dirs
insecure_dirs=( ${(f@):-"$(compaudit 2>/dev/null)"} )

# If no such directories exist, get us out of here.
if [[ -z "${insecure_dirs}" ]] {
	return
} else {
	# List ownership and permissions of all insecure directories.
	print "[oh-my-zsh] Insecure completion-dependent directories detected:"
	ls -ld "${(@)insecure_dirs}"
	echo 'no loading completions that are world/other writable. run this to fix:\ncompaudit | xargs chmod g-w,o-w'
}

unset insecure_dirs

# automatically load bash completion functions
autoload -U +X bashcompinit && bashcompinit

autoload -Uz compinit
# Load only from secure directories
compinit -i -C -d ~/.zcompdump
