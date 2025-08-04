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

@assembly_image_cache = dso_local local_unnamed_addr global [138 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [276 x i32] [
	i32 39109920, ; 0: Newtonsoft.Json.dll => 0x254c520 => 51
	i32 42639949, ; 1: System.Threading.Thread => 0x28aa24d => 127
	i32 67008169, ; 2: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 33
	i32 72070932, ; 3: Microsoft.Maui.Graphics.dll => 0x44bb714 => 49
	i32 117431740, ; 4: System.Runtime.InteropServices => 0x6ffddbc => 116
	i32 165246403, ; 5: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 57
	i32 182336117, ; 6: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 76
	i32 195452805, ; 7: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 30
	i32 199333315, ; 8: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 31
	i32 205061960, ; 9: System.ComponentModel => 0xc38ff48 => 90
	i32 220171995, ; 10: System.Diagnostics.Debug => 0xd1f8edb => 93
	i32 230752869, ; 11: Microsoft.CSharp.dll => 0xdc10265 => 83
	i32 246610117, ; 12: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 111
	i32 280992041, ; 13: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 2
	i32 317674968, ; 14: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 30
	i32 318968648, ; 15: Xamarin.AndroidX.Activity.dll => 0x13031348 => 53
	i32 336156722, ; 16: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 15
	i32 342366114, ; 17: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 64
	i32 356389973, ; 18: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 14
	i32 379916513, ; 19: System.Threading.Thread.dll => 0x16a510e1 => 127
	i32 385762202, ; 20: System.Memory.dll => 0x16fe439a => 101
	i32 395744057, ; 21: _Microsoft.Android.Resource.Designer => 0x17969339 => 34
	i32 435591531, ; 22: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 26
	i32 442565967, ; 23: System.Collections => 0x1a61054f => 87
	i32 450948140, ; 24: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 63
	i32 459347974, ; 25: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 120
	i32 465846621, ; 26: mscorlib => 0x1bc4415d => 133
	i32 469710990, ; 27: System.dll => 0x1bff388e => 132
	i32 498788369, ; 28: System.ObjectModel => 0x1dbae811 => 106
	i32 500358224, ; 29: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 13
	i32 503918385, ; 30: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 7
	i32 513247710, ; 31: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 44
	i32 539058512, ; 32: Microsoft.Extensions.Logging => 0x20216150 => 41
	i32 562488221, ; 33: System.ServiceModel => 0x2186e39d => 50
	i32 592146354, ; 34: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 21
	i32 627609679, ; 35: Xamarin.AndroidX.CustomView => 0x2568904f => 61
	i32 627931235, ; 36: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 19
	i32 672442732, ; 37: System.Collections.Concurrent => 0x2814a96c => 84
	i32 688181140, ; 38: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 1
	i32 690569205, ; 39: System.Xml.Linq.dll => 0x29293ff5 => 129
	i32 706645707, ; 40: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 16
	i32 709557578, ; 41: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 4
	i32 722857257, ; 42: System.Runtime.Loader.dll => 0x2b15ed29 => 117
	i32 759454413, ; 43: System.Net.Requests => 0x2d445acd => 104
	i32 775507847, ; 44: System.IO.Compression => 0x2e394f87 => 98
	i32 777317022, ; 45: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 25
	i32 789151979, ; 46: Microsoft.Extensions.Options => 0x2f0980eb => 43
	i32 804715423, ; 47: System.Data.Common => 0x2ff6fb9f => 92
	i32 823281589, ; 48: System.Private.Uri.dll => 0x311247b5 => 107
	i32 830298997, ; 49: System.IO.Compression.Brotli => 0x317d5b75 => 97
	i32 904024072, ; 50: System.ComponentModel.Primitives.dll => 0x35e25008 => 88
	i32 926902833, ; 51: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 28
	i32 955402788, ; 52: Newtonsoft.Json => 0x38f24a24 => 51
	i32 967690846, ; 53: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 64
	i32 975874589, ; 54: System.Xml.XDocument => 0x3a2aaa1d => 131
	i32 992768348, ; 55: System.Collections.dll => 0x3b2c715c => 87
	i32 1012816738, ; 56: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 74
	i32 1019214401, ; 57: System.Drawing => 0x3cbffa41 => 96
	i32 1028951442, ; 58: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 40
	i32 1029334545, ; 59: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 3
	i32 1035644815, ; 60: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 54
	i32 1036536393, ; 61: System.Drawing.Primitives.dll => 0x3dc84a49 => 95
	i32 1044663988, ; 62: System.Linq.Expressions.dll => 0x3e444eb4 => 99
	i32 1052210849, ; 63: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 66
	i32 1082857460, ; 64: System.ComponentModel.TypeConverter => 0x408b17f4 => 89
	i32 1084122840, ; 65: Xamarin.Kotlin.StdLib => 0x409e66d8 => 80
	i32 1098259244, ; 66: System => 0x41761b2c => 132
	i32 1118262833, ; 67: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 16
	i32 1168523401, ; 68: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 22
	i32 1178241025, ; 69: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 71
	i32 1203215381, ; 70: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 20
	i32 1214827643, ; 71: CommunityToolkit.Mvvm => 0x4868cc7b => 35
	i32 1234928153, ; 72: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 18
	i32 1260983243, ; 73: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 2
	i32 1293217323, ; 74: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 62
	i32 1324164729, ; 75: System.Linq => 0x4eed2679 => 100
	i32 1373134921, ; 76: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 32
	i32 1376866003, ; 77: Xamarin.AndroidX.SavedState => 0x52114ed3 => 74
	i32 1379779777, ; 78: System.Resources.ResourceManager => 0x523dc4c1 => 115
	i32 1406073936, ; 79: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 58
	i32 1408764838, ; 80: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 119
	i32 1430672901, ; 81: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 0
	i32 1461004990, ; 82: es\Microsoft.Maui.Controls.resources => 0x57152abe => 6
	i32 1462112819, ; 83: System.IO.Compression.dll => 0x57261233 => 98
	i32 1469204771, ; 84: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 55
	i32 1470490898, ; 85: Microsoft.Extensions.Primitives => 0x57a5e912 => 44
	i32 1480492111, ; 86: System.IO.Compression.Brotli.dll => 0x583e844f => 97
	i32 1493001747, ; 87: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 10
	i32 1514721132, ; 88: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 5
	i32 1543031311, ; 89: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 125
	i32 1550322496, ; 90: System.Reflection.Extensions.dll => 0x5c680b40 => 112
	i32 1551623176, ; 91: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 25
	i32 1622152042, ; 92: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 68
	i32 1624863272, ; 93: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 78
	i32 1636350590, ; 94: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 60
	i32 1639515021, ; 95: System.Net.Http.dll => 0x61b9038d => 102
	i32 1639986890, ; 96: System.Text.RegularExpressions => 0x61c036ca => 125
	i32 1657153582, ; 97: System.Runtime => 0x62c6282e => 121
	i32 1658251792, ; 98: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 79
	i32 1677501392, ; 99: System.Net.Primitives.dll => 0x63fca3d0 => 103
	i32 1679769178, ; 100: System.Security.Cryptography => 0x641f3e5a => 122
	i32 1701541528, ; 101: System.Diagnostics.Debug.dll => 0x656b7698 => 93
	i32 1726116996, ; 102: System.Reflection.dll => 0x66e27484 => 114
	i32 1729485958, ; 103: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 56
	i32 1736233607, ; 104: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 23
	i32 1743415430, ; 105: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 1
	i32 1763938596, ; 106: System.Diagnostics.TraceSource.dll => 0x69239124 => 94
	i32 1765942094, ; 107: System.Reflection.Extensions => 0x6942234e => 112
	i32 1766324549, ; 108: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 76
	i32 1770582343, ; 109: Microsoft.Extensions.Logging.dll => 0x6988f147 => 41
	i32 1780572499, ; 110: Mono.Android.Runtime.dll => 0x6a216153 => 136
	i32 1782862114, ; 111: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 17
	i32 1788241197, ; 112: Xamarin.AndroidX.Fragment => 0x6a96652d => 63
	i32 1793755602, ; 113: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 9
	i32 1808609942, ; 114: Xamarin.AndroidX.Loader => 0x6bcd3296 => 68
	i32 1813058853, ; 115: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 80
	i32 1813201214, ; 116: Xamarin.Google.Android.Material => 0x6c13413e => 79
	i32 1818569960, ; 117: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 72
	i32 1824175904, ; 118: System.Text.Encoding.Extensions => 0x6cbab720 => 123
	i32 1824722060, ; 119: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 119
	i32 1828688058, ; 120: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 42
	i32 1842015223, ; 121: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 29
	i32 1853025655, ; 122: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 26
	i32 1858542181, ; 123: System.Linq.Expressions => 0x6ec71a65 => 99
	i32 1870277092, ; 124: System.Reflection.Primitives => 0x6f7a29e4 => 113
	i32 1875935024, ; 125: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 8
	i32 1900610850, ; 126: System.Resources.ResourceManager.dll => 0x71490522 => 115
	i32 1910275211, ; 127: System.Collections.NonGeneric.dll => 0x71dc7c8b => 85
	i32 1939592360, ; 128: System.Private.Xml.Linq => 0x739bd4a8 => 108
	i32 1961813231, ; 129: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 75
	i32 1968388702, ; 130: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 37
	i32 2003115576, ; 131: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 5
	i32 2019465201, ; 132: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 66
	i32 2025202353, ; 133: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 0
	i32 2045470958, ; 134: System.Private.Xml => 0x79eb68ee => 109
	i32 2055257422, ; 135: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 65
	i32 2066184531, ; 136: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 4
	i32 2070888862, ; 137: System.Diagnostics.TraceSource => 0x7b6f419e => 94
	i32 2079903147, ; 138: System.Runtime.dll => 0x7bf8cdab => 121
	i32 2090596640, ; 139: System.Numerics.Vectors => 0x7c9bf920 => 105
	i32 2092919810, ; 140: System.ServiceModel.dll => 0x7cbf6c02 => 50
	i32 2127167465, ; 141: System.Console => 0x7ec9ffe9 => 91
	i32 2142473426, ; 142: System.Collections.Specialized => 0x7fb38cd2 => 86
	i32 2159891885, ; 143: Microsoft.Maui => 0x80bd55ad => 47
	i32 2169148018, ; 144: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 12
	i32 2181898931, ; 145: Microsoft.Extensions.Options.dll => 0x820d22b3 => 43
	i32 2192057212, ; 146: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 42
	i32 2193016926, ; 147: System.ObjectModel.dll => 0x82b6c85e => 106
	i32 2201107256, ; 148: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 81
	i32 2201231467, ; 149: System.Net.Http => 0x8334206b => 102
	i32 2207618523, ; 150: it\Microsoft.Maui.Controls.resources => 0x839595db => 14
	i32 2216717168, ; 151: Firebase.Auth.dll => 0x84206b70 => 36
	i32 2266799131, ; 152: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 38
	i32 2270573516, ; 153: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 8
	i32 2279755925, ; 154: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 73
	i32 2303942373, ; 155: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 18
	i32 2305521784, ; 156: System.Private.CoreLib.dll => 0x896b7878 => 134
	i32 2353062107, ; 157: System.Net.Primitives => 0x8c40e0db => 103
	i32 2368005991, ; 158: System.Xml.ReaderWriter.dll => 0x8d24e767 => 130
	i32 2371007202, ; 159: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 37
	i32 2395872292, ; 160: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 13
	i32 2427813419, ; 161: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 10
	i32 2428407029, ; 162: ESP32pH.dll => 0x90be8cf5 => 82
	i32 2435356389, ; 163: System.Console.dll => 0x912896e5 => 91
	i32 2454642406, ; 164: System.Text.Encoding.dll => 0x924edee6 => 124
	i32 2475788418, ; 165: Java.Interop.dll => 0x93918882 => 135
	i32 2480646305, ; 166: Microsoft.Maui.Controls => 0x93dba8a1 => 45
	i32 2538310050, ; 167: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 111
	i32 2550873716, ; 168: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 11
	i32 2562349572, ; 169: Microsoft.CSharp => 0x98ba5a04 => 83
	i32 2585220780, ; 170: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 123
	i32 2593496499, ; 171: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 20
	i32 2605712449, ; 172: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 81
	i32 2617129537, ; 173: System.Private.Xml.dll => 0x9bfe3a41 => 109
	i32 2620871830, ; 174: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 60
	i32 2626831493, ; 175: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 15
	i32 2663698177, ; 176: System.Runtime.Loader => 0x9ec4cf01 => 117
	i32 2664396074, ; 177: System.Xml.XDocument.dll => 0x9ecf752a => 131
	i32 2665622720, ; 178: System.Drawing.Primitives => 0x9ee22cc0 => 95
	i32 2676780864, ; 179: System.Data.Common.dll => 0x9f8c6f40 => 92
	i32 2715334215, ; 180: System.Threading.Tasks.dll => 0xa1d8b647 => 126
	i32 2724373263, ; 181: System.Runtime.Numerics.dll => 0xa262a30f => 118
	i32 2732626843, ; 182: Xamarin.AndroidX.Activity => 0xa2e0939b => 53
	i32 2737747696, ; 183: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 55
	i32 2752995522, ; 184: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 21
	i32 2758225723, ; 185: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 46
	i32 2764765095, ; 186: Microsoft.Maui.dll => 0xa4caf7a7 => 47
	i32 2778768386, ; 187: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 77
	i32 2785988530, ; 188: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 27
	i32 2801831435, ; 189: Microsoft.Maui.Graphics => 0xa7008e0b => 49
	i32 2806116107, ; 190: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 6
	i32 2810250172, ; 191: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 58
	i32 2831556043, ; 192: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 19
	i32 2853208004, ; 193: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 77
	i32 2861189240, ; 194: Microsoft.Maui.Essentials => 0xaa8a4878 => 48
	i32 2901442782, ; 195: System.Reflection => 0xacf080de => 114
	i32 2905242038, ; 196: mscorlib.dll => 0xad2a79b6 => 133
	i32 2909740682, ; 197: System.Private.CoreLib => 0xad6f1e8a => 134
	i32 2916838712, ; 198: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 78
	i32 2919462931, ; 199: System.Numerics.Vectors.dll => 0xae037813 => 105
	i32 2959614098, ; 200: System.ComponentModel.dll => 0xb0682092 => 90
	i32 2978675010, ; 201: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 62
	i32 2987532451, ; 202: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 75
	i32 3038032645, ; 203: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 34
	i32 3057625584, ; 204: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 69
	i32 3059408633, ; 205: Mono.Android.Runtime => 0xb65adef9 => 136
	i32 3059793426, ; 206: System.ComponentModel.Primitives => 0xb660be12 => 88
	i32 3075834255, ; 207: System.Threading.Tasks => 0xb755818f => 126
	i32 3077302341, ; 208: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 12
	i32 3115364679, ; 209: ESP32pH => 0xb9b0b147 => 82
	i32 3159123045, ; 210: System.Reflection.Primitives.dll => 0xbc4c6465 => 113
	i32 3178803400, ; 211: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 70
	i32 3220365878, ; 212: System.Threading => 0xbff2e236 => 128
	i32 3258312781, ; 213: Xamarin.AndroidX.CardView => 0xc235e84d => 56
	i32 3299363146, ; 214: System.Text.Encoding => 0xc4a8494a => 124
	i32 3305363605, ; 215: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 7
	i32 3316684772, ; 216: System.Net.Requests.dll => 0xc5b097e4 => 104
	i32 3317135071, ; 217: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 61
	i32 3346324047, ; 218: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 71
	i32 3357674450, ; 219: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 24
	i32 3362522851, ; 220: Xamarin.AndroidX.Core => 0xc86c06e3 => 59
	i32 3366347497, ; 221: Java.Interop => 0xc8a662e9 => 135
	i32 3374999561, ; 222: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 73
	i32 3381016424, ; 223: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 3
	i32 3428513518, ; 224: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 39
	i32 3463511458, ; 225: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 11
	i32 3471940407, ; 226: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 89
	i32 3476120550, ; 227: Mono.Android => 0xcf3163e6 => 137
	i32 3479583265, ; 228: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 24
	i32 3484440000, ; 229: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 23
	i32 3509114376, ; 230: System.Xml.Linq => 0xd128d608 => 129
	i32 3580758918, ; 231: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 31
	i32 3608519521, ; 232: System.Linq.dll => 0xd715a361 => 100
	i32 3641597786, ; 233: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 65
	i32 3643446276, ; 234: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 28
	i32 3643854240, ; 235: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 70
	i32 3657292374, ; 236: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 38
	i32 3672681054, ; 237: Mono.Android.dll => 0xdae8aa5e => 137
	i32 3697841164, ; 238: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 33
	i32 3724971120, ; 239: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 69
	i32 3748608112, ; 240: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 52
	i32 3786282454, ; 241: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 57
	i32 3792276235, ; 242: System.Collections.NonGeneric => 0xe2098b0b => 85
	i32 3802395368, ; 243: System.Collections.Specialized.dll => 0xe2a3f2e8 => 86
	i32 3823082795, ; 244: System.Security.Cryptography.dll => 0xe3df9d2b => 122
	i32 3841636137, ; 245: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 40
	i32 3849253459, ; 246: System.Runtime.InteropServices.dll => 0xe56ef253 => 116
	i32 3889960447, ; 247: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 32
	i32 3896106733, ; 248: System.Collections.Concurrent.dll => 0xe839deed => 84
	i32 3896760992, ; 249: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 59
	i32 3928044579, ; 250: System.Xml.ReaderWriter => 0xea213423 => 130
	i32 3931092270, ; 251: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 72
	i32 3955647286, ; 252: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 54
	i32 3980434154, ; 253: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 27
	i32 3987592930, ; 254: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 9
	i32 4024013275, ; 255: Firebase.Auth => 0xefd991db => 36
	i32 4025784931, ; 256: System.Memory => 0xeff49a63 => 101
	i32 4046471985, ; 257: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 46
	i32 4054681211, ; 258: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 110
	i32 4068434129, ; 259: System.Private.Xml.Linq.dll => 0xf27f60d1 => 108
	i32 4073602200, ; 260: System.Threading.dll => 0xf2ce3c98 => 128
	i32 4094352644, ; 261: Microsoft.Maui.Essentials.dll => 0xf40add04 => 48
	i32 4099507663, ; 262: System.Drawing.dll => 0xf45985cf => 96
	i32 4100113165, ; 263: System.Private.Uri => 0xf462c30d => 107
	i32 4102112229, ; 264: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 22
	i32 4125707920, ; 265: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 17
	i32 4126470640, ; 266: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 39
	i32 4147896353, ; 267: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 110
	i32 4150914736, ; 268: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 29
	i32 4181436372, ; 269: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 120
	i32 4182413190, ; 270: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 67
	i32 4213026141, ; 271: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 52
	i32 4271975918, ; 272: Microsoft.Maui.Controls.dll => 0xfea12dee => 45
	i32 4274623895, ; 273: CommunityToolkit.Mvvm.dll => 0xfec99597 => 35
	i32 4274976490, ; 274: System.Runtime.Numerics => 0xfecef6ea => 118
	i32 4292120959 ; 275: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 67
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [276 x i32] [
	i32 51, ; 0
	i32 127, ; 1
	i32 33, ; 2
	i32 49, ; 3
	i32 116, ; 4
	i32 57, ; 5
	i32 76, ; 6
	i32 30, ; 7
	i32 31, ; 8
	i32 90, ; 9
	i32 93, ; 10
	i32 83, ; 11
	i32 111, ; 12
	i32 2, ; 13
	i32 30, ; 14
	i32 53, ; 15
	i32 15, ; 16
	i32 64, ; 17
	i32 14, ; 18
	i32 127, ; 19
	i32 101, ; 20
	i32 34, ; 21
	i32 26, ; 22
	i32 87, ; 23
	i32 63, ; 24
	i32 120, ; 25
	i32 133, ; 26
	i32 132, ; 27
	i32 106, ; 28
	i32 13, ; 29
	i32 7, ; 30
	i32 44, ; 31
	i32 41, ; 32
	i32 50, ; 33
	i32 21, ; 34
	i32 61, ; 35
	i32 19, ; 36
	i32 84, ; 37
	i32 1, ; 38
	i32 129, ; 39
	i32 16, ; 40
	i32 4, ; 41
	i32 117, ; 42
	i32 104, ; 43
	i32 98, ; 44
	i32 25, ; 45
	i32 43, ; 46
	i32 92, ; 47
	i32 107, ; 48
	i32 97, ; 49
	i32 88, ; 50
	i32 28, ; 51
	i32 51, ; 52
	i32 64, ; 53
	i32 131, ; 54
	i32 87, ; 55
	i32 74, ; 56
	i32 96, ; 57
	i32 40, ; 58
	i32 3, ; 59
	i32 54, ; 60
	i32 95, ; 61
	i32 99, ; 62
	i32 66, ; 63
	i32 89, ; 64
	i32 80, ; 65
	i32 132, ; 66
	i32 16, ; 67
	i32 22, ; 68
	i32 71, ; 69
	i32 20, ; 70
	i32 35, ; 71
	i32 18, ; 72
	i32 2, ; 73
	i32 62, ; 74
	i32 100, ; 75
	i32 32, ; 76
	i32 74, ; 77
	i32 115, ; 78
	i32 58, ; 79
	i32 119, ; 80
	i32 0, ; 81
	i32 6, ; 82
	i32 98, ; 83
	i32 55, ; 84
	i32 44, ; 85
	i32 97, ; 86
	i32 10, ; 87
	i32 5, ; 88
	i32 125, ; 89
	i32 112, ; 90
	i32 25, ; 91
	i32 68, ; 92
	i32 78, ; 93
	i32 60, ; 94
	i32 102, ; 95
	i32 125, ; 96
	i32 121, ; 97
	i32 79, ; 98
	i32 103, ; 99
	i32 122, ; 100
	i32 93, ; 101
	i32 114, ; 102
	i32 56, ; 103
	i32 23, ; 104
	i32 1, ; 105
	i32 94, ; 106
	i32 112, ; 107
	i32 76, ; 108
	i32 41, ; 109
	i32 136, ; 110
	i32 17, ; 111
	i32 63, ; 112
	i32 9, ; 113
	i32 68, ; 114
	i32 80, ; 115
	i32 79, ; 116
	i32 72, ; 117
	i32 123, ; 118
	i32 119, ; 119
	i32 42, ; 120
	i32 29, ; 121
	i32 26, ; 122
	i32 99, ; 123
	i32 113, ; 124
	i32 8, ; 125
	i32 115, ; 126
	i32 85, ; 127
	i32 108, ; 128
	i32 75, ; 129
	i32 37, ; 130
	i32 5, ; 131
	i32 66, ; 132
	i32 0, ; 133
	i32 109, ; 134
	i32 65, ; 135
	i32 4, ; 136
	i32 94, ; 137
	i32 121, ; 138
	i32 105, ; 139
	i32 50, ; 140
	i32 91, ; 141
	i32 86, ; 142
	i32 47, ; 143
	i32 12, ; 144
	i32 43, ; 145
	i32 42, ; 146
	i32 106, ; 147
	i32 81, ; 148
	i32 102, ; 149
	i32 14, ; 150
	i32 36, ; 151
	i32 38, ; 152
	i32 8, ; 153
	i32 73, ; 154
	i32 18, ; 155
	i32 134, ; 156
	i32 103, ; 157
	i32 130, ; 158
	i32 37, ; 159
	i32 13, ; 160
	i32 10, ; 161
	i32 82, ; 162
	i32 91, ; 163
	i32 124, ; 164
	i32 135, ; 165
	i32 45, ; 166
	i32 111, ; 167
	i32 11, ; 168
	i32 83, ; 169
	i32 123, ; 170
	i32 20, ; 171
	i32 81, ; 172
	i32 109, ; 173
	i32 60, ; 174
	i32 15, ; 175
	i32 117, ; 176
	i32 131, ; 177
	i32 95, ; 178
	i32 92, ; 179
	i32 126, ; 180
	i32 118, ; 181
	i32 53, ; 182
	i32 55, ; 183
	i32 21, ; 184
	i32 46, ; 185
	i32 47, ; 186
	i32 77, ; 187
	i32 27, ; 188
	i32 49, ; 189
	i32 6, ; 190
	i32 58, ; 191
	i32 19, ; 192
	i32 77, ; 193
	i32 48, ; 194
	i32 114, ; 195
	i32 133, ; 196
	i32 134, ; 197
	i32 78, ; 198
	i32 105, ; 199
	i32 90, ; 200
	i32 62, ; 201
	i32 75, ; 202
	i32 34, ; 203
	i32 69, ; 204
	i32 136, ; 205
	i32 88, ; 206
	i32 126, ; 207
	i32 12, ; 208
	i32 82, ; 209
	i32 113, ; 210
	i32 70, ; 211
	i32 128, ; 212
	i32 56, ; 213
	i32 124, ; 214
	i32 7, ; 215
	i32 104, ; 216
	i32 61, ; 217
	i32 71, ; 218
	i32 24, ; 219
	i32 59, ; 220
	i32 135, ; 221
	i32 73, ; 222
	i32 3, ; 223
	i32 39, ; 224
	i32 11, ; 225
	i32 89, ; 226
	i32 137, ; 227
	i32 24, ; 228
	i32 23, ; 229
	i32 129, ; 230
	i32 31, ; 231
	i32 100, ; 232
	i32 65, ; 233
	i32 28, ; 234
	i32 70, ; 235
	i32 38, ; 236
	i32 137, ; 237
	i32 33, ; 238
	i32 69, ; 239
	i32 52, ; 240
	i32 57, ; 241
	i32 85, ; 242
	i32 86, ; 243
	i32 122, ; 244
	i32 40, ; 245
	i32 116, ; 246
	i32 32, ; 247
	i32 84, ; 248
	i32 59, ; 249
	i32 130, ; 250
	i32 72, ; 251
	i32 54, ; 252
	i32 27, ; 253
	i32 9, ; 254
	i32 36, ; 255
	i32 101, ; 256
	i32 46, ; 257
	i32 110, ; 258
	i32 108, ; 259
	i32 128, ; 260
	i32 48, ; 261
	i32 96, ; 262
	i32 107, ; 263
	i32 22, ; 264
	i32 17, ; 265
	i32 39, ; 266
	i32 110, ; 267
	i32 29, ; 268
	i32 120, ; 269
	i32 67, ; 270
	i32 52, ; 271
	i32 45, ; 272
	i32 35, ; 273
	i32 118, ; 274
	i32 67 ; 275
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
