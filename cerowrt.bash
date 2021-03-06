#!/bin/bash
set -o errexit -o nounset -o pipefail
function -h {
cat <<EOF
 USAGE: $0 (-0)?
        $0 show (-0)?
        $0 //<task> <arg>*
        $0 list

  In the first form, runs all the top-level tasks and their dependencies. In
  the second form, shows what would be run. The remaining forms are for
  debugging.

  With -0, the output of the task listing and the main command use ASCII null
  to separate the status, the task head word and each argument in the argument
  list, to facilitate unambiguous parsing. Each line ends with two nulls.

EOF
}; function --help { -h ;}

tag=$'(unversioned)'

function //cerowrt {
  local -a ___=( "$@" )
  : This task had no commands.
}

function //network.reload {
  local -a ___=( "$@" )
  run uci commit wireless
  run /etc/init.d/network reload
}

function //opkg {
  local -a ___=( "$@" )
  run opkg install "$@"
}

function //opkg.up {
  local -a ___=( "$@" )
  run opkg update
}

function //qos {
  local -a ___=( "$@" )
  { [[ ${1:+true} ]] &&
    { local download="$1"
      shift ;} ;} ||
  local download=100000
  { [[ ${1:+true} ]] &&
    { local upload="$1"
      shift ;} ;} ||
  local upload=10000
  run uci commit qos
  run /etc/init.d/qos restart
}

function //system {
  local -a ___=( "$@" )
  { [[ ${1:+true} ]] &&
    { local hostname="$1"
      shift ;} ;} ||
  local hostname=CEROwrt
  run uci commit system
  run hostname "$hostname"
}

function //tools {
  local -a ___=( "$@" )
  : This task had no commands.
}

function //uci.set {
  local -a ___=( "$@" )
  local key="$1"
  shift
  local value="$1"
  shift
  run logger $'taskl:' uci.set "$key" "$value"
  run uci set "$key"$'='"$value"
}

function //uci.set.qos {
  local -a ___=( "$@" )
  local download="$1"
  shift
  local upload="$1"
  shift
  { [[ ${1:+true} ]] &&
    { local iface="$1"
      shift ;} ;} ||
  local iface=ge00
  : This task had no commands.
}

function //uci.set.wireless {
  local -a ___=( "$@" )
  local iface="$1"
  shift
  local key="$1"
  shift
  local value="$1"
  shift
  : This task had no commands.
}

function //wireless {
  local -a ___=( "$@" )
  { [[ ${1:+true} ]] &&
    { local ssid_base="$1"
      shift ;} ;} ||
  local ssid_base=CEROwrt
  { [[ ${1:+true} ]] &&
    { local key="$1"
      shift ;} ;} ||
  local key=Beatthebloat
  : This task had no commands.
}

function //wireless.iface {
  local -a ___=( "$@" )
  local iface="$1"
  shift
  local ssid="$1"
  shift
  local key="$1"
  shift
  : This task had no commands.
}

function tasks {
  enter 00
  enter 01
  enter 02
  enter 03
  enter 04
  try 04
  leave 04
  try 03
  leave 03
  enter 05
  try 05
  leave 05
  enter 06
  try 06
  leave 06
  enter 07
  try 07
  leave 07
  try 02
  leave 02
  try 01
  leave 01
  enter 08
  enter 09
  try 09
  leave 09
  try 08
  leave 08
  enter 10
  enter 11
  try 11
  leave 11
  try 10
  leave 10
  enter 12
  enter 13
  enter 14
  enter 15
  enter 16
  try 16
  leave 16
  enter 17
  try 17
  leave 17
  enter 18
  try 18
  leave 18
  enter 19
  try 19
  leave 19
  enter 20
  try 20
  leave 20
  enter 21
  try 21
  leave 21
  enter 22
  try 22
  leave 22
  enter 23
  try 23
  leave 23
  enter 24
  try 24
  leave 24
  enter 25
  try 25
  leave 25
  enter 26
  try 26
  leave 26
  enter 27
  try 27
  leave 27
  try 15
  leave 15
  try 14
  leave 14
  enter 28
  try 28
  leave 28
  enter 29
  try 29
  leave 29
  try 13
  leave 13
  enter 30
  enter 31
  try 31
  leave 31
  enter 32
  try 32
  leave 32
  enter 33
  try 33
  leave 33
  try 30
  leave 30
  enter 34
  enter 35
  try 35
  leave 35
  enter 36
  try 36
  leave 36
  enter 37
  try 37
  leave 37
  try 34
  leave 34
  enter 38
  enter 39
  try 39
  leave 39
  enter 40
  try 40
  leave 40
  enter 41
  try 41
  leave 41
  try 38
  leave 38
  try 12
  leave 12
  try 00
  leave 00
}

argv00=( //cerowrt )
argv15=( //network.reload )
argv03=( //opkg
         qos-scripts )
argv11=( //opkg
         zile )
argv04=( //opkg.up )
argv01=( //qos
         100000
         10000 )
argv08=( //system
         CEROwrt )
argv10=( //tools )
argv05=( //uci.set
         qos.ge00.download
         100000 )
argv06=( //uci.set
         qos.ge00.enabled
         1 )
argv07=( //uci.set
         qos.ge00.upload
         10000 )
argv09=( //uci.set
         $'system.@system[0].hostname'
         CEROwrt )
argv16=( //uci.set
         $'wireless.@wifi-iface[0].encryption'
         psk2 )
argv17=( //uci.set
         $'wireless.@wifi-iface[0].key'
         Beatthebloat )
argv18=( //uci.set
         $'wireless.@wifi-iface[0].ssid'
         CEROwrt )
argv19=( //uci.set
         $'wireless.@wifi-iface[1].encryption'
         psk2 )
argv20=( //uci.set
         $'wireless.@wifi-iface[1].key'
         Beatthebloat )
argv21=( //uci.set
         $'wireless.@wifi-iface[1].ssid'
         CEROwrt-guest )
argv22=( //uci.set
         $'wireless.@wifi-iface[3].encryption'
         psk2 )
argv23=( //uci.set
         $'wireless.@wifi-iface[3].key'
         Beatthebloat )
argv24=( //uci.set
         $'wireless.@wifi-iface[3].ssid'
         CEROwrt5 )
argv25=( //uci.set
         $'wireless.@wifi-iface[4].encryption'
         psk2 )
argv26=( //uci.set
         $'wireless.@wifi-iface[4].key'
         Beatthebloat )
argv27=( //uci.set
         $'wireless.@wifi-iface[4].ssid'
         CEROwrt-guest5 )
argv02=( //uci.set.qos
         100000
         10000 )
argv14=( //uci.set.wireless
         0
         encryption
         psk2 )
argv28=( //uci.set.wireless
         0
         key
         Beatthebloat )
argv29=( //uci.set.wireless
         0
         ssid
         CEROwrt )
argv31=( //uci.set.wireless
         1
         encryption
         psk2 )
argv32=( //uci.set.wireless
         1
         key
         Beatthebloat )
argv33=( //uci.set.wireless
         1
         ssid
         CEROwrt-guest )
argv35=( //uci.set.wireless
         3
         encryption
         psk2 )
argv36=( //uci.set.wireless
         3
         key
         Beatthebloat )
argv37=( //uci.set.wireless
         3
         ssid
         CEROwrt5 )
argv39=( //uci.set.wireless
         4
         encryption
         psk2 )
argv40=( //uci.set.wireless
         4
         key
         Beatthebloat )
argv41=( //uci.set.wireless
         4
         ssid
         CEROwrt-guest5 )
argv12=( //wireless
         CEROwrt
         Beatthebloat )
argv13=( //wireless.iface
         0
         CEROwrt
         Beatthebloat )
argv30=( //wireless.iface
         1
         CEROwrt-guest
         Beatthebloat )
argv34=( //wireless.iface
         3
         CEROwrt5
         Beatthebloat )
argv38=( //wireless.iface
         4
         CEROwrt-guest5
         Beatthebloat )


################################### Running raw commands: helpers and reporting

tmp=/tmp/"$(printf 'taskl.%04x%04x.%d\n' $RANDOM $RANDOM $$)"
function tmp {
  trap "rm -rf $tmp" EXIT
  mkdir -p "$tmp"
  chmod =t,u=rxw,g=rxs "$tmp"
}

# Every action is run in a subshell with log tailing. If the action's
# "command" part is a URL then we use curlx to download and run the URL.
function run {
  case "$1" in
    http://*|https://*) local cmd=( curlx "$@" ) ;;
    *)                  local cmd=( exec  "$@" ) ;;
  esac
  tmp
  if ( exec 1> >(exec tail -n20 > "$tmp"/o)
       exec 2> >(exec tail -n20 > "$tmp"/e)
       "${cmd[@]}" )
  then : # Do nothing.
  else
    local x=$?
    bar "Command failed with exit code $x"
    msg "$@"
    if [[ -s "$tmp"/o ]]
    then bar "Last few (up to 20) lines of stdout" && cat "$tmp"/o >&2
    else bar "No stdout available"
    fi
    if [[ -s "$tmp"/e ]]
    then bar "Last few (up to 20) lines of stderr" && cat "$tmp"/e >&2
    else bar "No stderr available"
    fi
    return $(( $x == 0 ? 1 : $x ))
  fi
}

function curlx {
  local url="$1" ; shift
  local bin="$tmp"/x
  curl -sSfL --retry 2 "$url" > "$bin"
  chmod u+rx "$bin"
  exec "$bin" "$@"
}


############################################## Managing and reporting task runs

# This portion of the code makes heavy use of "variable variables" to access
# state local to a particular run, in particular: argument vectors for
# individual calls and stored exit statuses. The $depth variable is also
# shared among them.

dry_run=false
depth=0

# Print a message on entry to a task and set the indent level. If the task has
# already been run, this procedure will simply repeat the message that
# indicated how the task went the first time round.
function enter {
  depth=$(( $depth + 1 ))
  stateful_status "$@"
}

# Execute a task if it hasn't already been executed, storing its return code in
# a shared variable.
function try {
  ! $dry_run || return 0
  local exit_ptr="exit$1"
  local argv_ptr="argv$1[@]"
  if ! [[ ${!exit_ptr:-} ]]
  then
    ( set -o errexit -o nounset -o pipefail ; "${!argv_ptr}" ) &&
      local code=$? || local code=$?
    eval "$exit_ptr=$code"
  fi
}

# Report on the status of a task (but not if it's already been reported) and
# restore the indent level.
function leave {
  local stat_ptr="stat$1"
  local exit_ptr="exit$1"
  if $dry_run
  then
    depth=$(( $depth - 1 ))
  else
    case "${!stat_ptr}" in
      '*') stateful_status "$@" ;;
    esac
    depth=$(( $depth - 1 ))
    return "${!exit_ptr}"
  fi
}

function stateful_status {
  local stat_ptr="stat$1"
  local exit_ptr="exit$1"
  local argv_ptr="argv$1[@]"
  case "${!exit_ptr:-}" in
    '') eval "$stat_ptr='*'" ;;
    0)  eval "$stat_ptr='+'" ;;
    *)  eval "$stat_ptr='!'" ;;
  esac
  status_line "${!stat_ptr}" "$depth" "${!argv_ptr}"
}


#################################################################### Formatting

function out { printf '%s\n' "$*" ;}
function msg { printf '%79s\n' "$*" >&2 ;}
function err { local x=$? ; msg "$*" ; return $(( $x == 0 ? 1 : $x )) ;}

zero=false
function status_line {
  local status="$1" ; shift
  local indent=$(( 10#$1 )) ; shift
  printf "%-${depth}s" "$status"
  if $zero
  then printf ' \0%s\0' "$@" && printf '\0\n'
  else printf ' %s'     "$@" && echo
  fi
}

function bar {
  local s="$*"
  local n=$(( 72 - ${#s} ))
  printf ' ==%s %s ==\n' \
         "$( [[ $n -lt 1 ]] || yes = | head -n$n | tr -d -c = )" \
         "$s" >&2
}


############################################### Arguments and options, dispatch

function show {
  if [[ ${1:+true} ]]
  then [[ $1 = -0 ]] && local zero=true || err "Bad option."
  fi
  local dry_run=true
  tasks
}

function list {
  declare -F | cut -d' ' -f3 | egrep ^//
}

function tag {
  out "$tag"
}


if [[ $# -gt 0 ]]
then
  if [[ $1 = -0 ]]
  then
    [[ $# = 1 ]] || err "Bad arguments."
    zero=true
    tasks
  else
    if [[ $1 ]] && declare -F | cut -d' ' -f3 | fgrep -qx -- "$1"
    then "$@"
    else err 'No such subcommand: `'"$1""'"
    fi
  fi
else
  tasks
fi

