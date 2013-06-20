#!/bin/bash

read -p "Are u sure ? (y/n) : " -n 1
echo
if [[ $REPLY =~ ^[Yy]$ ]]; then
	rsync --exclude ".git/" --exclude "README.md" --exclude "run.sh" -av --no-perms . ~
	echo "You have the new config"
else
	echo "No problem bro ! ;)"
fi
