import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/Model/disc_type_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'disc_event.dart';
part 'disc_state.dart';

class DISCBloc extends Bloc<DISCEvent, DISCState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  DISCBloc() : super(DiscInitial()) {
    on<OnTapEvent>(_onTapEvent);
    on<GetDISCTypeEvent>(getDISCTypeEvent);
    on<GetDISCQuestionListEvent>(getDISCQuestionListEvent);
  }

  _onTapEvent(OnTapEvent event, Emitter<DISCState> emit) {
    // emit(OnTapSuccess(onTapIndex: event.onTapIndex, onTap: event.onTap));
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }

  getDISCTypeEvent(GetDISCTypeEvent event, Emitter<DISCState> emit) async {
    emit(GetDISCTypeLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetDISCTypeFailed("No Network Connection!"));
    } else {
      try {
        List<DISCTypeModel> discTypeList;
        discTypeList = await coursiaRepository.getDISCTypeList();
        emit(GetDISCTypeSuccess(discTypeList: discTypeList));
      } catch (e) {
        emit(GetDISCTypeFailed(e.toString()));
      }
    }
  }

  getDISCQuestionListEvent(
      GetDISCQuestionListEvent event, Emitter<DISCState> emit) async {
    emit(GetDISCQuestionListLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetDISCQuestionListFailed("No Network Connection!"));
    } else {
      try {
        List<DISCQuestionModel> discQuestionList;
        discQuestionList = await coursiaRepository.getDISCQuestionList();
        emit(GetDISCQuestionListSuccess(discQuestionList: discQuestionList));
      } catch (e) {
        emit(GetDISCTypeFailed(e.toString()));
      }
    }
  }
}
