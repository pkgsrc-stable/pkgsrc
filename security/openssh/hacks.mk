# $NetBSD: hacks.mk,v 1.2 2006/10/31 03:31:19 taca Exp $

.if !defined(OPENSSH_HACKS_MK)
OPENSSH_HACKS_MK=	# defined

### [Sun May 14 15:09:28 CDT 2006 : schwarz]
### work around a definition conflict for _res present in openssh
### 4.3p1 and 4.3p2 (should be fixed with later releases)
###
.if !empty(LOWER_OPSYS:Mirix5*)
PKG_HACKS+=		_res-conflict
CPPFLAGS+=		-D_res=_compat_res
.endif

.endif
