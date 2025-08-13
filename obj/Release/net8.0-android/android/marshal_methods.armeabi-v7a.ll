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

@assembly_image_cache = dso_local local_unnamed_addr global [144 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [288 x i32] [
	i32 39109920, ; 0: Newtonsoft.Json.dll => 0x254c520 => 53
	i32 42639949, ; 1: System.Threading.Thread => 0x28aa24d => 132
	i32 67008169, ; 2: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 3: Microsoft.Maui.Graphics.dll => 0x44bb714 => 51
	i32 117431740, ; 4: System.Runtime.InteropServices => 0x6ffddbc => 119
	i32 165246403, ; 5: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 60
	i32 182336117, ; 6: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 79
	i32 195452805, ; 7: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 8: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 9: System.ComponentModel => 0xc38ff48 => 93
	i32 220171995, ; 10: System.Diagnostics.Debug => 0xd1f8edb => 96
	i32 230752869, ; 11: Microsoft.CSharp.dll => 0xdc10265 => 86
	i32 246610117, ; 12: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 114
	i32 280992041, ; 13: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 14: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 15: Xamarin.AndroidX.Activity.dll => 0x13031348 => 56
	i32 336156722, ; 16: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 17: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 67
	i32 356389973, ; 18: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 19: System.Threading.Thread.dll => 0x16a510e1 => 132
	i32 385762202, ; 20: System.Memory.dll => 0x16fe439a => 104
	i32 393699800, ; 21: Firebase => 0x177761d8 => 37
	i32 395744057, ; 22: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 23: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 24: System.Collections => 0x1a61054f => 90
	i32 450948140, ; 25: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 66
	i32 459347974, ; 26: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 123
	i32 465846621, ; 27: mscorlib => 0x1bc4415d => 138
	i32 469710990, ; 28: System.dll => 0x1bff388e => 137
	i32 498788369, ; 29: System.ObjectModel => 0x1dbae811 => 109
	i32 500358224, ; 30: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 31: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 32: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 46
	i32 539058512, ; 33: Microsoft.Extensions.Logging => 0x20216150 => 43
	i32 562488221, ; 34: System.ServiceModel => 0x2186e39d => 52
	i32 592146354, ; 35: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 610194910, ; 36: System.Reactive.dll => 0x245ed5de => 55
	i32 627609679, ; 37: Xamarin.AndroidX.CustomView => 0x2568904f => 64
	i32 627931235, ; 38: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 662205335, ; 39: System.Text.Encodings.Web.dll => 0x27787397 => 128
	i32 672442732, ; 40: System.Collections.Concurrent => 0x2814a96c => 87
	i32 688181140, ; 41: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 42: System.Xml.Linq.dll => 0x29293ff5 => 134
	i32 706645707, ; 43: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 44: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 45: System.Runtime.Loader.dll => 0x2b15ed29 => 120
	i32 759454413, ; 46: System.Net.Requests => 0x2d445acd => 107
	i32 775507847, ; 47: System.IO.Compression => 0x2e394f87 => 101
	i32 777317022, ; 48: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 49: Microsoft.Extensions.Options => 0x2f0980eb => 45
	i32 804715423, ; 50: System.Data.Common => 0x2ff6fb9f => 95
	i32 823281589, ; 51: System.Private.Uri.dll => 0x311247b5 => 110
	i32 830298997, ; 52: System.IO.Compression.Brotli => 0x317d5b75 => 100
	i32 904024072, ; 53: System.ComponentModel.Primitives.dll => 0x35e25008 => 91
	i32 926902833, ; 54: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 955402788, ; 55: Newtonsoft.Json => 0x38f24a24 => 53
	i32 967690846, ; 56: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 67
	i32 975874589, ; 57: System.Xml.XDocument => 0x3a2aaa1d => 136
	i32 992768348, ; 58: System.Collections.dll => 0x3b2c715c => 90
	i32 1012816738, ; 59: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 77
	i32 1019214401, ; 60: System.Drawing => 0x3cbffa41 => 99
	i32 1028951442, ; 61: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 42
	i32 1029334545, ; 62: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 63: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 57
	i32 1036536393, ; 64: System.Drawing.Primitives.dll => 0x3dc84a49 => 98
	i32 1044663988, ; 65: System.Linq.Expressions.dll => 0x3e444eb4 => 102
	i32 1052210849, ; 66: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 69
	i32 1082857460, ; 67: System.ComponentModel.TypeConverter => 0x408b17f4 => 92
	i32 1084122840, ; 68: Xamarin.Kotlin.StdLib => 0x409e66d8 => 83
	i32 1098259244, ; 69: System => 0x41761b2c => 137
	i32 1118262833, ; 70: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 71: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 72: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 74
	i32 1203215381, ; 73: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1214827643, ; 74: CommunityToolkit.Mvvm => 0x4868cc7b => 35
	i32 1234928153, ; 75: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 76: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 77: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 65
	i32 1324164729, ; 78: System.Linq => 0x4eed2679 => 103
	i32 1373134921, ; 79: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 80: Xamarin.AndroidX.SavedState => 0x52114ed3 => 77
	i32 1379779777, ; 81: System.Resources.ResourceManager => 0x523dc4c1 => 118
	i32 1406073936, ; 82: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 61
	i32 1408764838, ; 83: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 122
	i32 1430672901, ; 84: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 85: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 86: System.IO.Compression.dll => 0x57261233 => 101
	i32 1469204771, ; 87: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 58
	i32 1470490898, ; 88: Microsoft.Extensions.Primitives => 0x57a5e912 => 46
	i32 1480492111, ; 89: System.IO.Compression.Brotli.dll => 0x583e844f => 100
	i32 1493001747, ; 90: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 91: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 92: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 130
	i32 1550322496, ; 93: System.Reflection.Extensions.dll => 0x5c680b40 => 115
	i32 1551623176, ; 94: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 95: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 71
	i32 1624863272, ; 96: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 81
	i32 1636350590, ; 97: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 63
	i32 1639515021, ; 98: System.Net.Http.dll => 0x61b9038d => 105
	i32 1639986890, ; 99: System.Text.RegularExpressions => 0x61c036ca => 130
	i32 1657153582, ; 100: System.Runtime => 0x62c6282e => 124
	i32 1658251792, ; 101: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 82
	i32 1677501392, ; 102: System.Net.Primitives.dll => 0x63fca3d0 => 106
	i32 1679769178, ; 103: System.Security.Cryptography => 0x641f3e5a => 125
	i32 1701541528, ; 104: System.Diagnostics.Debug.dll => 0x656b7698 => 96
	i32 1726116996, ; 105: System.Reflection.dll => 0x66e27484 => 117
	i32 1729485958, ; 106: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 59
	i32 1736233607, ; 107: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 108: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 109: System.Diagnostics.TraceSource.dll => 0x69239124 => 97
	i32 1765942094, ; 110: System.Reflection.Extensions => 0x6942234e => 115
	i32 1766324549, ; 111: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 79
	i32 1770582343, ; 112: Microsoft.Extensions.Logging.dll => 0x6988f147 => 43
	i32 1780572499, ; 113: Mono.Android.Runtime.dll => 0x6a216153 => 142
	i32 1782862114, ; 114: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 115: Xamarin.AndroidX.Fragment => 0x6a96652d => 66
	i32 1793755602, ; 116: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 117: Xamarin.AndroidX.Loader => 0x6bcd3296 => 71
	i32 1813058853, ; 118: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 83
	i32 1813201214, ; 119: Xamarin.Google.Android.Material => 0x6c13413e => 82
	i32 1818569960, ; 120: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 75
	i32 1824175904, ; 121: System.Text.Encoding.Extensions => 0x6cbab720 => 126
	i32 1824722060, ; 122: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 122
	i32 1828688058, ; 123: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 44
	i32 1842015223, ; 124: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 125: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 126: System.Linq.Expressions => 0x6ec71a65 => 102
	i32 1870277092, ; 127: System.Reflection.Primitives => 0x6f7a29e4 => 116
	i32 1875935024, ; 128: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1900610850, ; 129: System.Resources.ResourceManager.dll => 0x71490522 => 118
	i32 1910275211, ; 130: System.Collections.NonGeneric.dll => 0x71dc7c8b => 88
	i32 1939592360, ; 131: System.Private.Xml.Linq => 0x739bd4a8 => 111
	i32 1961813231, ; 132: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 78
	i32 1968388702, ; 133: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 39
	i32 2003115576, ; 134: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 135: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 69
	i32 2025202353, ; 136: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 137: System.Private.Xml => 0x79eb68ee => 112
	i32 2055257422, ; 138: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 68
	i32 2066184531, ; 139: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 140: System.Diagnostics.TraceSource => 0x7b6f419e => 97
	i32 2079903147, ; 141: System.Runtime.dll => 0x7bf8cdab => 124
	i32 2090596640, ; 142: System.Numerics.Vectors => 0x7c9bf920 => 108
	i32 2092919810, ; 143: System.ServiceModel.dll => 0x7cbf6c02 => 52
	i32 2127167465, ; 144: System.Console => 0x7ec9ffe9 => 94
	i32 2142473426, ; 145: System.Collections.Specialized => 0x7fb38cd2 => 89
	i32 2159891885, ; 146: Microsoft.Maui => 0x80bd55ad => 49
	i32 2169148018, ; 147: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 148: Microsoft.Extensions.Options.dll => 0x820d22b3 => 45
	i32 2192057212, ; 149: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 44
	i32 2193016926, ; 150: System.ObjectModel.dll => 0x82b6c85e => 109
	i32 2201107256, ; 151: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 84
	i32 2201231467, ; 152: System.Net.Http => 0x8334206b => 105
	i32 2207618523, ; 153: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2216717168, ; 154: Firebase.Auth.dll => 0x84206b70 => 36
	i32 2266799131, ; 155: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 40
	i32 2270573516, ; 156: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 157: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 76
	i32 2303942373, ; 158: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 159: System.Private.CoreLib.dll => 0x896b7878 => 140
	i32 2353062107, ; 160: System.Net.Primitives => 0x8c40e0db => 106
	i32 2368005991, ; 161: System.Xml.ReaderWriter.dll => 0x8d24e767 => 135
	i32 2371007202, ; 162: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 39
	i32 2395872292, ; 163: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 164: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2428407029, ; 165: ESP32pH.dll => 0x90be8cf5 => 85
	i32 2435356389, ; 166: System.Console.dll => 0x912896e5 => 94
	i32 2454642406, ; 167: System.Text.Encoding.dll => 0x924edee6 => 127
	i32 2471841756, ; 168: netstandard.dll => 0x93554fdc => 139
	i32 2475788418, ; 169: Java.Interop.dll => 0x93918882 => 141
	i32 2480646305, ; 170: Microsoft.Maui.Controls => 0x93dba8a1 => 47
	i32 2538310050, ; 171: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 114
	i32 2550873716, ; 172: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 173: Microsoft.CSharp => 0x98ba5a04 => 86
	i32 2570120770, ; 174: System.Text.Encodings.Web => 0x9930ee42 => 128
	i32 2585220780, ; 175: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 126
	i32 2593496499, ; 176: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 177: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 84
	i32 2617129537, ; 178: System.Private.Xml.dll => 0x9bfe3a41 => 112
	i32 2620871830, ; 179: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 63
	i32 2626831493, ; 180: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 181: System.Runtime.Loader => 0x9ec4cf01 => 120
	i32 2664396074, ; 182: System.Xml.XDocument.dll => 0x9ecf752a => 136
	i32 2665622720, ; 183: System.Drawing.Primitives => 0x9ee22cc0 => 98
	i32 2676780864, ; 184: System.Data.Common.dll => 0x9f8c6f40 => 95
	i32 2715334215, ; 185: System.Threading.Tasks.dll => 0xa1d8b647 => 131
	i32 2724373263, ; 186: System.Runtime.Numerics.dll => 0xa262a30f => 121
	i32 2732626843, ; 187: Xamarin.AndroidX.Activity => 0xa2e0939b => 56
	i32 2737747696, ; 188: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 58
	i32 2752995522, ; 189: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 190: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 48
	i32 2764765095, ; 191: Microsoft.Maui.dll => 0xa4caf7a7 => 49
	i32 2778768386, ; 192: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 80
	i32 2785988530, ; 193: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 194: Microsoft.Maui.Graphics => 0xa7008e0b => 51
	i32 2806116107, ; 195: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 196: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 61
	i32 2831556043, ; 197: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 198: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 80
	i32 2861189240, ; 199: Microsoft.Maui.Essentials => 0xaa8a4878 => 50
	i32 2901442782, ; 200: System.Reflection => 0xacf080de => 117
	i32 2905242038, ; 201: mscorlib.dll => 0xad2a79b6 => 138
	i32 2909740682, ; 202: System.Private.CoreLib => 0xad6f1e8a => 140
	i32 2916838712, ; 203: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 81
	i32 2919462931, ; 204: System.Numerics.Vectors.dll => 0xae037813 => 108
	i32 2959614098, ; 205: System.ComponentModel.dll => 0xb0682092 => 93
	i32 2978675010, ; 206: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 65
	i32 2987532451, ; 207: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 78
	i32 3038032645, ; 208: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 209: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 72
	i32 3059408633, ; 210: Mono.Android.Runtime => 0xb65adef9 => 142
	i32 3059793426, ; 211: System.ComponentModel.Primitives => 0xb660be12 => 91
	i32 3075834255, ; 212: System.Threading.Tasks => 0xb755818f => 131
	i32 3077302341, ; 213: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3115364679, ; 214: ESP32pH => 0xb9b0b147 => 85
	i32 3159123045, ; 215: System.Reflection.Primitives.dll => 0xbc4c6465 => 116
	i32 3178803400, ; 216: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 73
	i32 3220365878, ; 217: System.Threading => 0xbff2e236 => 133
	i32 3258312781, ; 218: Xamarin.AndroidX.CardView => 0xc235e84d => 59
	i32 3299363146, ; 219: System.Text.Encoding => 0xc4a8494a => 127
	i32 3305363605, ; 220: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 221: System.Net.Requests.dll => 0xc5b097e4 => 107
	i32 3317135071, ; 222: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 64
	i32 3322403133, ; 223: Firebase.dll => 0xc607d93d => 37
	i32 3346324047, ; 224: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 74
	i32 3357674450, ; 225: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3358260929, ; 226: System.Text.Json => 0xc82afec1 => 129
	i32 3362522851, ; 227: Xamarin.AndroidX.Core => 0xc86c06e3 => 62
	i32 3366347497, ; 228: Java.Interop => 0xc8a662e9 => 141
	i32 3374999561, ; 229: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 76
	i32 3381016424, ; 230: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 231: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 41
	i32 3430777524, ; 232: netstandard => 0xcc7d82b4 => 139
	i32 3463511458, ; 233: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 234: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 92
	i32 3476120550, ; 235: Mono.Android => 0xcf3163e6 => 143
	i32 3479583265, ; 236: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 237: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3485117614, ; 238: System.Text.Json.dll => 0xcfbaacae => 129
	i32 3509114376, ; 239: System.Xml.Linq => 0xd128d608 => 134
	i32 3580758918, ; 240: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3596207933, ; 241: LiteDB.dll => 0xd659c73d => 38
	i32 3608519521, ; 242: System.Linq.dll => 0xd715a361 => 103
	i32 3629588173, ; 243: LiteDB => 0xd8571ecd => 38
	i32 3641597786, ; 244: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 68
	i32 3643446276, ; 245: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 246: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 73
	i32 3657292374, ; 247: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 40
	i32 3672681054, ; 248: Mono.Android.dll => 0xdae8aa5e => 143
	i32 3697841164, ; 249: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 250: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 72
	i32 3731644420, ; 251: System.Reactive => 0xde6c6004 => 55
	i32 3748608112, ; 252: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 54
	i32 3786282454, ; 253: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 60
	i32 3792276235, ; 254: System.Collections.NonGeneric => 0xe2098b0b => 88
	i32 3802395368, ; 255: System.Collections.Specialized.dll => 0xe2a3f2e8 => 89
	i32 3823082795, ; 256: System.Security.Cryptography.dll => 0xe3df9d2b => 125
	i32 3841636137, ; 257: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 42
	i32 3849253459, ; 258: System.Runtime.InteropServices.dll => 0xe56ef253 => 119
	i32 3889960447, ; 259: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 260: System.Collections.Concurrent.dll => 0xe839deed => 87
	i32 3896760992, ; 261: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 62
	i32 3928044579, ; 262: System.Xml.ReaderWriter => 0xea213423 => 135
	i32 3931092270, ; 263: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 75
	i32 3955647286, ; 264: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 57
	i32 3980434154, ; 265: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 266: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4024013275, ; 267: Firebase.Auth => 0xefd991db => 36
	i32 4025784931, ; 268: System.Memory => 0xeff49a63 => 104
	i32 4046471985, ; 269: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 48
	i32 4054681211, ; 270: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 113
	i32 4068434129, ; 271: System.Private.Xml.Linq.dll => 0xf27f60d1 => 111
	i32 4073602200, ; 272: System.Threading.dll => 0xf2ce3c98 => 133
	i32 4094352644, ; 273: Microsoft.Maui.Essentials.dll => 0xf40add04 => 50
	i32 4099507663, ; 274: System.Drawing.dll => 0xf45985cf => 99
	i32 4100113165, ; 275: System.Private.Uri => 0xf462c30d => 110
	i32 4102112229, ; 276: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 277: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 278: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 41
	i32 4147896353, ; 279: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 113
	i32 4150914736, ; 280: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 281: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 123
	i32 4182413190, ; 282: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 70
	i32 4213026141, ; 283: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 54
	i32 4271975918, ; 284: Microsoft.Maui.Controls.dll => 0xfea12dee => 47
	i32 4274623895, ; 285: CommunityToolkit.Mvvm.dll => 0xfec99597 => 35
	i32 4274976490, ; 286: System.Runtime.Numerics => 0xfecef6ea => 121
	i32 4292120959 ; 287: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 70
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [288 x i32] [
	i32 53, ; 0
	i32 132, ; 1
	i32 33, ; 2
	i32 51, ; 3
	i32 119, ; 4
	i32 60, ; 5
	i32 79, ; 6
	i32 30, ; 7
	i32 31, ; 8
	i32 93, ; 9
	i32 96, ; 10
	i32 86, ; 11
	i32 114, ; 12
	i32 2, ; 13
	i32 30, ; 14
	i32 56, ; 15
	i32 15, ; 16
	i32 67, ; 17
	i32 14, ; 18
	i32 132, ; 19
	i32 104, ; 20
	i32 37, ; 21
	i32 34, ; 22
	i32 26, ; 23
	i32 90, ; 24
	i32 66, ; 25
	i32 123, ; 26
	i32 138, ; 27
	i32 137, ; 28
	i32 109, ; 29
	i32 13, ; 30
	i32 7, ; 31
	i32 46, ; 32
	i32 43, ; 33
	i32 52, ; 34
	i32 21, ; 35
	i32 55, ; 36
	i32 64, ; 37
	i32 19, ; 38
	i32 128, ; 39
	i32 87, ; 40
	i32 1, ; 41
	i32 134, ; 42
	i32 16, ; 43
	i32 4, ; 44
	i32 120, ; 45
	i32 107, ; 46
	i32 101, ; 47
	i32 25, ; 48
	i32 45, ; 49
	i32 95, ; 50
	i32 110, ; 51
	i32 100, ; 52
	i32 91, ; 53
	i32 28, ; 54
	i32 53, ; 55
	i32 67, ; 56
	i32 136, ; 57
	i32 90, ; 58
	i32 77, ; 59
	i32 99, ; 60
	i32 42, ; 61
	i32 3, ; 62
	i32 57, ; 63
	i32 98, ; 64
	i32 102, ; 65
	i32 69, ; 66
	i32 92, ; 67
	i32 83, ; 68
	i32 137, ; 69
	i32 16, ; 70
	i32 22, ; 71
	i32 74, ; 72
	i32 20, ; 73
	i32 35, ; 74
	i32 18, ; 75
	i32 2, ; 76
	i32 65, ; 77
	i32 103, ; 78
	i32 32, ; 79
	i32 77, ; 80
	i32 118, ; 81
	i32 61, ; 82
	i32 122, ; 83
	i32 0, ; 84
	i32 6, ; 85
	i32 101, ; 86
	i32 58, ; 87
	i32 46, ; 88
	i32 100, ; 89
	i32 10, ; 90
	i32 5, ; 91
	i32 130, ; 92
	i32 115, ; 93
	i32 25, ; 94
	i32 71, ; 95
	i32 81, ; 96
	i32 63, ; 97
	i32 105, ; 98
	i32 130, ; 99
	i32 124, ; 100
	i32 82, ; 101
	i32 106, ; 102
	i32 125, ; 103
	i32 96, ; 104
	i32 117, ; 105
	i32 59, ; 106
	i32 23, ; 107
	i32 1, ; 108
	i32 97, ; 109
	i32 115, ; 110
	i32 79, ; 111
	i32 43, ; 112
	i32 142, ; 113
	i32 17, ; 114
	i32 66, ; 115
	i32 9, ; 116
	i32 71, ; 117
	i32 83, ; 118
	i32 82, ; 119
	i32 75, ; 120
	i32 126, ; 121
	i32 122, ; 122
	i32 44, ; 123
	i32 29, ; 124
	i32 26, ; 125
	i32 102, ; 126
	i32 116, ; 127
	i32 8, ; 128
	i32 118, ; 129
	i32 88, ; 130
	i32 111, ; 131
	i32 78, ; 132
	i32 39, ; 133
	i32 5, ; 134
	i32 69, ; 135
	i32 0, ; 136
	i32 112, ; 137
	i32 68, ; 138
	i32 4, ; 139
	i32 97, ; 140
	i32 124, ; 141
	i32 108, ; 142
	i32 52, ; 143
	i32 94, ; 144
	i32 89, ; 145
	i32 49, ; 146
	i32 12, ; 147
	i32 45, ; 148
	i32 44, ; 149
	i32 109, ; 150
	i32 84, ; 151
	i32 105, ; 152
	i32 14, ; 153
	i32 36, ; 154
	i32 40, ; 155
	i32 8, ; 156
	i32 76, ; 157
	i32 18, ; 158
	i32 140, ; 159
	i32 106, ; 160
	i32 135, ; 161
	i32 39, ; 162
	i32 13, ; 163
	i32 10, ; 164
	i32 85, ; 165
	i32 94, ; 166
	i32 127, ; 167
	i32 139, ; 168
	i32 141, ; 169
	i32 47, ; 170
	i32 114, ; 171
	i32 11, ; 172
	i32 86, ; 173
	i32 128, ; 174
	i32 126, ; 175
	i32 20, ; 176
	i32 84, ; 177
	i32 112, ; 178
	i32 63, ; 179
	i32 15, ; 180
	i32 120, ; 181
	i32 136, ; 182
	i32 98, ; 183
	i32 95, ; 184
	i32 131, ; 185
	i32 121, ; 186
	i32 56, ; 187
	i32 58, ; 188
	i32 21, ; 189
	i32 48, ; 190
	i32 49, ; 191
	i32 80, ; 192
	i32 27, ; 193
	i32 51, ; 194
	i32 6, ; 195
	i32 61, ; 196
	i32 19, ; 197
	i32 80, ; 198
	i32 50, ; 199
	i32 117, ; 200
	i32 138, ; 201
	i32 140, ; 202
	i32 81, ; 203
	i32 108, ; 204
	i32 93, ; 205
	i32 65, ; 206
	i32 78, ; 207
	i32 34, ; 208
	i32 72, ; 209
	i32 142, ; 210
	i32 91, ; 211
	i32 131, ; 212
	i32 12, ; 213
	i32 85, ; 214
	i32 116, ; 215
	i32 73, ; 216
	i32 133, ; 217
	i32 59, ; 218
	i32 127, ; 219
	i32 7, ; 220
	i32 107, ; 221
	i32 64, ; 222
	i32 37, ; 223
	i32 74, ; 224
	i32 24, ; 225
	i32 129, ; 226
	i32 62, ; 227
	i32 141, ; 228
	i32 76, ; 229
	i32 3, ; 230
	i32 41, ; 231
	i32 139, ; 232
	i32 11, ; 233
	i32 92, ; 234
	i32 143, ; 235
	i32 24, ; 236
	i32 23, ; 237
	i32 129, ; 238
	i32 134, ; 239
	i32 31, ; 240
	i32 38, ; 241
	i32 103, ; 242
	i32 38, ; 243
	i32 68, ; 244
	i32 28, ; 245
	i32 73, ; 246
	i32 40, ; 247
	i32 143, ; 248
	i32 33, ; 249
	i32 72, ; 250
	i32 55, ; 251
	i32 54, ; 252
	i32 60, ; 253
	i32 88, ; 254
	i32 89, ; 255
	i32 125, ; 256
	i32 42, ; 257
	i32 119, ; 258
	i32 32, ; 259
	i32 87, ; 260
	i32 62, ; 261
	i32 135, ; 262
	i32 75, ; 263
	i32 57, ; 264
	i32 27, ; 265
	i32 9, ; 266
	i32 36, ; 267
	i32 104, ; 268
	i32 48, ; 269
	i32 113, ; 270
	i32 111, ; 271
	i32 133, ; 272
	i32 50, ; 273
	i32 99, ; 274
	i32 110, ; 275
	i32 22, ; 276
	i32 17, ; 277
	i32 41, ; 278
	i32 113, ; 279
	i32 29, ; 280
	i32 123, ; 281
	i32 70, ; 282
	i32 54, ; 283
	i32 47, ; 284
	i32 35, ; 285
	i32 121, ; 286
	i32 70 ; 287
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

; Function attributes: "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" uwtable willreturn
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

; Function attributes: "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8"
declare void @abort() local_unnamed_addr #2

; Function attributes: nofree nounwind
declare noundef i32 @puts(ptr noundef) local_unnamed_addr #1
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+armv7-a,+d32,+dsp,+fp64,+neon,+vfp2,+vfp2sp,+vfp3,+vfp3d16,+vfp3d16sp,+vfp3sp,-aes,-fp-armv8,-fp-armv8d16,-fp-armv8d16sp,-fp-armv8sp,-fp16,-fp16fml,-fullfp16,-sha2,-thumb-mode,-vfp4,-vfp4d16,-vfp4d16sp,-vfp4sp" }

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
