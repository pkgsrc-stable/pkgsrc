# $NetBSD: buildlink2.mk,v 1.4 2003/10/20 15:28:23 agc Exp $

.if !defined(DB3_BUILDLINK2_MK)
DB3_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=		db3
BUILDLINK_DEPENDS.db3?=		db3>=2.9.2
BUILDLINK_PKGSRCDIR.db3?=	../../databases/db3

EVAL_PREFIX+=		BUILDLINK_PREFIX.db3=db3
BUILDLINK_PREFIX.db3_DEFAULT=	${LOCALBASE}
BUILDLINK_FILES.db3=	include/db3/db_cxx.h
BUILDLINK_FILES.db3+=	include/db3/db.h
BUILDLINK_FILES.db3+=	include/db3/db_185.h
BUILDLINK_FILES.db3+=	lib/libdb3.*
BUILDLINK_FILES.db3+=	lib/libdb3_cxx.*

BUILDLINK_CPPFLAGS.db3=	-I${BUILDLINK_PREFIX.db3}/include/db3

BUILDLINK_TARGETS+=	db3-buildlink

db3-buildlink: _BUILDLINK_USE

.endif	# DB3_BUILDLINK2_MK
