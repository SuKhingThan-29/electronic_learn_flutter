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

class GetJobLevel extends AuthEvent {
  const GetJobLevel();

  @override
  List<Object> get props => [];
}

class EmailVerification extends AuthEvent {
  final String? name;
  final String? email;
  const EmailVerification({this.name, this.email});

  @override
  List<Object> get props => [name!, email!];
}

class SendOTP extends AuthEvent {
  final String? name;
  final String? email;
  final String? otp;
  const SendOTP({this.name, this.email, this.otp});

  @override
  List<Object> get props => [name!, email!, otp!];
}
