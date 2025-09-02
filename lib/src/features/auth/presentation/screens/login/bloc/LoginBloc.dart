
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstlove/src/domain/utils/Resource.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginState.dart';
import 'package:myfirstlove/src/features/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(LoginState(formKey: GlobalKey<FormState>(), response: Initial())) {
    on<LoginInit>(_onInit);
    on<LoginEmailChanged>(_onEmailChanged);
    on<LoginPasswordChanged>(_onPasswordChanged);
    on<LoginSubmitted>(_onSubmitted);
  }
  final formKey = GlobalKey<FormState>();

  void _onInit(LoginInit event, Emitter<LoginState> emit) async {
    emit(LoginState(formKey: formKey, response: Initial()));
  }

 Future<void> _onEmailChanged(
      LoginEmailChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        email: BlocFormItem(
            value: event.email.value,
            error: event.email.value.isNotEmpty ? null : 'Ingresa el email'),
        formKey: formKey));
  }

  Future<void> _onPasswordChanged(
      LoginPasswordChanged event, Emitter<LoginState> emit) async {
    emit(state.copyWith(
        password: BlocFormItem(
            value: event.password.value,
            error: event.password.value.isNotEmpty &&
                    event.password.value.length >= 6
                ? null
                : 'Ingresa el password'),
        formKey: formKey));
  }

  Future<void> _onSubmitted(LoginSubmitted event, Emitter<LoginState> emit) async {
    // Validación final
    final email = state.email.value.trim();
    final password = state.password.value.trim();

    final emailError = email.isEmpty ? 'Ingresa el email' : null;
    final passwordError = password.isEmpty || password.length < 6
        ? 'Ingresa el password (mínimo 6 caracteres)'
        : null;

    emit(state.copyWith(
      email: state.email.copyWith(error: emailError),
      password: state.password.copyWith(error: passwordError),
    ));

    if (emailError != null || passwordError != null) return;

    // Simula login
    emit(state.copyWith(response: Loading()));
    await Future.delayed(const Duration(seconds: 2));

    if (email == "admin@test.com" && password == "123456") {
      emit(state.copyWith(response: Success("Bienvenido")));
    } else {
      emit(state.copyWith(response: Error("Credenciales incorrectas")));
    }
  }
}
