import 'package:get/get.dart';

import '../screens/home_screen.dart';
import '../screens/splash_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
  ];
}
