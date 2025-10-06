
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:myfirstlove/src/domain/utils/Resource.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginState.dart';
import 'package:myfirstlove/src/features/utils/BlocFormItem.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
AuthUseCases authUseCases;


  LoginBloc(this.authUseCases) : super(LoginState()) {
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
    emit(
      state.copyWith(response: Loading(), formKey: formKey),
    );
    await Future.delayed(const Duration(seconds: 6));
    Resource resource= 
    await authUseCases.loginUseCase.run(state.email.value, state.password.value);
    emit(state.copyWith(response: resource, formKey: formKey));
  }
}
