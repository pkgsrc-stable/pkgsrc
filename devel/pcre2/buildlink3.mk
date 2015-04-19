# $NetBSD: buildlink3.mk,v 1.1 2015/04/19 19:18:22 wiz Exp $

BUILDLINK_TREE+=	pcre2

.if !defined(PCRE2_BUILDLINK3_MK)
PCRE2_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.pcre2+=	pcre2>=10.10
BUILDLINK_PKGSRCDIR.pcre2?=	../../devel/pcre2
.endif	# PCRE2_BUILDLINK3_MK

BUILDLINK_TREE+=	-pcre2
