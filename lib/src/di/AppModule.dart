import 'package:injectable/injectable.dart';
import 'package:myfirstlove/src/data/dataSource/local/SharedPref.dart';
import 'package:myfirstlove/src/data/dataSource/remote/service/AmenitiesService.dart';
import 'package:myfirstlove/src/data/dataSource/remote/service/AuthService.dart';
import 'package:myfirstlove/src/data/repository/AmenitiesRepositoryimpl.dart';
import 'package:myfirstlove/src/data/repository/AuthRepositoryImpl.dart';
import 'package:myfirstlove/src/domain/models/Amenities.dart';
import 'package:myfirstlove/src/domain/models/AuthResponse.dart';
import 'package:myfirstlove/src/domain/repository/AmenitiesRepository.dart';
import 'package:myfirstlove/src/domain/repository/AuthRepository.dart';
import 'package:myfirstlove/src/domain/useCase/Amenities/AmenitiesUseCases.dart';
import 'package:myfirstlove/src/domain/useCase/Amenities/DeleteAmenitiesUseCase.dart';
import 'package:myfirstlove/src/domain/useCase/Amenities/GetAmenitiesUseCase.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/GetUserSessionUseCase.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/LoginUseCase.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/LogoutUseCase.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/RegisterUseCase.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/SaveUserSessionUseCase.dart';

@module
abstract class AppModule {

  //Shared Preferences
   @injectable 
   SharedPref get sharedPref => SharedPref();

   @injectable
   Future<String> get token async {
      String token ="";
      final userSession = await sharedPref.read('user');
      if(userSession != null){
       AuthResponse authResponse = AuthResponse.fromJson(userSession);
       token = authResponse.token;
      }
      return token;
   }

  //services
  @injectable
  AuthService get authService => AuthService();

  @injectable
  AmenitiesService get amenitiesService => AmenitiesService(token);


  //Repositories
  @injectable
  AuthRepository get authRepository => 
      AuthRepositoryImpl(authService, sharedPref);

  @injectable
  AmenitiesRepository get amenitiesRepository => AmenitiesRepositoryimpl(amenitiesService);

  //UseCases
  @injectable
  AuthUseCases get authUseCases => AuthUseCases(
    loginUseCase: LoginUseCase(authRepository),
    registerUseCase: RegisterUseCase(authRepository),
    saveUserSessionUseCase: SaveUserSessionUseCase(authRepository),
    getUserSessionUseCase: GetUserSessionUseCase(authRepository), 
    logoutUseCase: LogoutUseCase(authRepository)
  );

  @injectable
  AmenitiesUseCases get amenitiesUseCases => AmenitiesUseCases(
    getAmenities: GetAmenitiesUseCase(amenitiesRepository),
    deleteAmenities: DeleteAmenitiesUseCase(amenitiesRepository)
  );

}