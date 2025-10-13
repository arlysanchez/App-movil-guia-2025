import 'package:equatable/equatable.dart';

class HomeState extends Equatable {
final int pageIndex;
const HomeState({this.pageIndex = 0});

  HomeState copyWith({int? pageIndex}) {
    return HomeState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
  @override
  List<Object?> get props => [pageIndex];

}