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
    emit(GetDateSuccess(date: event.date));
  }

  _getDropDownValue(GetDropDownValue event, Emitter<ProfileState> emit) {
    emit(GetDropDownValueSuccess(value: event.value));
  }
}
