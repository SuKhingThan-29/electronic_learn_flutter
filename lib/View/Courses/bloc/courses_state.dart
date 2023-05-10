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

class IconTapSuccess extends CoursesState {
  final bool? isIconTap;
  const IconTapSuccess({required this.isIconTap});

  @override
  List<Object> get props => [isIconTap!];
}

class OnTapLessonReviewSuccess extends CoursesState {
  final String? lessonOrReview;
  const OnTapLessonReviewSuccess({required this.lessonOrReview});

  @override
  List<Object> get props => [lessonOrReview!];
}
