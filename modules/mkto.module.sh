alias d="docker-compose"

YAML_DIR="/Users/msmall/Work/docker-compose/mercury-min"
export DOCKER_COMPOSE_LOCATION=$YAML_DIR

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

alias sc="cd ~/secretcrimes"
alias hgclient_tail="docker logs -f mercury_mercury-client_1 --tail 500 \
	| ack --passthru 'webpack: Compiled successfully.'"
alias hgserver_tail="docker logs -f mercury_mercury-server_1 --tail 1000 \
	| ack --passthru '###'"
alias dedangle="docker volume rm \"$(docker volume ls -qf dangling=true)\""
