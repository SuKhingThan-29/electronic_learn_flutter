import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'disc_event.dart';
part 'disc_state.dart';

class DiscBloc extends Bloc<DiscEvent, DiscState> {
  DiscBloc() : super(DiscInitial()) {
    on<OnTapEvent>(_onTapEvent);
  }

  _onTapEvent(OnTapEvent event, Emitter<DiscState> emit) {
    // emit(OnTapSuccess(onTapIndex: event.onTapIndex, onTap: event.onTap));
    emit(OnTapSuccess(onTapIndex: event.onTapIndex));
  }
}
