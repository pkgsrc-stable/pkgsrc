# $NetBSD: buildlink3.mk,v 1.1 2005/02/26 22:48:35 jmmv Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
BOOST_BUILD_BUILDLINK3_MK:=	${BOOST_BUILD_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	boost-build
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nboost-build}
BUILDLINK_PACKAGES+=	boost-build

.if !empty(BOOST_BUILD_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.boost-build+=		boost-build>=1.32.0
BUILDLINK_DEPMETHOD.boost-build?=	build
BUILDLINK_PKGSRCDIR.boost-build?=	../../devel/boost-build
.endif	# BOOST_BUILD_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
