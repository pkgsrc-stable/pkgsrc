# $NetBSD: buildlink2.mk,v 1.5 2004/01/03 18:49:55 reed Exp $

.if !defined(FOX_BUILDLINK2_MK)
FOX_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		fox
BUILDLINK_DEPENDS.fox?=		fox>=1.0.43nb2
BUILDLINK_PKGSRCDIR.fox?=	../../x11/fox

EVAL_PREFIX+=		BUILDLINK_PREFIX.fox=fox
BUILDLINK_PREFIX.fox_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.fox=	include/fox/*
BUILDLINK_FILES.fox+=	lib/libFOX-*
BUILDLINK_FILES.fox+=	lib/libFOX.*

BUILDLINK_CPPFLAGS.fox+=	-I${BUILDLINK_PREFIX.fox}/include/fox
CPPFLAGS+=			${BUILDLINK_CPPFLAGS.fox}

BUILDLINK_TARGETS+=	fox-buildlink

fox-buildlink: _BUILDLINK_USE

.endif	# FOX_BUILDLINK2_MK
