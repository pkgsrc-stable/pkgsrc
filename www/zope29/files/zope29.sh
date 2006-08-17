#!/bin/sh
#
# Startup script for Zope server.
#
# $NetBSD: zope29.sh,v 1.1 2006/08/17 11:57:25 darcy Exp $
#

# PROVIDE: zope29
# REQUIRE: DAEMON

# You will need to set some variables in /etc/rc.conf to start Zope
#
# zope29_enable : bool
#   Enable Zope ("YES") or not ("NO", the default).
#
# zope29_instances : list
#   List of dirs with Zope's instances ("" by default).
#

if [ -f /etc/rc.subr ]
then
	. /etc/rc.subr
fi

name="zope29"
rcvar=`set_rcvar`

zope29ctl () {
    for instance in $zope29_instances; do
	if [ -d ${instance} ]; then
	    echo -n "  Zope instance ${instance} -> "
	    ${instance}/bin/zopectl "$1"
	fi
    done
}

zope29_start () {
    echo "Starting Zope 2.9:"
    zope29ctl "start"
}

zope29_stop () {
    echo "Stopping Zope 2.9:"
    zope29ctl "stop"
}

zope29_restart () {
    echo "Restarting Zope 2.9:"
    zope29ctl "restart"
}

  start_cmd="zope29_start"
   stop_cmd="zope29_stop"
restart_cmd="zope29_restart"

load_rc_config $name

: ${zope29_enable="NO"}
: ${zope29_instances=""}

cmd="$1"
[ $# -gt 0 ] && shift
[ -n  "$*" ] && zope29_instances="$*"

run_rc_command "${cmd}"
