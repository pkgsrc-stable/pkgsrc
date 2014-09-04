$NetBSD: patch-gcc_config_netbsd-stdint.h,v 1.1 2014/09/04 18:43:11 jperkin Exp $

Copy gcc/config/freebsd-stdint.h to gcc/config/netbsd-stdint.h.

--- gcc/config/netbsd-stdint.h.orig	2014-09-04 10:04:27.042303825 +0000
+++ gcc/config/netbsd-stdint.h
@@ -0,0 +1,56 @@
+/* Definitions for <stdint.h> types for NetBSD systems.
+   Copyright (C) 2009 Free Software Foundation, Inc.
+   Contributed by Gerald Pfeifer <gerald@pfeifer.com>.
+
+This file is part of GCC.
+
+GCC is free software; you can redistribute it and/or modify
+it under the terms of the GNU General Public License as published by
+the Free Software Foundation; either version 3, or (at your option)
+any later version.
+
+GCC is distributed in the hope that it will be useful,
+but WITHOUT ANY WARRANTY; without even the implied warranty of
+MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
+GNU General Public License for more details.
+
+Under Section 7 of GPL version 3, you are granted additional
+permissions described in the GCC Runtime Library Exception, version
+3.1, as published by the Free Software Foundation.
+
+You should have received a copy of the GNU General Public License and
+a copy of the GCC Runtime Library Exception along with this program;
+see the files COPYING3 and COPYING.RUNTIME respectively.  If not, see
+<http://www.gnu.org/licenses/>.  */
+
+#define SIG_ATOMIC_TYPE   "int"
+
+#define INT8_TYPE         "signed char"
+#define INT16_TYPE        "short int"
+#define INT32_TYPE        "int"
+#define INT64_TYPE        (LONG_TYPE_SIZE == 64 ? "long int" : "long long int")
+#define UINT8_TYPE        "unsigned char"
+#define UINT16_TYPE       "short unsigned int"
+#define UINT32_TYPE       "unsigned int"
+#define UINT64_TYPE       (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")
+
+#define INT_LEAST8_TYPE   "signed char"
+#define INT_LEAST16_TYPE  "short int"
+#define INT_LEAST32_TYPE  "int"
+#define INT_LEAST64_TYPE  (LONG_TYPE_SIZE == 64 ? "long int" : "long long int")
+#define UINT_LEAST8_TYPE  "unsigned char"
+#define UINT_LEAST16_TYPE "short unsigned int"
+#define UINT_LEAST32_TYPE "unsigned int"
+#define UINT_LEAST64_TYPE (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")
+
+#define INT_FAST8_TYPE    "int"
+#define INT_FAST16_TYPE   "int"
+#define INT_FAST32_TYPE   "int"
+#define INT_FAST64_TYPE   (LONG_TYPE_SIZE == 64 ? "long int" : "long long int")
+#define UINT_FAST8_TYPE   "unsigned int"
+#define UINT_FAST16_TYPE  "unsigned int"
+#define UINT_FAST32_TYPE  "unsigned int"
+#define UINT_FAST64_TYPE  (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "long long unsigned int")
+
+#define INTPTR_TYPE       (LONG_TYPE_SIZE == 64 ? "long int" : "int")
+#define UINTPTR_TYPE      (LONG_TYPE_SIZE == 64 ? "long unsigned int" : "unsigned int")
