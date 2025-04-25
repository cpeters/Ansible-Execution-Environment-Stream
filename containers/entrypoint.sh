#!/usr/bin/env bash
USER=$(whoami)
START_ID=$(($(id -u) + 1))
END_ID=$((65536 - ${START_ID}))
echo "${USER}:${START_ID}:${END_ID}" >/etc/subuid
echo "${USER}:${START_ID}:${END_ID}" >/etc/subgid
/usr/libexec/podman/catatonit -- "$@"
