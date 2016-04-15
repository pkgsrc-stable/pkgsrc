$NetBSD: patch-liblangtag_lt-tag.h,v 1.1 2016/04/15 08:26:26 wiz Exp $

From 3cc56cf32c006e7e8445c3ba49ffc128c646c88d Mon Sep 17 00:00:00 2001
From: David Tardon <dtardon@redhat.com>
Date: Wed, 23 Mar 2016 14:07:48 +0100
Subject: [PATCH] enum must be declared before it's used

---
 liblangtag/lt-tag.h | 26 +++++++++++++-------------
 1 file changed, 13 insertions(+), 13 deletions(-)

--- liblangtag/lt-tag.h.orig	2016-03-23 02:58:27.000000000 +0000
+++ liblangtag/lt-tag.h
@@ -37,6 +37,19 @@ LT_BEGIN_DECLS
  */
 typedef struct _lt_tag_t	lt_tag_t;
 
+enum _lt_tag_filter_t {
+	LT_TAG_FILTER_NONE          = 0,
+	LT_TAG_FILTER_LANGUAGE      = 1 << 0,
+	LT_TAG_FILTER_EXTLANG       = 1 << 1,
+	LT_TAG_FILTER_SCRIPT        = 1 << 2,
+	LT_TAG_FILTER_REGION        = 1 << 3,
+	LT_TAG_FILTER_VARIANT       = 1 << 4,
+	LT_TAG_FILTER_EXTENSION     = 1 << 5,
+	LT_TAG_FILTER_PRIVATEUSE    = 1 << 6,
+	LT_TAG_FILTER_GRANDFATHERED = 1 << 7,
+	LT_TAG_FILTER_ALL           = -1
+};
+
 /**
  * lt_tag_filter_t:
  * @LT_TAG_FILTER_NONE: all of objects filtered.
@@ -55,19 +68,6 @@ typedef struct _lt_tag_t	lt_tag_t;
  */
 typedef enum _lt_tag_filter_t	lt_tag_filter_t;
 
-enum _lt_tag_filter_t {
-	LT_TAG_FILTER_NONE          = 0,
-	LT_TAG_FILTER_LANGUAGE      = 1 << 0,
-	LT_TAG_FILTER_EXTLANG       = 1 << 1,
-	LT_TAG_FILTER_SCRIPT        = 1 << 2,
-	LT_TAG_FILTER_REGION        = 1 << 3,
-	LT_TAG_FILTER_VARIANT       = 1 << 4,
-	LT_TAG_FILTER_EXTENSION     = 1 << 5,
-	LT_TAG_FILTER_PRIVATEUSE    = 1 << 6,
-	LT_TAG_FILTER_GRANDFATHERED = 1 << 7,
-	LT_TAG_FILTER_ALL           = -1
-};
-
 lt_tag_t                 *lt_tag_new                         (void);
 lt_tag_t                 *lt_tag_ref                         (lt_tag_t       *tag);
 void                      lt_tag_unref                       (lt_tag_t       *tag);
