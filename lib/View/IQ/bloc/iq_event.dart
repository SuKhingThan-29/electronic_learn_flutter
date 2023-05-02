part of 'iq_bloc.dart';

abstract class IqEvent extends Equatable {
  const IqEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends IqEvent {
  final int? onTapIndex;
  const OnTapEvent({required this.onTapIndex});
}
