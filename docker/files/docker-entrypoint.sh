#!/bin/bash

set -ue

uid=${DK_UID:-1001}
gid=${DK_GID:-1001}
username=${DK_NAME:-firacode}

if ! id -u "$username" >/dev/null 2>&1; then
  groupadd -g"$gid" "$username"
  useradd -u"$uid" -g"$gid" -M -s/bin/bash "$username"
fi

exec gosu "$username" "$@"
