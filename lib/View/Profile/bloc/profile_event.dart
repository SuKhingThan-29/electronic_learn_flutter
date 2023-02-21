part of 'profile_bloc.dart';

abstract class ProfileEvent extends Equatable {
  const ProfileEvent();

  @override
  List<Object> get props => [];
}

class GetSelectedDate extends ProfileEvent {
  final String date;
  const GetSelectedDate({required this.date});

  @override
  List<Object> get props => [date];
}

class GetDropDownValue extends ProfileEvent {
  final String value;
  const GetDropDownValue({required this.value});

  @override
  List<Object> get props => [value];
}
