# login process: ||> .zshenv <|| ➔ .zprofile  ➔ .zshrc ➔ .zlogin ➔ .zlogout
# ------------------------------------------------------------------------------

################################################################################
# zshenv is sourced for all sessions and is the only zsh config sourced for non-login
# non-interactive shells.
# 	|- [non-]login shells: check the output of `echo $0` for a hyphen if not sure.
# 	|- [non-]interactive shells: exactly what it sounds like.
# http://zsh.sourceforge.net/Doc/Release/Files.html#Startup_002fShutdown-Files
# https://blog.flowblok.id.au/2013-02/shell-startup-scripts.html
################################################################################

# unless you know you are doing, do not create a ~/.zshenv nor alter /etc/zshenv

# https://blog.patshead.com/2011/04/improve-your-oh-my-zsh-startup-time-maybe.html
# skip_global_compinit=1

# http://disq.us/p/f55b78
# setopt noglobalrcs

# provide for a minimal environment to non-login non-interactive shells.
# https://github.com/sorin-ionescu/prezto/blob/master/runcoms/zshenv
if [[ ( "$SHLVL" -eq 1 && ! -o LOGIN ) && -s "${ZDOTDIR:-$HOME}/.zprofile" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprofile"
fi
