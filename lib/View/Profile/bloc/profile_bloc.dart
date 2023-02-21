import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'profile_event.dart';
part 'profile_state.dart';

class ProfileBloc extends Bloc<ProfileEvent, ProfileState> {
  ProfileBloc() : super(ProfileInitial()) {
    on<GetSelectedDate>(_getSelectedDate);
    on<GetDropDownValue>(_getDropDownValue);
  }

  _getSelectedDate(GetSelectedDate event, Emitter<ProfileState> emit) {
    emit(GetDateLoading());
    try {
      emit(GetDateSuccess(date: event.date));
    } catch (e) {
      emit(GetDateFailed(message: e.toString()));
    }
  }

  _getDropDownValue(GetDropDownValue event, Emitter<ProfileState> emit) {
    emit(GetDropDownValueLoading());
    try {
      emit(GetDropDownValueSuccess(value: event.value));
    } catch (e) {
      emit(GetDropDownValueFailed(message: e.toString()));
    }
  }
}
