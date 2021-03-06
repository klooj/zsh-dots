# sourced when the shell receives instruction to end the session; i.e. `exit`
# the commands are executed and then the shell session closes. Can be useful for
# things making sure ssh-agents are killed or recompiling functions and the fpath
# for quicker loading on next login.

# dotcompile
shell.recompile 2> $HOME/err_$HOST
ssh-agent -k >&/dev/null
