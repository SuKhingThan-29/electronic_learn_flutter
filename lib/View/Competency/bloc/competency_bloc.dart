import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'competency_event.dart';
part 'competency_state.dart';

class CompetencyBloc extends Bloc<CompetencyEvent, CompetencyState> {
  CompetencyBloc() : super(CompetencyInitial()) {
    on<OnTapEvent>(_onTapEvent);
  }

  _onTapEvent(OnTapEvent event, Emitter<CompetencyState> emit) {
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }
}
