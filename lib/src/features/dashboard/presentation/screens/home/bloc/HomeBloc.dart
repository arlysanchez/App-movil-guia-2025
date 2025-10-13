import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:myfirstlove/src/domain/useCase/Auth/AuthUseCases.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/home/bloc/HomeEvent.dart';
import 'package:myfirstlove/src/features/dashboard/presentation/screens/home/bloc/HomeState.dart';

class HomeBloc extends Bloc<HomeEvent,HomeState>{
AuthUseCases authUseCases;


HomeBloc(this.authUseCases):super(HomeState()) {
  on<Logout>(_onLogout);
  on<ChangeDrawerPage>(_onChangeDrawerPage);
}

Future<void> _onLogout(Logout event, Emitter<HomeState> emit) async {
  await authUseCases.logoutUseCase.run();
}

Future<void> _onChangeDrawerPage(
      ChangeDrawerPage event, Emitter<HomeState> emit) async {
    emit(state.copyWith(pageIndex: event.pageIndex));
  }



}