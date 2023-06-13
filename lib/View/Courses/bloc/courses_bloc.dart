import 'package:coursia/Model/courses_model.dart';
import 'package:coursia/Model/subcategory_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  CoursesBloc() : super(CoursesInitial()) {
    on<OnTapEvent>(_onTapEvent);
    on<IconTap>(_onIconTap);
    on<OnTapLessonReviewEvent>(_onTapLessonReviewEvent);
    on<GetSubCategoryList>(_getSubCategoryList);
    on<GetCoursesList>(_getCoursesList);
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

  _getSubCategoryList(
      GetSubCategoryList event, Emitter<CoursesState> emit) async {
    emit(GetSubCategoryListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetSubCategoryListFailed("No Network Connection!"));
    } else {
      try {
        List<SubCategoryModel> subCategoryList;
        subCategoryList =
            await coursiaRepository.getSubCategoryList(event.mainSubName);
        emit(GetSubCategoryListSuccess(subCategoryList: subCategoryList));
      } catch (e) {
        emit(GetSubCategoryListFailed(e.toString()));
      }
    }
  }

  _getCoursesList(GetCoursesList event, Emitter<CoursesState> emit) async {
    emit(GetCoursesListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetCoursesListFailed("No Network Connection!"));
    } else {
      try {
        List<CoursesModel> coursesList;
        coursesList = await coursiaRepository.getCoursesList(
            event.mainCategoryName, event.topic, event.cost, event.level);
        emit(GetCoursesListSuccess(
            coursesList: coursesList, filterList: event.filterList!));
      } catch (e) {
        emit(GetCoursesListFailed(e.toString()));
      }
    }
  }
}
