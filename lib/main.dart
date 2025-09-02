import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstlove/src/constants/app_colors.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/LoginContent.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/LoginPage.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/register/register_screen.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/welcome_screen.dart';
import 'package:myfirstlove/src/features/blocProvider.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/dashboard_screen.dart';
import 'package:myfirstlove/src/routing/app_router.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    
    return MultiBlocProvider(providers: blocProviders, 
    child:MaterialApp(
      title: 'My First love',
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: AppColors.primary,
        scaffoldBackgroundColor: AppColors.background,
        fontFamily: 'SansSerif'
      ),
      initialRoute: AppRoutes.welcome,
      routes: {
      AppRoutes.welcome:(context) => const WelcomeScreen(),
      AppRoutes.login :(context) => const LoginPage(),
      AppRoutes.register :(context) => const RegisterScreen(),
      AppRoutes.dashboard :(context) => const DashboardScreen(),

      },
    ),

    );
  }
}

