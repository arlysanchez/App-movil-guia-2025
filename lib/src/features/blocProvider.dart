import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginBloc.dart';
import 'package:myfirstlove/src/features/auth/presentation/screens/login/bloc/LoginEvent.dart';

List<BlocProvider> blocProviders = [

   BlocProvider<LoginBloc>(
    create: (context) => LoginBloc()..add(LoginInit()),
  ),

  ];