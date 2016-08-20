#!/bin/bash

info() {
    echo -e "\x1b[97m\xE2\x87\x92 \x1b[0m $1"
}

error() {
    echo -e "\x1b[97m\x1b[41m\x21\x1b[0m \x1b[31m$1\x1b[0m" 1>&2
    exit 1
}

warning() {
    echo -e "\x1b[97m\x1b[45m\x21\x1b[0m $1"
}

