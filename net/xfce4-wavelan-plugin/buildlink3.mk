# $NetBSD: buildlink3.mk,v 1.34 2013/06/04 22:16:57 tron Exp $

BUILDLINK_TREE+=	xfce4-wavelan-plugin

.if !defined(XFCE4_WAVELAN_PLUGIN_BUILDLINK3_MK)
XFCE4_WAVELAN_PLUGIN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-wavelan-plugin+=	xfce4-wavelan-plugin>=0.5.3
BUILDLINK_ABI_DEPENDS.xfce4-wavelan-plugin+=	xfce4-wavelan-plugin>=0.5.4nb17
BUILDLINK_PKGSRCDIR.xfce4-wavelan-plugin?=	../../net/xfce4-wavelan-plugin

.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.endif # XFCE4_WAVELAN_PLUGIN_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-wavelan-plugin
