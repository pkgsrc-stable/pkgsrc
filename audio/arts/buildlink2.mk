# $NetBSD: buildlink2.mk,v 1.2 2002/08/25 19:21:43 jlam Exp $

.if !defined(ARTS_BUILDLINK2_MK)
ARTS_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		arts
BUILDLINK_DEPENDS.arts?=	arts>=1.0.0
BUILDLINK_PKGSRCDIR.arts?=	../../audio/arts

EVAL_PREFIX+=			BUILDLINK_PREFIX.arts=arts
BUILDLINK_PREFIX.arts_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.arts!=	${GREP} "^\(include\|lib\)" ${.CURDIR}/../../audio/arts/PLIST

BUILDLINK_TARGETS+=		arts-buildlink

arts-buildlink: _BUILDLINK_USE

.endif	# ARTS_BUILDLINK2_MK
