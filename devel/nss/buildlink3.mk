# $NetBSD: buildlink3.mk,v 1.4 2005/10/15 22:06:20 jmmv Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
NSS_BUILDLINK3_MK:=	${NSS_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	nss
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nnss}
BUILDLINK_PACKAGES+=	nss

.if !empty(NSS_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.nss+=		nss>=3.9.2nb1
BUILDLINK_RECOMMENDED.nss+=	nss>=3.9.2nb2
BUILDLINK_PKGSRCDIR.nss?=	../../devel/nss

BUILDLINK_FILES.nss+=		lib/nss/*
BUILDLINK_FILES.nss+=		include/nss/*

BUILDLINK_INCDIRS.nss+=		include/nss
BUILDLINK_LIBDIRS.nss+=		lib/nss
BUILDLINK_RPATHDIRS.nss+=	lib/nss

.endif	# NSS_BUILDLINK3_MK

.include "../../devel/nspr/buildlink3.mk"

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
