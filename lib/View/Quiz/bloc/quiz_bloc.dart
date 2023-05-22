import 'package:coursia/Model/quiz_question_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'quiz_event.dart';
part 'quiz_state.dart';

class QuizBloc extends Bloc<QuizEvent, QuizState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  QuizBloc() : super(QuizInitial()) {
    on<OnTapEvent>(_onTapEvent);
    on<GetQuizTypeEvent>(getQuizTypeEvent);
    on<GetQuizQuestionListEvent>(getQuizQuestionListEvent);
  }

  _onTapEvent(OnTapEvent event, Emitter<QuizState> emit) {
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }

  getQuizTypeEvent(GetQuizTypeEvent event, Emitter<QuizState> emit) async {
    emit(GetQuizTypeLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetQuizTypeFailed("No Network Connection!"));
    } else {
      try {
        List<QuizTypeModel> quizTypeList;
        quizTypeList = await coursiaRepository.getQuizTypeList();
        emit(GetQuizTypeSuccess(quizTypeList: quizTypeList));
      } catch (e) {
        emit(GetQuizTypeFailed(e.toString()));
      }
    }
  }

  getQuizQuestionListEvent(
      GetQuizQuestionListEvent event, Emitter<QuizState> emit) async {
    emit(GetQuizQuestionListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetQuizQuestionListFailed("No Network Connection!"));
    } else {
      try {
        List<QuizQuestionModel> quizQuestionList;
        quizQuestionList = await coursiaRepository.getQuizQuestionList();
        emit(GetQuizQuestionListSuccess(quizQuestionList: quizQuestionList));
      } catch (e) {
        emit(GetQuizQuestionListFailed(e.toString()));
      }
    }
  }
}
