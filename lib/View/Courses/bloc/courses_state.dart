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

class GetSubCategoryListLoading extends CoursesState {}

class GetSubCategoryListSuccess extends CoursesState {
  final List<SubCategoryModel> subCategoryList;
  const GetSubCategoryListSuccess({required this.subCategoryList});

  @override
  List<Object> get props => [subCategoryList];
}

class GetSubCategoryListFailed extends CoursesState {
  final String? message;
  const GetSubCategoryListFailed(this.message);

  @override
  List<Object> get props => [message!];
}
