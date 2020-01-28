#!/bin/bash
alias d="docker-compose"

__yamldir_meue="/Users/msmall/devdocker/meue"
__yamldir_meue_min="/Users/msmall/devdocker/docker-compose/meue-min"

export DOCKER_COMPOSE_LOCATION="/Users/msmall/Work/docker-compose/"
export COMPOSE_HTTP_TIMEOUT='1000'

__DD_POCKET=""

godir () {
	local workdir="$(pwd)";
	if [[ workdir != $1 ]]; then
		__DD_POCKET=workdir;
		cd $1 || exit;
	elif [[ -n $__DD_POCKET ]]; then
		cd "$__DD_POCKET" || exit;
		__DD_POCKET="";
	else
		echo "😩 Nowhere to navigate.";
	fi;
}

dd() {
	godir $__yamldir_meue;
}

ddm() {
	godir $__yamldir_meue_min;
}

docker_grep() {
	d logs -f --tail 1000 "$1" | grep -n "$2"
}

docker_tail_ack() {
	d logs -f --tail 1000 "$1" | ack --passthru "$2"
}

dexec() {
	bash -c "clear && docker exec -it $1 sh"
}

alias mcli="docker_tail_ack meue-client '｢wdm｣'"
alias mser="docker_tail_ack meue-server '###'"

alias dedangle="docker volume rm \"$(docker volume ls -qf dangling=true)\""
alias sc="cd ~/Work"
