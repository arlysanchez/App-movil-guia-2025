import 'package:flutter/material.dart';
import 'package:myfirstlove/src/common_widgets/app_logo.dart';
import 'package:myfirstlove/src/common_widgets/custom_text_field.dart';
import 'package:myfirstlove/src/common_widgets/primary_button.dart';
import 'package:myfirstlove/src/constants/app_text_styles.dart';
import 'package:myfirstlove/src/routing/app_router.dart';

class LoginScreen extends StatelessWidget{
const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
   return Scaffold(
    body: SingleChildScrollView(
      child: SafeArea
      (child: 
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
        child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //1. logo y el nombre del app
          const AppLogo(size: 100),
          const SizedBox(height: 16),
          Text(
           'ECOMMERCE',
            style: AppTextStyles.brandName,
            textAlign: TextAlign.center,

          ),
          const SizedBox(height: 48),
          // Formulario login

          const CustomTextField(label: 'Email'),
          const SizedBox(height: 16),
          const CustomTextField(label: 'Password', isPassword: true),
           const SizedBox(height: 32),
           PrimaryButton(
            text: 'Login', 
            onPressed:(){
              //usamos para el usario no pueda volver atras 
              Navigator.pushNamedAndRemoveUntil
              (context, AppRoutes.dashboard,
               (route)=> false,  //eliminara todas las rutas anteriores
               );
            }
            ),
           const SizedBox(height: 24),
           Row(
           mainAxisAlignment: MainAxisAlignment.center,
           children: [
            Text('No tienes cuenta?',
             style: AppTextStyles.body.copyWith(fontSize: 14)),
            
            TextButton(onPressed: (){
              Navigator.pushNamed(context, AppRoutes.register);
            },
            child: const Text(
              'Registate aquí',
              style: AppTextStyles.textLink,
            ),
            
            ),

           ],


           )

        ],

        ),
        
        
        )
        ),
    ),
   );
  }


}