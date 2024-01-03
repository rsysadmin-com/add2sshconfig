#!/bin/bash

# v0.1 by martinm@rsysadmin.com
#

ssh_config=~/.ssh/config
host=$1
ip=$2

function usage() {
cat << EOT
$(basename $0) hostname ip.add.re.ss
  e.g.: $(basename $0) foobar 10.10.10.10
EOT
   exit 1
}

[[ $# -lt 2 ]] && usage

egrep $host $ssh_config > /dev/null
if [ $? -eq 0 ]
then
   echo -e "\n== $host [$ip] found in $ssh_config."
   echo -e "== Edit $ssh_config manually. Bailing out...\n"
   exit 1
else
   echo -e "\n== Adding $host [$ip] to $ssh_config..."
    echo "Host $host
      User $USER
      Hostname $ip
      ProxyCommand ssh $USER@10.0.104.10 -W %h:%p

Host $ip
      User $USER
      Hostname $ip
      ProxyCommand ssh $USER@10.0.104.10 -W %h:%p
" | tee -a $ssh_config
fi

