part of 'courses_bloc.dart';

abstract class CoursesState extends Equatable {
  const CoursesState();

  @override
  List<Object> get props => [];
}

class CoursesInitial extends CoursesState {}

class OnTapSuccess extends CoursesState {
  final String type;
  const OnTapSuccess({required this.type});

  @override
  List<Object> get props => [type];
}
