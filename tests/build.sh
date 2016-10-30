#!/bin/bash

ansible-playbook build.yml
if [ "$?" != "0" ]; then
    cat build.out
fi 
