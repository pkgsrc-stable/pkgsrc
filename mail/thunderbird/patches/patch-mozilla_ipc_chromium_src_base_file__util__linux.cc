$NetBSD: patch-mozilla_ipc_chromium_src_base_file__util__linux.cc,v 1.1 2012/09/02 06:43:41 ryoon Exp $

--- mozilla/ipc/chromium/src/base/file_util_linux.cc.orig	2012-08-25 00:31:11.000000000 +0000
+++ mozilla/ipc/chromium/src/base/file_util_linux.cc
@@ -28,7 +28,7 @@ bool GetTempDir(FilePath* path) {
 }
 
 bool GetShmemTempDir(FilePath* path) {
-#ifdef ANDROID
+#if defined(ANDROID) || defined(OS_BSD)
   return GetTempDir(path);
 #else
   *path = FilePath("/dev/shm");
