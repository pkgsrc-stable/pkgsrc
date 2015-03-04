# $NetBSD: buildlink3.mk,v 1.1 2015/03/04 19:34:27 tnn Exp $

BUILDLINK_TREE+=	libLLVM34

.if !defined(LIBLLVM34_BUILDLINK3_MK)
LIBLLVM34_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.libLLVM34+=	libLLVM34>=3.4.2
BUILDLINK_PKGSRCDIR.libLLVM34?=		../../lang/libLLVM34
BUILDLINK_INCDIRS.libLLVM34?=		include/libLLVM34
BUILDLINK_LIBDIRS.libLLVM34?=		lib/libLLVM34
LLVM_CONFIG_PATH?=	${BUILDLINK_PREFIX.libLLVM34}/libexec/libLLVM34/llvm-config

.endif	# LIBLLVM34_BUILDLINK3_MK

BUILDLINK_TREE+=	-libLLVM34
