# $NetBSD: buildlink3.mk,v 1.4 2009/01/11 03:11:37 smb Exp $

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH}+
CLAWS_MAIL_BUILDLINK3_MK:=	${CLAWS_MAIL_BUILDLINK3_MK}+

.if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	claws-mail
.endif

BUILDLINK_PACKAGES:=	${BUILDLINK_PACKAGES:Nclaws-mail}
BUILDLINK_PACKAGES+=	claws-mail
BUILDLINK_ORDER:=	${BUILDLINK_ORDER} ${BUILDLINK_DEPTH}claws-mail

.if ${CLAWS_MAIL_BUILDLINK3_MK} == "+"
BUILDLINK_API_DEPENDS.claws-mail+= claws-mail>=3.7.0
BUILDLINK_PKGSRCDIR.claws-mail?=	../../mail/claws-mail
.endif	# CLAWS_MAIL_BUILDLINK3_MK

BUILDLINK_DEPTH:=		${BUILDLINK_DEPTH:S/+$//}
