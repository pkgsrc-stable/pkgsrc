# $NetBSD: buildlink2.mk,v 1.2 2002/08/25 19:21:55 jlam Exp $

.if !defined(NAS_BUILDLINK2_MK)
NAS_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		nas
BUILDLINK_DEPENDS.nas?=		nas>=1.4.2
BUILDLINK_PKGSRCDIR.nas?=	../../audio/nas

EVAL_PREFIX+=		BUILDLINK_PREFIX.nas=nas
BUILDLINK_PREFIX.nas_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.nas=	include/audio/*
BUILDLINK_FILES.nas+=	lib/libaudio.*

BUILDLINK_TARGETS+=	nas-buildlink

nas-buildlink: _BUILDLINK_USE

.endif	# NAS_BUILDLINK2_MK
