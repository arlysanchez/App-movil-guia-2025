import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstlove/injection.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/register/bloc/RegisterBloc.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/register/bloc/RegisterEvent.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/admin/home/bloc/HomeBloc.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/client/home/bloc/HomeClientBloc.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/roles/bloc/RolesBloc.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/roles/bloc/RolesEvent.dart';

List<BlocProvider> blocProviders = [

   BlocProvider<LoginBloc>(
    create: (context) => LoginBloc(locator<AuthUseCases>())..add(LoginInit()),
  ),
    BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc()..add(RegisterInit()),
    ),
    BlocProvider<HomeBloc>(
      create: (context) => HomeBloc(locator<AuthUseCases>())),
      
       BlocProvider<HomeClientBloc>(
      create: (context) => HomeClientBloc(locator<AuthUseCases>())),
       BlocProvider<RolesBloc>(
      create: (context) =>
          RolesBloc(locator<AuthUseCases>())..add(GetRolesList())),
  ];