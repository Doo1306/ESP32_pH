; ModuleID = 'marshal_methods.armeabi-v7a.ll'
source_filename = "marshal_methods.armeabi-v7a.ll"
target datalayout = "e-m:e-p:32:32-Fi8-i64:64-v128:64:128-a:0:32-n32-S64"
target triple = "armv7-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [317 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [628 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 67
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 66
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 107
	i32 32687329, ; 3: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 237
	i32 34715100, ; 4: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 271
	i32 34839235, ; 5: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 47
	i32 39109920, ; 6: Newtonsoft.Json.dll => 0x254c520 => 193
	i32 39485524, ; 7: System.Net.WebSockets.dll => 0x25a8054 => 79
	i32 42639949, ; 8: System.Threading.Thread => 0x28aa24d => 144
	i32 66541672, ; 9: System.Diagnostics.StackTrace => 0x3f75868 => 29
	i32 67008169, ; 10: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 312
	i32 68219467, ; 11: System.Security.Cryptography.Primitives => 0x410f24b => 123
	i32 72070932, ; 12: Microsoft.Maui.Graphics.dll => 0x44bb714 => 191
	i32 82292897, ; 13: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 101
	i32 101534019, ; 14: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 255
	i32 117431740, ; 15: System.Runtime.InteropServices => 0x6ffddbc => 106
	i32 120558881, ; 16: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 255
	i32 122350210, ; 17: System.Threading.Channels.dll => 0x74aea82 => 138
	i32 134690465, ; 18: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 275
	i32 142721839, ; 19: System.Net.WebHeaderCollection => 0x881c32f => 76
	i32 149972175, ; 20: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 123
	i32 159306688, ; 21: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 22: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 211
	i32 176265551, ; 23: System.ServiceProcess => 0xa81994f => 131
	i32 182336117, ; 24: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 257
	i32 184328833, ; 25: System.ValueTuple.dll => 0xafca281 => 150
	i32 195452805, ; 26: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 309
	i32 199333315, ; 27: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 310
	i32 205061960, ; 28: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 29: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 209
	i32 220171995, ; 30: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 31: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 231
	i32 230752869, ; 32: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 33: System.Linq.Parallel => 0xdcb05c4 => 58
	i32 231814094, ; 34: System.Globalization => 0xdd133ce => 41
	i32 246610117, ; 35: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 90
	i32 261689757, ; 36: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 214
	i32 276479776, ; 37: System.Threading.Timer.dll => 0x107abf20 => 146
	i32 278686392, ; 38: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 233
	i32 280482487, ; 39: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 230
	i32 280992041, ; 40: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 281
	i32 291076382, ; 41: System.IO.Pipes.AccessControl.dll => 0x1159791e => 53
	i32 298918909, ; 42: System.Net.Ping.dll => 0x11d123fd => 68
	i32 317674968, ; 43: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 309
	i32 318968648, ; 44: Xamarin.AndroidX.Activity.dll => 0x13031348 => 200
	i32 321597661, ; 45: System.Numerics => 0x132b30dd => 82
	i32 336156722, ; 46: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 294
	i32 342366114, ; 47: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 232
	i32 356389973, ; 48: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 293
	i32 360082299, ; 49: System.ServiceModel.Web => 0x15766b7b => 130
	i32 367780167, ; 50: System.IO.Pipes => 0x15ebe147 => 54
	i32 374914964, ; 51: System.Transactions.Local => 0x1658bf94 => 148
	i32 375677976, ; 52: System.Net.ServicePoint.dll => 0x16646418 => 73
	i32 379916513, ; 53: System.Threading.Thread.dll => 0x16a510e1 => 144
	i32 385762202, ; 54: System.Memory.dll => 0x16fe439a => 61
	i32 392610295, ; 55: System.Threading.ThreadPool.dll => 0x1766c1f7 => 145
	i32 393699800, ; 56: Firebase => 0x177761d8 => 174
	i32 395744057, ; 57: _Microsoft.Android.Resource.Designer => 0x17969339 => 313
	i32 403441872, ; 58: WindowsBase => 0x180c08d0 => 164
	i32 435591531, ; 59: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 305
	i32 441335492, ; 60: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 215
	i32 442565967, ; 61: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 62: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 228
	i32 451504562, ; 63: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 124
	i32 456227837, ; 64: System.Web.HttpUtility.dll => 0x1b317bfd => 151
	i32 459347974, ; 65: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 112
	i32 465846621, ; 66: mscorlib => 0x1bc4415d => 165
	i32 469710990, ; 67: System.dll => 0x1bff388e => 163
	i32 476646585, ; 68: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 230
	i32 486930444, ; 69: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 243
	i32 498788369, ; 70: System.ObjectModel => 0x1dbae811 => 83
	i32 500358224, ; 71: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 292
	i32 503918385, ; 72: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 286
	i32 513247710, ; 73: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 185
	i32 526420162, ; 74: System.Transactions.dll => 0x1f6088c2 => 149
	i32 527452488, ; 75: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 275
	i32 530272170, ; 76: System.Linq.Queryable => 0x1f9b4faa => 59
	i32 539058512, ; 77: Microsoft.Extensions.Logging => 0x20216150 => 181
	i32 540030774, ; 78: System.IO.FileSystem.dll => 0x20303736 => 50
	i32 545304856, ; 79: System.Runtime.Extensions => 0x2080b118 => 102
	i32 546455878, ; 80: System.Runtime.Serialization.Xml => 0x20924146 => 113
	i32 549171840, ; 81: System.Globalization.Calendars => 0x20bbb280 => 39
	i32 557405415, ; 82: Jsr305Binding => 0x213954e7 => 268
	i32 562488221, ; 83: System.ServiceModel => 0x2186e39d => 192
	i32 569601784, ; 84: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 266
	i32 577335427, ; 85: System.Security.Cryptography.Cng => 0x22697083 => 119
	i32 592146354, ; 86: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 300
	i32 601371474, ; 87: System.IO.IsolatedStorage.dll => 0x23d83352 => 51
	i32 605376203, ; 88: System.IO.Compression.FileSystem => 0x24154ecb => 43
	i32 610194910, ; 89: System.Reactive.dll => 0x245ed5de => 195
	i32 613668793, ; 90: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 118
	i32 627609679, ; 91: Xamarin.AndroidX.CustomView => 0x2568904f => 220
	i32 627931235, ; 92: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 298
	i32 639843206, ; 93: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 226
	i32 643868501, ; 94: System.Net => 0x2660a755 => 80
	i32 662205335, ; 95: System.Text.Encodings.Web.dll => 0x27787397 => 135
	i32 663517072, ; 96: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 262
	i32 666292255, ; 97: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 207
	i32 672442732, ; 98: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 99: System.Net.Security => 0x28bdabca => 72
	i32 688181140, ; 100: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 280
	i32 690569205, ; 101: System.Xml.Linq.dll => 0x29293ff5 => 154
	i32 691348768, ; 102: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 277
	i32 693804605, ; 103: System.Windows => 0x295a9e3d => 153
	i32 699345723, ; 104: System.Reflection.Emit => 0x29af2b3b => 91
	i32 700284507, ; 105: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 272
	i32 700358131, ; 106: System.IO.Compression.ZipFile => 0x29be9df3 => 44
	i32 706645707, ; 107: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 295
	i32 709557578, ; 108: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 283
	i32 720511267, ; 109: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 276
	i32 722857257, ; 110: System.Runtime.Loader.dll => 0x2b15ed29 => 108
	i32 735137430, ; 111: System.Security.SecureString.dll => 0x2bd14e96 => 128
	i32 752232764, ; 112: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 113: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 197
	i32 759454413, ; 114: System.Net.Requests => 0x2d445acd => 71
	i32 762598435, ; 115: System.IO.Pipes.dll => 0x2d745423 => 54
	i32 775507847, ; 116: System.IO.Compression => 0x2e394f87 => 45
	i32 777317022, ; 117: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 304
	i32 789151979, ; 118: Microsoft.Extensions.Options => 0x2f0980eb => 184
	i32 790371945, ; 119: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 221
	i32 804715423, ; 120: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 121: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 235
	i32 823281589, ; 122: System.Private.Uri.dll => 0x311247b5 => 85
	i32 830298997, ; 123: System.IO.Compression.Brotli => 0x317d5b75 => 42
	i32 832635846, ; 124: System.Xml.XPath.dll => 0x31a103c6 => 159
	i32 834051424, ; 125: System.Net.Quic => 0x31b69d60 => 70
	i32 843511501, ; 126: Xamarin.AndroidX.Print => 0x3246f6cd => 248
	i32 873119928, ; 127: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 128: System.Globalization.dll => 0x34505120 => 41
	i32 878954865, ; 129: System.Net.Http.Json => 0x3463c971 => 62
	i32 904024072, ; 130: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 131: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 52
	i32 926902833, ; 132: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 307
	i32 928116545, ; 133: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 271
	i32 952186615, ; 134: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 104
	i32 955402788, ; 135: Newtonsoft.Json => 0x38f24a24 => 193
	i32 956575887, ; 136: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 276
	i32 966729478, ; 137: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 269
	i32 967690846, ; 138: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 232
	i32 975236339, ; 139: System.Diagnostics.Tracing => 0x3a20ecf3 => 33
	i32 975874589, ; 140: System.Xml.XDocument => 0x3a2aaa1d => 157
	i32 986514023, ; 141: System.Private.DataContractSerialization.dll => 0x3acd0267 => 84
	i32 987214855, ; 142: System.Diagnostics.Tools => 0x3ad7b407 => 31
	i32 992768348, ; 143: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 144: System.IO.FileSystem => 0x3b45fb35 => 50
	i32 1001831731, ; 145: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 55
	i32 1012816738, ; 146: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 252
	i32 1019214401, ; 147: System.Drawing => 0x3cbffa41 => 35
	i32 1028951442, ; 148: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 180
	i32 1029334545, ; 149: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 282
	i32 1031528504, ; 150: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 270
	i32 1035644815, ; 151: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 205
	i32 1036536393, ; 152: System.Drawing.Primitives.dll => 0x3dc84a49 => 34
	i32 1044663988, ; 153: System.Linq.Expressions.dll => 0x3e444eb4 => 57
	i32 1052210849, ; 154: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 239
	i32 1067306892, ; 155: GoogleGson => 0x3f9dcf8c => 175
	i32 1082857460, ; 156: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 157: Xamarin.Kotlin.StdLib => 0x409e66d8 => 273
	i32 1098259244, ; 158: System => 0x41761b2c => 163
	i32 1118262833, ; 159: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 295
	i32 1121599056, ; 160: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 238
	i32 1127624469, ; 161: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 183
	i32 1149092582, ; 162: Xamarin.AndroidX.Window => 0x447dc2e6 => 265
	i32 1168523401, ; 163: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 301
	i32 1170634674, ; 164: System.Web.dll => 0x45c677b2 => 152
	i32 1175144683, ; 165: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 261
	i32 1178241025, ; 166: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 246
	i32 1203215381, ; 167: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 299
	i32 1204270330, ; 168: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 207
	i32 1208641965, ; 169: System.Diagnostics.Process => 0x480a69ad => 28
	i32 1214827643, ; 170: CommunityToolkit.Mvvm => 0x4868cc7b => 172
	i32 1219128291, ; 171: System.IO.IsolatedStorage => 0x48aa6be3 => 51
	i32 1234928153, ; 172: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 297
	i32 1243150071, ; 173: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 266
	i32 1253011324, ; 174: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 175: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 281
	i32 1264511973, ; 176: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 256
	i32 1267360935, ; 177: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 260
	i32 1273260888, ; 178: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 212
	i32 1275534314, ; 179: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 277
	i32 1278448581, ; 180: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 204
	i32 1293217323, ; 181: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 223
	i32 1309188875, ; 182: System.Private.DataContractSerialization => 0x4e08a30b => 84
	i32 1322716291, ; 183: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 265
	i32 1324164729, ; 184: System.Linq => 0x4eed2679 => 60
	i32 1335329327, ; 185: System.Runtime.Serialization.Json.dll => 0x4f97822f => 111
	i32 1364015309, ; 186: System.IO => 0x514d38cd => 56
	i32 1373134921, ; 187: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 311
	i32 1376866003, ; 188: Xamarin.AndroidX.SavedState => 0x52114ed3 => 252
	i32 1379779777, ; 189: System.Resources.ResourceManager => 0x523dc4c1 => 98
	i32 1402170036, ; 190: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 191: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 216
	i32 1408764838, ; 192: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 110
	i32 1411638395, ; 193: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 100
	i32 1422545099, ; 194: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 101
	i32 1430672901, ; 195: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 279
	i32 1434145427, ; 196: System.Runtime.Handles => 0x557b5293 => 103
	i32 1435222561, ; 197: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 269
	i32 1439761251, ; 198: System.Net.Quic.dll => 0x55d10363 => 70
	i32 1452070440, ; 199: System.Formats.Asn1.dll => 0x568cd628 => 37
	i32 1453312822, ; 200: System.Diagnostics.Tools.dll => 0x569fcb36 => 31
	i32 1457743152, ; 201: System.Runtime.Extensions.dll => 0x56e36530 => 102
	i32 1458022317, ; 202: System.Net.Security.dll => 0x56e7a7ad => 72
	i32 1461004990, ; 203: es\Microsoft.Maui.Controls.resources => 0x57152abe => 285
	i32 1461234159, ; 204: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 205: System.Security.Cryptography.OpenSsl => 0x57201017 => 122
	i32 1462112819, ; 206: System.IO.Compression.dll => 0x57261233 => 45
	i32 1469204771, ; 207: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 206
	i32 1470490898, ; 208: Microsoft.Extensions.Primitives => 0x57a5e912 => 185
	i32 1479771757, ; 209: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 210: System.IO.Compression.Brotli.dll => 0x583e844f => 42
	i32 1487239319, ; 211: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1490025113, ; 212: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 253
	i32 1493001747, ; 213: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 289
	i32 1514721132, ; 214: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 284
	i32 1536373174, ; 215: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 30
	i32 1543031311, ; 216: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 137
	i32 1543355203, ; 217: System.Reflection.Emit.dll => 0x5bfdbb43 => 91
	i32 1550322496, ; 218: System.Reflection.Extensions.dll => 0x5c680b40 => 92
	i32 1551623176, ; 219: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 304
	i32 1565862583, ; 220: System.IO.FileSystem.Primitives => 0x5d552ab7 => 48
	i32 1566207040, ; 221: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 140
	i32 1573704789, ; 222: System.Runtime.Serialization.Json => 0x5dccd455 => 111
	i32 1580037396, ; 223: System.Threading.Overlapped => 0x5e2d7514 => 139
	i32 1582372066, ; 224: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 222
	i32 1592978981, ; 225: System.Runtime.Serialization.dll => 0x5ef2ee25 => 114
	i32 1597949149, ; 226: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 270
	i32 1601112923, ; 227: System.Xml.Serialization => 0x5f6f0b5b => 156
	i32 1604827217, ; 228: System.Net.WebClient => 0x5fa7b851 => 75
	i32 1618516317, ; 229: System.Net.WebSockets.Client.dll => 0x6078995d => 78
	i32 1622152042, ; 230: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 242
	i32 1622358360, ; 231: System.Dynamic.Runtime => 0x60b33958 => 36
	i32 1624863272, ; 232: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 264
	i32 1635184631, ; 233: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 226
	i32 1636350590, ; 234: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 219
	i32 1639515021, ; 235: System.Net.Http.dll => 0x61b9038d => 63
	i32 1639986890, ; 236: System.Text.RegularExpressions => 0x61c036ca => 137
	i32 1641389582, ; 237: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1657153582, ; 238: System.Runtime => 0x62c6282e => 115
	i32 1658241508, ; 239: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 258
	i32 1658251792, ; 240: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 267
	i32 1670060433, ; 241: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 214
	i32 1675553242, ; 242: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 47
	i32 1677501392, ; 243: System.Net.Primitives.dll => 0x63fca3d0 => 69
	i32 1678508291, ; 244: System.Net.WebSockets => 0x640c0103 => 79
	i32 1679769178, ; 245: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1691477237, ; 246: System.Reflection.Metadata => 0x64d1e4f5 => 93
	i32 1696967625, ; 247: System.Security.Cryptography.Csp => 0x6525abc9 => 120
	i32 1698840827, ; 248: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 274
	i32 1701541528, ; 249: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 250: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 235
	i32 1726116996, ; 251: System.Reflection.dll => 0x66e27484 => 96
	i32 1728033016, ; 252: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 27
	i32 1729485958, ; 253: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 210
	i32 1736233607, ; 254: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 302
	i32 1743415430, ; 255: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 280
	i32 1744735666, ; 256: System.Transactions.Local.dll => 0x67fe8db2 => 148
	i32 1746316138, ; 257: Mono.Android.Export => 0x6816ab6a => 168
	i32 1750313021, ; 258: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 259: System.Resources.Reader.dll => 0x68cc9d1e => 97
	i32 1763938596, ; 260: System.Diagnostics.TraceSource.dll => 0x69239124 => 32
	i32 1765942094, ; 261: System.Reflection.Extensions => 0x6942234e => 92
	i32 1766324549, ; 262: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 257
	i32 1770582343, ; 263: Microsoft.Extensions.Logging.dll => 0x6988f147 => 181
	i32 1776026572, ; 264: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 265: System.Globalization.Extensions.dll => 0x69ec0683 => 40
	i32 1780572499, ; 266: Mono.Android.Runtime.dll => 0x6a216153 => 169
	i32 1782862114, ; 267: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 296
	i32 1788241197, ; 268: Xamarin.AndroidX.Fragment => 0x6a96652d => 228
	i32 1793755602, ; 269: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 288
	i32 1808609942, ; 270: Xamarin.AndroidX.Loader => 0x6bcd3296 => 242
	i32 1813058853, ; 271: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 273
	i32 1813201214, ; 272: Xamarin.Google.Android.Material => 0x6c13413e => 267
	i32 1818569960, ; 273: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 247
	i32 1818787751, ; 274: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 275: System.Text.Encoding.Extensions => 0x6cbab720 => 133
	i32 1824722060, ; 276: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 110
	i32 1828688058, ; 277: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 182
	i32 1842015223, ; 278: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 308
	i32 1847515442, ; 279: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 197
	i32 1853025655, ; 280: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 305
	i32 1858542181, ; 281: System.Linq.Expressions => 0x6ec71a65 => 57
	i32 1870277092, ; 282: System.Reflection.Primitives => 0x6f7a29e4 => 94
	i32 1875935024, ; 283: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 287
	i32 1879696579, ; 284: System.Formats.Tar.dll => 0x7009e4c3 => 38
	i32 1885316902, ; 285: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 208
	i32 1888955245, ; 286: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 287: System.Reflection.Metadata.dll => 0x70a66bdd => 93
	i32 1898237753, ; 288: System.Reflection.DispatchProxy => 0x7124cf39 => 88
	i32 1900610850, ; 289: System.Resources.ResourceManager.dll => 0x71490522 => 98
	i32 1910275211, ; 290: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 291: System.Private.Xml.Linq => 0x739bd4a8 => 86
	i32 1956758971, ; 292: System.Resources.Writer => 0x74a1c5bb => 99
	i32 1961813231, ; 293: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 254
	i32 1968388702, ; 294: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 177
	i32 1983156543, ; 295: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 274
	i32 1985761444, ; 296: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 199
	i32 2003115576, ; 297: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 284
	i32 2011961780, ; 298: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 299: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 239
	i32 2025202353, ; 300: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 279
	i32 2031763787, ; 301: Xamarin.Android.Glide => 0x791a414b => 196
	i32 2045470958, ; 302: System.Private.Xml => 0x79eb68ee => 87
	i32 2055257422, ; 303: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 234
	i32 2060060697, ; 304: System.Windows.dll => 0x7aca0819 => 153
	i32 2066184531, ; 305: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 283
	i32 2070888862, ; 306: System.Diagnostics.TraceSource => 0x7b6f419e => 32
	i32 2079903147, ; 307: System.Runtime.dll => 0x7bf8cdab => 115
	i32 2090596640, ; 308: System.Numerics.Vectors => 0x7c9bf920 => 81
	i32 2092919810, ; 309: System.ServiceModel.dll => 0x7cbf6c02 => 192
	i32 2127167465, ; 310: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 311: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 312: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 161
	i32 2146852085, ; 313: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 314: Microsoft.Maui => 0x80bd55ad => 189
	i32 2169148018, ; 315: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 291
	i32 2181898931, ; 316: Microsoft.Extensions.Options.dll => 0x820d22b3 => 184
	i32 2192057212, ; 317: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 182
	i32 2193016926, ; 318: System.ObjectModel.dll => 0x82b6c85e => 83
	i32 2201107256, ; 319: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 278
	i32 2201231467, ; 320: System.Net.Http => 0x8334206b => 63
	i32 2207618523, ; 321: it\Microsoft.Maui.Controls.resources => 0x839595db => 293
	i32 2216717168, ; 322: Firebase.Auth.dll => 0x84206b70 => 173
	i32 2217644978, ; 323: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 261
	i32 2222056684, ; 324: System.Threading.Tasks.Parallel => 0x8471e4ec => 142
	i32 2244775296, ; 325: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 243
	i32 2252106437, ; 326: System.Xml.Serialization.dll => 0x863c6ac5 => 156
	i32 2256313426, ; 327: System.Globalization.Extensions => 0x867c9c52 => 40
	i32 2265110946, ; 328: System.Security.AccessControl.dll => 0x8702d9a2 => 116
	i32 2266799131, ; 329: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 178
	i32 2267999099, ; 330: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 198
	i32 2270573516, ; 331: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 287
	i32 2279755925, ; 332: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 250
	i32 2293034957, ; 333: System.ServiceModel.Web.dll => 0x88acefcd => 130
	i32 2295906218, ; 334: System.Net.Sockets => 0x88d8bfaa => 74
	i32 2298471582, ; 335: System.Net.Mail => 0x88ffe49e => 65
	i32 2303942373, ; 336: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 297
	i32 2305521784, ; 337: System.Private.CoreLib.dll => 0x896b7878 => 171
	i32 2315684594, ; 338: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 202
	i32 2320631194, ; 339: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 142
	i32 2340441535, ; 340: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 105
	i32 2344264397, ; 341: System.ValueTuple => 0x8bbaa2cd => 150
	i32 2353062107, ; 342: System.Net.Primitives => 0x8c40e0db => 69
	i32 2368005991, ; 343: System.Xml.ReaderWriter.dll => 0x8d24e767 => 155
	i32 2371007202, ; 344: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 177
	i32 2378619854, ; 345: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 120
	i32 2383496789, ; 346: System.Security.Principal.Windows.dll => 0x8e114655 => 126
	i32 2395872292, ; 347: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 292
	i32 2401565422, ; 348: System.Web.HttpUtility => 0x8f24faee => 151
	i32 2403452196, ; 349: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 225
	i32 2421380589, ; 350: System.Threading.Tasks.Dataflow => 0x905355ed => 140
	i32 2423080555, ; 351: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 212
	i32 2427813419, ; 352: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 289
	i32 2428407029, ; 353: ESP32pH.dll => 0x90be8cf5 => 0
	i32 2435356389, ; 354: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 355: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2454642406, ; 356: System.Text.Encoding.dll => 0x924edee6 => 134
	i32 2458678730, ; 357: System.Net.Sockets.dll => 0x928c75ca => 74
	i32 2459001652, ; 358: System.Linq.Parallel.dll => 0x92916334 => 58
	i32 2465532216, ; 359: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 215
	i32 2471841756, ; 360: netstandard.dll => 0x93554fdc => 166
	i32 2475788418, ; 361: Java.Interop.dll => 0x93918882 => 167
	i32 2480646305, ; 362: Microsoft.Maui.Controls => 0x93dba8a1 => 187
	i32 2483903535, ; 363: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 364: System.Net.ServicePoint => 0x94147f61 => 73
	i32 2490993605, ; 365: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 366: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 367: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 237
	i32 2522472828, ; 368: Xamarin.Android.Glide.dll => 0x9659e17c => 196
	i32 2538310050, ; 369: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 90
	i32 2550873716, ; 370: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 290
	i32 2562349572, ; 371: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2570120770, ; 372: System.Text.Encodings.Web => 0x9930ee42 => 135
	i32 2581783588, ; 373: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 238
	i32 2581819634, ; 374: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 260
	i32 2585220780, ; 375: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 133
	i32 2585805581, ; 376: System.Net.Ping => 0x9a20430d => 68
	i32 2589602615, ; 377: System.Threading.ThreadPool => 0x9a5a3337 => 145
	i32 2593496499, ; 378: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 299
	i32 2605712449, ; 379: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 278
	i32 2615233544, ; 380: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 229
	i32 2616218305, ; 381: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 183
	i32 2617129537, ; 382: System.Private.Xml.dll => 0x9bfe3a41 => 87
	i32 2618712057, ; 383: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 95
	i32 2620871830, ; 384: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 219
	i32 2624644809, ; 385: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 224
	i32 2626831493, ; 386: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 294
	i32 2627185994, ; 387: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 30
	i32 2629843544, ; 388: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 44
	i32 2633051222, ; 389: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 233
	i32 2663391936, ; 390: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 198
	i32 2663698177, ; 391: System.Runtime.Loader => 0x9ec4cf01 => 108
	i32 2664396074, ; 392: System.Xml.XDocument.dll => 0x9ecf752a => 157
	i32 2665622720, ; 393: System.Drawing.Primitives => 0x9ee22cc0 => 34
	i32 2676780864, ; 394: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 395: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 113
	i32 2693849962, ; 396: System.IO.dll => 0xa090e36a => 56
	i32 2701096212, ; 397: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 258
	i32 2715334215, ; 398: System.Threading.Tasks.dll => 0xa1d8b647 => 143
	i32 2717744543, ; 399: System.Security.Claims => 0xa1fd7d9f => 117
	i32 2719963679, ; 400: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 119
	i32 2724373263, ; 401: System.Runtime.Numerics.dll => 0xa262a30f => 109
	i32 2732626843, ; 402: Xamarin.AndroidX.Activity => 0xa2e0939b => 200
	i32 2735172069, ; 403: System.Threading.Channels => 0xa30769e5 => 138
	i32 2737747696, ; 404: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 206
	i32 2740948882, ; 405: System.IO.Pipes.AccessControl => 0xa35f8f92 => 53
	i32 2748088231, ; 406: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 104
	i32 2752995522, ; 407: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 300
	i32 2758225723, ; 408: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 188
	i32 2764765095, ; 409: Microsoft.Maui.dll => 0xa4caf7a7 => 189
	i32 2765824710, ; 410: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 132
	i32 2770495804, ; 411: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 272
	i32 2778768386, ; 412: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 263
	i32 2779977773, ; 413: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 251
	i32 2785988530, ; 414: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 306
	i32 2788224221, ; 415: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 229
	i32 2801831435, ; 416: Microsoft.Maui.Graphics => 0xa7008e0b => 191
	i32 2803228030, ; 417: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 158
	i32 2806116107, ; 418: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 285
	i32 2810250172, ; 419: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 216
	i32 2819470561, ; 420: System.Xml.dll => 0xa80db4e1 => 162
	i32 2821205001, ; 421: System.ServiceProcess.dll => 0xa8282c09 => 131
	i32 2821294376, ; 422: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 251
	i32 2824502124, ; 423: System.Xml.XmlDocument => 0xa85a7b6c => 160
	i32 2831556043, ; 424: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 298
	i32 2838993487, ; 425: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 240
	i32 2849599387, ; 426: System.Threading.Overlapped.dll => 0xa9d96f9b => 139
	i32 2853208004, ; 427: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 263
	i32 2855708567, ; 428: Xamarin.AndroidX.Transition => 0xaa36a797 => 259
	i32 2861098320, ; 429: Mono.Android.Export.dll => 0xaa88e550 => 168
	i32 2861189240, ; 430: Microsoft.Maui.Essentials => 0xaa8a4878 => 190
	i32 2870099610, ; 431: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 201
	i32 2875164099, ; 432: Jsr305Binding.dll => 0xab5f85c3 => 268
	i32 2875220617, ; 433: System.Globalization.Calendars.dll => 0xab606289 => 39
	i32 2884993177, ; 434: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 227
	i32 2887636118, ; 435: System.Net.dll => 0xac1dd496 => 80
	i32 2899753641, ; 436: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 55
	i32 2900621748, ; 437: System.Dynamic.Runtime.dll => 0xace3f9b4 => 36
	i32 2901442782, ; 438: System.Reflection => 0xacf080de => 96
	i32 2905242038, ; 439: mscorlib.dll => 0xad2a79b6 => 165
	i32 2909740682, ; 440: System.Private.CoreLib => 0xad6f1e8a => 171
	i32 2916838712, ; 441: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 264
	i32 2919462931, ; 442: System.Numerics.Vectors.dll => 0xae037813 => 81
	i32 2921128767, ; 443: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 203
	i32 2936416060, ; 444: System.Resources.Reader => 0xaf06273c => 97
	i32 2940926066, ; 445: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 29
	i32 2942453041, ; 446: System.Xml.XPath.XDocument => 0xaf624531 => 158
	i32 2959614098, ; 447: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 448: System.Security.Principal.Windows => 0xb0ed41f3 => 126
	i32 2972252294, ; 449: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 118
	i32 2978675010, ; 450: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 223
	i32 2987532451, ; 451: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 254
	i32 2996846495, ; 452: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 236
	i32 3016983068, ; 453: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 256
	i32 3023353419, ; 454: WindowsBase.dll => 0xb434b64b => 164
	i32 3024354802, ; 455: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 231
	i32 3038032645, ; 456: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 313
	i32 3056245963, ; 457: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 253
	i32 3057625584, ; 458: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 244
	i32 3059408633, ; 459: Mono.Android.Runtime => 0xb65adef9 => 169
	i32 3059793426, ; 460: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3075834255, ; 461: System.Threading.Tasks => 0xb755818f => 143
	i32 3077302341, ; 462: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 291
	i32 3090735792, ; 463: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 124
	i32 3099732863, ; 464: System.Security.Claims.dll => 0xb8c22b7f => 117
	i32 3103600923, ; 465: System.Formats.Asn1 => 0xb8fd311b => 37
	i32 3111772706, ; 466: System.Runtime.Serialization => 0xb979e222 => 114
	i32 3115364679, ; 467: ESP32pH => 0xb9b0b147 => 0
	i32 3121463068, ; 468: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 46
	i32 3124832203, ; 469: System.Threading.Tasks.Extensions => 0xba4127cb => 141
	i32 3132293585, ; 470: System.Security.AccessControl => 0xbab301d1 => 116
	i32 3147165239, ; 471: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 33
	i32 3148237826, ; 472: GoogleGson.dll => 0xbba64c02 => 175
	i32 3159123045, ; 473: System.Reflection.Primitives.dll => 0xbc4c6465 => 94
	i32 3160747431, ; 474: System.IO.MemoryMappedFiles => 0xbc652da7 => 52
	i32 3178803400, ; 475: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 245
	i32 3192346100, ; 476: System.Security.SecureString => 0xbe4755f4 => 128
	i32 3193515020, ; 477: System.Web => 0xbe592c0c => 152
	i32 3204380047, ; 478: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 479: System.Xml.XmlDocument.dll => 0xbf506931 => 160
	i32 3211777861, ; 480: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 222
	i32 3220365878, ; 481: System.Threading => 0xbff2e236 => 147
	i32 3226221578, ; 482: System.Runtime.Handles.dll => 0xc04c3c0a => 103
	i32 3251039220, ; 483: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 88
	i32 3258312781, ; 484: Xamarin.AndroidX.CardView => 0xc235e84d => 210
	i32 3265493905, ; 485: System.Linq.Queryable.dll => 0xc2a37b91 => 59
	i32 3265893370, ; 486: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 141
	i32 3277815716, ; 487: System.Resources.Writer.dll => 0xc35f7fa4 => 99
	i32 3279906254, ; 488: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 489: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 490: System.Security.Cryptography.Encoding => 0xc4251ff9 => 121
	i32 3299363146, ; 491: System.Text.Encoding => 0xc4a8494a => 134
	i32 3303498502, ; 492: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 27
	i32 3305363605, ; 493: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 286
	i32 3316684772, ; 494: System.Net.Requests.dll => 0xc5b097e4 => 71
	i32 3317135071, ; 495: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 220
	i32 3317144872, ; 496: System.Data => 0xc5b79d28 => 24
	i32 3322403133, ; 497: Firebase.dll => 0xc607d93d => 174
	i32 3340431453, ; 498: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 208
	i32 3345895724, ; 499: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 249
	i32 3346324047, ; 500: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 246
	i32 3357674450, ; 501: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 303
	i32 3358260929, ; 502: System.Text.Json => 0xc82afec1 => 136
	i32 3362336904, ; 503: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 201
	i32 3362522851, ; 504: Xamarin.AndroidX.Core => 0xc86c06e3 => 217
	i32 3366347497, ; 505: Java.Interop => 0xc8a662e9 => 167
	i32 3374999561, ; 506: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 250
	i32 3381016424, ; 507: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 282
	i32 3395150330, ; 508: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 100
	i32 3403906625, ; 509: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 122
	i32 3405233483, ; 510: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 221
	i32 3428513518, ; 511: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 179
	i32 3429136800, ; 512: System.Xml => 0xcc6479a0 => 162
	i32 3430777524, ; 513: netstandard => 0xcc7d82b4 => 166
	i32 3441283291, ; 514: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 224
	i32 3445260447, ; 515: System.Formats.Tar => 0xcd5a809f => 38
	i32 3452344032, ; 516: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 186
	i32 3463511458, ; 517: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 290
	i32 3471940407, ; 518: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 519: Mono.Android => 0xcf3163e6 => 170
	i32 3479583265, ; 520: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 303
	i32 3484440000, ; 521: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 302
	i32 3485117614, ; 522: System.Text.Json.dll => 0xcfbaacae => 136
	i32 3486566296, ; 523: System.Transactions => 0xcfd0c798 => 149
	i32 3493954962, ; 524: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 213
	i32 3509114376, ; 525: System.Xml.Linq => 0xd128d608 => 154
	i32 3515174580, ; 526: System.Security.dll => 0xd1854eb4 => 129
	i32 3530912306, ; 527: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 528: System.Net.HttpListener => 0xd2ff69f1 => 64
	i32 3560100363, ; 529: System.Threading.Timer => 0xd432d20b => 146
	i32 3570554715, ; 530: System.IO.FileSystem.AccessControl => 0xd4d2575b => 46
	i32 3580758918, ; 531: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 310
	i32 3596207933, ; 532: LiteDB.dll => 0xd659c73d => 176
	i32 3597029428, ; 533: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 199
	i32 3598340787, ; 534: System.Net.WebSockets.Client => 0xd67a52b3 => 78
	i32 3608519521, ; 535: System.Linq.dll => 0xd715a361 => 60
	i32 3624195450, ; 536: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 105
	i32 3627220390, ; 537: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 248
	i32 3629588173, ; 538: LiteDB => 0xd8571ecd => 176
	i32 3633644679, ; 539: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 203
	i32 3638274909, ; 540: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 48
	i32 3641597786, ; 541: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 234
	i32 3643446276, ; 542: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 307
	i32 3643854240, ; 543: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 245
	i32 3645089577, ; 544: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 545: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 178
	i32 3660523487, ; 546: System.Net.NetworkInformation => 0xda2f27df => 67
	i32 3672681054, ; 547: Mono.Android.dll => 0xdae8aa5e => 170
	i32 3682565725, ; 548: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 209
	i32 3684561358, ; 549: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 213
	i32 3697841164, ; 550: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 312
	i32 3700866549, ; 551: System.Net.WebProxy.dll => 0xdc96bdf5 => 77
	i32 3706696989, ; 552: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 218
	i32 3716563718, ; 553: System.Runtime.Intrinsics => 0xdd864306 => 107
	i32 3718780102, ; 554: Xamarin.AndroidX.Annotation => 0xdda814c6 => 202
	i32 3724971120, ; 555: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 244
	i32 3731644420, ; 556: System.Reactive => 0xde6c6004 => 195
	i32 3732100267, ; 557: System.Net.NameResolution => 0xde7354ab => 66
	i32 3737834244, ; 558: System.Net.Http.Json.dll => 0xdecad304 => 62
	i32 3748608112, ; 559: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 194
	i32 3751444290, ; 560: System.Xml.XPath => 0xdf9a7f42 => 159
	i32 3786282454, ; 561: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 211
	i32 3792276235, ; 562: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 563: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 186
	i32 3802395368, ; 564: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 565: System.Net.WebProxy => 0xe3a54a09 => 77
	i32 3823082795, ; 566: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3829621856, ; 567: System.Numerics.dll => 0xe4436460 => 82
	i32 3841636137, ; 568: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 180
	i32 3844307129, ; 569: System.Net.Mail.dll => 0xe52378b9 => 65
	i32 3849253459, ; 570: System.Runtime.InteropServices.dll => 0xe56ef253 => 106
	i32 3870376305, ; 571: System.Net.HttpListener.dll => 0xe6b14171 => 64
	i32 3873536506, ; 572: System.Security.Principal => 0xe6e179fa => 127
	i32 3875112723, ; 573: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 121
	i32 3885497537, ; 574: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 76
	i32 3885922214, ; 575: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 259
	i32 3888767677, ; 576: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 249
	i32 3889960447, ; 577: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 311
	i32 3896106733, ; 578: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 579: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 217
	i32 3901907137, ; 580: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 581: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 43
	i32 3921031405, ; 582: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 262
	i32 3928044579, ; 583: System.Xml.ReaderWriter => 0xea213423 => 155
	i32 3930554604, ; 584: System.Security.Principal.dll => 0xea4780ec => 127
	i32 3931092270, ; 585: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 247
	i32 3945713374, ; 586: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 587: System.Text.Encoding.CodePages => 0xebac8bfe => 132
	i32 3955647286, ; 588: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 205
	i32 3959773229, ; 589: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 236
	i32 3980434154, ; 590: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 306
	i32 3987592930, ; 591: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 288
	i32 4003436829, ; 592: System.Diagnostics.Process.dll => 0xee9f991d => 28
	i32 4015948917, ; 593: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 204
	i32 4024013275, ; 594: Firebase.Auth => 0xefd991db => 173
	i32 4025784931, ; 595: System.Memory => 0xeff49a63 => 61
	i32 4046471985, ; 596: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 188
	i32 4054681211, ; 597: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 89
	i32 4068434129, ; 598: System.Private.Xml.Linq.dll => 0xf27f60d1 => 86
	i32 4073602200, ; 599: System.Threading.dll => 0xf2ce3c98 => 147
	i32 4094352644, ; 600: Microsoft.Maui.Essentials.dll => 0xf40add04 => 190
	i32 4099507663, ; 601: System.Drawing.dll => 0xf45985cf => 35
	i32 4100113165, ; 602: System.Private.Uri => 0xf462c30d => 85
	i32 4101593132, ; 603: Xamarin.AndroidX.Emoji2 => 0xf479582c => 225
	i32 4102112229, ; 604: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 301
	i32 4125707920, ; 605: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 296
	i32 4126470640, ; 606: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 179
	i32 4127667938, ; 607: System.IO.FileSystem.Watcher => 0xf60736e2 => 49
	i32 4130442656, ; 608: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 609: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 89
	i32 4150914736, ; 610: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 308
	i32 4151237749, ; 611: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 612: System.Xml.XmlSerializer => 0xf7e95c85 => 161
	i32 4161255271, ; 613: System.Reflection.TypeExtensions => 0xf807b767 => 95
	i32 4164802419, ; 614: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 49
	i32 4181436372, ; 615: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 112
	i32 4182413190, ; 616: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 241
	i32 4185676441, ; 617: System.Security => 0xf97c5a99 => 129
	i32 4196529839, ; 618: System.Net.WebClient.dll => 0xfa21f6af => 75
	i32 4213026141, ; 619: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 194
	i32 4256097574, ; 620: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 218
	i32 4258378803, ; 621: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 240
	i32 4260525087, ; 622: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 623: Microsoft.Maui.Controls.dll => 0xfea12dee => 187
	i32 4274623895, ; 624: CommunityToolkit.Mvvm.dll => 0xfec99597 => 172
	i32 4274976490, ; 625: System.Runtime.Numerics => 0xfecef6ea => 109
	i32 4292120959, ; 626: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 241
	i32 4294763496 ; 627: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 227
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [628 x i32] [
	i32 67, ; 0
	i32 66, ; 1
	i32 107, ; 2
	i32 237, ; 3
	i32 271, ; 4
	i32 47, ; 5
	i32 193, ; 6
	i32 79, ; 7
	i32 144, ; 8
	i32 29, ; 9
	i32 312, ; 10
	i32 123, ; 11
	i32 191, ; 12
	i32 101, ; 13
	i32 255, ; 14
	i32 106, ; 15
	i32 255, ; 16
	i32 138, ; 17
	i32 275, ; 18
	i32 76, ; 19
	i32 123, ; 20
	i32 13, ; 21
	i32 211, ; 22
	i32 131, ; 23
	i32 257, ; 24
	i32 150, ; 25
	i32 309, ; 26
	i32 310, ; 27
	i32 18, ; 28
	i32 209, ; 29
	i32 26, ; 30
	i32 231, ; 31
	i32 1, ; 32
	i32 58, ; 33
	i32 41, ; 34
	i32 90, ; 35
	i32 214, ; 36
	i32 146, ; 37
	i32 233, ; 38
	i32 230, ; 39
	i32 281, ; 40
	i32 53, ; 41
	i32 68, ; 42
	i32 309, ; 43
	i32 200, ; 44
	i32 82, ; 45
	i32 294, ; 46
	i32 232, ; 47
	i32 293, ; 48
	i32 130, ; 49
	i32 54, ; 50
	i32 148, ; 51
	i32 73, ; 52
	i32 144, ; 53
	i32 61, ; 54
	i32 145, ; 55
	i32 174, ; 56
	i32 313, ; 57
	i32 164, ; 58
	i32 305, ; 59
	i32 215, ; 60
	i32 12, ; 61
	i32 228, ; 62
	i32 124, ; 63
	i32 151, ; 64
	i32 112, ; 65
	i32 165, ; 66
	i32 163, ; 67
	i32 230, ; 68
	i32 243, ; 69
	i32 83, ; 70
	i32 292, ; 71
	i32 286, ; 72
	i32 185, ; 73
	i32 149, ; 74
	i32 275, ; 75
	i32 59, ; 76
	i32 181, ; 77
	i32 50, ; 78
	i32 102, ; 79
	i32 113, ; 80
	i32 39, ; 81
	i32 268, ; 82
	i32 192, ; 83
	i32 266, ; 84
	i32 119, ; 85
	i32 300, ; 86
	i32 51, ; 87
	i32 43, ; 88
	i32 195, ; 89
	i32 118, ; 90
	i32 220, ; 91
	i32 298, ; 92
	i32 226, ; 93
	i32 80, ; 94
	i32 135, ; 95
	i32 262, ; 96
	i32 207, ; 97
	i32 8, ; 98
	i32 72, ; 99
	i32 280, ; 100
	i32 154, ; 101
	i32 277, ; 102
	i32 153, ; 103
	i32 91, ; 104
	i32 272, ; 105
	i32 44, ; 106
	i32 295, ; 107
	i32 283, ; 108
	i32 276, ; 109
	i32 108, ; 110
	i32 128, ; 111
	i32 25, ; 112
	i32 197, ; 113
	i32 71, ; 114
	i32 54, ; 115
	i32 45, ; 116
	i32 304, ; 117
	i32 184, ; 118
	i32 221, ; 119
	i32 22, ; 120
	i32 235, ; 121
	i32 85, ; 122
	i32 42, ; 123
	i32 159, ; 124
	i32 70, ; 125
	i32 248, ; 126
	i32 3, ; 127
	i32 41, ; 128
	i32 62, ; 129
	i32 16, ; 130
	i32 52, ; 131
	i32 307, ; 132
	i32 271, ; 133
	i32 104, ; 134
	i32 193, ; 135
	i32 276, ; 136
	i32 269, ; 137
	i32 232, ; 138
	i32 33, ; 139
	i32 157, ; 140
	i32 84, ; 141
	i32 31, ; 142
	i32 12, ; 143
	i32 50, ; 144
	i32 55, ; 145
	i32 252, ; 146
	i32 35, ; 147
	i32 180, ; 148
	i32 282, ; 149
	i32 270, ; 150
	i32 205, ; 151
	i32 34, ; 152
	i32 57, ; 153
	i32 239, ; 154
	i32 175, ; 155
	i32 17, ; 156
	i32 273, ; 157
	i32 163, ; 158
	i32 295, ; 159
	i32 238, ; 160
	i32 183, ; 161
	i32 265, ; 162
	i32 301, ; 163
	i32 152, ; 164
	i32 261, ; 165
	i32 246, ; 166
	i32 299, ; 167
	i32 207, ; 168
	i32 28, ; 169
	i32 172, ; 170
	i32 51, ; 171
	i32 297, ; 172
	i32 266, ; 173
	i32 5, ; 174
	i32 281, ; 175
	i32 256, ; 176
	i32 260, ; 177
	i32 212, ; 178
	i32 277, ; 179
	i32 204, ; 180
	i32 223, ; 181
	i32 84, ; 182
	i32 265, ; 183
	i32 60, ; 184
	i32 111, ; 185
	i32 56, ; 186
	i32 311, ; 187
	i32 252, ; 188
	i32 98, ; 189
	i32 19, ; 190
	i32 216, ; 191
	i32 110, ; 192
	i32 100, ; 193
	i32 101, ; 194
	i32 279, ; 195
	i32 103, ; 196
	i32 269, ; 197
	i32 70, ; 198
	i32 37, ; 199
	i32 31, ; 200
	i32 102, ; 201
	i32 72, ; 202
	i32 285, ; 203
	i32 9, ; 204
	i32 122, ; 205
	i32 45, ; 206
	i32 206, ; 207
	i32 185, ; 208
	i32 9, ; 209
	i32 42, ; 210
	i32 4, ; 211
	i32 253, ; 212
	i32 289, ; 213
	i32 284, ; 214
	i32 30, ; 215
	i32 137, ; 216
	i32 91, ; 217
	i32 92, ; 218
	i32 304, ; 219
	i32 48, ; 220
	i32 140, ; 221
	i32 111, ; 222
	i32 139, ; 223
	i32 222, ; 224
	i32 114, ; 225
	i32 270, ; 226
	i32 156, ; 227
	i32 75, ; 228
	i32 78, ; 229
	i32 242, ; 230
	i32 36, ; 231
	i32 264, ; 232
	i32 226, ; 233
	i32 219, ; 234
	i32 63, ; 235
	i32 137, ; 236
	i32 15, ; 237
	i32 115, ; 238
	i32 258, ; 239
	i32 267, ; 240
	i32 214, ; 241
	i32 47, ; 242
	i32 69, ; 243
	i32 79, ; 244
	i32 125, ; 245
	i32 93, ; 246
	i32 120, ; 247
	i32 274, ; 248
	i32 26, ; 249
	i32 235, ; 250
	i32 96, ; 251
	i32 27, ; 252
	i32 210, ; 253
	i32 302, ; 254
	i32 280, ; 255
	i32 148, ; 256
	i32 168, ; 257
	i32 4, ; 258
	i32 97, ; 259
	i32 32, ; 260
	i32 92, ; 261
	i32 257, ; 262
	i32 181, ; 263
	i32 21, ; 264
	i32 40, ; 265
	i32 169, ; 266
	i32 296, ; 267
	i32 228, ; 268
	i32 288, ; 269
	i32 242, ; 270
	i32 273, ; 271
	i32 267, ; 272
	i32 247, ; 273
	i32 2, ; 274
	i32 133, ; 275
	i32 110, ; 276
	i32 182, ; 277
	i32 308, ; 278
	i32 197, ; 279
	i32 305, ; 280
	i32 57, ; 281
	i32 94, ; 282
	i32 287, ; 283
	i32 38, ; 284
	i32 208, ; 285
	i32 25, ; 286
	i32 93, ; 287
	i32 88, ; 288
	i32 98, ; 289
	i32 10, ; 290
	i32 86, ; 291
	i32 99, ; 292
	i32 254, ; 293
	i32 177, ; 294
	i32 274, ; 295
	i32 199, ; 296
	i32 284, ; 297
	i32 7, ; 298
	i32 239, ; 299
	i32 279, ; 300
	i32 196, ; 301
	i32 87, ; 302
	i32 234, ; 303
	i32 153, ; 304
	i32 283, ; 305
	i32 32, ; 306
	i32 115, ; 307
	i32 81, ; 308
	i32 192, ; 309
	i32 20, ; 310
	i32 11, ; 311
	i32 161, ; 312
	i32 3, ; 313
	i32 189, ; 314
	i32 291, ; 315
	i32 184, ; 316
	i32 182, ; 317
	i32 83, ; 318
	i32 278, ; 319
	i32 63, ; 320
	i32 293, ; 321
	i32 173, ; 322
	i32 261, ; 323
	i32 142, ; 324
	i32 243, ; 325
	i32 156, ; 326
	i32 40, ; 327
	i32 116, ; 328
	i32 178, ; 329
	i32 198, ; 330
	i32 287, ; 331
	i32 250, ; 332
	i32 130, ; 333
	i32 74, ; 334
	i32 65, ; 335
	i32 297, ; 336
	i32 171, ; 337
	i32 202, ; 338
	i32 142, ; 339
	i32 105, ; 340
	i32 150, ; 341
	i32 69, ; 342
	i32 155, ; 343
	i32 177, ; 344
	i32 120, ; 345
	i32 126, ; 346
	i32 292, ; 347
	i32 151, ; 348
	i32 225, ; 349
	i32 140, ; 350
	i32 212, ; 351
	i32 289, ; 352
	i32 0, ; 353
	i32 20, ; 354
	i32 14, ; 355
	i32 134, ; 356
	i32 74, ; 357
	i32 58, ; 358
	i32 215, ; 359
	i32 166, ; 360
	i32 167, ; 361
	i32 187, ; 362
	i32 15, ; 363
	i32 73, ; 364
	i32 6, ; 365
	i32 23, ; 366
	i32 237, ; 367
	i32 196, ; 368
	i32 90, ; 369
	i32 290, ; 370
	i32 1, ; 371
	i32 135, ; 372
	i32 238, ; 373
	i32 260, ; 374
	i32 133, ; 375
	i32 68, ; 376
	i32 145, ; 377
	i32 299, ; 378
	i32 278, ; 379
	i32 229, ; 380
	i32 183, ; 381
	i32 87, ; 382
	i32 95, ; 383
	i32 219, ; 384
	i32 224, ; 385
	i32 294, ; 386
	i32 30, ; 387
	i32 44, ; 388
	i32 233, ; 389
	i32 198, ; 390
	i32 108, ; 391
	i32 157, ; 392
	i32 34, ; 393
	i32 22, ; 394
	i32 113, ; 395
	i32 56, ; 396
	i32 258, ; 397
	i32 143, ; 398
	i32 117, ; 399
	i32 119, ; 400
	i32 109, ; 401
	i32 200, ; 402
	i32 138, ; 403
	i32 206, ; 404
	i32 53, ; 405
	i32 104, ; 406
	i32 300, ; 407
	i32 188, ; 408
	i32 189, ; 409
	i32 132, ; 410
	i32 272, ; 411
	i32 263, ; 412
	i32 251, ; 413
	i32 306, ; 414
	i32 229, ; 415
	i32 191, ; 416
	i32 158, ; 417
	i32 285, ; 418
	i32 216, ; 419
	i32 162, ; 420
	i32 131, ; 421
	i32 251, ; 422
	i32 160, ; 423
	i32 298, ; 424
	i32 240, ; 425
	i32 139, ; 426
	i32 263, ; 427
	i32 259, ; 428
	i32 168, ; 429
	i32 190, ; 430
	i32 201, ; 431
	i32 268, ; 432
	i32 39, ; 433
	i32 227, ; 434
	i32 80, ; 435
	i32 55, ; 436
	i32 36, ; 437
	i32 96, ; 438
	i32 165, ; 439
	i32 171, ; 440
	i32 264, ; 441
	i32 81, ; 442
	i32 203, ; 443
	i32 97, ; 444
	i32 29, ; 445
	i32 158, ; 446
	i32 18, ; 447
	i32 126, ; 448
	i32 118, ; 449
	i32 223, ; 450
	i32 254, ; 451
	i32 236, ; 452
	i32 256, ; 453
	i32 164, ; 454
	i32 231, ; 455
	i32 313, ; 456
	i32 253, ; 457
	i32 244, ; 458
	i32 169, ; 459
	i32 16, ; 460
	i32 143, ; 461
	i32 291, ; 462
	i32 124, ; 463
	i32 117, ; 464
	i32 37, ; 465
	i32 114, ; 466
	i32 0, ; 467
	i32 46, ; 468
	i32 141, ; 469
	i32 116, ; 470
	i32 33, ; 471
	i32 175, ; 472
	i32 94, ; 473
	i32 52, ; 474
	i32 245, ; 475
	i32 128, ; 476
	i32 152, ; 477
	i32 24, ; 478
	i32 160, ; 479
	i32 222, ; 480
	i32 147, ; 481
	i32 103, ; 482
	i32 88, ; 483
	i32 210, ; 484
	i32 59, ; 485
	i32 141, ; 486
	i32 99, ; 487
	i32 5, ; 488
	i32 13, ; 489
	i32 121, ; 490
	i32 134, ; 491
	i32 27, ; 492
	i32 286, ; 493
	i32 71, ; 494
	i32 220, ; 495
	i32 24, ; 496
	i32 174, ; 497
	i32 208, ; 498
	i32 249, ; 499
	i32 246, ; 500
	i32 303, ; 501
	i32 136, ; 502
	i32 201, ; 503
	i32 217, ; 504
	i32 167, ; 505
	i32 250, ; 506
	i32 282, ; 507
	i32 100, ; 508
	i32 122, ; 509
	i32 221, ; 510
	i32 179, ; 511
	i32 162, ; 512
	i32 166, ; 513
	i32 224, ; 514
	i32 38, ; 515
	i32 186, ; 516
	i32 290, ; 517
	i32 17, ; 518
	i32 170, ; 519
	i32 303, ; 520
	i32 302, ; 521
	i32 136, ; 522
	i32 149, ; 523
	i32 213, ; 524
	i32 154, ; 525
	i32 129, ; 526
	i32 19, ; 527
	i32 64, ; 528
	i32 146, ; 529
	i32 46, ; 530
	i32 310, ; 531
	i32 176, ; 532
	i32 199, ; 533
	i32 78, ; 534
	i32 60, ; 535
	i32 105, ; 536
	i32 248, ; 537
	i32 176, ; 538
	i32 203, ; 539
	i32 48, ; 540
	i32 234, ; 541
	i32 307, ; 542
	i32 245, ; 543
	i32 14, ; 544
	i32 178, ; 545
	i32 67, ; 546
	i32 170, ; 547
	i32 209, ; 548
	i32 213, ; 549
	i32 312, ; 550
	i32 77, ; 551
	i32 218, ; 552
	i32 107, ; 553
	i32 202, ; 554
	i32 244, ; 555
	i32 195, ; 556
	i32 66, ; 557
	i32 62, ; 558
	i32 194, ; 559
	i32 159, ; 560
	i32 211, ; 561
	i32 10, ; 562
	i32 186, ; 563
	i32 11, ; 564
	i32 77, ; 565
	i32 125, ; 566
	i32 82, ; 567
	i32 180, ; 568
	i32 65, ; 569
	i32 106, ; 570
	i32 64, ; 571
	i32 127, ; 572
	i32 121, ; 573
	i32 76, ; 574
	i32 259, ; 575
	i32 249, ; 576
	i32 311, ; 577
	i32 8, ; 578
	i32 217, ; 579
	i32 2, ; 580
	i32 43, ; 581
	i32 262, ; 582
	i32 155, ; 583
	i32 127, ; 584
	i32 247, ; 585
	i32 23, ; 586
	i32 132, ; 587
	i32 205, ; 588
	i32 236, ; 589
	i32 306, ; 590
	i32 288, ; 591
	i32 28, ; 592
	i32 204, ; 593
	i32 173, ; 594
	i32 61, ; 595
	i32 188, ; 596
	i32 89, ; 597
	i32 86, ; 598
	i32 147, ; 599
	i32 190, ; 600
	i32 35, ; 601
	i32 85, ; 602
	i32 225, ; 603
	i32 301, ; 604
	i32 296, ; 605
	i32 179, ; 606
	i32 49, ; 607
	i32 6, ; 608
	i32 89, ; 609
	i32 308, ; 610
	i32 21, ; 611
	i32 161, ; 612
	i32 95, ; 613
	i32 49, ; 614
	i32 112, ; 615
	i32 241, ; 616
	i32 129, ; 617
	i32 75, ; 618
	i32 194, ; 619
	i32 218, ; 620
	i32 240, ; 621
	i32 7, ; 622
	i32 187, ; 623
	i32 172, ; 624
	i32 109, ; 625
	i32 241, ; 626
	i32 227 ; 627
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 4

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 4

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 4

; Functions

; Function attributes: "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" uwtable willreturn
define void @xamarin_app_init(ptr nocapture noundef readnone %env, ptr noundef %fn) local_unnamed_addr #0
{
	%fnIsNull = icmp eq ptr %fn, null
	br i1 %fnIsNull, label %1, label %2

1: ; preds = %0
	%putsResult = call noundef i32 @puts(ptr @.str.0)
	call void @abort()
	unreachable 

2: ; preds = %1, %0
	store ptr %fn, ptr @get_function_pointer, align 4, !tbaa !3
	ret void
}

; Strings
@.str.0 = private unnamed_addr constant [40 x i8] c"get_function_pointer MUST be specified\0A\00", align 1

;MarshalMethodName
@.MarshalMethodName.0_name = private unnamed_addr constant [1 x i8] c"\00", align 1

; External functions

; Function attributes: noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress nofree norecurse nosync "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { noreturn "no-trapping-math"="true" nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"min_enum_size", i32 4}
