import 'package:flutter/material.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/LoginPage.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/register/RegisterPage.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/welcome_screen.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/admin/home/HomePage.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/client/home/HomeClientPage.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/roles/RolesPage.dart';

class AppRoutes {
  static const String welcome = '/';
  static const String login = '/login';
  static const String register = '/register';
  static const String homeAdmin = 'admin/home';
  static const String homeClient = 'cliente/home';
  static const String role = '/roles';

}

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case AppRoutes.welcome:
        return MaterialPageRoute(builder: (_) => WelcomeScreen());
      case AppRoutes.login:
        return MaterialPageRoute(builder: (_) => LoginPage());
      case AppRoutes.register:
        return MaterialPageRoute(builder: (_) => RegisterPage());
      case AppRoutes.homeAdmin:
        return MaterialPageRoute(builder: (_) => HomePage());
        case AppRoutes.homeClient:
        return MaterialPageRoute(builder: (_) => HomeClientPage());
        case AppRoutes.role:
        return MaterialPageRoute(builder: (_) => const RolesPage());
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(
              child: Text('No route defined for ${settings.name}'),
            ),
          ),
        );
    }
  }
}
