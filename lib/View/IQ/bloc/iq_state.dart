part of 'iq_bloc.dart';

abstract class IqState extends Equatable {
  const IqState();

  @override
  List<Object> get props => [];
}

class IqInitial extends IqState {}

class OnTapSuccess extends IqState {
  final int? onTapIndex;
  const OnTapSuccess({required this.onTapIndex});

  @override
  List<Object> get props => [onTapIndex!];
}
