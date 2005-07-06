# $NetBSD: plugin.mk,v 1.1 2005/07/06 12:21:17 martti Exp $

DISTNAME?=		${PLUGIN_NAME}-${PLUGIN_VERSION}
PKGNAME=		sm-${PLUGIN_NAME}-${PLUGIN_VERSION}
CATEGORIES?=		mail
MASTER_SITES?=		http://www.squirrelmail.org/plugins/

WRKSRC?=		${WRKDIR}/${PLUGIN_NAME}
NO_CONFIGURE?=		YES
NO_BUILD?=		YES

SM_PLUGINDIR=		share/squirrelmail/plugins
PLUGIN_DIR=		${SM_PLUGINDIR}/${PLUGIN_NAME}
FULL_PLUGIN_DIR=	${PREFIX}/${PLUGIN_DIR}

INSTALLATION_DIRS+=	${PLUGIN_DIR}

PLIST_SUBST+=		PLUGIN_DIR=${PLUGIN_DIR}

do-install:
	cd ${WRKSRC} && \
		${FIND} . -type f ! -name '*.orig' 2>/dev/null | \
		${PAX} -rw ${FULL_PLUGIN_DIR}

.include "../../mail/squirrelmail/buildlink3.mk"
