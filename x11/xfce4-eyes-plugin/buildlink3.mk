# $NetBSD: buildlink3.mk,v 1.21 2013/06/04 22:17:34 tron Exp $

BUILDLINK_TREE+=	xfce4-eyes-plugin

.if !defined(XFCE4_EYES_PLUGIN_BUILDLINK3_MK)
XFCE4_EYES_PLUGIN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-eyes-plugin+=	xfce4-eyes-plugin>=4.4.0
BUILDLINK_ABI_DEPENDS.xfce4-eyes-plugin+=	xfce4-eyes-plugin>=4.4.0nb17
BUILDLINK_PKGSRCDIR.xfce4-eyes-plugin?=	../../x11/xfce4-eyes-plugin

.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.endif # XFCE4_EYES_PLUGIN_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-eyes-plugin
