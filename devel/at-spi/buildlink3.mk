# $NetBSD: buildlink3.mk,v 1.47 2018/11/14 22:21:13 kleink Exp $

BUILDLINK_TREE+=	at-spi

.if !defined(AT_SPI_BUILDLINK3_MK)
AT_SPI_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.at-spi+=	at-spi>=1.6.0
BUILDLINK_ABI_DEPENDS.at-spi+=	at-spi>=1.32.0nb25
BUILDLINK_PKGSRCDIR.at-spi?=	../../devel/at-spi

.include "../../devel/atk/buildlink3.mk"
.include "../../devel/libbonobo/buildlink3.mk"
.include "../../devel/popt/buildlink3.mk"
.include "../../x11/gtk2/buildlink3.mk"
.include "../../x11/libXtst/buildlink3.mk"
.include "../../sysutils/dbus-glib/buildlink3.mk"
.endif # AT_SPI_BUILDLINK3_MK

BUILDLINK_TREE+=	-at-spi
