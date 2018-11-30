alias d="docker-compose"

YAML_DIR="/Users/msmall/Work/docker-compose/mercury"
YAML_DIR="/Users/msmall/Work/docker-compose/mercury-min"
export DOCKER_COMPOSE_LOCATION="$YAML_DIR"
export COMPOSE_HTTP_TIMEOUT='1000'

__DD_POCKET=""

dd () {
	if [[ "$(pwd)" != $YAML_DIR ]]; then
		__DD_POCKET="$(pwd)";
		cd $YAML_DIR;
	elif [[ -n $__DD_POCKET ]]; then
		cd $__DD_POCKET;
		__DD_POCKET="";
	else;
		echo "Nowhere to navigate.";
	fi;
}

ddm () {
	if [[ "$(pwd)" != $YAML_MIN_DIR ]]; then
		__DD_POCKET="$(pwd)";
		cd $YAML_DIR;
	elif [[ -n $__DD_POCKET ]]; then
		cd $__DD_POCKET;
		__DD_POCKET="";
	else;
		echo "Nowhere to navigate.";
	fi;
}

dack() {
	local target="$(basename $(pwd))_$1_1"
	d logs -f $target --tail 1000 | ack --passthru "$2"
}
dgrep() {
	local target="$(basename $(pwd))_$1_1"
	d logs -f $target --tail 1000 | grep -n "$2"
}

dexec() {
	local target="$(basename $(pwd))_$1_1"
	bash -c "clear && docker exec -it $target sh"
}

alias dtail_client="dack mercury-client '｢wdm｣'"
alias dtail_server="dack mercury-server '###'"

alias dedangle="docker volume rm \"$(docker volume ls -qf dangling=true)\""
alias sc="cd ~/secretcrimes"
