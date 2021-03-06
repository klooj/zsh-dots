# =========== MODULES ============= #

# autoloads
autoload -U age
autoload -U zargs
autoload -U zmv
autoload -U zrecompile
autoload -U compaudit
autoload -U compinit
unalias run-help >&/dev/null
autoload -U run-help
autoload -U chpwd_recent_dirs
autoload -U cdr
autoload -U add-zsh-hook
autoload -U is-at-least
autoload -U colors && colors
autoload -U tetriscurses		# stop forgetting about this

# modules
zmodload -i zsh/complist
zmodload zsh/mapfile				# [mapfile module](http://zsh.sourceforge.net/Doc/Release/Zsh-Modules.html#The-zsh_002fmapfile-Module)
zmodload zsh/pcre
zmodload zsh/langinfo
zmodload -m -F zsh/files b:zf_\*
zmodload -F zsh/stat +b:zstat		# load zsh/stat as zstat


# not sure about
# unsetopt flowcontrol 	  	# output flow control via start/stop characters is disabled in shell's editor
