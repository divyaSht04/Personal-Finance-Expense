; ModuleID = 'marshal_methods.x86.ll'
source_filename = "marshal_methods.x86.ll"
target datalayout = "e-m:e-p:32:32-p270:32:32-p271:32:32-p272:64:64-f64:32:64-f80:32-n8:16:32-S128"
target triple = "i686-unknown-linux-android21"

%struct.MarshalMethodName = type {
	i64, ; uint64_t id
	ptr ; char* name
}

%struct.MarshalMethodsManagedClass = type {
	i32, ; uint32_t token
	ptr ; MonoClass klass
}

@assembly_image_cache = dso_local local_unnamed_addr global [345 x ptr] zeroinitializer, align 4

; Each entry maps hash of an assembly name to an index into the `assembly_image_cache` array
@assembly_image_cache_hashes = dso_local local_unnamed_addr constant [684 x i32] [
	i32 2616222, ; 0: System.Net.NetworkInformation.dll => 0x27eb9e => 68
	i32 10166715, ; 1: System.Net.NameResolution.dll => 0x9b21bb => 67
	i32 15721112, ; 2: System.Runtime.Intrinsics.dll => 0xefe298 => 108
	i32 26230656, ; 3: Microsoft.Extensions.DependencyModel => 0x1903f80 => 201
	i32 32687329, ; 4: Xamarin.AndroidX.Lifecycle.Runtime => 0x1f2c4e1 => 265
	i32 34715100, ; 5: Xamarin.Google.Guava.ListenableFuture.dll => 0x211b5dc => 299
	i32 34839235, ; 6: System.IO.FileSystem.DriveInfo => 0x2139ac3 => 48
	i32 39109920, ; 7: Newtonsoft.Json.dll => 0x254c520 => 222
	i32 39485524, ; 8: System.Net.WebSockets.dll => 0x25a8054 => 80
	i32 42639949, ; 9: System.Threading.Thread => 0x28aa24d => 145
	i32 66541672, ; 10: System.Diagnostics.StackTrace => 0x3f75868 => 30
	i32 67008169, ; 11: zh-Hant\Microsoft.Maui.Controls.resources => 0x3fe76a9 => 340
	i32 68219467, ; 12: System.Security.Cryptography.Primitives => 0x410f24b => 124
	i32 72070932, ; 13: Microsoft.Maui.Graphics.dll => 0x44bb714 => 220
	i32 82292897, ; 14: System.Runtime.CompilerServices.VisualC.dll => 0x4e7b0a1 => 102
	i32 101534019, ; 15: Xamarin.AndroidX.SlidingPaneLayout => 0x60d4943 => 283
	i32 117431740, ; 16: System.Runtime.InteropServices => 0x6ffddbc => 107
	i32 120558881, ; 17: Xamarin.AndroidX.SlidingPaneLayout.dll => 0x72f9521 => 283
	i32 122350210, ; 18: System.Threading.Channels.dll => 0x74aea82 => 139
	i32 134690465, ; 19: Xamarin.Kotlin.StdLib.Jdk7.dll => 0x80736a1 => 303
	i32 142721839, ; 20: System.Net.WebHeaderCollection => 0x881c32f => 77
	i32 149972175, ; 21: System.Security.Cryptography.Primitives.dll => 0x8f064cf => 124
	i32 159306688, ; 22: System.ComponentModel.Annotations => 0x97ed3c0 => 13
	i32 165246403, ; 23: Xamarin.AndroidX.Collection.dll => 0x9d975c3 => 239
	i32 176265551, ; 24: System.ServiceProcess => 0xa81994f => 132
	i32 182336117, ; 25: Xamarin.AndroidX.SwipeRefreshLayout.dll => 0xade3a75 => 285
	i32 184328833, ; 26: System.ValueTuple.dll => 0xafca281 => 151
	i32 195452805, ; 27: vi/Microsoft.Maui.Controls.resources.dll => 0xba65f85 => 337
	i32 199333315, ; 28: zh-HK/Microsoft.Maui.Controls.resources.dll => 0xbe195c3 => 338
	i32 205061960, ; 29: System.ComponentModel => 0xc38ff48 => 18
	i32 209399409, ; 30: Xamarin.AndroidX.Browser.dll => 0xc7b2e71 => 237
	i32 220171995, ; 31: System.Diagnostics.Debug => 0xd1f8edb => 26
	i32 230216969, ; 32: Xamarin.AndroidX.Legacy.Support.Core.Utils.dll => 0xdb8d509 => 259
	i32 230752869, ; 33: Microsoft.CSharp.dll => 0xdc10265 => 1
	i32 231409092, ; 34: System.Linq.Parallel => 0xdcb05c4 => 59
	i32 231814094, ; 35: System.Globalization => 0xdd133ce => 42
	i32 246610117, ; 36: System.Reflection.Emit.Lightweight => 0xeb2f8c5 => 91
	i32 254259026, ; 37: Microsoft.AspNetCore.Components.dll => 0xf27af52 => 187
	i32 261689757, ; 38: Xamarin.AndroidX.ConstraintLayout.dll => 0xf99119d => 242
	i32 276479776, ; 39: System.Threading.Timer.dll => 0x107abf20 => 147
	i32 278686392, ; 40: Xamarin.AndroidX.Lifecycle.LiveData.dll => 0x109c6ab8 => 261
	i32 280482487, ; 41: Xamarin.AndroidX.Interpolator => 0x10b7d2b7 => 258
	i32 280992041, ; 42: cs/Microsoft.Maui.Controls.resources.dll => 0x10bf9929 => 309
	i32 291076382, ; 43: System.IO.Pipes.AccessControl.dll => 0x1159791e => 54
	i32 298918909, ; 44: System.Net.Ping.dll => 0x11d123fd => 69
	i32 317674968, ; 45: vi\Microsoft.Maui.Controls.resources => 0x12ef55d8 => 337
	i32 318968648, ; 46: Xamarin.AndroidX.Activity.dll => 0x13031348 => 228
	i32 321597661, ; 47: System.Numerics => 0x132b30dd => 83
	i32 336156722, ; 48: ja/Microsoft.Maui.Controls.resources.dll => 0x14095832 => 322
	i32 342366114, ; 49: Xamarin.AndroidX.Lifecycle.Common => 0x146817a2 => 260
	i32 356389973, ; 50: it/Microsoft.Maui.Controls.resources.dll => 0x153e1455 => 321
	i32 360082299, ; 51: System.ServiceModel.Web => 0x15766b7b => 131
	i32 367780167, ; 52: System.IO.Pipes => 0x15ebe147 => 55
	i32 374914964, ; 53: System.Transactions.Local => 0x1658bf94 => 149
	i32 375677976, ; 54: System.Net.ServicePoint.dll => 0x16646418 => 74
	i32 379916513, ; 55: System.Threading.Thread.dll => 0x16a510e1 => 145
	i32 385762202, ; 56: System.Memory.dll => 0x16fe439a => 62
	i32 392610295, ; 57: System.Threading.ThreadPool.dll => 0x1766c1f7 => 146
	i32 395744057, ; 58: _Microsoft.Android.Resource.Designer => 0x17969339 => 341
	i32 403441872, ; 59: WindowsBase => 0x180c08d0 => 165
	i32 435591531, ; 60: sv/Microsoft.Maui.Controls.resources.dll => 0x19f6996b => 333
	i32 441335492, ; 61: Xamarin.AndroidX.ConstraintLayout.Core => 0x1a4e3ec4 => 243
	i32 442565967, ; 62: System.Collections => 0x1a61054f => 12
	i32 450948140, ; 63: Xamarin.AndroidX.Fragment.dll => 0x1ae0ec2c => 256
	i32 451504562, ; 64: System.Security.Cryptography.X509Certificates => 0x1ae969b2 => 125
	i32 456227837, ; 65: System.Web.HttpUtility.dll => 0x1b317bfd => 152
	i32 459347974, ; 66: System.Runtime.Serialization.Primitives.dll => 0x1b611806 => 113
	i32 465846621, ; 67: mscorlib => 0x1bc4415d => 166
	i32 469710990, ; 68: System.dll => 0x1bff388e => 164
	i32 476646585, ; 69: Xamarin.AndroidX.Interpolator.dll => 0x1c690cb9 => 258
	i32 486930444, ; 70: Xamarin.AndroidX.LocalBroadcastManager.dll => 0x1d05f80c => 271
	i32 498788369, ; 71: System.ObjectModel => 0x1dbae811 => 84
	i32 500358224, ; 72: id/Microsoft.Maui.Controls.resources.dll => 0x1dd2dc50 => 320
	i32 503918385, ; 73: fi/Microsoft.Maui.Controls.resources.dll => 0x1e092f31 => 314
	i32 513247710, ; 74: Microsoft.Extensions.Primitives.dll => 0x1e9789de => 213
	i32 526420162, ; 75: System.Transactions.dll => 0x1f6088c2 => 150
	i32 527452488, ; 76: Xamarin.Kotlin.StdLib.Jdk7 => 0x1f704948 => 303
	i32 530272170, ; 77: System.Linq.Queryable => 0x1f9b4faa => 60
	i32 539058512, ; 78: Microsoft.Extensions.Logging => 0x20216150 => 209
	i32 540030774, ; 79: System.IO.FileSystem.dll => 0x20303736 => 51
	i32 545304856, ; 80: System.Runtime.Extensions => 0x2080b118 => 103
	i32 546455878, ; 81: System.Runtime.Serialization.Xml => 0x20924146 => 114
	i32 549171840, ; 82: System.Globalization.Calendars => 0x20bbb280 => 40
	i32 557405415, ; 83: Jsr305Binding => 0x213954e7 => 296
	i32 569601784, ; 84: Xamarin.AndroidX.Window.Extensions.Core.Core => 0x21f36ef8 => 294
	i32 571435654, ; 85: Microsoft.Extensions.FileProviders.Embedded.dll => 0x220f6a86 => 204
	i32 577335427, ; 86: System.Security.Cryptography.Cng => 0x22697083 => 120
	i32 592146354, ; 87: pt-BR/Microsoft.Maui.Controls.resources.dll => 0x234b6fb2 => 328
	i32 601371474, ; 88: System.IO.IsolatedStorage.dll => 0x23d83352 => 52
	i32 605376203, ; 89: System.IO.Compression.FileSystem => 0x24154ecb => 44
	i32 606421715, ; 90: itext.layout => 0x242542d3 => 179
	i32 613668793, ; 91: System.Security.Cryptography.Algorithms => 0x2493d7b9 => 119
	i32 627609679, ; 92: Xamarin.AndroidX.CustomView => 0x2568904f => 248
	i32 627931235, ; 93: nl\Microsoft.Maui.Controls.resources => 0x256d7863 => 326
	i32 639843206, ; 94: Xamarin.AndroidX.Emoji2.ViewsHelper.dll => 0x26233b86 => 254
	i32 643868501, ; 95: System.Net => 0x2660a755 => 81
	i32 662205335, ; 96: System.Text.Encodings.Web.dll => 0x27787397 => 136
	i32 663517072, ; 97: Xamarin.AndroidX.VersionedParcelable => 0x278c7790 => 290
	i32 666292255, ; 98: Xamarin.AndroidX.Arch.Core.Common.dll => 0x27b6d01f => 235
	i32 672442732, ; 99: System.Collections.Concurrent => 0x2814a96c => 8
	i32 683518922, ; 100: System.Net.Security => 0x28bdabca => 73
	i32 688181140, ; 101: ca/Microsoft.Maui.Controls.resources.dll => 0x2904cf94 => 308
	i32 690569205, ; 102: System.Xml.Linq.dll => 0x29293ff5 => 155
	i32 691348768, ; 103: Xamarin.KotlinX.Coroutines.Android.dll => 0x29352520 => 305
	i32 693804605, ; 104: System.Windows => 0x295a9e3d => 154
	i32 699345723, ; 105: System.Reflection.Emit => 0x29af2b3b => 92
	i32 700284507, ; 106: Xamarin.Jetbrains.Annotations => 0x29bd7e5b => 300
	i32 700358131, ; 107: System.IO.Compression.ZipFile => 0x29be9df3 => 45
	i32 706645707, ; 108: ko/Microsoft.Maui.Controls.resources.dll => 0x2a1e8ecb => 323
	i32 709557578, ; 109: de/Microsoft.Maui.Controls.resources.dll => 0x2a4afd4a => 311
	i32 720511267, ; 110: Xamarin.Kotlin.StdLib.Jdk8 => 0x2af22123 => 304
	i32 722857257, ; 111: System.Runtime.Loader.dll => 0x2b15ed29 => 109
	i32 735137430, ; 112: System.Security.SecureString.dll => 0x2bd14e96 => 129
	i32 752232764, ; 113: System.Diagnostics.Contracts.dll => 0x2cd6293c => 25
	i32 755313932, ; 114: Xamarin.Android.Glide.Annotations.dll => 0x2d052d0c => 225
	i32 759454413, ; 115: System.Net.Requests => 0x2d445acd => 72
	i32 762598435, ; 116: System.IO.Pipes.dll => 0x2d745423 => 55
	i32 775507847, ; 117: System.IO.Compression => 0x2e394f87 => 46
	i32 777317022, ; 118: sk\Microsoft.Maui.Controls.resources => 0x2e54ea9e => 332
	i32 789151979, ; 119: Microsoft.Extensions.Options => 0x2f0980eb => 212
	i32 790371945, ; 120: Xamarin.AndroidX.CustomView.PoolingContainer.dll => 0x2f1c1e69 => 249
	i32 804008546, ; 121: Microsoft.AspNetCore.Components.WebView.Maui => 0x2fec3262 => 191
	i32 804715423, ; 122: System.Data.Common => 0x2ff6fb9f => 22
	i32 807930345, ; 123: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx.dll => 0x302809e9 => 263
	i32 823281589, ; 124: System.Private.Uri.dll => 0x311247b5 => 86
	i32 830298997, ; 125: System.IO.Compression.Brotli => 0x317d5b75 => 43
	i32 832635846, ; 126: System.Xml.XPath.dll => 0x31a103c6 => 160
	i32 834051424, ; 127: System.Net.Quic => 0x31b69d60 => 71
	i32 843511501, ; 128: Xamarin.AndroidX.Print => 0x3246f6cd => 276
	i32 873119928, ; 129: Microsoft.VisualBasic => 0x340ac0b8 => 3
	i32 877678880, ; 130: System.Globalization.dll => 0x34505120 => 42
	i32 878954865, ; 131: System.Net.Http.Json => 0x3463c971 => 63
	i32 904024072, ; 132: System.ComponentModel.Primitives.dll => 0x35e25008 => 16
	i32 911108515, ; 133: System.IO.MemoryMappedFiles.dll => 0x364e69a3 => 53
	i32 917108320, ; 134: itext.io => 0x36a9f660 => 177
	i32 926902833, ; 135: tr/Microsoft.Maui.Controls.resources.dll => 0x373f6a31 => 335
	i32 928116545, ; 136: Xamarin.Google.Guava.ListenableFuture => 0x3751ef41 => 299
	i32 952186615, ; 137: System.Runtime.InteropServices.JavaScript.dll => 0x38c136f7 => 105
	i32 955402788, ; 138: Newtonsoft.Json => 0x38f24a24 => 222
	i32 956575887, ; 139: Xamarin.Kotlin.StdLib.Jdk8.dll => 0x3904308f => 304
	i32 966729478, ; 140: Xamarin.Google.Crypto.Tink.Android => 0x399f1f06 => 297
	i32 967690846, ; 141: Xamarin.AndroidX.Lifecycle.Common.dll => 0x39adca5e => 260
	i32 971744099, ; 142: itext.barcodes.dll => 0x39eba363 => 174
	i32 975236339, ; 143: System.Diagnostics.Tracing => 0x3a20ecf3 => 34
	i32 975874589, ; 144: System.Xml.XDocument => 0x3a2aaa1d => 158
	i32 986514023, ; 145: System.Private.DataContractSerialization.dll => 0x3acd0267 => 85
	i32 987214855, ; 146: System.Diagnostics.Tools => 0x3ad7b407 => 32
	i32 992768348, ; 147: System.Collections.dll => 0x3b2c715c => 12
	i32 994442037, ; 148: System.IO.FileSystem => 0x3b45fb35 => 51
	i32 999186168, ; 149: Microsoft.Extensions.FileSystemGlobbing.dll => 0x3b8e5ef8 => 206
	i32 1001831731, ; 150: System.IO.UnmanagedMemoryStream.dll => 0x3bb6bd33 => 56
	i32 1012816738, ; 151: Xamarin.AndroidX.SavedState.dll => 0x3c5e5b62 => 280
	i32 1019214401, ; 152: System.Drawing => 0x3cbffa41 => 36
	i32 1028951442, ; 153: Microsoft.Extensions.DependencyInjection.Abstractions => 0x3d548d92 => 200
	i32 1029334545, ; 154: da/Microsoft.Maui.Controls.resources.dll => 0x3d5a6611 => 310
	i32 1031528504, ; 155: Xamarin.Google.ErrorProne.Annotations.dll => 0x3d7be038 => 298
	i32 1035644815, ; 156: Xamarin.AndroidX.AppCompat => 0x3dbaaf8f => 233
	i32 1036536393, ; 157: System.Drawing.Primitives.dll => 0x3dc84a49 => 35
	i32 1044663988, ; 158: System.Linq.Expressions.dll => 0x3e444eb4 => 58
	i32 1052210849, ; 159: Xamarin.AndroidX.Lifecycle.ViewModel.dll => 0x3eb776a1 => 267
	i32 1067306892, ; 160: GoogleGson => 0x3f9dcf8c => 173
	i32 1067609627, ; 161: itext.forms => 0x3fa26e1b => 176
	i32 1074246011, ; 162: itext.kernel.dll => 0x4007b17b => 178
	i32 1082857460, ; 163: System.ComponentModel.TypeConverter => 0x408b17f4 => 17
	i32 1084122840, ; 164: Xamarin.Kotlin.StdLib => 0x409e66d8 => 301
	i32 1098259244, ; 165: System => 0x41761b2c => 164
	i32 1099692271, ; 166: Microsoft.DotNet.PlatformAbstractions => 0x418bf8ef => 193
	i32 1106973742, ; 167: Microsoft.Extensions.Configuration.FileExtensions.dll => 0x41fb142e => 197
	i32 1118262833, ; 168: ko\Microsoft.Maui.Controls.resources => 0x42a75631 => 323
	i32 1121599056, ; 169: Xamarin.AndroidX.Lifecycle.Runtime.Ktx.dll => 0x42da3e50 => 266
	i32 1127624469, ; 170: Microsoft.Extensions.Logging.Debug => 0x43362f15 => 211
	i32 1149092582, ; 171: Xamarin.AndroidX.Window => 0x447dc2e6 => 293
	i32 1168523401, ; 172: pt\Microsoft.Maui.Controls.resources => 0x45a64089 => 329
	i32 1170634674, ; 173: System.Web.dll => 0x45c677b2 => 153
	i32 1173126369, ; 174: Microsoft.Extensions.FileProviders.Abstractions.dll => 0x45ec7ce1 => 202
	i32 1175144683, ; 175: Xamarin.AndroidX.VectorDrawable.Animated => 0x460b48eb => 289
	i32 1178241025, ; 176: Xamarin.AndroidX.Navigation.Runtime.dll => 0x463a8801 => 274
	i32 1203215381, ; 177: pl/Microsoft.Maui.Controls.resources.dll => 0x47b79c15 => 327
	i32 1204270330, ; 178: Xamarin.AndroidX.Arch.Core.Common => 0x47c7b4fa => 235
	i32 1208641965, ; 179: System.Diagnostics.Process => 0x480a69ad => 29
	i32 1219128291, ; 180: System.IO.IsolatedStorage => 0x48aa6be3 => 52
	i32 1222247595, ; 181: itext.pdfua.dll => 0x48da04ab => 181
	i32 1234928153, ; 182: nb/Microsoft.Maui.Controls.resources.dll => 0x499b8219 => 325
	i32 1243150071, ; 183: Xamarin.AndroidX.Window.Extensions.Core.Core.dll => 0x4a18f6f7 => 294
	i32 1245460359, ; 184: itext.svg => 0x4a3c3787 => 184
	i32 1250430400, ; 185: itext.commons.dll => 0x4a880dc0 => 185
	i32 1253011324, ; 186: Microsoft.Win32.Registry => 0x4aaf6f7c => 5
	i32 1260983243, ; 187: cs\Microsoft.Maui.Controls.resources => 0x4b2913cb => 309
	i32 1264511973, ; 188: Xamarin.AndroidX.Startup.StartupRuntime.dll => 0x4b5eebe5 => 284
	i32 1267360935, ; 189: Xamarin.AndroidX.VectorDrawable => 0x4b8a64a7 => 288
	i32 1273260888, ; 190: Xamarin.AndroidX.Collection.Ktx => 0x4be46b58 => 240
	i32 1275534314, ; 191: Xamarin.KotlinX.Coroutines.Android => 0x4c071bea => 305
	i32 1278448581, ; 192: Xamarin.AndroidX.Annotation.Jvm => 0x4c3393c5 => 232
	i32 1278779541, ; 193: itext.pdfa.dll => 0x4c38a095 => 180
	i32 1293217323, ; 194: Xamarin.AndroidX.DrawerLayout.dll => 0x4d14ee2b => 251
	i32 1309188875, ; 195: System.Private.DataContractSerialization => 0x4e08a30b => 85
	i32 1310192069, ; 196: PersonalFinanceExpenses => 0x4e17f1c5 => 0
	i32 1322716291, ; 197: Xamarin.AndroidX.Window.dll => 0x4ed70c83 => 293
	i32 1324164729, ; 198: System.Linq => 0x4eed2679 => 61
	i32 1335329327, ; 199: System.Runtime.Serialization.Json.dll => 0x4f97822f => 112
	i32 1364015309, ; 200: System.IO => 0x514d38cd => 57
	i32 1373134921, ; 201: zh-Hans\Microsoft.Maui.Controls.resources => 0x51d86049 => 339
	i32 1376866003, ; 202: Xamarin.AndroidX.SavedState => 0x52114ed3 => 280
	i32 1379779777, ; 203: System.Resources.ResourceManager => 0x523dc4c1 => 99
	i32 1402170036, ; 204: System.Configuration.dll => 0x53936ab4 => 19
	i32 1406073936, ; 205: Xamarin.AndroidX.CoordinatorLayout => 0x53cefc50 => 244
	i32 1408764838, ; 206: System.Runtime.Serialization.Formatters.dll => 0x53f80ba6 => 111
	i32 1411638395, ; 207: System.Runtime.CompilerServices.Unsafe => 0x5423e47b => 101
	i32 1422545099, ; 208: System.Runtime.CompilerServices.VisualC => 0x54ca50cb => 102
	i32 1430672901, ; 209: ar\Microsoft.Maui.Controls.resources => 0x55465605 => 307
	i32 1434145427, ; 210: System.Runtime.Handles => 0x557b5293 => 104
	i32 1435222561, ; 211: Xamarin.Google.Crypto.Tink.Android.dll => 0x558bc221 => 297
	i32 1439761251, ; 212: System.Net.Quic.dll => 0x55d10363 => 71
	i32 1452070440, ; 213: System.Formats.Asn1.dll => 0x568cd628 => 38
	i32 1453312822, ; 214: System.Diagnostics.Tools.dll => 0x569fcb36 => 32
	i32 1454105418, ; 215: Microsoft.Extensions.FileProviders.Composite => 0x56abe34a => 203
	i32 1457743152, ; 216: System.Runtime.Extensions.dll => 0x56e36530 => 103
	i32 1458022317, ; 217: System.Net.Security.dll => 0x56e7a7ad => 73
	i32 1461004990, ; 218: es\Microsoft.Maui.Controls.resources => 0x57152abe => 313
	i32 1461234159, ; 219: System.Collections.Immutable.dll => 0x5718a9ef => 9
	i32 1461719063, ; 220: System.Security.Cryptography.OpenSsl => 0x57201017 => 123
	i32 1462112819, ; 221: System.IO.Compression.dll => 0x57261233 => 46
	i32 1469204771, ; 222: Xamarin.AndroidX.AppCompat.AppCompatResources => 0x57924923 => 234
	i32 1470490898, ; 223: Microsoft.Extensions.Primitives => 0x57a5e912 => 213
	i32 1479771757, ; 224: System.Collections.Immutable => 0x5833866d => 9
	i32 1480492111, ; 225: System.IO.Compression.Brotli.dll => 0x583e844f => 43
	i32 1487239319, ; 226: Microsoft.Win32.Primitives => 0x58a57897 => 4
	i32 1488664300, ; 227: itext.bouncy-castle-connector.dll => 0x58bb36ec => 175
	i32 1490025113, ; 228: Xamarin.AndroidX.SavedState.SavedState.Ktx.dll => 0x58cffa99 => 281
	i32 1493001747, ; 229: hi/Microsoft.Maui.Controls.resources.dll => 0x58fd6613 => 317
	i32 1514721132, ; 230: el/Microsoft.Maui.Controls.resources.dll => 0x5a48cf6c => 312
	i32 1521091094, ; 231: Microsoft.Extensions.FileSystemGlobbing => 0x5aaa0216 => 206
	i32 1536373174, ; 232: System.Diagnostics.TextWriterTraceListener => 0x5b9331b6 => 31
	i32 1543031311, ; 233: System.Text.RegularExpressions.dll => 0x5bf8ca0f => 138
	i32 1543355203, ; 234: System.Reflection.Emit.dll => 0x5bfdbb43 => 92
	i32 1546581739, ; 235: Microsoft.AspNetCore.Components.WebView.Maui.dll => 0x5c2ef6eb => 191
	i32 1550322496, ; 236: System.Reflection.Extensions.dll => 0x5c680b40 => 93
	i32 1551623176, ; 237: sk/Microsoft.Maui.Controls.resources.dll => 0x5c7be408 => 332
	i32 1565862583, ; 238: System.IO.FileSystem.Primitives => 0x5d552ab7 => 49
	i32 1566207040, ; 239: System.Threading.Tasks.Dataflow.dll => 0x5d5a6c40 => 141
	i32 1573704789, ; 240: System.Runtime.Serialization.Json => 0x5dccd455 => 112
	i32 1580037396, ; 241: System.Threading.Overlapped => 0x5e2d7514 => 140
	i32 1582372066, ; 242: Xamarin.AndroidX.DocumentFile.dll => 0x5e5114e2 => 250
	i32 1592978981, ; 243: System.Runtime.Serialization.dll => 0x5ef2ee25 => 115
	i32 1597949149, ; 244: Xamarin.Google.ErrorProne.Annotations => 0x5f3ec4dd => 298
	i32 1601112923, ; 245: System.Xml.Serialization => 0x5f6f0b5b => 157
	i32 1604827217, ; 246: System.Net.WebClient => 0x5fa7b851 => 76
	i32 1618516317, ; 247: System.Net.WebSockets.Client.dll => 0x6078995d => 79
	i32 1622152042, ; 248: Xamarin.AndroidX.Loader.dll => 0x60b0136a => 270
	i32 1622358360, ; 249: System.Dynamic.Runtime => 0x60b33958 => 37
	i32 1624863272, ; 250: Xamarin.AndroidX.ViewPager2 => 0x60d97228 => 292
	i32 1632842087, ; 251: Microsoft.Extensions.Configuration.Json => 0x61533167 => 198
	i32 1635184631, ; 252: Xamarin.AndroidX.Emoji2.ViewsHelper => 0x6176eff7 => 254
	i32 1636350590, ; 253: Xamarin.AndroidX.CursorAdapter => 0x6188ba7e => 247
	i32 1639515021, ; 254: System.Net.Http.dll => 0x61b9038d => 64
	i32 1639986890, ; 255: System.Text.RegularExpressions => 0x61c036ca => 138
	i32 1641389582, ; 256: System.ComponentModel.EventBasedAsync.dll => 0x61d59e0e => 15
	i32 1654881142, ; 257: Microsoft.AspNetCore.Components.WebView => 0x62a37b76 => 190
	i32 1657153582, ; 258: System.Runtime => 0x62c6282e => 116
	i32 1658241508, ; 259: Xamarin.AndroidX.Tracing.Tracing.dll => 0x62d6c1e4 => 286
	i32 1658251792, ; 260: Xamarin.Google.Android.Material.dll => 0x62d6ea10 => 295
	i32 1670060433, ; 261: Xamarin.AndroidX.ConstraintLayout => 0x638b1991 => 242
	i32 1672083785, ; 262: itext.pdfa => 0x63a9f949 => 180
	i32 1675553242, ; 263: System.IO.FileSystem.DriveInfo.dll => 0x63dee9da => 48
	i32 1677501392, ; 264: System.Net.Primitives.dll => 0x63fca3d0 => 70
	i32 1678508291, ; 265: System.Net.WebSockets => 0x640c0103 => 80
	i32 1679769178, ; 266: System.Security.Cryptography => 0x641f3e5a => 126
	i32 1691477237, ; 267: System.Reflection.Metadata => 0x64d1e4f5 => 94
	i32 1696967625, ; 268: System.Security.Cryptography.Csp => 0x6525abc9 => 121
	i32 1698840827, ; 269: Xamarin.Kotlin.StdLib.Common => 0x654240fb => 302
	i32 1701541528, ; 270: System.Diagnostics.Debug.dll => 0x656b7698 => 26
	i32 1720223769, ; 271: Xamarin.AndroidX.Lifecycle.LiveData.Core.Ktx => 0x66888819 => 263
	i32 1726116996, ; 272: System.Reflection.dll => 0x66e27484 => 97
	i32 1728033016, ; 273: System.Diagnostics.FileVersionInfo.dll => 0x66ffb0f8 => 28
	i32 1729485958, ; 274: Xamarin.AndroidX.CardView.dll => 0x6715dc86 => 238
	i32 1736233607, ; 275: ro/Microsoft.Maui.Controls.resources.dll => 0x677cd287 => 330
	i32 1743415430, ; 276: ca\Microsoft.Maui.Controls.resources => 0x67ea6886 => 308
	i32 1744735666, ; 277: System.Transactions.Local.dll => 0x67fe8db2 => 149
	i32 1746115085, ; 278: System.IO.Pipelines.dll => 0x68139a0d => 223
	i32 1746316138, ; 279: Mono.Android.Export => 0x6816ab6a => 169
	i32 1750313021, ; 280: Microsoft.Win32.Primitives.dll => 0x6853a83d => 4
	i32 1758240030, ; 281: System.Resources.Reader.dll => 0x68cc9d1e => 98
	i32 1760259689, ; 282: Microsoft.AspNetCore.Components.Web.dll => 0x68eb6e69 => 189
	i32 1763938596, ; 283: System.Diagnostics.TraceSource.dll => 0x69239124 => 33
	i32 1765942094, ; 284: System.Reflection.Extensions => 0x6942234e => 93
	i32 1766324549, ; 285: Xamarin.AndroidX.SwipeRefreshLayout => 0x6947f945 => 285
	i32 1770582343, ; 286: Microsoft.Extensions.Logging.dll => 0x6988f147 => 209
	i32 1776026572, ; 287: System.Core.dll => 0x69dc03cc => 21
	i32 1777075843, ; 288: System.Globalization.Extensions.dll => 0x69ec0683 => 41
	i32 1780572499, ; 289: Mono.Android.Runtime.dll => 0x6a216153 => 170
	i32 1782862114, ; 290: ms\Microsoft.Maui.Controls.resources => 0x6a445122 => 324
	i32 1788241197, ; 291: Xamarin.AndroidX.Fragment => 0x6a96652d => 256
	i32 1793755602, ; 292: he\Microsoft.Maui.Controls.resources => 0x6aea89d2 => 316
	i32 1808609942, ; 293: Xamarin.AndroidX.Loader => 0x6bcd3296 => 270
	i32 1813058853, ; 294: Xamarin.Kotlin.StdLib.dll => 0x6c111525 => 301
	i32 1813201214, ; 295: Xamarin.Google.Android.Material => 0x6c13413e => 295
	i32 1818569960, ; 296: Xamarin.AndroidX.Navigation.UI.dll => 0x6c652ce8 => 275
	i32 1818787751, ; 297: Microsoft.VisualBasic.Core => 0x6c687fa7 => 2
	i32 1824175904, ; 298: System.Text.Encoding.Extensions => 0x6cbab720 => 134
	i32 1824722060, ; 299: System.Runtime.Serialization.Formatters => 0x6cc30c8c => 111
	i32 1828688058, ; 300: Microsoft.Extensions.Logging.Abstractions.dll => 0x6cff90ba => 210
	i32 1842015223, ; 301: uk/Microsoft.Maui.Controls.resources.dll => 0x6dcaebf7 => 336
	i32 1847515442, ; 302: Xamarin.Android.Glide.Annotations => 0x6e1ed932 => 225
	i32 1853025655, ; 303: sv\Microsoft.Maui.Controls.resources => 0x6e72ed77 => 333
	i32 1858542181, ; 304: System.Linq.Expressions => 0x6ec71a65 => 58
	i32 1870277092, ; 305: System.Reflection.Primitives => 0x6f7a29e4 => 95
	i32 1875935024, ; 306: fr\Microsoft.Maui.Controls.resources => 0x6fd07f30 => 315
	i32 1879696579, ; 307: System.Formats.Tar.dll => 0x7009e4c3 => 39
	i32 1885316902, ; 308: Xamarin.AndroidX.Arch.Core.Runtime.dll => 0x705fa726 => 236
	i32 1888955245, ; 309: System.Diagnostics.Contracts => 0x70972b6d => 25
	i32 1889954781, ; 310: System.Reflection.Metadata.dll => 0x70a66bdd => 94
	i32 1894524299, ; 311: Microsoft.DotNet.PlatformAbstractions.dll => 0x70ec258b => 193
	i32 1898237753, ; 312: System.Reflection.DispatchProxy => 0x7124cf39 => 89
	i32 1900610850, ; 313: System.Resources.ResourceManager.dll => 0x71490522 => 99
	i32 1910275211, ; 314: System.Collections.NonGeneric.dll => 0x71dc7c8b => 10
	i32 1939592360, ; 315: System.Private.Xml.Linq => 0x739bd4a8 => 87
	i32 1956758971, ; 316: System.Resources.Writer => 0x74a1c5bb => 100
	i32 1961813231, ; 317: Xamarin.AndroidX.Security.SecurityCrypto.dll => 0x74eee4ef => 282
	i32 1968388702, ; 318: Microsoft.Extensions.Configuration.dll => 0x75533a5e => 194
	i32 1983156543, ; 319: Xamarin.Kotlin.StdLib.Common.dll => 0x7634913f => 302
	i32 1985761444, ; 320: Xamarin.Android.Glide.GifDecoder => 0x765c50a4 => 227
	i32 2003115576, ; 321: el\Microsoft.Maui.Controls.resources => 0x77651e38 => 312
	i32 2011961780, ; 322: System.Buffers.dll => 0x77ec19b4 => 7
	i32 2019465201, ; 323: Xamarin.AndroidX.Lifecycle.ViewModel => 0x785e97f1 => 267
	i32 2025202353, ; 324: ar/Microsoft.Maui.Controls.resources.dll => 0x78b622b1 => 307
	i32 2031763787, ; 325: Xamarin.Android.Glide => 0x791a414b => 224
	i32 2045470958, ; 326: System.Private.Xml => 0x79eb68ee => 88
	i32 2045845235, ; 327: itext.pdfua => 0x79f11ef3 => 181
	i32 2048278909, ; 328: Microsoft.Extensions.Configuration.Binder.dll => 0x7a16417d => 196
	i32 2055257422, ; 329: Xamarin.AndroidX.Lifecycle.LiveData.Core.dll => 0x7a80bd4e => 262
	i32 2060060697, ; 330: System.Windows.dll => 0x7aca0819 => 154
	i32 2066184531, ; 331: de\Microsoft.Maui.Controls.resources => 0x7b277953 => 311
	i32 2070888862, ; 332: System.Diagnostics.TraceSource => 0x7b6f419e => 33
	i32 2072397586, ; 333: Microsoft.Extensions.FileProviders.Physical => 0x7b864712 => 205
	i32 2079903147, ; 334: System.Runtime.dll => 0x7bf8cdab => 116
	i32 2090596640, ; 335: System.Numerics.Vectors => 0x7c9bf920 => 82
	i32 2127167465, ; 336: System.Console => 0x7ec9ffe9 => 20
	i32 2142473426, ; 337: System.Collections.Specialized => 0x7fb38cd2 => 11
	i32 2143790110, ; 338: System.Xml.XmlSerializer.dll => 0x7fc7a41e => 162
	i32 2146852085, ; 339: Microsoft.VisualBasic.dll => 0x7ff65cf5 => 3
	i32 2159891885, ; 340: Microsoft.Maui => 0x80bd55ad => 218
	i32 2169148018, ; 341: hu\Microsoft.Maui.Controls.resources => 0x814a9272 => 319
	i32 2181898931, ; 342: Microsoft.Extensions.Options.dll => 0x820d22b3 => 212
	i32 2192057212, ; 343: Microsoft.Extensions.Logging.Abstractions => 0x82a8237c => 210
	i32 2193016926, ; 344: System.ObjectModel.dll => 0x82b6c85e => 84
	i32 2197979891, ; 345: Microsoft.Extensions.DependencyModel.dll => 0x830282f3 => 201
	i32 2201107256, ; 346: Xamarin.KotlinX.Coroutines.Core.Jvm.dll => 0x83323b38 => 306
	i32 2201231467, ; 347: System.Net.Http => 0x8334206b => 64
	i32 2207618523, ; 348: it\Microsoft.Maui.Controls.resources => 0x839595db => 321
	i32 2217644978, ; 349: Xamarin.AndroidX.VectorDrawable.Animated.dll => 0x842e93b2 => 289
	i32 2222056684, ; 350: System.Threading.Tasks.Parallel => 0x8471e4ec => 143
	i32 2244775296, ; 351: Xamarin.AndroidX.LocalBroadcastManager => 0x85cc8d80 => 271
	i32 2252106437, ; 352: System.Xml.Serialization.dll => 0x863c6ac5 => 157
	i32 2256313426, ; 353: System.Globalization.Extensions => 0x867c9c52 => 41
	i32 2265110946, ; 354: System.Security.AccessControl.dll => 0x8702d9a2 => 117
	i32 2266799131, ; 355: Microsoft.Extensions.Configuration.Abstractions => 0x871c9c1b => 195
	i32 2267999099, ; 356: Xamarin.Android.Glide.DiskLruCache.dll => 0x872eeb7b => 226
	i32 2270573516, ; 357: fr/Microsoft.Maui.Controls.resources.dll => 0x875633cc => 315
	i32 2279755925, ; 358: Xamarin.AndroidX.RecyclerView.dll => 0x87e25095 => 278
	i32 2293034957, ; 359: System.ServiceModel.Web.dll => 0x88acefcd => 131
	i32 2295906218, ; 360: System.Net.Sockets => 0x88d8bfaa => 75
	i32 2298471582, ; 361: System.Net.Mail => 0x88ffe49e => 66
	i32 2303942373, ; 362: nb\Microsoft.Maui.Controls.resources => 0x89535ee5 => 325
	i32 2305521784, ; 363: System.Private.CoreLib.dll => 0x896b7878 => 172
	i32 2315684594, ; 364: Xamarin.AndroidX.Annotation.dll => 0x8a068af2 => 230
	i32 2320631194, ; 365: System.Threading.Tasks.Parallel.dll => 0x8a52059a => 143
	i32 2340441535, ; 366: System.Runtime.InteropServices.RuntimeInformation.dll => 0x8b804dbf => 106
	i32 2344264397, ; 367: System.ValueTuple => 0x8bbaa2cd => 151
	i32 2353062107, ; 368: System.Net.Primitives => 0x8c40e0db => 70
	i32 2368005991, ; 369: System.Xml.ReaderWriter.dll => 0x8d24e767 => 156
	i32 2371007202, ; 370: Microsoft.Extensions.Configuration => 0x8d52b2e2 => 194
	i32 2378619854, ; 371: System.Security.Cryptography.Csp.dll => 0x8dc6dbce => 121
	i32 2383496789, ; 372: System.Security.Principal.Windows.dll => 0x8e114655 => 127
	i32 2395872292, ; 373: id\Microsoft.Maui.Controls.resources => 0x8ece1c24 => 320
	i32 2401565422, ; 374: System.Web.HttpUtility => 0x8f24faee => 152
	i32 2403452196, ; 375: Xamarin.AndroidX.Emoji2.dll => 0x8f41c524 => 253
	i32 2411328690, ; 376: Microsoft.AspNetCore.Components => 0x8fb9f4b2 => 187
	i32 2421380589, ; 377: System.Threading.Tasks.Dataflow => 0x905355ed => 141
	i32 2423080555, ; 378: Xamarin.AndroidX.Collection.Ktx.dll => 0x906d466b => 240
	i32 2427813419, ; 379: hi\Microsoft.Maui.Controls.resources => 0x90b57e2b => 317
	i32 2435356389, ; 380: System.Console.dll => 0x912896e5 => 20
	i32 2435904999, ; 381: System.ComponentModel.DataAnnotations.dll => 0x9130f5e7 => 14
	i32 2442556106, ; 382: Microsoft.JSInterop.dll => 0x919672ca => 214
	i32 2454642406, ; 383: System.Text.Encoding.dll => 0x924edee6 => 135
	i32 2458678730, ; 384: System.Net.Sockets.dll => 0x928c75ca => 75
	i32 2459001652, ; 385: System.Linq.Parallel.dll => 0x92916334 => 59
	i32 2465532216, ; 386: Xamarin.AndroidX.ConstraintLayout.Core.dll => 0x92f50938 => 243
	i32 2471841756, ; 387: netstandard.dll => 0x93554fdc => 167
	i32 2475788418, ; 388: Java.Interop.dll => 0x93918882 => 168
	i32 2480646305, ; 389: Microsoft.Maui.Controls => 0x93dba8a1 => 216
	i32 2483903535, ; 390: System.ComponentModel.EventBasedAsync => 0x940d5c2f => 15
	i32 2484371297, ; 391: System.Net.ServicePoint => 0x94147f61 => 74
	i32 2490993605, ; 392: System.AppContext.dll => 0x94798bc5 => 6
	i32 2501346920, ; 393: System.Data.DataSetExtensions => 0x95178668 => 23
	i32 2505896520, ; 394: Xamarin.AndroidX.Lifecycle.Runtime.dll => 0x955cf248 => 265
	i32 2522472828, ; 395: Xamarin.Android.Glide.dll => 0x9659e17c => 224
	i32 2537015816, ; 396: Microsoft.AspNetCore.Authorization => 0x9737ca08 => 186
	i32 2538310050, ; 397: System.Reflection.Emit.Lightweight.dll => 0x974b89a2 => 91
	i32 2550873716, ; 398: hr\Microsoft.Maui.Controls.resources => 0x980b3e74 => 318
	i32 2562349572, ; 399: Microsoft.CSharp => 0x98ba5a04 => 1
	i32 2566497382, ; 400: itext.bouncy-castle-connector => 0x98f9a466 => 175
	i32 2570120770, ; 401: System.Text.Encodings.Web => 0x9930ee42 => 136
	i32 2573607077, ; 402: itext.kernel => 0x996620a5 => 178
	i32 2581783588, ; 403: Xamarin.AndroidX.Lifecycle.Runtime.Ktx => 0x99e2e424 => 266
	i32 2581819634, ; 404: Xamarin.AndroidX.VectorDrawable.dll => 0x99e370f2 => 288
	i32 2585220780, ; 405: System.Text.Encoding.Extensions.dll => 0x9a1756ac => 134
	i32 2585805581, ; 406: System.Net.Ping => 0x9a20430d => 69
	i32 2585813321, ; 407: Microsoft.AspNetCore.Components.Forms => 0x9a206149 => 188
	i32 2589602615, ; 408: System.Threading.ThreadPool => 0x9a5a3337 => 146
	i32 2592341985, ; 409: Microsoft.Extensions.FileProviders.Abstractions => 0x9a83ffe1 => 202
	i32 2593496499, ; 410: pl\Microsoft.Maui.Controls.resources => 0x9a959db3 => 327
	i32 2605712449, ; 411: Xamarin.KotlinX.Coroutines.Core.Jvm => 0x9b500441 => 306
	i32 2615233544, ; 412: Xamarin.AndroidX.Fragment.Ktx => 0x9be14c08 => 257
	i32 2616218305, ; 413: Microsoft.Extensions.Logging.Debug.dll => 0x9bf052c1 => 211
	i32 2617129537, ; 414: System.Private.Xml.dll => 0x9bfe3a41 => 88
	i32 2618712057, ; 415: System.Reflection.TypeExtensions.dll => 0x9c165ff9 => 96
	i32 2620871830, ; 416: Xamarin.AndroidX.CursorAdapter.dll => 0x9c375496 => 247
	i32 2624644809, ; 417: Xamarin.AndroidX.DynamicAnimation => 0x9c70e6c9 => 252
	i32 2626831493, ; 418: ja\Microsoft.Maui.Controls.resources => 0x9c924485 => 322
	i32 2627185994, ; 419: System.Diagnostics.TextWriterTraceListener.dll => 0x9c97ad4a => 31
	i32 2629843544, ; 420: System.IO.Compression.ZipFile.dll => 0x9cc03a58 => 45
	i32 2633051222, ; 421: Xamarin.AndroidX.Lifecycle.LiveData => 0x9cf12c56 => 261
	i32 2663391936, ; 422: Xamarin.Android.Glide.DiskLruCache => 0x9ec022c0 => 226
	i32 2663698177, ; 423: System.Runtime.Loader => 0x9ec4cf01 => 109
	i32 2664396074, ; 424: System.Xml.XDocument.dll => 0x9ecf752a => 158
	i32 2665622720, ; 425: System.Drawing.Primitives => 0x9ee22cc0 => 35
	i32 2676780864, ; 426: System.Data.Common.dll => 0x9f8c6f40 => 22
	i32 2686887180, ; 427: System.Runtime.Serialization.Xml.dll => 0xa026a50c => 114
	i32 2692077919, ; 428: Microsoft.AspNetCore.Components.WebView.dll => 0xa075d95f => 190
	i32 2693849962, ; 429: System.IO.dll => 0xa090e36a => 57
	i32 2701096212, ; 430: Xamarin.AndroidX.Tracing.Tracing => 0xa0ff7514 => 286
	i32 2715334215, ; 431: System.Threading.Tasks.dll => 0xa1d8b647 => 144
	i32 2717744543, ; 432: System.Security.Claims => 0xa1fd7d9f => 118
	i32 2719963679, ; 433: System.Security.Cryptography.Cng.dll => 0xa21f5a1f => 120
	i32 2724373263, ; 434: System.Runtime.Numerics.dll => 0xa262a30f => 110
	i32 2732626843, ; 435: Xamarin.AndroidX.Activity => 0xa2e0939b => 228
	i32 2735172069, ; 436: System.Threading.Channels => 0xa30769e5 => 139
	i32 2735631878, ; 437: Microsoft.AspNetCore.Authorization.dll => 0xa30e6e06 => 186
	i32 2737747696, ; 438: Xamarin.AndroidX.AppCompat.AppCompatResources.dll => 0xa32eb6f0 => 234
	i32 2740948882, ; 439: System.IO.Pipes.AccessControl => 0xa35f8f92 => 54
	i32 2748088231, ; 440: System.Runtime.InteropServices.JavaScript => 0xa3cc7fa7 => 105
	i32 2752995522, ; 441: pt-BR\Microsoft.Maui.Controls.resources => 0xa41760c2 => 328
	i32 2758225723, ; 442: Microsoft.Maui.Controls.Xaml => 0xa4672f3b => 217
	i32 2764765095, ; 443: Microsoft.Maui.dll => 0xa4caf7a7 => 218
	i32 2765824710, ; 444: System.Text.Encoding.CodePages.dll => 0xa4db22c6 => 133
	i32 2770495804, ; 445: Xamarin.Jetbrains.Annotations.dll => 0xa522693c => 300
	i32 2778768386, ; 446: Xamarin.AndroidX.ViewPager.dll => 0xa5a0a402 => 291
	i32 2779977773, ; 447: Xamarin.AndroidX.ResourceInspection.Annotation.dll => 0xa5b3182d => 279
	i32 2785988530, ; 448: th\Microsoft.Maui.Controls.resources => 0xa60ecfb2 => 334
	i32 2788224221, ; 449: Xamarin.AndroidX.Fragment.Ktx.dll => 0xa630ecdd => 257
	i32 2801831435, ; 450: Microsoft.Maui.Graphics => 0xa7008e0b => 220
	i32 2803228030, ; 451: System.Xml.XPath.XDocument.dll => 0xa715dd7e => 159
	i32 2806116107, ; 452: es/Microsoft.Maui.Controls.resources.dll => 0xa741ef0b => 313
	i32 2810250172, ; 453: Xamarin.AndroidX.CoordinatorLayout.dll => 0xa78103bc => 244
	i32 2819470561, ; 454: System.Xml.dll => 0xa80db4e1 => 163
	i32 2820942282, ; 455: MudBlazor.dll => 0xa82429ca => 221
	i32 2821205001, ; 456: System.ServiceProcess.dll => 0xa8282c09 => 132
	i32 2821294376, ; 457: Xamarin.AndroidX.ResourceInspection.Annotation => 0xa8298928 => 279
	i32 2824502124, ; 458: System.Xml.XmlDocument => 0xa85a7b6c => 161
	i32 2831556043, ; 459: nl/Microsoft.Maui.Controls.resources.dll => 0xa8c61dcb => 326
	i32 2833784645, ; 460: Microsoft.AspNetCore.Metadata => 0xa8e81f45 => 192
	i32 2838993487, ; 461: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx.dll => 0xa9379a4f => 268
	i32 2849599387, ; 462: System.Threading.Overlapped.dll => 0xa9d96f9b => 140
	i32 2853208004, ; 463: Xamarin.AndroidX.ViewPager => 0xaa107fc4 => 291
	i32 2855708567, ; 464: Xamarin.AndroidX.Transition => 0xaa36a797 => 287
	i32 2861098320, ; 465: Mono.Android.Export.dll => 0xaa88e550 => 169
	i32 2861189240, ; 466: Microsoft.Maui.Essentials => 0xaa8a4878 => 219
	i32 2870099610, ; 467: Xamarin.AndroidX.Activity.Ktx.dll => 0xab123e9a => 229
	i32 2875164099, ; 468: Jsr305Binding.dll => 0xab5f85c3 => 296
	i32 2875220617, ; 469: System.Globalization.Calendars.dll => 0xab606289 => 40
	i32 2884993177, ; 470: Xamarin.AndroidX.ExifInterface => 0xabf58099 => 255
	i32 2887636118, ; 471: System.Net.dll => 0xac1dd496 => 81
	i32 2892341533, ; 472: Microsoft.AspNetCore.Components.Web => 0xac65a11d => 189
	i32 2899753641, ; 473: System.IO.UnmanagedMemoryStream => 0xacd6baa9 => 56
	i32 2900621748, ; 474: System.Dynamic.Runtime.dll => 0xace3f9b4 => 37
	i32 2901442782, ; 475: System.Reflection => 0xacf080de => 97
	i32 2905242038, ; 476: mscorlib.dll => 0xad2a79b6 => 166
	i32 2908639175, ; 477: itext.sign => 0xad5e4fc7 => 182
	i32 2909740682, ; 478: System.Private.CoreLib => 0xad6f1e8a => 172
	i32 2911054922, ; 479: Microsoft.Extensions.FileProviders.Physical.dll => 0xad832c4a => 205
	i32 2916838712, ; 480: Xamarin.AndroidX.ViewPager2.dll => 0xaddb6d38 => 292
	i32 2919462931, ; 481: System.Numerics.Vectors.dll => 0xae037813 => 82
	i32 2921128767, ; 482: Xamarin.AndroidX.Annotation.Experimental.dll => 0xae1ce33f => 231
	i32 2936416060, ; 483: System.Resources.Reader => 0xaf06273c => 98
	i32 2940926066, ; 484: System.Diagnostics.StackTrace.dll => 0xaf4af872 => 30
	i32 2942453041, ; 485: System.Xml.XPath.XDocument => 0xaf624531 => 159
	i32 2959614098, ; 486: System.ComponentModel.dll => 0xb0682092 => 18
	i32 2968338931, ; 487: System.Security.Principal.Windows => 0xb0ed41f3 => 127
	i32 2972252294, ; 488: System.Security.Cryptography.Algorithms.dll => 0xb128f886 => 119
	i32 2978675010, ; 489: Xamarin.AndroidX.DrawerLayout => 0xb18af942 => 251
	i32 2987532451, ; 490: Xamarin.AndroidX.Security.SecurityCrypto => 0xb21220a3 => 282
	i32 2996846495, ; 491: Xamarin.AndroidX.Lifecycle.Process.dll => 0xb2a03f9f => 264
	i32 3016983068, ; 492: Xamarin.AndroidX.Startup.StartupRuntime => 0xb3d3821c => 284
	i32 3023353419, ; 493: WindowsBase.dll => 0xb434b64b => 165
	i32 3024354802, ; 494: Xamarin.AndroidX.Legacy.Support.Core.Utils => 0xb443fdf2 => 259
	i32 3038032645, ; 495: _Microsoft.Android.Resource.Designer.dll => 0xb514b305 => 341
	i32 3056245963, ; 496: Xamarin.AndroidX.SavedState.SavedState.Ktx => 0xb62a9ccb => 281
	i32 3057625584, ; 497: Xamarin.AndroidX.Navigation.Common => 0xb63fa9f0 => 272
	i32 3059408633, ; 498: Mono.Android.Runtime => 0xb65adef9 => 170
	i32 3059793426, ; 499: System.ComponentModel.Primitives => 0xb660be12 => 16
	i32 3060069052, ; 500: MudBlazor => 0xb664f2bc => 221
	i32 3075834255, ; 501: System.Threading.Tasks => 0xb755818f => 144
	i32 3077302341, ; 502: hu/Microsoft.Maui.Controls.resources.dll => 0xb76be845 => 319
	i32 3090735792, ; 503: System.Security.Cryptography.X509Certificates.dll => 0xb838e2b0 => 125
	i32 3099732863, ; 504: System.Security.Claims.dll => 0xb8c22b7f => 118
	i32 3103600923, ; 505: System.Formats.Asn1 => 0xb8fd311b => 38
	i32 3111772706, ; 506: System.Runtime.Serialization => 0xb979e222 => 115
	i32 3121463068, ; 507: System.IO.FileSystem.AccessControl.dll => 0xba0dbf1c => 47
	i32 3124832203, ; 508: System.Threading.Tasks.Extensions => 0xba4127cb => 142
	i32 3132293585, ; 509: System.Security.AccessControl => 0xbab301d1 => 117
	i32 3146401616, ; 510: itext.styledxmlparser => 0xbb8a4750 => 183
	i32 3147165239, ; 511: System.Diagnostics.Tracing.dll => 0xbb95ee37 => 34
	i32 3148237826, ; 512: GoogleGson.dll => 0xbba64c02 => 173
	i32 3159123045, ; 513: System.Reflection.Primitives.dll => 0xbc4c6465 => 95
	i32 3160747431, ; 514: System.IO.MemoryMappedFiles => 0xbc652da7 => 53
	i32 3178803400, ; 515: Xamarin.AndroidX.Navigation.Fragment.dll => 0xbd78b0c8 => 273
	i32 3192346100, ; 516: System.Security.SecureString => 0xbe4755f4 => 129
	i32 3193515020, ; 517: System.Web => 0xbe592c0c => 153
	i32 3204380047, ; 518: System.Data.dll => 0xbefef58f => 24
	i32 3209718065, ; 519: System.Xml.XmlDocument.dll => 0xbf506931 => 161
	i32 3211777861, ; 520: Xamarin.AndroidX.DocumentFile => 0xbf6fd745 => 250
	i32 3220365878, ; 521: System.Threading => 0xbff2e236 => 148
	i32 3226221578, ; 522: System.Runtime.Handles.dll => 0xc04c3c0a => 104
	i32 3251039220, ; 523: System.Reflection.DispatchProxy.dll => 0xc1c6ebf4 => 89
	i32 3254221973, ; 524: PersonalFinanceExpenses.dll => 0xc1f77c95 => 0
	i32 3258312781, ; 525: Xamarin.AndroidX.CardView => 0xc235e84d => 238
	i32 3265493905, ; 526: System.Linq.Queryable.dll => 0xc2a37b91 => 60
	i32 3265893370, ; 527: System.Threading.Tasks.Extensions.dll => 0xc2a993fa => 142
	i32 3277815716, ; 528: System.Resources.Writer.dll => 0xc35f7fa4 => 100
	i32 3279906254, ; 529: Microsoft.Win32.Registry.dll => 0xc37f65ce => 5
	i32 3280506390, ; 530: System.ComponentModel.Annotations.dll => 0xc3888e16 => 13
	i32 3290767353, ; 531: System.Security.Cryptography.Encoding => 0xc4251ff9 => 122
	i32 3299363146, ; 532: System.Text.Encoding => 0xc4a8494a => 135
	i32 3303498502, ; 533: System.Diagnostics.FileVersionInfo => 0xc4e76306 => 28
	i32 3305363605, ; 534: fi\Microsoft.Maui.Controls.resources => 0xc503d895 => 314
	i32 3316684772, ; 535: System.Net.Requests.dll => 0xc5b097e4 => 72
	i32 3317135071, ; 536: Xamarin.AndroidX.CustomView.dll => 0xc5b776df => 248
	i32 3317144872, ; 537: System.Data => 0xc5b79d28 => 24
	i32 3340431453, ; 538: Xamarin.AndroidX.Arch.Core.Runtime => 0xc71af05d => 236
	i32 3342793838, ; 539: itext.barcodes => 0xc73efc6e => 174
	i32 3345895724, ; 540: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller.dll => 0xc76e512c => 277
	i32 3346324047, ; 541: Xamarin.AndroidX.Navigation.Runtime => 0xc774da4f => 274
	i32 3357674450, ; 542: ru\Microsoft.Maui.Controls.resources => 0xc8220bd2 => 331
	i32 3358260929, ; 543: System.Text.Json => 0xc82afec1 => 137
	i32 3362336904, ; 544: Xamarin.AndroidX.Activity.Ktx => 0xc8693088 => 229
	i32 3362522851, ; 545: Xamarin.AndroidX.Core => 0xc86c06e3 => 245
	i32 3366347497, ; 546: Java.Interop => 0xc8a662e9 => 168
	i32 3374999561, ; 547: Xamarin.AndroidX.RecyclerView => 0xc92a6809 => 278
	i32 3381016424, ; 548: da\Microsoft.Maui.Controls.resources => 0xc9863768 => 310
	i32 3395150330, ; 549: System.Runtime.CompilerServices.Unsafe.dll => 0xca5de1fa => 101
	i32 3403906625, ; 550: System.Security.Cryptography.OpenSsl.dll => 0xcae37e41 => 123
	i32 3405233483, ; 551: Xamarin.AndroidX.CustomView.PoolingContainer => 0xcaf7bd4b => 249
	i32 3406629867, ; 552: Microsoft.Extensions.FileProviders.Composite.dll => 0xcb0d0beb => 203
	i32 3421170118, ; 553: Microsoft.Extensions.Configuration.Binder => 0xcbeae9c6 => 196
	i32 3428513518, ; 554: Microsoft.Extensions.DependencyInjection.dll => 0xcc5af6ee => 199
	i32 3429136800, ; 555: System.Xml => 0xcc6479a0 => 163
	i32 3430777524, ; 556: netstandard => 0xcc7d82b4 => 167
	i32 3441283291, ; 557: Xamarin.AndroidX.DynamicAnimation.dll => 0xcd1dd0db => 252
	i32 3445260447, ; 558: System.Formats.Tar => 0xcd5a809f => 39
	i32 3452344032, ; 559: Microsoft.Maui.Controls.Compatibility.dll => 0xcdc696e0 => 215
	i32 3463511458, ; 560: hr/Microsoft.Maui.Controls.resources.dll => 0xce70fda2 => 318
	i32 3464190856, ; 561: Microsoft.AspNetCore.Components.Forms.dll => 0xce7b5b88 => 188
	i32 3471940407, ; 562: System.ComponentModel.TypeConverter.dll => 0xcef19b37 => 17
	i32 3476120550, ; 563: Mono.Android => 0xcf3163e6 => 171
	i32 3479583265, ; 564: ru/Microsoft.Maui.Controls.resources.dll => 0xcf663a21 => 331
	i32 3484440000, ; 565: ro\Microsoft.Maui.Controls.resources => 0xcfb055c0 => 330
	i32 3485117614, ; 566: System.Text.Json.dll => 0xcfbaacae => 137
	i32 3486566296, ; 567: System.Transactions => 0xcfd0c798 => 150
	i32 3493954962, ; 568: Xamarin.AndroidX.Concurrent.Futures.dll => 0xd0418592 => 241
	i32 3500000672, ; 569: Microsoft.JSInterop => 0xd09dc5a0 => 214
	i32 3509114376, ; 570: System.Xml.Linq => 0xd128d608 => 155
	i32 3515174580, ; 571: System.Security.dll => 0xd1854eb4 => 130
	i32 3530912306, ; 572: System.Configuration => 0xd2757232 => 19
	i32 3539954161, ; 573: System.Net.HttpListener => 0xd2ff69f1 => 65
	i32 3560100363, ; 574: System.Threading.Timer => 0xd432d20b => 147
	i32 3570554715, ; 575: System.IO.FileSystem.AccessControl => 0xd4d2575b => 47
	i32 3580758918, ; 576: zh-HK\Microsoft.Maui.Controls.resources => 0xd56e0b86 => 338
	i32 3592435036, ; 577: Microsoft.Extensions.Localization.Abstractions => 0xd620355c => 208
	i32 3597029428, ; 578: Xamarin.Android.Glide.GifDecoder.dll => 0xd6665034 => 227
	i32 3598340787, ; 579: System.Net.WebSockets.Client => 0xd67a52b3 => 79
	i32 3608519521, ; 580: System.Linq.dll => 0xd715a361 => 61
	i32 3624195450, ; 581: System.Runtime.InteropServices.RuntimeInformation => 0xd804d57a => 106
	i32 3627220390, ; 582: Xamarin.AndroidX.Print.dll => 0xd832fda6 => 276
	i32 3633644679, ; 583: Xamarin.AndroidX.Annotation.Experimental => 0xd8950487 => 231
	i32 3637786959, ; 584: itext.sign.dll => 0xd8d4394f => 182
	i32 3638274909, ; 585: System.IO.FileSystem.Primitives.dll => 0xd8dbab5d => 49
	i32 3641597786, ; 586: Xamarin.AndroidX.Lifecycle.LiveData.Core => 0xd90e5f5a => 262
	i32 3643446276, ; 587: tr\Microsoft.Maui.Controls.resources => 0xd92a9404 => 335
	i32 3643854240, ; 588: Xamarin.AndroidX.Navigation.Fragment => 0xd930cda0 => 273
	i32 3645089577, ; 589: System.ComponentModel.DataAnnotations => 0xd943a729 => 14
	i32 3657292374, ; 590: Microsoft.Extensions.Configuration.Abstractions.dll => 0xd9fdda56 => 195
	i32 3660523487, ; 591: System.Net.NetworkInformation => 0xda2f27df => 68
	i32 3672681054, ; 592: Mono.Android.dll => 0xdae8aa5e => 171
	i32 3682565725, ; 593: Xamarin.AndroidX.Browser => 0xdb7f7e5d => 237
	i32 3684561358, ; 594: Xamarin.AndroidX.Concurrent.Futures => 0xdb9df1ce => 241
	i32 3684657769, ; 595: itext.commons => 0xdb9f6a69 => 185
	i32 3697841164, ; 596: zh-Hant/Microsoft.Maui.Controls.resources.dll => 0xdc68940c => 340
	i32 3700866549, ; 597: System.Net.WebProxy.dll => 0xdc96bdf5 => 78
	i32 3706696989, ; 598: Xamarin.AndroidX.Core.Core.Ktx.dll => 0xdcefb51d => 246
	i32 3716563718, ; 599: System.Runtime.Intrinsics => 0xdd864306 => 108
	i32 3718780102, ; 600: Xamarin.AndroidX.Annotation => 0xdda814c6 => 230
	i32 3722202641, ; 601: Microsoft.Extensions.Configuration.Json.dll => 0xdddc4e11 => 198
	i32 3724971120, ; 602: Xamarin.AndroidX.Navigation.Common.dll => 0xde068c70 => 272
	i32 3732100267, ; 603: System.Net.NameResolution => 0xde7354ab => 67
	i32 3732214720, ; 604: Microsoft.AspNetCore.Metadata.dll => 0xde7513c0 => 192
	i32 3737834244, ; 605: System.Net.Http.Json.dll => 0xdecad304 => 63
	i32 3748608112, ; 606: System.Diagnostics.DiagnosticSource => 0xdf6f3870 => 27
	i32 3751444290, ; 607: System.Xml.XPath => 0xdf9a7f42 => 160
	i32 3758424670, ; 608: Microsoft.Extensions.Configuration.FileExtensions => 0xe005025e => 197
	i32 3776403777, ; 609: Microsoft.Extensions.Localization.Abstractions.dll => 0xe1175941 => 208
	i32 3786282454, ; 610: Xamarin.AndroidX.Collection => 0xe1ae15d6 => 239
	i32 3792276235, ; 611: System.Collections.NonGeneric => 0xe2098b0b => 10
	i32 3800979733, ; 612: Microsoft.Maui.Controls.Compatibility => 0xe28e5915 => 215
	i32 3802395368, ; 613: System.Collections.Specialized.dll => 0xe2a3f2e8 => 11
	i32 3819260425, ; 614: System.Net.WebProxy => 0xe3a54a09 => 78
	i32 3823082795, ; 615: System.Security.Cryptography.dll => 0xe3df9d2b => 126
	i32 3829621856, ; 616: System.Numerics.dll => 0xe4436460 => 83
	i32 3841636137, ; 617: Microsoft.Extensions.DependencyInjection.Abstractions.dll => 0xe4fab729 => 200
	i32 3844307129, ; 618: System.Net.Mail.dll => 0xe52378b9 => 66
	i32 3849253459, ; 619: System.Runtime.InteropServices.dll => 0xe56ef253 => 107
	i32 3870376305, ; 620: System.Net.HttpListener.dll => 0xe6b14171 => 65
	i32 3873536506, ; 621: System.Security.Principal => 0xe6e179fa => 128
	i32 3875112723, ; 622: System.Security.Cryptography.Encoding.dll => 0xe6f98713 => 122
	i32 3885497537, ; 623: System.Net.WebHeaderCollection.dll => 0xe797fcc1 => 77
	i32 3885922214, ; 624: Xamarin.AndroidX.Transition.dll => 0xe79e77a6 => 287
	i32 3888767677, ; 625: Xamarin.AndroidX.ProfileInstaller.ProfileInstaller => 0xe7c9e2bd => 277
	i32 3889960447, ; 626: zh-Hans/Microsoft.Maui.Controls.resources.dll => 0xe7dc15ff => 339
	i32 3896106733, ; 627: System.Collections.Concurrent.dll => 0xe839deed => 8
	i32 3896760992, ; 628: Xamarin.AndroidX.Core.dll => 0xe843daa0 => 245
	i32 3898862222, ; 629: itext.layout.dll => 0xe863ea8e => 179
	i32 3898971068, ; 630: Microsoft.Extensions.Localization.dll => 0xe86593bc => 207
	i32 3901907137, ; 631: Microsoft.VisualBasic.Core.dll => 0xe89260c1 => 2
	i32 3920810846, ; 632: System.IO.Compression.FileSystem.dll => 0xe9b2d35e => 44
	i32 3921031405, ; 633: Xamarin.AndroidX.VersionedParcelable.dll => 0xe9b630ed => 290
	i32 3928044579, ; 634: System.Xml.ReaderWriter => 0xea213423 => 156
	i32 3930554604, ; 635: System.Security.Principal.dll => 0xea4780ec => 128
	i32 3931092270, ; 636: Xamarin.AndroidX.Navigation.UI => 0xea4fb52e => 275
	i32 3945713374, ; 637: System.Data.DataSetExtensions.dll => 0xeb2ecede => 23
	i32 3953953790, ; 638: System.Text.Encoding.CodePages => 0xebac8bfe => 133
	i32 3954195687, ; 639: Microsoft.Extensions.Localization => 0xebb03ce7 => 207
	i32 3955647286, ; 640: Xamarin.AndroidX.AppCompat.dll => 0xebc66336 => 233
	i32 3959773229, ; 641: Xamarin.AndroidX.Lifecycle.Process => 0xec05582d => 264
	i32 3971066695, ; 642: itext.styledxmlparser.dll => 0xecb1ab47 => 183
	i32 3977646153, ; 643: itext.io.dll => 0xed161049 => 177
	i32 3980434154, ; 644: th/Microsoft.Maui.Controls.resources.dll => 0xed409aea => 334
	i32 3987592930, ; 645: he/Microsoft.Maui.Controls.resources.dll => 0xedadd6e2 => 316
	i32 4003436829, ; 646: System.Diagnostics.Process.dll => 0xee9f991d => 29
	i32 4015948917, ; 647: Xamarin.AndroidX.Annotation.Jvm.dll => 0xef5e8475 => 232
	i32 4023392905, ; 648: System.IO.Pipelines => 0xefd01a89 => 223
	i32 4025784931, ; 649: System.Memory => 0xeff49a63 => 62
	i32 4046471985, ; 650: Microsoft.Maui.Controls.Xaml.dll => 0xf1304331 => 217
	i32 4054681211, ; 651: System.Reflection.Emit.ILGeneration => 0xf1ad867b => 90
	i32 4068434129, ; 652: System.Private.Xml.Linq.dll => 0xf27f60d1 => 87
	i32 4073602200, ; 653: System.Threading.dll => 0xf2ce3c98 => 148
	i32 4091293555, ; 654: itext.forms.dll => 0xf3dc2f73 => 176
	i32 4094352644, ; 655: Microsoft.Maui.Essentials.dll => 0xf40add04 => 219
	i32 4099507663, ; 656: System.Drawing.dll => 0xf45985cf => 36
	i32 4100113165, ; 657: System.Private.Uri => 0xf462c30d => 86
	i32 4101593132, ; 658: Xamarin.AndroidX.Emoji2 => 0xf479582c => 253
	i32 4102112229, ; 659: pt/Microsoft.Maui.Controls.resources.dll => 0xf48143e5 => 329
	i32 4125707920, ; 660: ms/Microsoft.Maui.Controls.resources.dll => 0xf5e94e90 => 324
	i32 4126470640, ; 661: Microsoft.Extensions.DependencyInjection => 0xf5f4f1f0 => 199
	i32 4127667938, ; 662: System.IO.FileSystem.Watcher => 0xf60736e2 => 50
	i32 4130442656, ; 663: System.AppContext => 0xf6318da0 => 6
	i32 4147896353, ; 664: System.Reflection.Emit.ILGeneration.dll => 0xf73be021 => 90
	i32 4150914736, ; 665: uk\Microsoft.Maui.Controls.resources => 0xf769eeb0 => 336
	i32 4151237749, ; 666: System.Core => 0xf76edc75 => 21
	i32 4159265925, ; 667: System.Xml.XmlSerializer => 0xf7e95c85 => 162
	i32 4161255271, ; 668: System.Reflection.TypeExtensions => 0xf807b767 => 96
	i32 4164802419, ; 669: System.IO.FileSystem.Watcher.dll => 0xf83dd773 => 50
	i32 4181436372, ; 670: System.Runtime.Serialization.Primitives => 0xf93ba7d4 => 113
	i32 4182413190, ; 671: Xamarin.AndroidX.Lifecycle.ViewModelSavedState.dll => 0xf94a8f86 => 269
	i32 4185676441, ; 672: System.Security => 0xf97c5a99 => 130
	i32 4186523351, ; 673: itext.svg.dll => 0xf98946d7 => 184
	i32 4196529839, ; 674: System.Net.WebClient.dll => 0xfa21f6af => 76
	i32 4213026141, ; 675: System.Diagnostics.DiagnosticSource.dll => 0xfb1dad5d => 27
	i32 4256097574, ; 676: Xamarin.AndroidX.Core.Core.Ktx => 0xfdaee526 => 246
	i32 4258378803, ; 677: Xamarin.AndroidX.Lifecycle.ViewModel.Ktx => 0xfdd1b433 => 268
	i32 4260525087, ; 678: System.Buffers => 0xfdf2741f => 7
	i32 4271975918, ; 679: Microsoft.Maui.Controls.dll => 0xfea12dee => 216
	i32 4274976490, ; 680: System.Runtime.Numerics => 0xfecef6ea => 110
	i32 4292120959, ; 681: Xamarin.AndroidX.Lifecycle.ViewModelSavedState => 0xffd4917f => 269
	i32 4294648842, ; 682: Microsoft.Extensions.FileProviders.Embedded => 0xfffb240a => 204
	i32 4294763496 ; 683: Xamarin.AndroidX.ExifInterface.dll => 0xfffce3e8 => 255
], align 4

@assembly_image_cache_indices = dso_local local_unnamed_addr constant [684 x i32] [
	i32 68, ; 0
	i32 67, ; 1
	i32 108, ; 2
	i32 201, ; 3
	i32 265, ; 4
	i32 299, ; 5
	i32 48, ; 6
	i32 222, ; 7
	i32 80, ; 8
	i32 145, ; 9
	i32 30, ; 10
	i32 340, ; 11
	i32 124, ; 12
	i32 220, ; 13
	i32 102, ; 14
	i32 283, ; 15
	i32 107, ; 16
	i32 283, ; 17
	i32 139, ; 18
	i32 303, ; 19
	i32 77, ; 20
	i32 124, ; 21
	i32 13, ; 22
	i32 239, ; 23
	i32 132, ; 24
	i32 285, ; 25
	i32 151, ; 26
	i32 337, ; 27
	i32 338, ; 28
	i32 18, ; 29
	i32 237, ; 30
	i32 26, ; 31
	i32 259, ; 32
	i32 1, ; 33
	i32 59, ; 34
	i32 42, ; 35
	i32 91, ; 36
	i32 187, ; 37
	i32 242, ; 38
	i32 147, ; 39
	i32 261, ; 40
	i32 258, ; 41
	i32 309, ; 42
	i32 54, ; 43
	i32 69, ; 44
	i32 337, ; 45
	i32 228, ; 46
	i32 83, ; 47
	i32 322, ; 48
	i32 260, ; 49
	i32 321, ; 50
	i32 131, ; 51
	i32 55, ; 52
	i32 149, ; 53
	i32 74, ; 54
	i32 145, ; 55
	i32 62, ; 56
	i32 146, ; 57
	i32 341, ; 58
	i32 165, ; 59
	i32 333, ; 60
	i32 243, ; 61
	i32 12, ; 62
	i32 256, ; 63
	i32 125, ; 64
	i32 152, ; 65
	i32 113, ; 66
	i32 166, ; 67
	i32 164, ; 68
	i32 258, ; 69
	i32 271, ; 70
	i32 84, ; 71
	i32 320, ; 72
	i32 314, ; 73
	i32 213, ; 74
	i32 150, ; 75
	i32 303, ; 76
	i32 60, ; 77
	i32 209, ; 78
	i32 51, ; 79
	i32 103, ; 80
	i32 114, ; 81
	i32 40, ; 82
	i32 296, ; 83
	i32 294, ; 84
	i32 204, ; 85
	i32 120, ; 86
	i32 328, ; 87
	i32 52, ; 88
	i32 44, ; 89
	i32 179, ; 90
	i32 119, ; 91
	i32 248, ; 92
	i32 326, ; 93
	i32 254, ; 94
	i32 81, ; 95
	i32 136, ; 96
	i32 290, ; 97
	i32 235, ; 98
	i32 8, ; 99
	i32 73, ; 100
	i32 308, ; 101
	i32 155, ; 102
	i32 305, ; 103
	i32 154, ; 104
	i32 92, ; 105
	i32 300, ; 106
	i32 45, ; 107
	i32 323, ; 108
	i32 311, ; 109
	i32 304, ; 110
	i32 109, ; 111
	i32 129, ; 112
	i32 25, ; 113
	i32 225, ; 114
	i32 72, ; 115
	i32 55, ; 116
	i32 46, ; 117
	i32 332, ; 118
	i32 212, ; 119
	i32 249, ; 120
	i32 191, ; 121
	i32 22, ; 122
	i32 263, ; 123
	i32 86, ; 124
	i32 43, ; 125
	i32 160, ; 126
	i32 71, ; 127
	i32 276, ; 128
	i32 3, ; 129
	i32 42, ; 130
	i32 63, ; 131
	i32 16, ; 132
	i32 53, ; 133
	i32 177, ; 134
	i32 335, ; 135
	i32 299, ; 136
	i32 105, ; 137
	i32 222, ; 138
	i32 304, ; 139
	i32 297, ; 140
	i32 260, ; 141
	i32 174, ; 142
	i32 34, ; 143
	i32 158, ; 144
	i32 85, ; 145
	i32 32, ; 146
	i32 12, ; 147
	i32 51, ; 148
	i32 206, ; 149
	i32 56, ; 150
	i32 280, ; 151
	i32 36, ; 152
	i32 200, ; 153
	i32 310, ; 154
	i32 298, ; 155
	i32 233, ; 156
	i32 35, ; 157
	i32 58, ; 158
	i32 267, ; 159
	i32 173, ; 160
	i32 176, ; 161
	i32 178, ; 162
	i32 17, ; 163
	i32 301, ; 164
	i32 164, ; 165
	i32 193, ; 166
	i32 197, ; 167
	i32 323, ; 168
	i32 266, ; 169
	i32 211, ; 170
	i32 293, ; 171
	i32 329, ; 172
	i32 153, ; 173
	i32 202, ; 174
	i32 289, ; 175
	i32 274, ; 176
	i32 327, ; 177
	i32 235, ; 178
	i32 29, ; 179
	i32 52, ; 180
	i32 181, ; 181
	i32 325, ; 182
	i32 294, ; 183
	i32 184, ; 184
	i32 185, ; 185
	i32 5, ; 186
	i32 309, ; 187
	i32 284, ; 188
	i32 288, ; 189
	i32 240, ; 190
	i32 305, ; 191
	i32 232, ; 192
	i32 180, ; 193
	i32 251, ; 194
	i32 85, ; 195
	i32 0, ; 196
	i32 293, ; 197
	i32 61, ; 198
	i32 112, ; 199
	i32 57, ; 200
	i32 339, ; 201
	i32 280, ; 202
	i32 99, ; 203
	i32 19, ; 204
	i32 244, ; 205
	i32 111, ; 206
	i32 101, ; 207
	i32 102, ; 208
	i32 307, ; 209
	i32 104, ; 210
	i32 297, ; 211
	i32 71, ; 212
	i32 38, ; 213
	i32 32, ; 214
	i32 203, ; 215
	i32 103, ; 216
	i32 73, ; 217
	i32 313, ; 218
	i32 9, ; 219
	i32 123, ; 220
	i32 46, ; 221
	i32 234, ; 222
	i32 213, ; 223
	i32 9, ; 224
	i32 43, ; 225
	i32 4, ; 226
	i32 175, ; 227
	i32 281, ; 228
	i32 317, ; 229
	i32 312, ; 230
	i32 206, ; 231
	i32 31, ; 232
	i32 138, ; 233
	i32 92, ; 234
	i32 191, ; 235
	i32 93, ; 236
	i32 332, ; 237
	i32 49, ; 238
	i32 141, ; 239
	i32 112, ; 240
	i32 140, ; 241
	i32 250, ; 242
	i32 115, ; 243
	i32 298, ; 244
	i32 157, ; 245
	i32 76, ; 246
	i32 79, ; 247
	i32 270, ; 248
	i32 37, ; 249
	i32 292, ; 250
	i32 198, ; 251
	i32 254, ; 252
	i32 247, ; 253
	i32 64, ; 254
	i32 138, ; 255
	i32 15, ; 256
	i32 190, ; 257
	i32 116, ; 258
	i32 286, ; 259
	i32 295, ; 260
	i32 242, ; 261
	i32 180, ; 262
	i32 48, ; 263
	i32 70, ; 264
	i32 80, ; 265
	i32 126, ; 266
	i32 94, ; 267
	i32 121, ; 268
	i32 302, ; 269
	i32 26, ; 270
	i32 263, ; 271
	i32 97, ; 272
	i32 28, ; 273
	i32 238, ; 274
	i32 330, ; 275
	i32 308, ; 276
	i32 149, ; 277
	i32 223, ; 278
	i32 169, ; 279
	i32 4, ; 280
	i32 98, ; 281
	i32 189, ; 282
	i32 33, ; 283
	i32 93, ; 284
	i32 285, ; 285
	i32 209, ; 286
	i32 21, ; 287
	i32 41, ; 288
	i32 170, ; 289
	i32 324, ; 290
	i32 256, ; 291
	i32 316, ; 292
	i32 270, ; 293
	i32 301, ; 294
	i32 295, ; 295
	i32 275, ; 296
	i32 2, ; 297
	i32 134, ; 298
	i32 111, ; 299
	i32 210, ; 300
	i32 336, ; 301
	i32 225, ; 302
	i32 333, ; 303
	i32 58, ; 304
	i32 95, ; 305
	i32 315, ; 306
	i32 39, ; 307
	i32 236, ; 308
	i32 25, ; 309
	i32 94, ; 310
	i32 193, ; 311
	i32 89, ; 312
	i32 99, ; 313
	i32 10, ; 314
	i32 87, ; 315
	i32 100, ; 316
	i32 282, ; 317
	i32 194, ; 318
	i32 302, ; 319
	i32 227, ; 320
	i32 312, ; 321
	i32 7, ; 322
	i32 267, ; 323
	i32 307, ; 324
	i32 224, ; 325
	i32 88, ; 326
	i32 181, ; 327
	i32 196, ; 328
	i32 262, ; 329
	i32 154, ; 330
	i32 311, ; 331
	i32 33, ; 332
	i32 205, ; 333
	i32 116, ; 334
	i32 82, ; 335
	i32 20, ; 336
	i32 11, ; 337
	i32 162, ; 338
	i32 3, ; 339
	i32 218, ; 340
	i32 319, ; 341
	i32 212, ; 342
	i32 210, ; 343
	i32 84, ; 344
	i32 201, ; 345
	i32 306, ; 346
	i32 64, ; 347
	i32 321, ; 348
	i32 289, ; 349
	i32 143, ; 350
	i32 271, ; 351
	i32 157, ; 352
	i32 41, ; 353
	i32 117, ; 354
	i32 195, ; 355
	i32 226, ; 356
	i32 315, ; 357
	i32 278, ; 358
	i32 131, ; 359
	i32 75, ; 360
	i32 66, ; 361
	i32 325, ; 362
	i32 172, ; 363
	i32 230, ; 364
	i32 143, ; 365
	i32 106, ; 366
	i32 151, ; 367
	i32 70, ; 368
	i32 156, ; 369
	i32 194, ; 370
	i32 121, ; 371
	i32 127, ; 372
	i32 320, ; 373
	i32 152, ; 374
	i32 253, ; 375
	i32 187, ; 376
	i32 141, ; 377
	i32 240, ; 378
	i32 317, ; 379
	i32 20, ; 380
	i32 14, ; 381
	i32 214, ; 382
	i32 135, ; 383
	i32 75, ; 384
	i32 59, ; 385
	i32 243, ; 386
	i32 167, ; 387
	i32 168, ; 388
	i32 216, ; 389
	i32 15, ; 390
	i32 74, ; 391
	i32 6, ; 392
	i32 23, ; 393
	i32 265, ; 394
	i32 224, ; 395
	i32 186, ; 396
	i32 91, ; 397
	i32 318, ; 398
	i32 1, ; 399
	i32 175, ; 400
	i32 136, ; 401
	i32 178, ; 402
	i32 266, ; 403
	i32 288, ; 404
	i32 134, ; 405
	i32 69, ; 406
	i32 188, ; 407
	i32 146, ; 408
	i32 202, ; 409
	i32 327, ; 410
	i32 306, ; 411
	i32 257, ; 412
	i32 211, ; 413
	i32 88, ; 414
	i32 96, ; 415
	i32 247, ; 416
	i32 252, ; 417
	i32 322, ; 418
	i32 31, ; 419
	i32 45, ; 420
	i32 261, ; 421
	i32 226, ; 422
	i32 109, ; 423
	i32 158, ; 424
	i32 35, ; 425
	i32 22, ; 426
	i32 114, ; 427
	i32 190, ; 428
	i32 57, ; 429
	i32 286, ; 430
	i32 144, ; 431
	i32 118, ; 432
	i32 120, ; 433
	i32 110, ; 434
	i32 228, ; 435
	i32 139, ; 436
	i32 186, ; 437
	i32 234, ; 438
	i32 54, ; 439
	i32 105, ; 440
	i32 328, ; 441
	i32 217, ; 442
	i32 218, ; 443
	i32 133, ; 444
	i32 300, ; 445
	i32 291, ; 446
	i32 279, ; 447
	i32 334, ; 448
	i32 257, ; 449
	i32 220, ; 450
	i32 159, ; 451
	i32 313, ; 452
	i32 244, ; 453
	i32 163, ; 454
	i32 221, ; 455
	i32 132, ; 456
	i32 279, ; 457
	i32 161, ; 458
	i32 326, ; 459
	i32 192, ; 460
	i32 268, ; 461
	i32 140, ; 462
	i32 291, ; 463
	i32 287, ; 464
	i32 169, ; 465
	i32 219, ; 466
	i32 229, ; 467
	i32 296, ; 468
	i32 40, ; 469
	i32 255, ; 470
	i32 81, ; 471
	i32 189, ; 472
	i32 56, ; 473
	i32 37, ; 474
	i32 97, ; 475
	i32 166, ; 476
	i32 182, ; 477
	i32 172, ; 478
	i32 205, ; 479
	i32 292, ; 480
	i32 82, ; 481
	i32 231, ; 482
	i32 98, ; 483
	i32 30, ; 484
	i32 159, ; 485
	i32 18, ; 486
	i32 127, ; 487
	i32 119, ; 488
	i32 251, ; 489
	i32 282, ; 490
	i32 264, ; 491
	i32 284, ; 492
	i32 165, ; 493
	i32 259, ; 494
	i32 341, ; 495
	i32 281, ; 496
	i32 272, ; 497
	i32 170, ; 498
	i32 16, ; 499
	i32 221, ; 500
	i32 144, ; 501
	i32 319, ; 502
	i32 125, ; 503
	i32 118, ; 504
	i32 38, ; 505
	i32 115, ; 506
	i32 47, ; 507
	i32 142, ; 508
	i32 117, ; 509
	i32 183, ; 510
	i32 34, ; 511
	i32 173, ; 512
	i32 95, ; 513
	i32 53, ; 514
	i32 273, ; 515
	i32 129, ; 516
	i32 153, ; 517
	i32 24, ; 518
	i32 161, ; 519
	i32 250, ; 520
	i32 148, ; 521
	i32 104, ; 522
	i32 89, ; 523
	i32 0, ; 524
	i32 238, ; 525
	i32 60, ; 526
	i32 142, ; 527
	i32 100, ; 528
	i32 5, ; 529
	i32 13, ; 530
	i32 122, ; 531
	i32 135, ; 532
	i32 28, ; 533
	i32 314, ; 534
	i32 72, ; 535
	i32 248, ; 536
	i32 24, ; 537
	i32 236, ; 538
	i32 174, ; 539
	i32 277, ; 540
	i32 274, ; 541
	i32 331, ; 542
	i32 137, ; 543
	i32 229, ; 544
	i32 245, ; 545
	i32 168, ; 546
	i32 278, ; 547
	i32 310, ; 548
	i32 101, ; 549
	i32 123, ; 550
	i32 249, ; 551
	i32 203, ; 552
	i32 196, ; 553
	i32 199, ; 554
	i32 163, ; 555
	i32 167, ; 556
	i32 252, ; 557
	i32 39, ; 558
	i32 215, ; 559
	i32 318, ; 560
	i32 188, ; 561
	i32 17, ; 562
	i32 171, ; 563
	i32 331, ; 564
	i32 330, ; 565
	i32 137, ; 566
	i32 150, ; 567
	i32 241, ; 568
	i32 214, ; 569
	i32 155, ; 570
	i32 130, ; 571
	i32 19, ; 572
	i32 65, ; 573
	i32 147, ; 574
	i32 47, ; 575
	i32 338, ; 576
	i32 208, ; 577
	i32 227, ; 578
	i32 79, ; 579
	i32 61, ; 580
	i32 106, ; 581
	i32 276, ; 582
	i32 231, ; 583
	i32 182, ; 584
	i32 49, ; 585
	i32 262, ; 586
	i32 335, ; 587
	i32 273, ; 588
	i32 14, ; 589
	i32 195, ; 590
	i32 68, ; 591
	i32 171, ; 592
	i32 237, ; 593
	i32 241, ; 594
	i32 185, ; 595
	i32 340, ; 596
	i32 78, ; 597
	i32 246, ; 598
	i32 108, ; 599
	i32 230, ; 600
	i32 198, ; 601
	i32 272, ; 602
	i32 67, ; 603
	i32 192, ; 604
	i32 63, ; 605
	i32 27, ; 606
	i32 160, ; 607
	i32 197, ; 608
	i32 208, ; 609
	i32 239, ; 610
	i32 10, ; 611
	i32 215, ; 612
	i32 11, ; 613
	i32 78, ; 614
	i32 126, ; 615
	i32 83, ; 616
	i32 200, ; 617
	i32 66, ; 618
	i32 107, ; 619
	i32 65, ; 620
	i32 128, ; 621
	i32 122, ; 622
	i32 77, ; 623
	i32 287, ; 624
	i32 277, ; 625
	i32 339, ; 626
	i32 8, ; 627
	i32 245, ; 628
	i32 179, ; 629
	i32 207, ; 630
	i32 2, ; 631
	i32 44, ; 632
	i32 290, ; 633
	i32 156, ; 634
	i32 128, ; 635
	i32 275, ; 636
	i32 23, ; 637
	i32 133, ; 638
	i32 207, ; 639
	i32 233, ; 640
	i32 264, ; 641
	i32 183, ; 642
	i32 177, ; 643
	i32 334, ; 644
	i32 316, ; 645
	i32 29, ; 646
	i32 232, ; 647
	i32 223, ; 648
	i32 62, ; 649
	i32 217, ; 650
	i32 90, ; 651
	i32 87, ; 652
	i32 148, ; 653
	i32 176, ; 654
	i32 219, ; 655
	i32 36, ; 656
	i32 86, ; 657
	i32 253, ; 658
	i32 329, ; 659
	i32 324, ; 660
	i32 199, ; 661
	i32 50, ; 662
	i32 6, ; 663
	i32 90, ; 664
	i32 336, ; 665
	i32 21, ; 666
	i32 162, ; 667
	i32 96, ; 668
	i32 50, ; 669
	i32 113, ; 670
	i32 269, ; 671
	i32 130, ; 672
	i32 184, ; 673
	i32 76, ; 674
	i32 27, ; 675
	i32 246, ; 676
	i32 268, ; 677
	i32 7, ; 678
	i32 216, ; 679
	i32 110, ; 680
	i32 269, ; 681
	i32 204, ; 682
	i32 255 ; 683
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
attributes #0 = { "min-legal-vector-width"="0" mustprogress "no-trapping-math"="true" nofree norecurse nosync nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" uwtable willreturn }
attributes #1 = { nofree nounwind }
attributes #2 = { "no-trapping-math"="true" noreturn nounwind "stack-protector-buffer-size"="8" "stackrealign" "target-cpu"="i686" "target-features"="+cx8,+mmx,+sse,+sse2,+sse3,+ssse3,+x87" "tune-cpu"="generic" }

; Metadata
!llvm.module.flags = !{!0, !1, !7}
!0 = !{i32 1, !"wchar_size", i32 4}
!1 = !{i32 7, !"PIC Level", i32 2}
!llvm.ident = !{!2}
!2 = !{!"Xamarin.Android remotes/origin/release/8.0.4xx @ df9aaf29a52042a4fbf800daf2f3a38964b9e958"}
!3 = !{!4, !4, i64 0}
!4 = !{!"any pointer", !5, i64 0}
!5 = !{!"omnipotent char", !6, i64 0}
!6 = !{!"Simple C++ TBAA"}
!7 = !{i32 1, !"NumRegisterParameters", i32 0}
