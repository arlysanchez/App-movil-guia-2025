import 'package:flutter/material.dart';
import 'package:myfirstlove/src/common_widgets/app_logo.dart';
import 'package:myfirstlove/src/common_widgets/primary_button.dart';
import 'package:myfirstlove/src/constants/app_text_styles.dart';
import 'package:myfirstlove/src/routing/app_router.dart';

class WelcomeScreen extends StatelessWidget{

  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    
   return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Spacer(),
              Text('¡BIENVENIDO!', style: AppTextStyles.screenTitle, textAlign: TextAlign.center),
              const SizedBox(height: 32),
              const AppLogo(size: 150),
              const SizedBox(height: 16),
              Text('Ecommerce', style: AppTextStyles.brandName, textAlign: TextAlign.center),
              const SizedBox(height: 24),
              Text(
                'Descubre tus productos en esta tienda virtual,estamos cerca de ti',
                style: AppTextStyles.body,
                textAlign: TextAlign.center,
              ),
              const Spacer(),
              
              PrimaryButton(
                text: 'Comenzar',
                onPressed: () {
                  // Aquí iría la navegación a la pantalla de Login basica
                 // Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                 //navegacion robusta
                  Navigator.pushNamed(context, AppRoutes.login);
                },
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  }

