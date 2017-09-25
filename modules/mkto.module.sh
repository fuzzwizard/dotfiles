unalias d
alias d="docker-compose"

GREEN="\e[32m"
BLUE="\e[34m"
YELLOW="\e[33m"
NORMAL="\e[0m"

ROOT="$WORK_DIR"
DC_YAML_DIR="$ROOT/docker-compose/mercury"

__header () {
  local msg="$@"
  local char="#"
  local msg_length="$(echo $msg | wc -c) + 6"
  local line="$(printf '%*s' "$msg_length" | tr ' ' "$char")"

  echo "${GREEN}${line}\n   $msg \n${line}${NORMAL}"
}

__print () {
  echo "${BLUE}##### $@ ${NORMAL}"
}

__warn () {
  echo "${YELLOW}##### $@ ${NORMAL}"
}

__switch_into_docker_compose_dir () {
  if [[ "$(pwd)" != $DC_YAML_DIR ]]; then
    pushd $DC_YAML_DIR > /dev/null;
  else
    popd > /dev/null;
  fi
}; alias dd="__switch_into_docker_compose_dir"

__delete_dangling_docker_volumes () {
  __header "🏄  Deleting dangling docker volumes."

  local vols=$(docker volume ls -qf dangling=true)
  if [[ ! -n $vols ]]; then
    __print "🤙  No dangling volumes."
  else
    __warn "🗑  Removing the following volumes:"
    docker volume rm $vols
    echo $vols
  fi
}; alias ddangle="__delete_dangling_docker_volumes"

__docker_health_report () {
  __header "👩‍⚕️  Docker health report."

  local docker_ps="$(docker ps -a)"

  local unhealthy_containers="$(echo $docker_ps | grep -i 'unhealthy')"
  if [[ ! -n $unhealthy_containers ]]; then
    __print "😃  No unhealthy containers."
  else
    __warn "🤧  Unhealthy containers found: "
    echo $unhealthy_containers
  fi

  local exited_containers="$(echo $docker_ps | grep -i 'exited')"
  if [[ ! -n $exited_containers ]]; then
    __print "👌  No exited containers."
  else
    __print "✋  Exited containers found: "
    echo $exited_containers
  fi
}; alias dhealth="__docker_health_report"

alias mlm_tail="tail -f $DC_YAML_DIR/nohup.out"
alias hgclient_tail="docker logs -f mercury_mercury-client_1 --tail 100"
alias hgserver_tail="docker logs -f mercury_mercury-server_1 --tail 100"

alias daystart="$WORK_DIR/.misc/day start"
alias dayend="$WORK_DIR/.misc/day end"
