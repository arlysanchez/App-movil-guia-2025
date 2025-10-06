import 'package:injectable/injectable.dart';
import 'package:myfirstlove/src/data/dataSource/remote/service/AuthService.dart';
import 'package:myfirstlove/src/data/repository/AuthRepositoryImpl.dart';
import 'package:myfirstlove/src/domain/repository/AuthRepository.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/LoginUseCase.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/RegisterUseCase.dart';

@module
abstract class AppModule {

  //services
  @injectable
  AuthService get authService => AuthService();

  //Repositories
  @injectable
  AuthRepository get authRepository => AuthRepositoryImpl(authService);

  //UseCases
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    loginUseCase: LoginUseCase(authRepository),
    registerUseCase: RegisterUseCase(authRepository),
  );

}