#!/bin/sh
#
# $NetBSD: realplay.sh,v 1.1.1.1 2004/01/26 13:09:58 jmmv Exp $
#
REALPLAYER_HOME=@REALPLAYER_HOME@ ; export REALPLAYER_HOME
LD_LIBRARY_PATH=${REALPLAYER_HOME}:${LD_LIBRARY_PATH} ; export LD_LIBRARY_PATH
exec ${REALPLAYER_HOME}/realplay "$@"
