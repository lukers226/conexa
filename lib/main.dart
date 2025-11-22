import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter/services.dart';
import 'constants/app_theme.dart';
import 'routes/app_pages.dart';

const platform = MethodChannel("flavor");
String appFlavor = "unknown";

Future<void> loadFlavor() async {
  try {
    final result = await platform.invokeMethod<String>("getFlavor");
    appFlavor = result ?? "unknown";
  } catch (e) {
    appFlavor = "unknown";
  }
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await loadFlavor();
  print("Running flavor: $appFlavor");

  // UI setup (your existing code)
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom],
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      systemNavigationBarColor: Colors.transparent,
      systemNavigationBarDividerColor: Colors.transparent,
      systemNavigationBarIconBrightness: Brightness.light,
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light,
    ),
  );

  runApp(CommunityApp(flavor: appFlavor));
}

class CommunityApp extends StatelessWidget {
  final String flavor;

  const CommunityApp({super.key, required this.flavor});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: "Community App ($flavor)",
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: ThemeMode.system,
      initialRoute: '/',
      getPages: AppPages.pages,
    );
  }
}
