
# login process: .zshenv ➔ ||> .zprofile <|| ➔ .zshrc ➔ .zlogin ➔ .zlogout
# ------------------------------------------------------------------------------

################################################################################
# zprofile : similar to zlogin but sourced before zshrc. Both zprofile and
# zshrc are skipped in non-login non-interactive shells, so this declares environment
# variables in zprofile and uses zshenv to source zprofile. This way, non-login
# non-interactive shells will be a little less black boxy.

# https://htr3n.github.io/2018/07/faster-zsh/
################################################################################

# [encoding]($TIPS/encoding.md)
[[ -z "$LANG" ]] && export LANG='en_US.UTF-8'

# eliminates and prevents duplicates in paths
typeset -gU cdpath
typeset -gU FPATH fpath
typeset -gU PATH path

# # put the correct zsh executable first in path
path=(/usr/local/{bin,sbin} $path)
