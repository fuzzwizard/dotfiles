DC="docker-compose"

__in () {
	pushd "/Users/msmall/Work/docker-compose/mercury" > /dev/null;
}

__out () {
	popd > /dev/null;
}

__dc_do_one () {
	__in; docker-compose "$@"; __out; 
}

alias dc_pull="__dc_do_one pull"

alias dc_start="__dc_do_one \"up &\""

alias dc_stop="__dc_do_one stop"

alias dc_flush="__in; \
  $DC stop; $DC rm; $DC pull; __out"

alias dc_restart=" __in; \
  $DC stop; $DC up; __out"

alias dc_pullrestart="__in; \
  $DC stop; $DC pull; $DC up; __out"

alias hgclient_start="__in &&\
  nohup $DC up mercury-client >/dev/null &; __out"

alias hgclient_stop="__in; \
  $DC stop mercury-client; __out"

alias mlm_tail="tail -f $WORK_DIR/$DC/mercury/nohup.out"
alias hgclient_tail="docker logs -f mercury_mercury-client_1 --tail 100"
alias hgserver_tail="docker logs -f mercury_mercury-server_1 --tail 100"

alias hg_storybook="work; cd mercury-storybook; yarn && yarn storybook;"
alias secret_crimes="rm -rf ~/Secret\ Crimes/*"
