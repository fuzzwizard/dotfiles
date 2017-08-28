alias dc_pull="pushd $WORK_DIR/docker-compose/mercury;\
  docker-compose pull; popd"

alias dc_start="pushd $WORK_DIR/docker-compose/mercury;\
  docker-compose up &; popd"

alias dc_stop="pushd $WORK_DIR/docker-compose/mercury; \
  docker-compose stop; popd"

alias hgclient_start="pushd $WORK_DIR/docker-compose/mercury &&\
  nohup docker-compose up mercury-client >/dev/null &; popd"

alias hgclient_stop="pushd $WORK_DIR/docker-compose/mercury;\
  docker-compose stop mercury-client; popd"

alias mlm_tail="tail -f $WORK_DIR/docker-compose/mercury/nohup.out"
alias hgclient_tail="docker logs -f mercury_mercury-client_1 --tail 100"
alias hgserver_tail="docker logs -f mercury_mercury-server_1 --tail 100"

# This sleep 60 is so bad that I am embarassed to commit it.
alias hg_storybook="work; cd mercury-storybook; yarn && yarn storybook;"
alias secret_crimes="rm -rf ~/Secret\ Crimes/*"
