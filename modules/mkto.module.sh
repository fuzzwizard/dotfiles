alias d="docker-compose"

__yamldir_mercury="/Users/msmall/Work/docker-compose/mercury"
__yamldir_mercury_min="/Users/msmall/Work/docker-compose/mercury-min"
__yamldir_asset="/Users/msmall/Work/docker-compose/asset"
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
	___dd $__yamldir_mercury;
}

ddm () {
	___dd $__yamldir_mercury_min;
}

dda () {
	___dd $__yamldir_asset;
}
docker_grep() {
	d logs -f --tail 1000 $1 | grep -n "$2"
}

docker_tail_ack() {
	d logs -f --tail 1000 $1 | ack --passthru "$2"
}

dexec() {
	bash -c "clear && docker exec -it $1 sh"
}

alias hgcli="docker_tail_ack mercury-client '｢wdm｣'"
alias hgser="docker_tail_ack mercury-server '###'"

alias dedangle="docker volume rm \"$(docker volume ls -qf dangling=true)\""
alias sc="cd ~/secretcrimes"
