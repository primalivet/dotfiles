" add characters that can be included in keywords on top of what vim already
" think is keywords
setlocal iskeyword+=-

syntax match SSHKnownHostsIP4 "\<\(\d\{1,3}\.\)\{3}\d\{1,3}\>"
highlight def link SSHKnownHostsIP4 Constant

syntax keyword SSHKnownHostsRSA ssh-rsa
highlight def link SSHKnownHostsRSA Type

syntax match SSHKnownHostsRSAPubKey "AAAA.\+[=]\{0,2}"
highlight def link SSHKnownHostsRSAPubKey String

