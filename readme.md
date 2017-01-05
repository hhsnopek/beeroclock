# beero.cl/ock
> Proof of concept for a bash service. [Why?]

## Requirements
- [xinetd-org/xinetd]

## Installation
Copy [xinetd.d/beeroclock] over to their proper directory. Then update
`/etc/services` by commenting out port `80` and adding the following:
`beeroclock 80/tcp www`

Then depending on the location of this directory, you'll have to update [line 128]
which contains the path to the favicon.

## License
[MIT] © [Henry Snopek]

[Why?]: //medium.com/@hhsnopek/a-web-service-written-in-pure-bash-2af847902df1
[xinetd-org/xinetd]: //github.com/xinetd-org/xinetd
[xinetd.d/beeroclock]: xinetd.d/beeroclock
[line 128]: //github.com/hhsnopek/beeroclock/blob/master/service.sh#L112
[MIT]: license.md
[Henry Snopek]: //hhsnopek.com
