import 'package:myfirstlove/src/domain/useCase/Auth/LoginUseCase.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/RegisterUseCase.dart';

class AuthUseCases {
  LoginUseCase loginUseCase;
  RegisterUseCase registerUseCase;

  AuthUseCases({
    required this.loginUseCase,
    required this.registerUseCase,
  });


}