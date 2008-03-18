#!@SH@
#
# $NetBSD: strip_fopt.sh,v 1.1 2008/03/18 15:05:04 tron Exp $
#
# libtool assumes that the compiler can handle the -fPIC flag and the
# -fno-common. This isn't always true, for example yasm can't handle it.
command="$1"
shift
while [ $# -gt 0 ]; do
	case "$1" in
	-fPIC|-fno-common)
		;;
	-DPIC)
		command="$command -D__PIC__"
		;;
	*)
		command="$command $1"
		;;
	esac
	shift
done
echo $command
exec $command
