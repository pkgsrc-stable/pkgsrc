# $NetBSD: buildlink2.mk,v 1.8 2004/01/03 18:49:37 reed Exp $
#
# This Makefile fragment is included by packages that use gail.
#
# This file was created automatically using createbuildlink 2.0.
#

.if !defined(GAIL_BUILDLINK2_MK)
GAIL_BUILDLINK2_MK=	# defined

BUILDLINK_PACKAGES+=			gail
BUILDLINK_DEPENDS.gail?=		gail>=1.4.1nb1
BUILDLINK_PKGSRCDIR.gail?=		../../devel/gail

EVAL_PREFIX+=	BUILDLINK_PREFIX.gail=gail
BUILDLINK_PREFIX.gail_DEFAULT=	${X11PREFIX}
BUILDLINK_FILES.gail+=	include/gail-1.0/libgail-util/*
BUILDLINK_FILES.gail+=	lib/gtk-2.0/modules/libgail.*
BUILDLINK_FILES.gail+=	lib/libgailutil.*

.include "../../devel/atk/buildlink2.mk"
.include "../../devel/gettext-lib/buildlink2.mk"
.include "../../graphics/libart2/buildlink2.mk"
.include "../../graphics/libgnomecanvas/buildlink2.mk"
.include "../../x11/gtk2/buildlink2.mk"

BUILDLINK_TARGETS+=	gail-buildlink

gail-buildlink: _BUILDLINK_USE

.endif	# GAIL_BUILDLINK2_MK
