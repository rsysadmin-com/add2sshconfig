# add2sshconfig
Update your ~/.ssh/config file with new `ProxyCommand` entries to access servers behind a jump host.

## usage
Run the script without arguments to show the help.

```
./add2sshconfig.sh 
add2sshconfig.sh hostname ip.add.re.ss
  e.g.: add2sshconfig.sh foobar 10.10.10.10 10.10.10.100
```

This will result in:

```
== Adding foobar [10.10.10.10] to /home/martin/.ssh/config...
Host foobar
      User martin
      Hostname 10.10.10.10
      ProxyCommand ssh martin@10.10.10.100 -W %h:%p

Host 10.10.10.10
      User martin
      Hostname 10.10.10.10
      ProxyCommand ssh martin@10.10.10.100 -W %h:%p

```
where `10.10.10.100` is the jump host.


## disclaimer
this script is published on an "AS IS" basis. The author is not to be held responsible for any damages its use or misuse may cause.
