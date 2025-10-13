import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstlove/injection.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/register/bloc/RegisterBloc.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/register/bloc/RegisterEvent.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/home/bloc/HomeBloc.dart';

List<BlocProvider> blocProviders = [

   BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(locator<AuthUseCases>())..add(LoginInit()),
  ),
    BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc()..add(RegisterInit()),
    ),
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(locator<AuthUseCases>())),
  ];