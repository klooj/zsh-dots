
## autoload

- NOTE 3/6/2021: this paragraph is hard to read because i wrote it to myself to help understand what i was doing at the time, BUT it is 100% accurate in explaining how the autoload and compile process works. So i'm leaving it here in lieu of a finished writeup

 so take out the individual function definitions from each plugin and make each
 one its own file, removing the function name and declaration from the file
 and instead using it as the file name leaving the body of the funnction as the files'
 only contents. then zcompile/zrecompile those functions in plugin.zwc and add that
 zwc file explicity to fpath. resolve any aliases or expansions in the files
 definitions because they are suppressed. then autoload the zwc in zshrc using
 `autoload -w /path/to/plugin.zwc`

See the shell.recompile function for what is actually used. below is from the zsh manual and quick notes.  

### zrecompile flags

- "-R":
      When compiling scripts instead of autoloadable functions, it  is  often desirable to use this option; otherwise the whole file, including the code to define functions  which have  already  been  defined,  will remain mapped, consequently wasting memory.
- "-M"
    The compiled file is mapped into the shell's memory  when read.  This is done in such a way that multiple instances of the shell running on the same  host  will  share  this mapped file.  If neither -R nor -M is given, the zcompile builtin decides what to do based on the size of the  compiled file.

 ### Generic approach for zrecompiling scripts

- create digest of scripts in a `functions` directory that don't start with `_` (completion functions) and that don't have a `.` (function names cannot have that character). zrecompile any `.zsh` or `.zsh-theme` file that is not in a `*test*` directory (see 2a9a003), and that is a plain file with more than 1K
  * zcompile enabled module autoloaded functions

```shell
for dir in ${ZIM_HOME}/modules/${^zmodules}/functions(/FN); do
	zrecompile -pq ${dir}.zwc ${dir}/^(_*|*.*)(-.N)
done
```

  * zcompile enabled module scripts

```shell
for file (${ZIM_HOME}/modules/${^zmodules}/(^*test*/)#*.zsh{,-theme}(.NLk+1)); do
	zrecompile -pq ${file}
done
```
  * zcompile all prompt setup scripts

```shell
for file in ${ZIM_HOME}/modules/prompt/functions/prompt_*_setup; do
	zrecompile -pq ${file}
done
```

 instead of the fixed logic that was zrecompiling syntax-highlighting and history-substring-search modules' scripts.

### man pgs

- zshmisc
- 	- Syntax, redirection, functions, jobs, tests
- zshexpn
-  	- expansion and substitution
- zshparam
- zshoptions
- zshbuiltins
- zshzle
- zshcompsys
- zshmodules
- zshcontrib
- zshall
