## Notes on aliases:

- aliases do not take arguments but may be followed by anything on the cli.
- i do not use global aliases but you should know that option exists; i.e. `alias -g C='| wc -l'`. read up on it and be very careful if you chose to implement them.
- any file in this directory that ends in .zsh will be sourced by `.zlogin`.
  * more specifically, any file that ends in .zsh will be compiled into a `.zwc` file. When given the command `source path/to/somefile.zsh`, the shell will source `path/to/somefile.zwc` if it exists and is newer than `path/to/somefile.zsh`.
- If the right hand side of the assignment is surrounded in double quotes, aliases that have already been defined will be expanded.
  So:
```shell
alias l='ls'
alias ll="l -A"
```
  results in `ll='ls -A'`
-  as with many of the functions, some aliases are verbose; this may seem to defeat the purpose of an alias. But, when combined with tab completion, I find this approach keeps more commands at my fingers and less in my head.  So, if I type `net.` then press the tab key, completion will show me the appropriate aliases and commands for that context. This approach requires some extra thought on the front end for naming and organization in order to be successful.
-  in some of these files, I use conditional statements so that the same alias produces the same result across different operating systems despite using different underlying functions.
