# $NetBSD: buildlink3.mk,v 1.17 2004/03/10 17:57:14 jlam Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
READLINE_BUILDLINK3_MK:=	${READLINE_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	readline
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nreadline}
BUILDLINK_PACKAGES+=	readline

.if !empty(READLINE_BUILDLINK3_MK:M+)
BUILDLINK_DEPENDS.readline+=	readline>=2.2
BUILDLINK_PKGSRCDIR.readline?=	../../devel/readline

BUILDLINK_FILES.readline+=	include/history.h
BUILDLINK_FILES.readline+=	include/readline.h

BUILDLINK_TRANSFORM.readline=	\
	-e "s|include/history\.h|include/readline/history.h|g"		\
	-e "s|include/readline\.h|include/readline/readline.h|g"

.endif	# READLINE_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
