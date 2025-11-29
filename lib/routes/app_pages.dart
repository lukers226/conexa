import 'package:conexa/screens/home_screen.dart';
import 'package:conexa/screens/splash_screen.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';

import '../screens/chat_screen.dart';

class AppPages {
  static final pages = [
    GetPage(name: '/', page: () => const SplashScreen()),
    GetPage(name: '/home', page: () => const HomeScreen()),
    GetPage(name: '/chat', page: () => const ChatScreen()),
  ];
}
