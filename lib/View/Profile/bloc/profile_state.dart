part of 'profile_bloc.dart';

abstract class ProfileState extends Equatable {
  const ProfileState();

  @override
  List<Object> get props => [];
}

class ProfileInitial extends ProfileState {}

class GetDateLoading extends ProfileState {}

class GetDateSuccess extends ProfileState {
  final String date;
  const GetDateSuccess({required this.date});

  @override
  List<Object> get props => [date];
}

class GetDateFailed extends ProfileState {
  final String message;
  const GetDateFailed({required this.message});

  @override
  List<Object> get props => [message];
}

class GetDropDownValueLoading extends ProfileState {}

class GetDropDownValueSuccess extends ProfileState {
  final String value;
  const GetDropDownValueSuccess({required this.value});

  @override
  List<Object> get props => [value];
}

class GetDropDownValueFailed extends ProfileState {
  final String message;
  const GetDropDownValueFailed({required this.message});

  @override
  List<Object> get props => [message];
}
