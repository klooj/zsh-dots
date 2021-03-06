alias net.porto6='lsof -Pnl +M -i6'
alias net.porto4='lsof -Pnl +M -i4'
alias net.portListens='lsof -PiTCP -sTCP:LISTEN'
alias net.ipPub='echo "public ip:"; dig +short myip.opendns.com @resolver1.opendns.com || dig TXT +short o-o.myaddr.l.google.com @ns1.google.com'

case $OSTYPE in
	*darwin*)

		alias net.namehost='echo "Host name per ...\nsetting: `scutil --get HostName`\nlocalhost:`scutil --get LocalHostName`\nfqdn: `hostname -f`"'
		alias net.namecpu='echo "computer name:" && networksetup -getcomputername'
    alias net.names="net.namehost && net.namecpu"

		alias net.intAll='networksetup -listnetworkserviceorder'
		alias net.ints="networksetup -listallnetworkservices | sed -e '/\*/d' -e '/Thunder/d'"
    alias net.ips="net.ints | while read file; do echo $file && networksetup -getinfo $file; done; net.ipPub"
    alias net.dns="net.ints | while read file; do echo $file && networksetup -getdnsservers $file; done"
		alias net.dnsAll="echo 'DNS configs:' scutil --dns"
		# alias net.dns="echo 'DNS:' && scutil --dns | rg --word-regexp --only-matching --no-line-number 'nameserver.*' | uniq"

		alias net.proxy='scutil --proxy'
    alias net.wifi='airport -I'

    alias net.info="net.names; net.ips; net.dns; net.speed"

		;;
	*linux*)
		# alias net.namehost='hostname -f && hostname -s'
    alias net.names="echo 'hostname\nfqdn:`hostname -f` short:`hostname -s`'"

		alias net.dns='echo "domain: `hostname -d`\nservers: `nmcli | rg --no-line-number --after-context 3 DNS`"'
    alias net.intAll='nmcli g; nmcli d'
		alias net.ints="nmcli | rg --word-regexp --only-matching --no-line-number '(^(en|eth)[[:alnum:]]*)'"
		alias net.ips="hostname -I; net.ipPub"
		alias net.ip4="nmcli | rg --word-regexp --only-matching --no-line-number '(^(en|eth)[[:alnum:]]*)' | ip addr show | rg -F 'inet ' | rg -o '192\S*/' | sed -e 's/^.*://' -e 's+/++'"
    alias net.info="net.names; net.ipPub; nmcli -g common -m tabular; net.speed"


		;;
esac
