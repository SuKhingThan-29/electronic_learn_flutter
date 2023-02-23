part of 'disc_bloc.dart';

abstract class DiscEvent extends Equatable {
  const DiscEvent();

  @override
  List<Object> get props => [];
}

class OnTapEvent extends DiscEvent {
  // final bool? onTap;
  final int? onTapIndex;
  // const OnTapEvent({required this.onTapIndex, this.onTap});
  const OnTapEvent({required this.onTapIndex});
}
