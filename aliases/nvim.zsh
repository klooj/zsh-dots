
# __________
#/ 	NVIM	\
alias foonv="cds $FOONV"
alias foovi="cds ~/.vim"
alias helpvim="open https://vim.fandom.com/wiki/Search_and_replace"

alias nv="$EDITOR"
alias nV="${GXEDITOR}"
alias nVd="vimr --wait --nvim -d"
alias nvrc="${EDITOR} $FOONV/init.lua"
alias nVrc="${GXEDITOR} $FOONV/init.lua"
alias virc="$EDITOR ~/.vimrc"
# alias nv.up="editorup"
alias nv.nobg="export TRANSPARENT_TERM=true nvim && $EDITOR"
alias nV.nobg="export TRANSPARENT_TERM=true && ${GXEDITOR}"
alias nv.bg="export TRANSPARENT_TERM='' && $EDITOR"
alias nV.bg="export TRANSPARENT_TERM='' && ${GXEDITOR}"

alias nvw="nvim +WikiIndex"
alias nVw="cd ~/Desktop/info && vimr index.wiki"
alias nvj="nvim +WikiJournal"
alias nvt="nvim ~/Desktop/info/todo.md"
# alias lvim='vim -c "normal '\''0"'	# open last doc
