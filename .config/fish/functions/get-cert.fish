function get-cert
	if test (count $argv) -lt 1; or test $argv[1] = "--help"
		echo "get-cert requires a hostname:port or hostname target"
		return
	end
	switch $argv
	case "*:*"
		set hostname (echo "$argv" | awk '{split($0,a,":"); print a[1]}')
		set port (echo "$argv" | awk '{split($0,a,":"); print a[2]}')
	case "*"
		set hostname $argv
		set port 443
	end
	echo -n | openssl s_client -connect "$hostname:$port" | sed -ne '/-BEGIN CERTIFICATE-/,/-END CERTIFICATE-/p' > "./$hostname.cert"
end
