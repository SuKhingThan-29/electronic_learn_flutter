import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/Model/iq_type_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'iq_event.dart';
part 'iq_state.dart';

class IqBloc extends Bloc<IQEvent, IQState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  IqBloc() : super(IqInitial()) {
    on<OnTapEvent>(_onTapEvent);
    on<GetIQTypeEvent>(getIQTypeEvent);
    on<GetIQQuestionListEvent>(getIQQuestionListEvent);
  }

  _onTapEvent(OnTapEvent event, Emitter<IQState> emit) {
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }

  getIQTypeEvent(GetIQTypeEvent event, Emitter<IQState> emit) async {
    emit(GetIQTypeLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetIQTypeFailed("No Network Connection!"));
    } else {
      try {
        List<IQTypeModel> iqTypeList;
        iqTypeList = await coursiaRepository.getIQTypeList();
        emit(GetIQTypeSuccess(iqTypeList: iqTypeList));
      } catch (e) {
        emit(GetIQTypeFailed(e.toString()));
      }
    }
  }

  getIQQuestionListEvent(
      GetIQQuestionListEvent event, Emitter<IQState> emit) async {
    emit(GetIQQuestionListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetIQQuestionListFailed("No Network Connection!"));
    } else {
      try {
        List<IQQuestionModel> iqQuestionList;
        iqQuestionList = await coursiaRepository.getIQQuestionList();
        emit(GetIQQuestionListSuccess(iqQuestionList: iqQuestionList));
      } catch (e) {
        emit(GetIQQuestionListFailed(e.toString()));
      }
    }
  }
}
