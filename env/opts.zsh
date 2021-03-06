# [Zsh Options](https://goo.gl/M3zjNU)

setopt always_to_end       # move cursor to the end of a completed word
setopt auto_cd             # Auto changes to a directory without typing cd.
setopt auto_list           # automatically list choices on ambiguous completion
setopt auto_menu           # show completion menu on a successive tab press
setopt auto_pushd          # Push the old directory onto the stack on cd.
setopt combining_chars     # handle ligatures and characters better
setopt complete_in_word    # complete from both ends of a word
setopt extended_glob       # Use extended globbing syntax. also needed for file modification glob modifiers with compinit
setopt glob_dots           # do not require leading dot when globbing; controversial
setopt glob_star_short     # use ** instead of **/*; use *** to follow links
setopt hist_subst_pattern  # use globs instead of literals in expansion subsitution
setopt interactivecomments # recognize in line comments
setopt long_list_jobs
setopt multios             # Write to multiple descriptors.
setopt null_glob           # don't error out on empty matches
setopt prompt_subst        # perform expansion in prompts
setopt pushd_ignore_dups   # Do not store duplicates in the stack.
setopt pushdminus 			# switch meaning of ‘+’ and ‘-’ when used with a number to specify a directory in the stack
setopt re_match_pcre
setopt short_loops

unsetopt auto_param_slash  # if completed parameter is a directory, add a trailing slash
unsetopt case_glob         # makes globbing (filename generation) case-sensitive
unsetopt case_match
unsetopt menu_complete     # autoselect the first completion entry if you want to live


function env_default() {
	[[ ${parameters[$1]} = *-export* ]] && return 0
	export "$1=$2" && return 3
}

env_default 'PAGER' 'less'
env_default 'LESS' '-R'

###############
# setopt cdable_vars          # Change directory to a path stored in a variable.
# setopt auto_name_dirs       # Auto add variable-stored paths to ~ list.
# setopt clobber              # turn off warning "file exists" with > and >>
# setopt pushd_silent         # Do not print the directory stack after pushd or popd.
# setopt pushd_to_home        # Push to home directory when no argument is given.
# setopt globdots            # files beginning with a . be matched without explicitly specifying the dot
# setopt path_dirs           # perform path search even on command names with slashes
# unsetopt flow_control      # disable start/stop characters in shell editor
# unsetopt clobber           # Do not overwrite existing files with > and >>  , use >! and >>! to bypass.

# globalias() {
#    if [[ $LBUFFER =~ ' [A-Z0-9]+$' ]]; then
#      zle _expand_alias
#      zle expand-word
#    fi
#    zle self-insert
# }

# zle -N globalias
# bindkey " " globalias
# bindkey "^ " magic-space           # control-space to bypass completion
# bindkey -M isearch " " magic-space # normal space during searches
