#!/usr/bin/env bash

curl --silent "https://api.github.com/repos/fatedier/frp/releases/latest" |
    grep '"tag_name":' |
    sed -E 's/.*"([^"]+)".*/\1/' |
    sed -E 's/^v//'