# Add project specific ProGuard rules here.
# You can control the set of applied configuration files using the
# proguardFiles setting in build.gradle.
#
# For more details, see
#   http://developer.android.com/guide/developing/tools/proguard.html

# If your project uses WebView with JS, uncomment the following
# and specify the fully qualified class name to the JavaScript interface
# class:
#-keepclassmembers class fqcn.of.javascript.interface.for.webview {
#   public *;
#}

# Uncomment this to preserve the line number information for
# debugging stack traces.
#-keepattributes SourceFile,LineNumberTable

# If you keep the line number information, uncomment this to
# hide the original source file name.
#-renamesourcefileattribute SourceFile

-keepattributes Exceptions, InnerClasses, Signature, Deprecated, SourceFile, LineNumberTable, *Annotation*, EnclosingMethod

-keep class com.google.android.gms.ads.identifier.** { *; }
-keep class com.google.android.gms.vision.** { *; }
-keep interface com.google.android.gms.vision.** { *; }
-keep interface com.google.android.gms.common.** { *; }
-keep class com.google.android.gms.** { *; }
-keep class com.google.firebase.** { *; }
-keep class androidx.** {*;}

# Core Module -- START
-keep class com.m17ent.core.dto.** { *; }
-keep class com.m17ent.core.module.**.dto.** { *; }
-keep class com.m17ent.core.module.sdk.** { *; }
-keep public class com.m17ent.core.module.common.activity.M17BaseActivity { *; }
-keep public class com.m17ent.core.module.common.fragment.M17BaseFragment { *; }
-keep interface * {
  <methods>;
}
# Core Module -- START

# Messaging Module -- START
-keep class com.m17ent.messaging.dto.** { *; }
-keep class com.m17ent.messaging.module.**.dto.** { *; }
-keep class com.m17ent.messaging.module.**.interface.** { *; }
-keep class com.m17ent.messaging.module.msgprovider.** { *; }
# Messaging Module -- END

#WANSU_CHAT -- START
-keep class com.wangsu.mts.** { *; }
#WANSU_CHAT -- END

# Pubnub -- START
-dontwarn org.slf4j.**
-dontwarn com.pubnub.**
-keep class com.pubnub.** { *; }
-dontnote retrofit2.Platform
-dontwarn retrofit2.Platform$Java8
-dontnote retrofit2.Platform$IOS$MainThreadExecutor
-keepattributes Exceptions
# Pubnub -- END

#ABLY -- START
-keep class io.ably.** { *; }
-keep class org.java_websocket.** { *; }
-keep class org.msgpack.** { *; }
#ABLY -- END


# Ijk -- START
-keep class tv.danmaku.ijk.media.** { *; }
# Ijk -- END
