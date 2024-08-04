#!/bin/sh

# wait-for-it.sh
# Use this script to test if a given TCP host/port are available

TIMEOUT=15
QUIET=0
HOST=
PORT=

echoerr() {
    if [ "$QUIET" -ne 1 ]; then echo "$@" 1>&2; fi
}

usage() {
    echo "Usage: $0 host:port [-t timeout] [-q]"
    exit 1
}

wait_for() {
    for i in `seq $TIMEOUT` ; do
        nc -z "$HOST" "$PORT" >/dev/null 2>&1
        result=$?
        if [ $result -eq 0 ] ; then
            if [ "$QUIET" -ne 1 ]; then echo "Host $HOST:$PORT is available after $i seconds"; fi
            return 0
        fi
        sleep 1
    done
    echo "Operation timed out after $TIMEOUT seconds"
    return 1
}

while getopts "t:q" opt; do
    case "$opt" in
        t) TIMEOUT="$OPTARG" ;;
        q) QUIET=1 ;;
        *) usage ;;
    esac
done

shift $((OPTIND-1))

HOSTPORT=$1

if [ "$HOSTPORT" = "" ] ; then
    usage
fi

HOST=$(printf "%s\n" "$HOSTPORT"| cut -d : -f 1)
PORT=$(printf "%s\n" "$HOSTPORT"| cut -d : -f 2)

if [ "$HOST" = "" ] || [ "$PORT" = "" ]; then
    usage
fi

wait_for
result=$?

exit $result
