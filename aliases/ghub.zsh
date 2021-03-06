# alias glog='git log --graph --pretty=format:"%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset" --abbrev-commit'
alias g='git'
alias gl='git pull --stat | sed "/up to date/d" | bat -pp -l "Git Log" - '
alias gp='git push'
alias ga='git add .'
alias gaga='mycommit'

alias g2="gca 'it2'"
alias gspell="gca 'spell file'"

# alias gapa='git add --patch'
alias g.a='forgit::add'
alias g.c='git commit -v'
alias g.ca='git commit -v -a'
alias g.cx='git commit -v --amend'
alias g.cax='git commit -v -a --amend'

alias g.chb='git checkout -b'
alias g.sw='git switch'

alias g.stshow='forgit::stash::show'
alias g.stcl='git stash --clear'
alias g.stcl='git stash'

alias glo='forgit::log'
alias gst='git status -sb'
alias g.cf='git config --list'


alias g.F='git fetch'
alias g.Fap='git fetch --all --prune'
alias gfo='git fetch origin'

alias g.d='forgit::diff'
alias g.ds='git diff --staged'
alias g.dcash='git diff --cached'
alias g.reb='forgit::rebase'

alias g.pv='git push -v'

alias g.ig='[[ -e ./.gitignore ]] && ${=EDITOR} .gitignore || ${=EDITOR} ~/.gitignore '
alias g.igls='fd --no-ignore --hidden --type f | git check-ignore --stdin'
alias g.igup='forgit::ignore::update'
alias g.igDLTemplates='forgit::ignore'    # grab ignore templates; fuzzy multi select
alias g.iget='forgit::ignore::get'            # same; takes an argument
alias g.igListAll='forgit::ignore::list'      # show all available for download
alias g.igclean='forgit::ignore::clean'

alias g.cleanup='git pull && git remote prune origin && git repack && git prune-packed && git reflog expire --expire=1.month.ago && git gc --aggressive'

alias g.rh='forgit::reset::head'
alias g.rH='git reset --hard'
alias g.rHAF='git reset --hard && git clean -dffx'
alias g.rst='forgit::restore'

alias g.cherry='forgit::cherry::pick'
# alias g.clean='forgit::clean'
alias g.dev='git checkout -b dev'
