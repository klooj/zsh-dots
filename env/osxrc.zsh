export BROWSER="open -a /Applications/Safari.app"
export GXEDITOR="vimR"
export HOMEBREW_AUTO_UPDATE_SECS=86400
export HOMEBREW_BAT=1
export HOMEBREW_CELLAR="/usr/local/Cellar"
export HOMEBREW_PREFIX="/usr/local"
export HOMEBREW_REPOSITORY="/usr/local/Homebrew"
export LOCATE_PATH=/var/db/locate.database
export MANPATH="/usr/local/gnuman:/usr/local/man:/usr/local/share/man:/usr/share/man:/Library/Apple/usr/share/man:$XDG_MAN"
export TOOLCHAINS=swift
# export HELPDIR=/usr/local/share/zsh/help
# export HOMEBREW_FORCE_VENDOR_RUBY=true
# export LC_COLLATE=US-ASCII


# path
# ==========
#TODO: get rid of this hard-coded value for ruby
local rubyv=3.0.0
path=(
	/usr/local/opt/ccache/libexec
	/usr/local/gnubin
	/usr/local/bin
	/usr/local/sbin
	$HOME/.local/bin
	$HOME/go/bin
	$HOME/.cargo/bin
	$HOME/.pyenv/bin
	$HOME/.gem/ruby/$rubyv/bin
	/usr/local/lib/ruby/gems/${rubyv}/bin
	/usr/local/opt/ruby/bin
	/usr/local/opt/python/libexec/bin
	/usr/bin
	/usr/sbin
	/bin
	/sbin
	# /opt/X11/bin
	# /Library/Apple/usr/bin
	# /Library/TeX/texbin
	$path
)

fpath=(
 	/usr/local/share/zsh/site-functions.zwc
 	/usr/local/share/zsh/functions.zwc
	$fpath
)
# /usr/local/share/zsh/site-functions
# /usr/local/share/zsh/functions
# ln -s /System/Library/PrivateFrameworks/Apple80211.framework/Versions/Current/Resources/airport /usr/local/bin/airport


# compiler flags
# ================
typeset -gTU LDFLAGS ldflags
LDFLAGS+="-L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib"
ldflags=(-L/usr/local/opt/{openssl@1.1,qt,readline,ruby,libpq,libressl,python}/lib $ldflags)
typeset -gTU PKG_CONFIG_PATH pkg_config_path
pkg_config_path+=(/usr/local/opt/{openssl@1.1,qt,libressl,python,readline,ruby,libpq}/lib/pkgconfig)
export RUBY_CONFIGURE_OPTS="--with-openssl-dir=/usr/local/opt/openssl@1.1"



#############
# export ldflags=("$ldflags -L/usr/local/opt/llvm/lib -Wl,-rpath,/usr/local/opt/llvm/lib")
# typeset -gTU CPPFLAGS cppflags
# cppflags+=(-I/usr/local/opt{openssl@1.1,qt,readline,ruby,libpq,libressl}/include)
# export GUILE_LOAD_PATH="/usr/local/share/guile/site/3.0"
# export GUILE_LOAD_COMPILED_PATH="/usr/local/lib/guile/3.0/site-ccache"
# export GUILE_SYSTEM_EXTENSIONS_PATH="/usr/local/lib/guile/3.0/extensions"
# export GUILE_TLS_CERTIFICATE_DIRECTORY=/usr/local/etc/gnutls/
# ,expat, sqlite
