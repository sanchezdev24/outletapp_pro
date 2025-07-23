import 'package:get/get.dart';
import 'package:outletapp_pro/features/auth/presentation/pages/login_page.dart';
import 'package:outletapp_pro/features/auth/presentation/pages/register_page.dart';
import 'package:outletapp_pro/features/main_navigation/presentation/pages/main_navigation_page.dart';

class AppRoutes {
  static const String login = '/login';
  static const String register = '/register';
  static const String main = '/main';

  static List<GetPage> routes = [
    GetPage(
      name: login,
      page: () => const LoginPage(),
    ),
    GetPage(
      name: register,
      page: () => const RegisterPage(),
    ),
    GetPage(
      name: main,
      page: () => const MainNavigationPage(),
    ),
  ];
}