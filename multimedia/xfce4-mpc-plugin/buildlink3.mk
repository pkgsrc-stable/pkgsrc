# $NetBSD: buildlink3.mk,v 1.26 2014/05/05 00:48:13 ryoon Exp $

BUILDLINK_TREE+=	xfce4-mpc-plugin

.if !defined(XFCE4_MPC_PLUGIN_BUILDLINK3_MK)
XFCE4_MPC_PLUGIN_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.xfce4-mpc-plugin+=	xfce4-mpc-plugin>=0.3.2
BUILDLINK_ABI_DEPENDS.xfce4-mpc-plugin+=	xfce4-mpc-plugin>=0.3.2nb21
BUILDLINK_PKGSRCDIR.xfce4-mpc-plugin?=	../../multimedia/xfce4-mpc-plugin

.include "../../x11/xfce4-panel/buildlink3.mk"
.include "../../x11/libSM/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.endif # XFCE4_MPC_PLUGIN_BUILDLINK3_MK

BUILDLINK_TREE+=	-xfce4-mpc-plugin
