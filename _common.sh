#!/bin/bash

fini(){
    log "Stopped!"
    trap - EXIT
    exit 0
}

log(){
    echo "[@] $@"
}
