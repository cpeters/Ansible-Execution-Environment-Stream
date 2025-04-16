#!/usr/bin/env bash
#if [ ! -d "${HOME}" ]
#then
#  mkdir -p "${HOME}"
#fi
#if ! whoami &> /dev/null
#then
#  if [ -w /etc/passwd ]
#  then
#    echo "${USERNAME:-user}:x:$(id -u):0:${USERNAME:-user} user:${HOME}:/bin/bash" >> /etc/passwd
#    echo "${USERNAME:-user}:x:$(id -u):" >> /etc/group
#  fi
#fi
USER=$(whoami)
START_ID=$(( $(id -u)+1 ))
END_ID=$(( 65536-${START_ID} ))
echo "${USER}:${START_ID}:${END_ID}" > /etc/subuid
echo "${USER}:${START_ID}:${END_ID}" > /etc/subgid
/usr/libexec/podman/catatonit -- "$@"
