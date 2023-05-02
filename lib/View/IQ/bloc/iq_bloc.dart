import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'iq_event.dart';
part 'iq_state.dart';

class IqBloc extends Bloc<IqEvent, IqState> {
  IqBloc() : super(IqInitial()) {
    on<OnTapEvent>(_onTapEvent);
  }

  _onTapEvent(OnTapEvent event, Emitter<IqState> emit) {
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }
}
