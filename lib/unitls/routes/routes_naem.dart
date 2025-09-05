import 'package:get/get.dart';
import 'package:mvvm/view/home_screen.dart';
import 'package:mvvm/view/login_screen.dart';

class RoutesName {
  static const String login = '/login';
  static const String home = '/home';
}

class AppRoutes {
  static final routes = [
    GetPage(
      name: RoutesName.login,
      page: () => LoginScreen(),
    ),
    GetPage(
      name: RoutesName.home,
      page: () => HomeScreen(),
    ),
  ];
}
