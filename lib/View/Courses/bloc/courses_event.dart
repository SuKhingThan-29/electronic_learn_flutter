part of 'courses_bloc.dart';

abstract class CoursesEvent extends Equatable {
  const CoursesEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends CoursesEvent {
  final String? type;
  const OnTapEvent({required this.type});
}

class IconTap extends CoursesEvent {
  final bool? isIconTap;
  const IconTap({required this.isIconTap});
}

class OnTapLessonReviewEvent extends CoursesEvent {
  final String? lessonOrReview;
  const OnTapLessonReviewEvent({required this.lessonOrReview});
}

class GetSubCategoryList extends CoursesEvent {
  final String? mainSubName;
  const GetSubCategoryList({this.mainSubName});

  @override
  List<Object> get props => [mainSubName!];
}

class GetCoursesList extends CoursesEvent {
  final String? mainCategoryName;
  final int? topic;
  final int? cost;
  final String? level;
  final List<String>? filterList;

  const GetCoursesList(
      {this.mainCategoryName,
      this.topic,
      this.cost,
      this.level,
      this.filterList});

  @override
  List<Object> get props =>
      [mainCategoryName!, topic!, cost!, level!, filterList!];
}
