# $NetBSD: buildlink3.mk,v 1.29 2018/11/12 03:51:35 ryoon Exp $

BUILDLINK_TREE+=	qt5-qtscript

.if !defined(QT5_QTSCRIPT_BUILDLINK3_MK)
QT5_QTSCRIPT_BUILDLINK3_MK:=

BUILDLINK_API_DEPENDS.qt5-qtscript+=	qt5-qtscript>=5.9.1
BUILDLINK_ABI_DEPENDS.qt5-qtscript+=	qt5-qtscript>=5.11.2nb1
BUILDLINK_PKGSRCDIR.qt5-qtscript?=	../../x11/qt5-qtscript

BUILDLINK_INCDIRS.qt5-qtscript+=	qt5/include
BUILDLINK_LIBDIRS.qt5-qtscript+=	qt5/lib
BUILDLINK_LIBDIRS.qt5-qtscript+=	qt5/plugins

.include "../../x11/qt5-qttools/buildlink3.mk"
.endif	# QT5_QTSCRIPT_BUILDLINK3_MK

BUILDLINK_TREE+=	-qt5-qtscript
