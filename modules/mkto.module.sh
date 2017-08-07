alias mlm_start="cd $WORK_DIR/docker-compose/mercury;\
  nohup docker-compose up nginx-proxy mlm mlm-mysql-data mlm-mysql zookeeper\
  locator identity redis mongo memcached assetapi treeservice metadataservice\
  mercury-server &"

alias mlm_stop="cd $WORK_DIR/docker-compose/mercury; \
  docker-compose stop nginx-proxy mlm mlm-mysql-data mlm-mysql zookeeper locator\
  identity redis mongo memcached assetapi treeservice metadataservice\
  mercury-server"

alias hgclient_start="cd $WORK_DIR/docker-compose/mercury &&\
  nohup docker-compose up mercury-client >/dev/null &"

alias hgclient_stop="cd $WORK_DIR/docker-compose/mercury;\
  docker-compose stop mercury-client"

alias mlm_tail="tail -f $WORK_DIR/docker-compose/mercury/nohup.out"
alias hgclient_tail="docker logs -f mercury_mercury-client_1 --tail 100"
alias hgserver_tail="docker logs -f mercury_mercury-server_1 --tail 100"

# This sleep 60 is so bad that I am embarassed to commit it.
alias mlm="mlm_stop; sleep 60; mlm_start; mlm_tail;"
alias hg_storybook="work; cd mercury-storybook; yarn && yarn storybook;"
