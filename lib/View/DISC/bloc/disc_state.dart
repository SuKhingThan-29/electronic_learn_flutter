// ignore_for_file: camel_case_types

part of 'disc_bloc.dart';

abstract class DiscState extends Equatable {
  const DiscState();

  @override
  List<Object> get props => [];
}

class DiscInitial extends DiscState {}

class OnTapSuccess extends DiscState {
  final int? onTapIndex;

  const OnTapSuccess({required this.onTapIndex});

  @override
  List<Object> get props => [onTapIndex!];
}
