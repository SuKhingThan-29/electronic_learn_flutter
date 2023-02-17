part of 'courses_bloc.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

class CoursesInitial extends CoursesState {}

class OnTapLoading extends CoursesState {}

class OnTapSuccess extends CoursesState {
  final String type;
  const OnTapSuccess({required this.type});

  @override
  List<Object> get props => [type];
}

class OnTapFailed extends CoursesState {
  final String message;
  const OnTapFailed({required this.message});

  @override
  List<Object> get props => [message];
}
