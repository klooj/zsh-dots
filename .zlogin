# login process: .zshenv ➔ .zprofile ➔ .zshrc ➔ ||> .zlogin <|| ➔ .zlogout
# ------------------------------------------------------------------------------
# this file is sourced last and only for login shells


# aliases
for i in $ZDOTS/aliases/*.zsh; do . $i; done

# this will cause errors if loaded too early
# zmodload -F zsh/stat -b:stat  # load zsh/stat as zstat

eval "$(lua ~/.zsh/z.lua/z.lua --init zsh enhanced fzf)" >&/dev/null
[[ $OSTYPE =~ linux ]] && . $FOOZ/czmod/czmod.zsh

. $ZDOTS/env/plugins-wrappers.zsh

# gpgconf --launch gpg-agent
