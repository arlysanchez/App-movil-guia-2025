import 'package:equatable/equatable.dart';

class HomeClientState extends Equatable {
final int pageIndex;
const HomeClientState({this.pageIndex = 0});

  HomeClientState copyWith({int? pageIndex}) {
    return HomeClientState(
      pageIndex: pageIndex ?? this.pageIndex,
    );
  }
  @override
  List<Object?> get props => [pageIndex];

}