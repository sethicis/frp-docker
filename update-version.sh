#!/usr/bin/env bash

set -x

latest_release_version() {
  curl --silent "https://api.github.com/repos/fatedier/frp/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/' |
    sed -E 's/^v//'
}

latest_release=$(latest_release_version)

sed -E -i "s/frp_version=([0-9.-]+)/frp_version=${latest_release}/" ./Dockerfile
