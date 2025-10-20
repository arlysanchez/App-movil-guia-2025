import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/client/home/bloc/HomeClientEvent.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/client/home/bloc/HomeClientState.dart';

class HomeClientBloc extends Bloc<HomeClientEvent,HomeClientState>{
AuthUseCases authUseCases;


HomeClientBloc(this.authUseCases):super(HomeClientState()) {
  on<Logout>(_onLogout);
  on<ChangeDrawerPage>(_onChangeDrawerPage);
}

Future<void> _onLogout(Logout event, Emitter<HomeClientState> emit) async {
  await authUseCases.logoutUseCase.run();
}

Future<void> _onChangeDrawerPage(
      ChangeDrawerPage event, Emitter<HomeClientState> emit) async {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }



}