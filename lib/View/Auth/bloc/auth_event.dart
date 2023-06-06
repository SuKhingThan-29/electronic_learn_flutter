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

class RegisterAccount extends AuthEvent {
  final String? name;
  final String? email;
  final String? password;
  final String? confirmPassword;
  final String? joblevel;
  const RegisterAccount(
      {this.name,
      this.email,
      this.password,
      this.confirmPassword,
      this.joblevel});

  @override
  List<Object> get props =>
      [name!, email!, password!, confirmPassword!, joblevel!];
}

class EmailVerificationFromForget extends AuthEvent {
  final String? email;
  const EmailVerificationFromForget({this.email});

  @override
  List<Object> get props => [email!];
}

class SendOTPFromForget extends AuthEvent {
  final String? email;
  final String? otp;
  const SendOTPFromForget({this.email, this.otp});

  @override
  List<Object> get props => [email!, otp!];
}

class ResetPassword extends AuthEvent {
  final String? email;
  final String? password;
  final String? confirmPassword;
  const ResetPassword({this.email, this.password, this.confirmPassword});

  @override
  List<Object> get props => [email!, password!, confirmPassword!];
}

class Login extends AuthEvent {
  final String? email;
  final String? password;
  const Login({this.email, this.password});

  @override
  List<Object> get props => [email!, password!];
}
