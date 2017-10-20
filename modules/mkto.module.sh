unalias d
alias d="docker-compose"

YAML_DIR="/Users/msmall/Work/docker-compose/mercury"

dd () {
	if [[ "$(pwd)" != $YAML_DIR ]]; then
		pushd $YAML_DIR > /dev/null;
	else
		popd > /dev/null;
	fi
}

alias mlm_tail="tail -f $YAML_DIR/nohup.out"
alias hgclient_tail="docker logs -f mercury_mercury-client_1 --tail 500 \
	| ack --passthru 'webpack: Compiled successfully.'"
alias hgserver_tail="docker logs -f mercury_mercury-server_1 --tail 1000 \
	| ack --passthru '###'"

alias hg_storybook="work; cd mercury-storybook; yarn && yarn storybook;"

alias daystart="$WORK_DIR/.misc/day start"
alias dayend="$WORK_DIR/.misc/day end"

alias dedangle=docker volume rm "$(docker volume ls -qf dangling=true)"
