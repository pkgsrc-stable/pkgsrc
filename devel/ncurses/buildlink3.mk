# $NetBSD: buildlink3.mk,v 1.20 2004/02/18 16:35:27 jlam Exp $

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH}+
NCURSES_BUILDLINK3_MK:=	${NCURSES_BUILDLINK3_MK}+

.include "../../mk/bsd.prefs.mk"

.if !empty(NCURSES_BUILDLINK3_MK:M+)
BUILDLINK_PACKAGES+=		ncurses
BUILDLINK_DEPENDS.ncurses+=	ncurses>=5.3nb1
BUILDLINK_PKGSRCDIR.ncurses?=	../../devel/ncurses
.endif	# NCURSES_BUILDLINK3_MK

BUILDLINK_CHECK_BUILTIN.ncurses?=	NO

.if !defined(_BLNK_LIBNCURSES_FOUND)
_BLNK_LIBNCURSES_FOUND!=	\
	if [ "`${ECHO} /usr/lib/libncurses.*`" = "/usr/lib/libncurses.*" ]; then \
		${ECHO} "NO";						\
	else								\
		${ECHO} "YES";						\
	fi
MAKEFLAGS+=	_BLNK_LIBNCURSES_FOUND=${_BLNK_LIBNCURSES_FOUND}
.endif

_NCURSES_H=	/usr/include/curses.h

.if !defined(BUILDLINK_IS_BUILTIN.ncurses)
BUILDLINK_IS_BUILTIN.ncurses=	NO
.  if !empty(_BLNK_LIBNCURSES_FOUND:M[yY][eE][sS])
BUILDLINK_IS_BUILTIN.ncurses=	YES
.  elif exists(${_NCURSES_H})
_IS_BUILTIN.ncurses!=		\
	if ${GREP} -q "\#define[ 	]*NCURSES_VERSION" ${_NCURSES_H}; then \
		${ECHO} "YES";						\
	else								\
		${ECHO} "NO";						\
	fi
BUILDLINK_IS_BUILTIN.ncurses=	${_IS_BUILTIN.ncurses}
.    if !empty(BUILDLINK_CHECK_BUILTIN.ncurses:M[nN][oO]) && \
        !empty(_IS_BUILTIN.ncurses:M[yY][eE][sS])
#
# Create an appropriate name for the built-in package distributed
# with the system.  This package name can be used to check against
# BUILDLINK_DEPENDS.<pkg> to see if we need to install the pkgsrc
# version or if the built-in one is sufficient.
#
_NCURSES_VERSION!=							\
	${AWK} '/\#define[ 	]*NCURSES_VERSION[ 	]/ {		\
			vers = $$3;					\
			gsub("\"", "", vers);				\
			print vers;					\
		}							\
	' ${_NCURSES_H}
_NCURSES_PKG=		ncurses-${_NCURSES_VERSION}
BUILDLINK_IS_BUILTIN.ncurses=	YES
.      for _depend_ in ${BUILDLINK_DEPENDS.ncurses}
.        if !empty(BUILDLINK_IS_BUILTIN.ncurses:M[yY][eE][sS])
BUILDLINK_IS_BUILTIN.ncurses!=						\
	if ${PKG_ADMIN} pmatch '${_depend_}' ${_NCURSES_PKG}; then	\
		${ECHO} "YES";						\
	else								\
		${ECHO} "NO";						\
	fi
.        endif
.      endfor
.    endif
.  endif
#
# XXX By default, assume that the native curses on NetBSD systems
# XXX supports ncurses.
#
.  if ${OPSYS} == "NetBSD"
BUILDLINK_IS_BUILTIN.ncurses=	YES
#
# These versions of NetBSD didn't have a curses library that was
# capable of replacing ncurses.
#
# XXX In reality, no version of NetBSD has a curses library that can
# XXX completely replace ncurses; however, some versions implement
# XXX enough of ncurses that some packages are happy.
#
_INCOMPAT_CURSES=	NetBSD-0.*-* NetBSD-1.[0123]*-*
_INCOMPAT_CURSES+=	NetBSD-1.4.*-* NetBSD-1.4[A-X]-*
.    for _pattern_ in ${_INCOMPAT_CURSES} ${INCOMPAT_CURSES}
.      if !empty(MACHINE_PLATFORM:M${_pattern_})
BUILDLINK_IS_BUILTIN.ncurses=	NO
.      endif
.    endfor
.  endif
MAKEFLAGS+=	BUILDLINK_IS_BUILTIN.ncurses=${BUILDLINK_IS_BUILTIN.ncurses}
.endif

.if !empty(BUILDLINK_CHECK_BUILTIN.ncurses:M[yY][eE][sS])
BUILDLINK_USE_BUILTIN.ncurses=	YES
.endif

.if !defined(BUILDLINK_USE_BUILTIN.ncurses)
.  if !empty(BUILDLINK_IS_BUILTIN.ncurses:M[yY][eE][sS])
BUILDLINK_USE_BUILTIN.ncurses=	YES
.  else
BUILDLINK_USE_BUILTIN.ncurses=	NO
.  endif

.  if !empty(PREFER_NATIVE:M[yY][eE][sS]) && \
      !empty(BUILDLINK_IS_BUILTIN.ncurses:M[yY][eE][sS])
BUILDLINK_USE_BUILTIN.ncurses=	YES
.  endif
.  if !empty(PREFER_PKGSRC:M[yY][eE][sS])
BUILDLINK_USE_BUILTIN.ncurses=	NO
.  endif
.  if !empty(PREFER_NATIVE:Mncurses) && \
      !empty(BUILDLINK_IS_BUILTIN.ncurses:M[yY][eE][sS])
BUILDLINK_USE_BUILTIN.ncurses=	YES
.  endif
.  if !empty(PREFER_PKGSRC:Mncurses)
BUILDLINK_USE_BUILTIN.ncurses=	NO
.  endif

.  if defined(USE_NCURSES)
.    if !empty(BUILDLINK_IS_BUILTIN.ncurses:M[yY][eE][sS]) && \
        !empty(_BLNK_LIBNCURSES_FOUND:M[yY][eE][sS])
BUILDLINK_USE_BUILTIN.ncurses=	NO
.    endif
.  endif
.endif

.if !empty(BUILDLINK_USE_BUILTIN.ncurses:M[nN][oO])
.  if !empty(BUILDLINK_DEPTH:M+)
BUILDLINK_DEPENDS+=	ncurses
.  endif
.endif

.if !empty(NCURSES_BUILDLINK3_MK:M+)
.  if !empty(BUILDLINK_USE_BUILTIN.ncurses:M[yY][eE][sS])
.    if !empty(_BLNK_LIBNCURSES_FOUND:M[nN][oO])
BUILDLINK_TRANSFORM.ncurses+=	-e "s|/curses\.h|/ncurses.h|g"
BUILDLINK_TRANSFORM+=		l:ncurses:curses
.    endif
.  endif

BUILDLINK_FILES.ncurses=	include/curses.h
BUILDLINK_FILES.ncurses+=	include/term.h

BUILDLINK_TARGETS+=	buildlink-ncurses-curses-h
BUILDLINK_TARGETS+=	buildlink-ncurses-extra-includes

.PHONY: buildlink-ncurses-extra-includes
buildlink-ncurses-extra-includes:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	extra_includes="include/term.h";				\
	for f in $${extra_includes}; do					\
		if [ ! -f ${BUILDLINK_DIR}/$${f} ]; then		\
			${ECHO_BUILDLINK_MSG} "Touching extra ncurses header ($${f}) in ${BUILDLINK_DIR}."; \
			${TOUCH} ${TOUCH_FLAGS} ${BUILDLINK_DIR}/$${f}; \
		fi;							\
	done

.PHONY: buildlink-ncurses-curses-h
buildlink-ncurses-curses-h:
	${_PKG_SILENT}${_PKG_DEBUG}					\
	if [ ! -f ${BUILDLINK_DIR}/include/curses.h -a			\
	     -f ${BUILDLINK_PREFIX.ncurses}/include/ncurses.h ]; then	\
		${ECHO_BUILDLINK_MSG} "Linking curses.h to ncurses.h.";	\
		${LN} -s ${BUILDLINK_PREFIX.ncurses}/include/ncurses.h	\
			${BUILDLINK_DIR}/include/curses.h;		\
	fi
.endif	# NCURSES_BUILDLINK3_MK

BUILDLINK_DEPTH:=	${BUILDLINK_DEPTH:S/+$//}
