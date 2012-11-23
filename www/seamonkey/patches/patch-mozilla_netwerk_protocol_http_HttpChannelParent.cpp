$NetBSD: patch-mozilla_netwerk_protocol_http_HttpChannelParent.cpp,v 1.5 2012/11/23 17:28:50 ryoon Exp $

* Fix build with gcc<4.5, for example, DragonFly 3.0.1.
  See https://bugzilla.mozilla.org/show_bug.cgi?id=621446

--- mozilla/netwerk/protocol/http/HttpChannelParent.cpp.orig	2012-11-18 10:19:49.000000000 +0000
+++ mozilla/netwerk/protocol/http/HttpChannelParent.cpp
@@ -313,6 +313,13 @@ HttpChannelParent::RecvUpdateAssociatedC
   return true;
 }
 
+// Compiling with a version of GCC <= 4.4 fails with an internal compiler
+// error.
+#if !defined(__GNUC__) || \
+  (__GNUC__ >= 5) || (__GNUC__ == 4 && __GNUC_MINOR__ >= 5)
+#pragma GCC optimize ("O0")
+#endif
+
 bool
 HttpChannelParent::RecvRedirect2Verify(const nsresult& result, 
                                        const RequestHeaderTuples& changedHeaders)
