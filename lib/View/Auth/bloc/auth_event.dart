part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class VisibilityOnOffEvent extends AuthEvent {
  final bool? obscureText;
  const VisibilityOnOffEvent(this.obscureText);

  @override
  List<Object> get props => [obscureText!];
}

class VisibilityOnOff1Event extends AuthEvent {
  final bool? obscureText1;
  const VisibilityOnOff1Event(this.obscureText1);

  @override
  List<Object> get props => [obscureText1!];
}
