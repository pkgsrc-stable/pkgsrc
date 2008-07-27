# $NetBSD: options.mk,v 1.10 2008/07/27 00:03:42 bjs Exp $

PKG_OPTIONS_VAR=	PKG_OPTIONS.MesaLib

# Assembler code build configurations
.if (${MACHINE_ARCH} == "i386" || ${MACHINE_ARCH} == "x86_64") && \
    ${OPSYS} != "SunOS" && ${OPSYS} != "Darwin"
PKG_SUPPORTED_OPTIONS+=		${MACHINE_ARCH}
PKG_SUGGESTED_OPTIONS+=		${MACHINE_ARCH}
.endif
###
### XXX  There are [probably] others, but let's not get crazy just yet.
### 	 This will take a while to test for the myriad platforms we
### 	 support.
###
.if (${MACHINE_ARCH} == "i386" || ${MACHINE_ARCH} == "x86_64" || \
     ${MACHINE_ARCH} == "powerpc" || ${MACHINE_ARCH} == "sparc" || \
     ${MACHINE_ARCH} == "sparc64") && \
    ((${OPSYS} == "NetBSD" && ${X11_TYPE} == "modular") || \
     ${OPSYS} == "FreeBSD" || ${OPSYS} == "OpenBSD" || \
     ${OPSYS} == "DragonFly" || ${OPSYS} == "Linux")
PKG_SUPPORTED_OPTIONS+=		dri
.endif
###
### XXX OpenGL still works fine with the software fallback.  As of now,
###	I think this is a good way to see which bugs surface before the
###	next release branch.  Upgrading the X server to the 1.4 branch
###	is advised given that it's glx/glcore modules are built from
###	Mesa 6.5.3 (a development release).
###
.if !empty(MACHINE_PLATFORM:MNetBSD-[4-9]*-*86*) && ${X11_TYPE} == "modular"
PKG_SUGGESTED_OPTIONS+=		dri
.endif

.include "../../mk/bsd.options.mk"
###
### XXX Yes, this is a bit overly verbose; with Mesa, that can't hurt much.
###
.if !empty(PKG_OPTIONS:Mi386) || !empty(PKG_OPTIONS:Mx86_64)
BUILD_TARGET_SUFFIX=	-${MACHINE_ARCH}
.else
BUILD_TARGET_SUFFIX=	# empty
.endif

.if !empty(PKG_OPTIONS:Mdri)
BUILD_TARGET=	pkgsrc-dri${BUILD_TARGET_SUFFIX}
PLIST.dri=	# empty
.  include "../../graphics/MesaLib/dri.mk"
.else
BUILD_TARGET=	pkgsrc${BUILD_TARGET_SUFFIX}
PLIST.nodri=	# empty
###
### XXX building libOSMesa breaks with -j, and GNU make has no .WAIT
###
MAKE_JOBS_SAFE=			no
.endif
