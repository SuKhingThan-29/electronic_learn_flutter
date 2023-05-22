import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/Model/competency_type_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'competency_event.dart';
part 'competency_state.dart';

class CompetencyBloc extends Bloc<CompetencyEvent, CompetencyState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  CompetencyBloc() : super(CompetencyInitial()) {
    on<OnTapEvent>(_onTapEvent);
    on<GetCompetencyTypeEvent>(getCompetencyTypeEvent);
    on<GetCompetencyQuestionListEvent>(getCompetencyQuestionListEvent);
  }

  _onTapEvent(OnTapEvent event, Emitter<CompetencyState> emit) {
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }

  getCompetencyTypeEvent(
      GetCompetencyTypeEvent event, Emitter<CompetencyState> emit) async {
    emit(GetCompetencyTypeLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetCompetencyTypeFailed("No Network Connection!"));
    } else {
      try {
        List<CompetencyTypeModel> competencyTypeList;
        competencyTypeList = await coursiaRepository.getCompetencyTypeList();
        emit(GetCompetencyTypeSuccess(competencyTypeList: competencyTypeList));
      } catch (e) {
        emit(GetCompetencyTypeFailed(e.toString()));
      }
    }
  }

  getCompetencyQuestionListEvent(GetCompetencyQuestionListEvent event,
      Emitter<CompetencyState> emit) async {
    emit(GetCompetencyQuestionListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetCompetencyQuestionListFailed("No Network Connection!"));
    } else {
      try {
        List<CompetencyQuestionModel> competencyQuestionList;
        competencyQuestionList =
            await coursiaRepository.getCompetencyQuestionList();
        emit(GetCompetencyQuestionListSuccess(
            competencyQuestionList: competencyQuestionList));
      } catch (e) {
        emit(GetCompetencyTypeFailed(e.toString()));
      }
    }
  }
}
