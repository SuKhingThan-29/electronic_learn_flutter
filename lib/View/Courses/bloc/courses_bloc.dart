import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursesBloc() : super(CoursesInitial()) {
    on<OnTapEvent>(_onTapEvent);
    on<IconTap>(_onIconTap);
    on<OnTapLessonReviewEvent>(_onTapLessonReviewEvent);
  }

  _onTapEvent(OnTapEvent event, Emitter<CoursesState> emit) {
    emit(OnTapSuccess(type: event.type!));
  }

  _onIconTap(IconTap event, Emitter<CoursesState> emit) {
    emit(IconTapSuccess(isIconTap: event.isIconTap));
  }

  _onTapLessonReviewEvent(
      OnTapLessonReviewEvent event, Emitter<CoursesState> emit) {
    emit(OnTapLessonReviewSuccess(lessonOrReview: event.lessonOrReview));
  }
}
