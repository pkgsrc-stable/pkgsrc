# $NetBSD: buildlink3.mk,v 1.31 2018/11/12 03:51:08 ryoon Exp $

BUILDLINK_TREE+=	telepathy-mission-control

.if !defined(TELEPATHY_MISSION_CONTROL_BUILDLINK3_MK)
TELEPATHY_MISSION_CONTROL_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.telepathy-mission-control+=	telepathy-mission-control>=4.67
BUILDLINK_ABI_DEPENDS.telepathy-mission-control+=	telepathy-mission-control>=4.67nb34
BUILDLINK_PKGSRCDIR.telepathy-mission-control?=		../../chat/telepathy-mission-control

.include "../../chat/libtelepathy/buildlink3.mk"
.include "../../chat/telepathy-glib/buildlink3.mk"
.include "../../devel/glib2/buildlink3.mk"
.include "../../security/gnome-keyring/buildlink3.mk"
.include "../../sysutils/dbus/buildlink3.mk"
.include "../../sysutils/dbus-glib/buildlink3.mk"
.endif # TELEPATHY_MISSION_CONTROL_BUILDLINK3_MK

BUILDLINK_TREE+=	-telepathy-mission-control
