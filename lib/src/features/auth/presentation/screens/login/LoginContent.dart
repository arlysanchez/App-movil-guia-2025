import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginState.dart';
import 'package:myfirstlove/src/features/utils/BlocFormItem.dart';
import 'package:myfirstlove/src/common_widgets/app_logo.dart';
import 'package:myfirstlove/src/common_widgets/custom_text_field.dart';
import 'package:myfirstlove/src/common_widgets/primary_button.dart';
import 'package:myfirstlove/src/constants/app_text_styles.dart';
import 'package:myfirstlove/src/routing/app_router.dart';

class LoginContent extends StatelessWidget {
  final LoginBloc? bloc;
  final LoginState state;

  const LoginContent(this.bloc, this.state, {super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 48.0),
          child: Form(
            key: state.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const AppLogo(size: 100),
                const SizedBox(height: 16),
                Text(
                  'ECOMMERCE',
                  style: AppTextStyles.brandName,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                // Campo Email
                CustomTextField(
                  label: 'Email',
                   onChanged: (value) {
                 bloc?.add(LoginEmailChanged(email: BlocFormItem(value: value)));
                },
                  validator: (value) => state.email.error,
                ),
                const SizedBox(height: 16),
                // Campo Password
                CustomTextField(
                  label: 'Password',
                  isPassword: true,
                  onChanged: (value) {
                    bloc?.add(
                      LoginPasswordChanged(password: BlocFormItem(value: value)),
                    );
                  },
                  validator: (value) => state.password.error,
                ),
                const SizedBox(height: 32),
                // Botón Login
                PrimaryButton(
                  text: 'Login',
                  onPressed: () {
                    if (state.formKey!.currentState!.validate()) {
                      bloc?.add(const LoginSubmitted());
                    } else {
                      Fluttertoast.showToast(
                        msg: 'Formulario inválido',
                        toastLength: Toast.LENGTH_LONG,
                      );
                    }
                  },
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'No tienes cuenta?',
                      style: AppTextStyles.body.copyWith(fontSize: 14),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(context, AppRoutes.register);
                      },
                      child: const Text(
                        'Regístrate aquí',
                        style: AppTextStyles.textLink,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}