import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<VisibilityOnOffEvent>(_visibilityOnOffEvent);
    on<VisibilityOnOff1Event>(_visibilityOnOff1Event);
  }

  _visibilityOnOffEvent(VisibilityOnOffEvent event, Emitter<AuthState> emit) {
    emit(VisibilityOnOffLoading());
    emit(VisibilityOnOffSuccess(obscureText: event.obscureText));
  }

  _visibilityOnOff1Event(VisibilityOnOff1Event event, Emitter<AuthState> emit) {
    emit(VisibilityOnOff1Loading());
    emit(VisibilityOnOff1Success(obscureText1: event.obscureText1));
  }
}
