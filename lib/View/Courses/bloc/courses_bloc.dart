import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
part 'courses_event.dart';
part 'courses_state.dart';

class CoursesBloc extends Bloc<CoursesEvent, CoursesState> {
  CoursesBloc() : super(CoursesInitial()) {
    on<OnTapEvent>(_onTapEvent);
  }

  _onTapEvent(OnTapEvent event, Emitter<CoursesState> emit) {
    emit(OnTapSuccess(type: event.type!));
  }
}
