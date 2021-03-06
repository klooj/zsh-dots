# This is a modified version of the omz ssh-agent plugin. You need to specify
# the keys to be loaded and the directory in which they are located. If you
# want agent forwarding, address that in your ssh config rather than here.

# NOTE: friendly reminder, check permissions for the $HOME directory itself to
# make sure it is not world writable. `chmod 755 ~/ ` is the outer limit of
# acceptable for strict modes to function properly with ssh.

# The default directory is ~/.ssh and loads id_rsa, id_ed25519, and keys beginning
# with "$HOST_" except those containing the string "pub" or "dsa". Agents expire
# after 4 hours or are killed upon logout (see .zlogout for the latter).

local sshdir=$HOME/.ssh
local myids=($(print "$sshdir"/id{_rsa,_ed25519}(:t)) $(print "$sshdir"/"$HOST"_*~*(pub|dsa)(:t)))

typeset _agent_forwarding _ssh_env_cache

function _start_agent() {
	local lifetime
	zstyle -s :omz:plugins:ssh-agent lifetime lifetime

	# start ssh-agent and setup environment
	ssh-agent -s ${lifetime:+-t} ${lifetime} | sed 's/^echo/#echo/' >! $_ssh_env_cache
	chmod 600 $_ssh_env_cache
	. $_ssh_env_cache > /dev/null
}

function _add_identities() {
	local id line sig lines
	local -a identities loaded_sigs loaded_ids not_loaded
	zstyle -a :omz:plugins:ssh-agent identities identities

	# check for .ssh folder presence
	if [[ ! -d $sshdir ]]; then
		return
	fi

	for id in $myids; do
			# check if file exists
		[[ -f "$sshdir/$id" ]] && identities+=$id
	done

	# get list of loaded identities' signatures and filenames
	if lines=$(ssh-add -l); then
		for line in ${(f)lines}; do
			loaded_sigs+=${${(z)line}[2]}
			loaded_ids+=${${(z)line}[3]}
		done
	fi

	# add identities if not already loaded
	for id in $identities; do
		# check for filename match, otherwise try for signature match
		if [[ ${loaded_ids[(I)$sshdir/$id]} -le 0 ]]; then
			sig="$(ssh-keygen -lf "$sshdir/$id" | awk '{print $2}')"
			[[ ${loaded_sigs[(I)$sig]} -le 0 ]] && not_loaded+="$sshdir/$id"
		fi
	done

	[[ -n "$not_loaded" ]] && ssh-add ${^not_loaded}
}

# Get the filename to store/lookup the environment from
_ssh_env_cache="$sshdir/environment-$SHORT_HOST"

if [[ -n "$SSH_AUTH_SOCK" ]]; then
	[[ -L $SSH_AUTH_SOCK ]] || ln -sf "$SSH_AUTH_SOCK" /tmp/ssh-agent-$USER-screen

elif [[ -f "$_ssh_env_cache" ]]; then
	# Source SSH settings, if applicable
	. $_ssh_env_cache > /dev/null
	if [[ $USER == "root" ]]; then
		FILTER="ax"
	else
		FILTER="x"
	fi
	ps $FILTER | rg "ssh-agent" | rg -q "$SSH_AGENT_PID" || {
		_start_agent >&/dev/null
	}
else
	_start_agent >&/dev/null
fi

_add_identities >&/dev/null

# tidy up after ourselves
unset _agent_forwarding _ssh_env_cache
unfunction _start_agent _add_identities
