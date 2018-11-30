alias d="docker-compose"

YAML_DIR="/Users/msmall/Work/docker-compose/mercury"
YAML_MIN_DIR="/Users/msmall/Work/docker-compose/mercury-min"
export DOCKER_COMPOSE_LOCATION="$YAML_DIR"
export COMPOSE_HTTP_TIMEOUT='1000'

__DD_POCKET=""

___dd () {
	if [[ "$(pwd)" != $1 ]]; then
		__DD_POCKET="$(pwd)";
		cd $1;
	elif [[ -n $__DD_POCKET ]]; then
		cd $__DD_POCKET;
		__DD_POCKET="";
	else;
		echo "Nowhere to navigate.";
	fi;
}

dd () {
	___dd $YAML_DIR;
}

ddm () {
	___dd $YAML_MIN_DIR;
}

dack() {
	d logs -f --tail 1000 $1 | ack --passthru "$2"
}
dgrep() {
	d logs -f --tail 1000 $1 | grep -n "$2"
}

dexec() {
	bash -c "clear && docker exec -it $1 sh"
}

alias dack_cl="dack mercury-client '｢wdm｣'"
alias dack_se="dack mercury-server '###'"

alias dedangle="docker volume rm \"$(docker volume ls -qf dangling=true)\""
alias sc="cd ~/secretcrimes"
