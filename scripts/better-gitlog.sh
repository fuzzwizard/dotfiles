#!/bin/sh

# Run once and you're good.

git config \
	--global alias.lg \
	"log --color --graph \
	--pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' \
	--abbrev-commit";
