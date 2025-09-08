import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginEvent.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/register/bloc/RegisterBloc.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/register/bloc/RegisterEvent.dart';

List<BlocProvider> blocProviders = [

   BlocProvider<LoginBloc>(
    create: (context) => LoginBloc()..add(LoginInit()),
  ),
    BlocProvider<RegisterBloc>(
      create: (context) => RegisterBloc()..add(RegisterInit()),
    ),

  ];