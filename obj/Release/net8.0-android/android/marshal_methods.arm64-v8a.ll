; ModuleID = 'marshal_methods.arm64-v8a.ll'
source_filename = "marshal_methods.arm64-v8a.ll"
target datalayout = "e-m:e-i8:8:32-i16:16:32-i64:64-i128:128-n32:64-S128"
target triple = "aarch64-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [144 x ptr] zeroinitializer, align 8

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [288 x i64] [
	i64 98382396393917666, ; 0: Microsoft.Extensions.Primitives.dll => 0x15d8644ad360ce2 => 46
	i64 120698629574877762, ; 1: Mono.Android => 0x1accec39cafe242 => 143
	i64 131669012237370309, ; 2: Microsoft.Maui.Essentials.dll => 0x1d3c844de55c3c5 => 50
	i64 196720943101637631, ; 3: System.Linq.Expressions.dll => 0x2bae4a7cd73f3ff => 102
	i64 210515253464952879, ; 4: Xamarin.AndroidX.Collection.dll => 0x2ebe681f694702f => 60
	i64 232391251801502327, ; 5: Xamarin.AndroidX.SavedState.dll => 0x3399e9cbc897277 => 77
	i64 435118502366263740, ; 6: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x609d9f8f8bdb9bc => 78
	i64 464346026994987652, ; 7: System.Reactive.dll => 0x671b04057e67284 => 55
	i64 545109961164950392, ; 8: fi/Microsoft.Maui.Controls.resources.dll => 0x7909e9f1ec38b78 => 7
	i64 560278790331054453, ; 9: System.Reflection.Primitives => 0x7c6829760de3975 => 116
	i64 750875890346172408, ; 10: System.Threading.Thread => 0xa6ba5a4da7d1ff8 => 132
	i64 799765834175365804, ; 11: System.ComponentModel.dll => 0xb1956c9f18442ac => 93
	i64 849051935479314978, ; 12: hi/Microsoft.Maui.Controls.resources.dll => 0xbc8703ca21a3a22 => 10
	i64 872800313462103108, ; 13: Xamarin.AndroidX.DrawerLayout => 0xc1ccf42c3c21c44 => 65
	i64 1010599046655515943, ; 14: System.Reflection.Primitives.dll => 0xe065e7a82401d27 => 116
	i64 1120440138749646132, ; 15: Xamarin.Google.Android.Material.dll => 0xf8c9a5eae431534 => 82
	i64 1121665720830085036, ; 16: nb/Microsoft.Maui.Controls.resources.dll => 0xf90f507becf47ac => 18
	i64 1268860745194512059, ; 17: System.Drawing.dll => 0x119be62002c19ebb => 99
	i64 1369545283391376210, ; 18: Xamarin.AndroidX.Navigation.Fragment.dll => 0x13019a2dd85acb52 => 73
	i64 1476839205573959279, ; 19: System.Net.Primitives.dll => 0x147ec96ece9b1e6f => 106
	i64 1486715745332614827, ; 20: Microsoft.Maui.Controls.dll => 0x14a1e017ea87d6ab => 47
	i64 1513467482682125403, ; 21: Mono.Android.Runtime => 0x1500eaa8245f6c5b => 142
	i64 1537168428375924959, ; 22: System.Threading.Thread.dll => 0x15551e8a954ae0df => 132
	i64 1556147632182429976, ; 23: ko/Microsoft.Maui.Controls.resources.dll => 0x15988c06d24c8918 => 16
	i64 1624659445732251991, ; 24: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0x168bf32877da9957 => 58
	i64 1628611045998245443, ; 25: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0x1699fd1e1a00b643 => 70
	i64 1731380447121279447, ; 26: Newtonsoft.Json => 0x18071957e9b889d7 => 53
	i64 1743969030606105336, ; 27: System.Memory.dll => 0x1833d297e88f2af8 => 104
	i64 1767386781656293639, ; 28: System.Private.Uri.dll => 0x188704e9f5582107 => 110
	i64 1795316252682057001, ; 29: Xamarin.AndroidX.AppCompat.dll => 0x18ea3e9eac997529 => 57
	i64 1835311033149317475, ; 30: es\Microsoft.Maui.Controls.resources => 0x197855a927386163 => 6
	i64 1836611346387731153, ; 31: Xamarin.AndroidX.SavedState => 0x197cf449ebe482d1 => 77
	i64 1875417405349196092, ; 32: System.Drawing.Primitives => 0x1a06d2319b6c713c => 98
	i64 1881198190668717030, ; 33: tr\Microsoft.Maui.Controls.resources => 0x1a1b5bc992ea9be6 => 28
	i64 1897575647115118287, ; 34: Xamarin.AndroidX.Security.SecurityCrypto => 0x1a558aff4cba86cf => 78
	i64 1920760634179481754, ; 35: Microsoft.Maui.Controls.Xaml => 0x1aa7e99ec2d2709a => 48
	i64 1930726298510463061, ; 36: CommunityToolkit.Mvvm.dll => 0x1acb5156cd389055 => 35
	i64 1959996714666907089, ; 37: tr/Microsoft.Maui.Controls.resources.dll => 0x1b334ea0a2a755d1 => 28
	i64 1981742497975770890, ; 38: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x1b80904d5c241f0a => 69
	i64 1983698669889758782, ; 39: cs/Microsoft.Maui.Controls.resources.dll => 0x1b87836e2031a63e => 2
	i64 2019660174692588140, ; 40: pl/Microsoft.Maui.Controls.resources.dll => 0x1c07463a6f8e1a6c => 20
	i64 2102659300918482391, ; 41: System.Drawing.Primitives.dll => 0x1d2e257e6aead5d7 => 98
	i64 2133195048986300728, ; 42: Newtonsoft.Json.dll => 0x1d9aa1984b735138 => 53
	i64 2262844636196693701, ; 43: Xamarin.AndroidX.DrawerLayout.dll => 0x1f673d352266e6c5 => 65
	i64 2287834202362508563, ; 44: System.Collections.Concurrent => 0x1fc00515e8ce7513 => 87
	i64 2302323944321350744, ; 45: ru/Microsoft.Maui.Controls.resources.dll => 0x1ff37f6ddb267c58 => 24
	i64 2329709569556905518, ; 46: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x2054ca829b447e2e => 68
	i64 2335503487726329082, ; 47: System.Text.Encodings.Web => 0x2069600c4d9d1cfa => 128
	i64 2470498323731680442, ; 48: Xamarin.AndroidX.CoordinatorLayout => 0x2248f922dc398cba => 61
	i64 2497223385847772520, ; 49: System.Runtime => 0x22a7eb7046413568 => 124
	i64 2547086958574651984, ; 50: Xamarin.AndroidX.Activity.dll => 0x2359121801df4a50 => 56
	i64 2602673633151553063, ; 51: th\Microsoft.Maui.Controls.resources => 0x241e8de13a460e27 => 27
	i64 2624866290265602282, ; 52: mscorlib.dll => 0x246d65fbde2db8ea => 138
	i64 2656907746661064104, ; 53: Microsoft.Extensions.DependencyInjection => 0x24df3b84c8b75da8 => 41
	i64 2662981627730767622, ; 54: cs\Microsoft.Maui.Controls.resources => 0x24f4cfae6c48af06 => 2
	i64 2801337043852609656, ; 55: ESP32pH.dll => 0x26e0593302fa4878 => 85
	i64 2895129759130297543, ; 56: fi\Microsoft.Maui.Controls.resources => 0x282d912d479fa4c7 => 7
	i64 3017704767998173186, ; 57: Xamarin.Google.Android.Material => 0x29e10a7f7d88a002 => 82
	i64 3289520064315143713, ; 58: Xamarin.AndroidX.Lifecycle.Common => 0x2da6b911e3063621 => 67
	i64 3311221304742556517, ; 59: System.Numerics.Vectors.dll => 0x2df3d23ba9e2b365 => 108
	i64 3325875462027654285, ; 60: System.Runtime.Numerics => 0x2e27e21c8958b48d => 121
	i64 3344514922410554693, ; 61: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x2e6a1a9a18463545 => 84
	i64 3429672777697402584, ; 62: Microsoft.Maui.Essentials => 0x2f98a5385a7b1ed8 => 50
	i64 3494946837667399002, ; 63: Microsoft.Extensions.Configuration => 0x30808ba1c00a455a => 39
	i64 3522470458906976663, ; 64: Xamarin.AndroidX.SwipeRefreshLayout => 0x30e2543832f52197 => 79
	i64 3551103847008531295, ; 65: System.Private.CoreLib.dll => 0x31480e226177735f => 140
	i64 3567343442040498961, ; 66: pt\Microsoft.Maui.Controls.resources => 0x3181bff5bea4ab11 => 22
	i64 3571415421602489686, ; 67: System.Runtime.dll => 0x319037675df7e556 => 124
	i64 3634544395678783861, ; 68: System.ServiceModel => 0x32707edf08d21975 => 52
	i64 3638003163729360188, ; 69: Microsoft.Extensions.Configuration.Abstractions => 0x327cc89a39d5f53c => 40
	i64 3647754201059316852, ; 70: System.Xml.ReaderWriter => 0x329f6d1e86145474 => 135
	i64 3655542548057982301, ; 71: Microsoft.Extensions.Configuration.dll => 0x32bb18945e52855d => 39
	i64 3716579019761409177, ; 72: netstandard.dll => 0x3393f0ed5c8c5c99 => 139
	i64 3727469159507183293, ; 73: Xamarin.AndroidX.RecyclerView => 0x33baa1739ba646bd => 76
	i64 3869221888984012293, ; 74: Microsoft.Extensions.Logging.dll => 0x35b23cceda0ed605 => 43
	i64 3890352374528606784, ; 75: Microsoft.Maui.Controls.Xaml.dll => 0x35fd4edf66e00240 => 48
	i64 3933965368022646939, ; 76: System.Net.Requests => 0x369840a8bfadc09b => 107
	i64 3966267475168208030, ; 77: System.Memory => 0x370b03412596249e => 104
	i64 4009997192427317104, ; 78: System.Runtime.Serialization.Primitives => 0x37a65f335cf1a770 => 123
	i64 4073500526318903918, ; 79: System.Private.Xml.dll => 0x3887fb25779ae26e => 112
	i64 4120493066591692148, ; 80: zh-Hant\Microsoft.Maui.Controls.resources => 0x392eee9cdda86574 => 33
	i64 4154383907710350974, ; 81: System.ComponentModel => 0x39a7562737acb67e => 93
	i64 4187479170553454871, ; 82: System.Linq.Expressions => 0x3a1cea1e912fa117 => 102
	i64 4205801962323029395, ; 83: System.ComponentModel.TypeConverter => 0x3a5e0299f7e7ad93 => 92
	i64 4356591372459378815, ; 84: vi/Microsoft.Maui.Controls.resources.dll => 0x3c75b8c562f9087f => 30
	i64 4679594760078841447, ; 85: ar/Microsoft.Maui.Controls.resources.dll => 0x40f142a407475667 => 0
	i64 4794310189461587505, ; 86: Xamarin.AndroidX.Activity => 0x4288cfb749e4c631 => 56
	i64 4795410492532947900, ; 87: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0x428cb86f8f9b7bbc => 79
	i64 4809057822547766521, ; 88: System.Drawing => 0x42bd349c3145ecf9 => 99
	i64 4853321196694829351, ; 89: System.Runtime.Loader.dll => 0x435a75ea15de7927 => 120
	i64 5081566143765835342, ; 90: System.Resources.ResourceManager.dll => 0x4685597c05d06e4e => 118
	i64 5099468265966638712, ; 91: System.Resources.ResourceManager => 0x46c4f35ea8519678 => 118
	i64 5103417709280584325, ; 92: System.Collections.Specialized => 0x46d2fb5e161b6285 => 89
	i64 5182934613077526976, ; 93: System.Collections.Specialized.dll => 0x47ed7b91fa9009c0 => 89
	i64 5290786973231294105, ; 94: System.Runtime.Loader => 0x496ca6b869b72699 => 120
	i64 5446034149219586269, ; 95: System.Diagnostics.Debug => 0x4b94333452e150dd => 96
	i64 5471532531798518949, ; 96: sv\Microsoft.Maui.Controls.resources => 0x4beec9d926d82ca5 => 26
	i64 5522859530602327440, ; 97: uk\Microsoft.Maui.Controls.resources => 0x4ca5237b51eead90 => 29
	i64 5570799893513421663, ; 98: System.IO.Compression.Brotli => 0x4d4f74fcdfa6c35f => 100
	i64 5573260873512690141, ; 99: System.Security.Cryptography.dll => 0x4d58333c6e4ea1dd => 125
	i64 5692067934154308417, ; 100: Xamarin.AndroidX.ViewPager2.dll => 0x4efe49a0d4a8bb41 => 81
	i64 6068057819846744445, ; 101: ro/Microsoft.Maui.Controls.resources.dll => 0x5436126fec7f197d => 23
	i64 6200764641006662125, ; 102: ro\Microsoft.Maui.Controls.resources => 0x560d8a96830131ed => 23
	i64 6218967553231149354, ; 103: Firebase.Auth.dll => 0x564e360a4805d92a => 36
	i64 6222399776351216807, ; 104: System.Text.Json.dll => 0x565a67a0ffe264a7 => 129
	i64 6284145129771520194, ; 105: System.Reflection.Emit.ILGeneration => 0x5735c4b3610850c2 => 113
	i64 6357457916754632952, ; 106: _Microsoft.Android.Resource.Designer => 0x583a3a4ac2a7a0f8 => 34
	i64 6401687960814735282, ; 107: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0x58d75d486341cfb2 => 68
	i64 6478287442656530074, ; 108: hr\Microsoft.Maui.Controls.resources => 0x59e7801b0c6a8e9a => 11
	i64 6548213210057960872, ; 109: Xamarin.AndroidX.CustomView.dll => 0x5adfed387b066da8 => 64
	i64 6560151584539558821, ; 110: Microsoft.Extensions.Options => 0x5b0a571be53243a5 => 45
	i64 6743165466166707109, ; 111: nl\Microsoft.Maui.Controls.resources => 0x5d948943c08c43a5 => 19
	i64 6777482997383978746, ; 112: pt/Microsoft.Maui.Controls.resources.dll => 0x5e0e74e0a2525efa => 22
	i64 6786606130239981554, ; 113: System.Diagnostics.TraceSource => 0x5e2ede51877147f2 => 97
	i64 6814185388980153342, ; 114: System.Xml.XDocument.dll => 0x5e90d98217d1abfe => 136
	i64 6876862101832370452, ; 115: System.Xml.Linq => 0x5f6f85a57d108914 => 134
	i64 6894844156784520562, ; 116: System.Numerics.Vectors => 0x5faf683aead1ad72 => 108
	i64 7083547580668757502, ; 117: System.Private.Xml.Linq.dll => 0x624dd0fe8f56c5fe => 111
	i64 7220009545223068405, ; 118: sv/Microsoft.Maui.Controls.resources.dll => 0x6432a06d99f35af5 => 26
	i64 7270811800166795866, ; 119: System.Linq => 0x64e71ccf51a90a5a => 103
	i64 7338192458477945005, ; 120: System.Reflection => 0x65d67f295d0740ad => 117
	i64 7377312882064240630, ; 121: System.ComponentModel.TypeConverter.dll => 0x66617afac45a2ff6 => 92
	i64 7488575175965059935, ; 122: System.Xml.Linq.dll => 0x67ecc3724534ab5f => 134
	i64 7489048572193775167, ; 123: System.ObjectModel => 0x67ee71ff6b419e3f => 109
	i64 7503526963013706253, ; 124: System.ServiceModel.dll => 0x6821e20478ff620d => 52
	i64 7602111570124318452, ; 125: System.Reactive => 0x698020320025a6f4 => 55
	i64 7654504624184590948, ; 126: System.Net.Http => 0x6a3a4366801b8264 => 105
	i64 7708790323521193081, ; 127: ms/Microsoft.Maui.Controls.resources.dll => 0x6afb1ff4d1730479 => 17
	i64 7714652370974252055, ; 128: System.Private.CoreLib => 0x6b0ff375198b9c17 => 140
	i64 7735176074855944702, ; 129: Microsoft.CSharp => 0x6b58dda848e391fe => 86
	i64 7735352534559001595, ; 130: Xamarin.Kotlin.StdLib.dll => 0x6b597e2582ce8bfb => 83
	i64 7836164640616011524, ; 131: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x6cbfa6390d64d704 => 58
	i64 8064050204834738623, ; 132: System.Collections.dll => 0x6fe942efa61731bf => 90
	i64 8083354569033831015, ; 133: Xamarin.AndroidX.Lifecycle.Common.dll => 0x702dd82730cad267 => 67
	i64 8087206902342787202, ; 134: System.Diagnostics.DiagnosticSource => 0x703b87d46f3aa082 => 54
	i64 8113615946733131500, ; 135: System.Reflection.Extensions => 0x70995ab73cf916ec => 115
	i64 8167236081217502503, ; 136: Java.Interop.dll => 0x7157d9f1a9b8fd27 => 141
	i64 8185542183669246576, ; 137: System.Collections => 0x7198e33f4794aa70 => 90
	i64 8246048515196606205, ; 138: Microsoft.Maui.Graphics.dll => 0x726fd96f64ee56fd => 51
	i64 8368701292315763008, ; 139: System.Security.Cryptography => 0x7423997c6fd56140 => 125
	i64 8400357532724379117, ; 140: Xamarin.AndroidX.Navigation.UI.dll => 0x749410ab44503ded => 75
	i64 8410671156615598628, ; 141: System.Reflection.Emit.Lightweight.dll => 0x74b8b4daf4b25224 => 114
	i64 8563666267364444763, ; 142: System.Private.Uri => 0x76d841191140ca5b => 110
	i64 8614108721271900878, ; 143: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x778b763e14018ace => 21
	i64 8626175481042262068, ; 144: Java.Interop => 0x77b654e585b55834 => 141
	i64 8638972117149407195, ; 145: Microsoft.CSharp.dll => 0x77e3cb5e8b31d7db => 86
	i64 8639588376636138208, ; 146: Xamarin.AndroidX.Navigation.Runtime => 0x77e5fbdaa2fda2e0 => 74
	i64 8677882282824630478, ; 147: pt-BR\Microsoft.Maui.Controls.resources => 0x786e07f5766b00ce => 21
	i64 8702320156596882678, ; 148: Firebase.dll => 0x78c4da1357adccf6 => 37
	i64 8725526185868997716, ; 149: System.Diagnostics.DiagnosticSource.dll => 0x79174bd613173454 => 54
	i64 8941376889969657626, ; 150: System.Xml.XDocument => 0x7c1626e87187471a => 136
	i64 9045785047181495996, ; 151: zh-HK\Microsoft.Maui.Controls.resources => 0x7d891592e3cb0ebc => 31
	i64 9057635389615298436, ; 152: LiteDB => 0x7db32f65bf06d784 => 38
	i64 9296667808972889535, ; 153: LiteDB.dll => 0x8104661dcca35dbf => 38
	i64 9312692141327339315, ; 154: Xamarin.AndroidX.ViewPager2 => 0x813d54296a634f33 => 81
	i64 9324707631942237306, ; 155: Xamarin.AndroidX.AppCompat => 0x8168042fd44a7c7a => 57
	i64 9659729154652888475, ; 156: System.Text.RegularExpressions => 0x860e407c9991dd9b => 130
	i64 9678050649315576968, ; 157: Xamarin.AndroidX.CoordinatorLayout.dll => 0x864f57c9feb18c88 => 61
	i64 9702891218465930390, ; 158: System.Collections.NonGeneric.dll => 0x86a79827b2eb3c96 => 88
	i64 9808709177481450983, ; 159: Mono.Android.dll => 0x881f890734e555e7 => 143
	i64 9956195530459977388, ; 160: Microsoft.Maui => 0x8a2b8315b36616ac => 49
	i64 9991543690424095600, ; 161: es/Microsoft.Maui.Controls.resources.dll => 0x8aa9180c89861370 => 6
	i64 10038780035334861115, ; 162: System.Net.Http.dll => 0x8b50e941206af13b => 105
	i64 10051358222726253779, ; 163: System.Private.Xml => 0x8b7d990c97ccccd3 => 112
	i64 10092835686693276772, ; 164: Microsoft.Maui.Controls => 0x8c10f49539bd0c64 => 47
	i64 10143853363526200146, ; 165: da\Microsoft.Maui.Controls.resources => 0x8cc634e3c2a16b52 => 3
	i64 10144742755892837524, ; 166: Firebase => 0x8cc95dc98eb5bc94 => 37
	i64 10229024438826829339, ; 167: Xamarin.AndroidX.CustomView => 0x8df4cb880b10061b => 64
	i64 10245369515835430794, ; 168: System.Reflection.Emit.Lightweight => 0x8e2edd4ad7fc978a => 114
	i64 10360651442923773544, ; 169: System.Text.Encoding => 0x8fc86d98211c1e68 => 127
	i64 10364469296367737616, ; 170: System.Reflection.Emit.ILGeneration.dll => 0x8fd5fde967711b10 => 113
	i64 10406448008575299332, ; 171: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x906b2153fcb3af04 => 84
	i64 10430153318873392755, ; 172: Xamarin.AndroidX.Core => 0x90bf592ea44f6673 => 62
	i64 10506226065143327199, ; 173: ca\Microsoft.Maui.Controls.resources => 0x91cd9cf11ed169df => 1
	i64 10785150219063592792, ; 174: System.Net.Primitives => 0x95ac8cfb68830758 => 106
	i64 11002576679268595294, ; 175: Microsoft.Extensions.Logging.Abstractions => 0x98b1013215cd365e => 44
	i64 11009005086950030778, ; 176: Microsoft.Maui.dll => 0x98c7d7cc621ffdba => 49
	i64 11103970607964515343, ; 177: hu\Microsoft.Maui.Controls.resources => 0x9a193a6fc41a6c0f => 12
	i64 11162124722117608902, ; 178: Xamarin.AndroidX.ViewPager => 0x9ae7d54b986d05c6 => 80
	i64 11220793807500858938, ; 179: ja\Microsoft.Maui.Controls.resources => 0x9bb8448481fdd63a => 15
	i64 11226290749488709958, ; 180: Microsoft.Extensions.Options.dll => 0x9bcbcbf50c874146 => 45
	i64 11340910727871153756, ; 181: Xamarin.AndroidX.CursorAdapter => 0x9d630238642d465c => 63
	i64 11485890710487134646, ; 182: System.Runtime.InteropServices => 0x9f6614bf0f8b71b6 => 119
	i64 11518296021396496455, ; 183: id\Microsoft.Maui.Controls.resources => 0x9fd9353475222047 => 13
	i64 11529969570048099689, ; 184: Xamarin.AndroidX.ViewPager.dll => 0xa002ae3c4dc7c569 => 80
	i64 11530571088791430846, ; 185: Microsoft.Extensions.Logging => 0xa004d1504ccd66be => 43
	i64 11597940890313164233, ; 186: netstandard => 0xa0f429ca8d1805c9 => 139
	i64 11705530742807338875, ; 187: he/Microsoft.Maui.Controls.resources.dll => 0xa272663128721f7b => 9
	i64 11743665907891708234, ; 188: System.Threading.Tasks => 0xa2f9e1ec30c0214a => 131
	i64 12123043025855404482, ; 189: System.Reflection.Extensions.dll => 0xa83db366c0e359c2 => 115
	i64 12145679461940342714, ; 190: System.Text.Json => 0xa88e1f1ebcb62fba => 129
	i64 12201331334810686224, ; 191: System.Runtime.Serialization.Primitives.dll => 0xa953d6341e3bd310 => 123
	i64 12451044538927396471, ; 192: Xamarin.AndroidX.Fragment.dll => 0xaccaff0a2955b677 => 66
	i64 12466513435562512481, ; 193: Xamarin.AndroidX.Loader.dll => 0xad01f3eb52569061 => 71
	i64 12475113361194491050, ; 194: _Microsoft.Android.Resource.Designer.dll => 0xad2081818aba1caa => 34
	i64 12517810545449516888, ; 195: System.Diagnostics.TraceSource.dll => 0xadb8325e6f283f58 => 97
	i64 12528155905152483962, ; 196: Firebase.Auth => 0xaddcf36b3153827a => 36
	i64 12538491095302438457, ; 197: Xamarin.AndroidX.CardView.dll => 0xae01ab382ae67e39 => 59
	i64 12550732019250633519, ; 198: System.IO.Compression => 0xae2d28465e8e1b2f => 101
	i64 12681088699309157496, ; 199: it/Microsoft.Maui.Controls.resources.dll => 0xaffc46fc178aec78 => 14
	i64 12700543734426720211, ; 200: Xamarin.AndroidX.Collection => 0xb041653c70d157d3 => 60
	i64 12708922737231849740, ; 201: System.Text.Encoding.Extensions => 0xb05f29e50e96e90c => 126
	i64 12823819093633476069, ; 202: th/Microsoft.Maui.Controls.resources.dll => 0xb1f75b85abe525e5 => 27
	i64 12843321153144804894, ; 203: Microsoft.Extensions.Primitives => 0xb23ca48abd74d61e => 46
	i64 13068258254871114833, ; 204: System.Runtime.Serialization.Formatters.dll => 0xb55bc7a4eaa8b451 => 122
	i64 13221551921002590604, ; 205: ca/Microsoft.Maui.Controls.resources.dll => 0xb77c636bdebe318c => 1
	i64 13222659110913276082, ; 206: ja/Microsoft.Maui.Controls.resources.dll => 0xb78052679c1178b2 => 15
	i64 13343850469010654401, ; 207: Mono.Android.Runtime.dll => 0xb92ee14d854f44c1 => 142
	i64 13381594904270902445, ; 208: he\Microsoft.Maui.Controls.resources => 0xb9b4f9aaad3e94ad => 9
	i64 13465488254036897740, ; 209: Xamarin.Kotlin.StdLib => 0xbadf06394d106fcc => 83
	i64 13467053111158216594, ; 210: uk/Microsoft.Maui.Controls.resources.dll => 0xbae49573fde79792 => 29
	i64 13540124433173649601, ; 211: vi\Microsoft.Maui.Controls.resources => 0xbbe82f6eede718c1 => 30
	i64 13545416393490209236, ; 212: id/Microsoft.Maui.Controls.resources.dll => 0xbbfafc7174bc99d4 => 13
	i64 13572454107664307259, ; 213: Xamarin.AndroidX.RecyclerView.dll => 0xbc5b0b19d99f543b => 76
	i64 13717397318615465333, ; 214: System.ComponentModel.Primitives.dll => 0xbe5dfc2ef2f87d75 => 91
	i64 13755568601956062840, ; 215: fr/Microsoft.Maui.Controls.resources.dll => 0xbee598c36b1b9678 => 8
	i64 13814445057219246765, ; 216: hr/Microsoft.Maui.Controls.resources.dll => 0xbfb6c49664b43aad => 11
	i64 13881769479078963060, ; 217: System.Console.dll => 0xc0a5f3cade5c6774 => 94
	i64 13959074834287824816, ; 218: Xamarin.AndroidX.Fragment => 0xc1b8989a7ad20fb0 => 66
	i64 14100563506285742564, ; 219: da/Microsoft.Maui.Controls.resources.dll => 0xc3af43cd0cff89e4 => 3
	i64 14124974489674258913, ; 220: Xamarin.AndroidX.CardView => 0xc405fd76067d19e1 => 59
	i64 14125464355221830302, ; 221: System.Threading.dll => 0xc407bafdbc707a9e => 133
	i64 14254574811015963973, ; 222: System.Text.Encoding.Extensions.dll => 0xc5d26c4442d66545 => 126
	i64 14327695147300244862, ; 223: System.Reflection.dll => 0xc6d632d338eb4d7e => 117
	i64 14423219658244587134, ; 224: ESP32pH => 0xc82991dc97197e7e => 85
	i64 14461014870687870182, ; 225: System.Net.Requests.dll => 0xc8afd8683afdece6 => 107
	i64 14464374589798375073, ; 226: ru\Microsoft.Maui.Controls.resources => 0xc8bbc80dcb1e5ea1 => 24
	i64 14522721392235705434, ; 227: el/Microsoft.Maui.Controls.resources.dll => 0xc98b12295c2cf45a => 5
	i64 14551742072151931844, ; 228: System.Text.Encodings.Web.dll => 0xc9f22c50f1b8fbc4 => 128
	i64 14622043554576106986, ; 229: System.Runtime.Serialization.Formatters => 0xcaebef2458cc85ea => 122
	i64 14669215534098758659, ; 230: Microsoft.Extensions.DependencyInjection.dll => 0xcb9385ceb3993c03 => 41
	i64 14705122255218365489, ; 231: ko\Microsoft.Maui.Controls.resources => 0xcc1316c7b0fb5431 => 16
	i64 14744092281598614090, ; 232: zh-Hans\Microsoft.Maui.Controls.resources => 0xcc9d89d004439a4a => 32
	i64 14852515768018889994, ; 233: Xamarin.AndroidX.CursorAdapter.dll => 0xce1ebc6625a76d0a => 63
	i64 14892012299694389861, ; 234: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xceab0e490a083a65 => 33
	i64 14904040806490515477, ; 235: ar\Microsoft.Maui.Controls.resources => 0xced5ca2604cb2815 => 0
	i64 14954917835170835695, ; 236: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xcf8a8a895a82ecef => 42
	i64 14987728460634540364, ; 237: System.IO.Compression.dll => 0xcfff1ba06622494c => 101
	i64 15076659072870671916, ; 238: System.ObjectModel.dll => 0xd13b0d8c1620662c => 109
	i64 15111608613780139878, ; 239: ms\Microsoft.Maui.Controls.resources => 0xd1b737f831192f66 => 17
	i64 15115185479366240210, ; 240: System.IO.Compression.Brotli.dll => 0xd1c3ed1c1bc467d2 => 100
	i64 15133485256822086103, ; 241: System.Linq.dll => 0xd204f0a9127dd9d7 => 103
	i64 15227001540531775957, ; 242: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd3512d3999b8e9d5 => 40
	i64 15370334346939861994, ; 243: Xamarin.AndroidX.Core.dll => 0xd54e65a72c560bea => 62
	i64 15391712275433856905, ; 244: Microsoft.Extensions.DependencyInjection.Abstractions => 0xd59a58c406411f89 => 42
	i64 15526743539506359484, ; 245: System.Text.Encoding.dll => 0xd77a12fc26de2cbc => 127
	i64 15527772828719725935, ; 246: System.Console => 0xd77dbb1e38cd3d6f => 94
	i64 15536481058354060254, ; 247: de\Microsoft.Maui.Controls.resources => 0xd79cab34eec75bde => 4
	i64 15582737692548360875, ; 248: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xd841015ed86f6aab => 70
	i64 15609085926864131306, ; 249: System.dll => 0xd89e9cf3334914ea => 137
	i64 15661133872274321916, ; 250: System.Xml.ReaderWriter.dll => 0xd9578647d4bfb1fc => 135
	i64 15664356999916475676, ; 251: de/Microsoft.Maui.Controls.resources.dll => 0xd962f9b2b6ecd51c => 4
	i64 15743187114543869802, ; 252: hu/Microsoft.Maui.Controls.resources.dll => 0xda7b09450ae4ef6a => 12
	i64 15783653065526199428, ; 253: el\Microsoft.Maui.Controls.resources => 0xdb0accd674b1c484 => 5
	i64 15817206913877585035, ; 254: System.Threading.Tasks.dll => 0xdb8201e29086ac8b => 131
	i64 16154507427712707110, ; 255: System => 0xe03056ea4e39aa26 => 137
	i64 16288847719894691167, ; 256: nb\Microsoft.Maui.Controls.resources => 0xe20d9cb300c12d5f => 18
	i64 16321164108206115771, ; 257: Microsoft.Extensions.Logging.Abstractions.dll => 0xe2806c487e7b0bbb => 44
	i64 16648892297579399389, ; 258: CommunityToolkit.Mvvm => 0xe70cbf55c4f508dd => 35
	i64 16649148416072044166, ; 259: Microsoft.Maui.Graphics => 0xe70da84600bb4e86 => 51
	i64 16677317093839702854, ; 260: Xamarin.AndroidX.Navigation.UI => 0xe771bb8960dd8b46 => 75
	i64 16833383113903931215, ; 261: mscorlib => 0xe99c30c1484d7f4f => 138
	i64 16856067890322379635, ; 262: System.Data.Common.dll => 0xe9ecc87060889373 => 95
	i64 16890310621557459193, ; 263: System.Text.RegularExpressions.dll => 0xea66700587f088f9 => 130
	i64 16942731696432749159, ; 264: sk\Microsoft.Maui.Controls.resources => 0xeb20acb622a01a67 => 25
	i64 16998075588627545693, ; 265: Xamarin.AndroidX.Navigation.Fragment => 0xebe54bb02d623e5d => 73
	i64 17008137082415910100, ; 266: System.Collections.NonGeneric => 0xec090a90408c8cd4 => 88
	i64 17031351772568316411, ; 267: Xamarin.AndroidX.Navigation.Common.dll => 0xec5b843380a769fb => 72
	i64 17062143951396181894, ; 268: System.ComponentModel.Primitives => 0xecc8e986518c9786 => 91
	i64 17089008752050867324, ; 269: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xed285aeb25888c7c => 32
	i64 17230721278011714856, ; 270: System.Private.Xml.Linq => 0xef1fd1b5c7a72d28 => 111
	i64 17260702271250283638, ; 271: System.Data.Common => 0xef8a5543bba6bc76 => 95
	i64 17342750010158924305, ; 272: hi\Microsoft.Maui.Controls.resources => 0xf0add33f97ecc211 => 10
	i64 17438153253682247751, ; 273: sk/Microsoft.Maui.Controls.resources.dll => 0xf200c3fe308d7847 => 25
	i64 17514990004910432069, ; 274: fr\Microsoft.Maui.Controls.resources => 0xf311be9c6f341f45 => 8
	i64 17623389608345532001, ; 275: pl\Microsoft.Maui.Controls.resources => 0xf492db79dfbef661 => 20
	i64 17685921127322830888, ; 276: System.Diagnostics.Debug.dll => 0xf571038fafa74828 => 96
	i64 17702523067201099846, ; 277: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xf5abfef008ae1846 => 31
	i64 17704177640604968747, ; 278: Xamarin.AndroidX.Loader => 0xf5b1dfc36cac272b => 71
	i64 17710060891934109755, ; 279: Xamarin.AndroidX.Lifecycle.ViewModel => 0xf5c6c68c9e45303b => 69
	i64 17712670374920797664, ; 280: System.Runtime.InteropServices.dll => 0xf5d00bdc38bd3de0 => 119
	i64 17777860260071588075, ; 281: System.Runtime.Numerics.dll => 0xf6b7a5b72419c0eb => 121
	i64 18025913125965088385, ; 282: System.Threading => 0xfa28e87b91334681 => 133
	i64 18099568558057551825, ; 283: nl/Microsoft.Maui.Controls.resources.dll => 0xfb2e95b53ad977d1 => 19
	i64 18121036031235206392, ; 284: Xamarin.AndroidX.Navigation.Common => 0xfb7ada42d3d42cf8 => 72
	i64 18245806341561545090, ; 285: System.Collections.Concurrent.dll => 0xfd3620327d587182 => 87
	i64 18305135509493619199, ; 286: Xamarin.AndroidX.Navigation.Runtime.dll => 0xfe08e7c2d8c199ff => 74
	i64 18324163916253801303 ; 287: it\Microsoft.Maui.Controls.resources => 0xfe4c81ff0a56ab57 => 14
], align 8

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [288 x i32] [
	i32 46, ; 0
	i32 143, ; 1
	i32 50, ; 2
	i32 102, ; 3
	i32 60, ; 4
	i32 77, ; 5
	i32 78, ; 6
	i32 55, ; 7
	i32 7, ; 8
	i32 116, ; 9
	i32 132, ; 10
	i32 93, ; 11
	i32 10, ; 12
	i32 65, ; 13
	i32 116, ; 14
	i32 82, ; 15
	i32 18, ; 16
	i32 99, ; 17
	i32 73, ; 18
	i32 106, ; 19
	i32 47, ; 20
	i32 142, ; 21
	i32 132, ; 22
	i32 16, ; 23
	i32 58, ; 24
	i32 70, ; 25
	i32 53, ; 26
	i32 104, ; 27
	i32 110, ; 28
	i32 57, ; 29
	i32 6, ; 30
	i32 77, ; 31
	i32 98, ; 32
	i32 28, ; 33
	i32 78, ; 34
	i32 48, ; 35
	i32 35, ; 36
	i32 28, ; 37
	i32 69, ; 38
	i32 2, ; 39
	i32 20, ; 40
	i32 98, ; 41
	i32 53, ; 42
	i32 65, ; 43
	i32 87, ; 44
	i32 24, ; 45
	i32 68, ; 46
	i32 128, ; 47
	i32 61, ; 48
	i32 124, ; 49
	i32 56, ; 50
	i32 27, ; 51
	i32 138, ; 52
	i32 41, ; 53
	i32 2, ; 54
	i32 85, ; 55
	i32 7, ; 56
	i32 82, ; 57
	i32 67, ; 58
	i32 108, ; 59
	i32 121, ; 60
	i32 84, ; 61
	i32 50, ; 62
	i32 39, ; 63
	i32 79, ; 64
	i32 140, ; 65
	i32 22, ; 66
	i32 124, ; 67
	i32 52, ; 68
	i32 40, ; 69
	i32 135, ; 70
	i32 39, ; 71
	i32 139, ; 72
	i32 76, ; 73
	i32 43, ; 74
	i32 48, ; 75
	i32 107, ; 76
	i32 104, ; 77
	i32 123, ; 78
	i32 112, ; 79
	i32 33, ; 80
	i32 93, ; 81
	i32 102, ; 82
	i32 92, ; 83
	i32 30, ; 84
	i32 0, ; 85
	i32 56, ; 86
	i32 79, ; 87
	i32 99, ; 88
	i32 120, ; 89
	i32 118, ; 90
	i32 118, ; 91
	i32 89, ; 92
	i32 89, ; 93
	i32 120, ; 94
	i32 96, ; 95
	i32 26, ; 96
	i32 29, ; 97
	i32 100, ; 98
	i32 125, ; 99
	i32 81, ; 100
	i32 23, ; 101
	i32 23, ; 102
	i32 36, ; 103
	i32 129, ; 104
	i32 113, ; 105
	i32 34, ; 106
	i32 68, ; 107
	i32 11, ; 108
	i32 64, ; 109
	i32 45, ; 110
	i32 19, ; 111
	i32 22, ; 112
	i32 97, ; 113
	i32 136, ; 114
	i32 134, ; 115
	i32 108, ; 116
	i32 111, ; 117
	i32 26, ; 118
	i32 103, ; 119
	i32 117, ; 120
	i32 92, ; 121
	i32 134, ; 122
	i32 109, ; 123
	i32 52, ; 124
	i32 55, ; 125
	i32 105, ; 126
	i32 17, ; 127
	i32 140, ; 128
	i32 86, ; 129
	i32 83, ; 130
	i32 58, ; 131
	i32 90, ; 132
	i32 67, ; 133
	i32 54, ; 134
	i32 115, ; 135
	i32 141, ; 136
	i32 90, ; 137
	i32 51, ; 138
	i32 125, ; 139
	i32 75, ; 140
	i32 114, ; 141
	i32 110, ; 142
	i32 21, ; 143
	i32 141, ; 144
	i32 86, ; 145
	i32 74, ; 146
	i32 21, ; 147
	i32 37, ; 148
	i32 54, ; 149
	i32 136, ; 150
	i32 31, ; 151
	i32 38, ; 152
	i32 38, ; 153
	i32 81, ; 154
	i32 57, ; 155
	i32 130, ; 156
	i32 61, ; 157
	i32 88, ; 158
	i32 143, ; 159
	i32 49, ; 160
	i32 6, ; 161
	i32 105, ; 162
	i32 112, ; 163
	i32 47, ; 164
	i32 3, ; 165
	i32 37, ; 166
	i32 64, ; 167
	i32 114, ; 168
	i32 127, ; 169
	i32 113, ; 170
	i32 84, ; 171
	i32 62, ; 172
	i32 1, ; 173
	i32 106, ; 174
	i32 44, ; 175
	i32 49, ; 176
	i32 12, ; 177
	i32 80, ; 178
	i32 15, ; 179
	i32 45, ; 180
	i32 63, ; 181
	i32 119, ; 182
	i32 13, ; 183
	i32 80, ; 184
	i32 43, ; 185
	i32 139, ; 186
	i32 9, ; 187
	i32 131, ; 188
	i32 115, ; 189
	i32 129, ; 190
	i32 123, ; 191
	i32 66, ; 192
	i32 71, ; 193
	i32 34, ; 194
	i32 97, ; 195
	i32 36, ; 196
	i32 59, ; 197
	i32 101, ; 198
	i32 14, ; 199
	i32 60, ; 200
	i32 126, ; 201
	i32 27, ; 202
	i32 46, ; 203
	i32 122, ; 204
	i32 1, ; 205
	i32 15, ; 206
	i32 142, ; 207
	i32 9, ; 208
	i32 83, ; 209
	i32 29, ; 210
	i32 30, ; 211
	i32 13, ; 212
	i32 76, ; 213
	i32 91, ; 214
	i32 8, ; 215
	i32 11, ; 216
	i32 94, ; 217
	i32 66, ; 218
	i32 3, ; 219
	i32 59, ; 220
	i32 133, ; 221
	i32 126, ; 222
	i32 117, ; 223
	i32 85, ; 224
	i32 107, ; 225
	i32 24, ; 226
	i32 5, ; 227
	i32 128, ; 228
	i32 122, ; 229
	i32 41, ; 230
	i32 16, ; 231
	i32 32, ; 232
	i32 63, ; 233
	i32 33, ; 234
	i32 0, ; 235
	i32 42, ; 236
	i32 101, ; 237
	i32 109, ; 238
	i32 17, ; 239
	i32 100, ; 240
	i32 103, ; 241
	i32 40, ; 242
	i32 62, ; 243
	i32 42, ; 244
	i32 127, ; 245
	i32 94, ; 246
	i32 4, ; 247
	i32 70, ; 248
	i32 137, ; 249
	i32 135, ; 250
	i32 4, ; 251
	i32 12, ; 252
	i32 5, ; 253
	i32 131, ; 254
	i32 137, ; 255
	i32 18, ; 256
	i32 44, ; 257
	i32 35, ; 258
	i32 51, ; 259
	i32 75, ; 260
	i32 138, ; 261
	i32 95, ; 262
	i32 130, ; 263
	i32 25, ; 264
	i32 73, ; 265
	i32 88, ; 266
	i32 72, ; 267
	i32 91, ; 268
	i32 32, ; 269
	i32 111, ; 270
	i32 95, ; 271
	i32 10, ; 272
	i32 25, ; 273
	i32 8, ; 274
	i32 20, ; 275
	i32 96, ; 276
	i32 31, ; 277
	i32 71, ; 278
	i32 69, ; 279
	i32 119, ; 280
	i32 121, ; 281
	i32 133, ; 282
	i32 19, ; 283
	i32 72, ; 284
	i32 87, ; 285
	i32 74, ; 286
	i32 14 ; 287
], align 4

@marshal_methods_number_of_classes = dso_local local_unnamed_addr constant i32 0, align 4

@marshal_methods_class_cache = dso_local local_unnamed_addr global [0 x %struct.MarshalMethodsManagedClass] zeroinitializer, align 8

; Names of classes in which marshal methods reside
@mm_class_names = dso_local local_unnamed_addr constant [0 x ptr] zeroinitializer, align 8

@mm_method_names = dso_local local_unnamed_addr constant [1 x %struct.MarshalMethodName] [
	%struct.MarshalMethodName {
		i64 0, ; id 0x0; name: 
		ptr @.MarshalMethodName.0_name; char* name
	} ; 0
], align 8

; get_function_pointer (uint32_t mono_image_index, uint32_t class_index, uint32_t method_token, void*& target_ptr)
@get_function_pointer = internal dso_local unnamed_addr global ptr null, align 8

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
	store ptr %fn, ptr @get_function_pointer, align 8, !tbaa !3
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "target-cpu"="generic" "target-features"="+fix-cortex-a53-835769,+neon,+outline-atomics,+v8a" }

; Metadata
!llvm.module.flags = !{!0, !1, !7, !8, !9, !10}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ 82d8938cf80f6d5fa6c28529ddfbdb753d805ab4"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"branch-target-enforcement", i32 0}
!8 = !{i32 1, !"sign-return-address", i32 0}
!9 = !{i32 1, !"sign-return-address-all", i32 0}
!10 = !{i32 1, !"sign-return-address-with-bkey", i32 0}
