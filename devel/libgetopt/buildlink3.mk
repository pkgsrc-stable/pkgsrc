# $NetBSD: buildlink3.mk,v 1.6 2004/03/10 17:57:14 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
LIBGETOPT_BUILDLINK3_MK:=	${LIBGETOPT_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	getopt
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Ngetopt}
BUILDLINK_PACKAGES+=	getopt

.if !empty(LIBGETOPT_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.getopt+=	libgetopt>=1.3
BUILDLINK_PKGSRCDIR.getopt?=	../../devel/libgetopt
.endif	# LIBGETOPT_BUILDLINK3_MK

BUILDLINK_DEPTH:=     ${BUILDLINK_DEPTH:S/+$//}
