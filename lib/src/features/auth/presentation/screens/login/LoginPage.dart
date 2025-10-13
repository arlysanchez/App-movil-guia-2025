import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:myfirstlove/src/domain/models/AuthResponse.dart';
import 'package:myfirstlove/src/domain/utils/Resource.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:myfirstlove/src/routing/app_router.dart';
import 'bloc/LoginState.dart';
import 'LoginContent.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  LoginBloc? _bloc;

   @override
  void initState() {
    // EJECUTA UNA SOLA VEZ CUANDO CARGA LA PANTALLA
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    _bloc = BlocProvider.of<LoginBloc>(context);

    return Scaffold(
      body: BlocListener<LoginBloc, LoginState>(
        listener: (context, state) {
          final responseState = state.response;
          if (responseState is Error) {
            Fluttertoast.showToast(
              msg: responseState.message,
              toastLength: Toast.LENGTH_LONG,
            );
          } else if (responseState is Success) {
            final authResponse = responseState.data as AuthResponse;
             _bloc?.add(LoginSaveUserSession(authResponse: authResponse));
              Fluttertoast.showToast(
              msg: 'Login exitoso', toastLength: Toast.LENGTH_LONG);
              print('Usuario en sesion: ${authResponse?.toJson()}');
            // 👉 Navegar a dashboard cuando login es correcto

            Navigator.pushNamedAndRemoveUntil(
              context,
              AppRoutes.dashboard,
              (route) => false,
            );
          }
        },
        child: BlocBuilder<LoginBloc, LoginState>(
          builder: (context, state) {
            if (state.response is Loading) {
              return Stack(
                children: [
                  LoginContent(_bloc, state),
                  const Center(child: CircularProgressIndicator()),
                ],
              );
            }
            return LoginContent(_bloc, state);
          },
        ),
      ),
    );
  }
}