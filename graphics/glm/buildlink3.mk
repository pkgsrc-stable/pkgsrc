# $NetBSD: buildlink3.mk,v 1.2 2014/10/13 21:47:59 ryoon Exp $

BUILDLINK_TREE+=	glm

.if !defined(GLM_BUILDLINK3_MK)
GLM_BUILDLINK3_MK:=

BUILDLINK_DEPMETHOD.glm?=	build

BUILDLINK_API_DEPENDS.glm+=	glm>=0.9.5.3
BUILDLINK_PKGSRCDIR.glm?=	../../graphics/glm
.endif	# GLM_BUILDLINK3_MK

BUILDLINK_TREE+=	-glm
