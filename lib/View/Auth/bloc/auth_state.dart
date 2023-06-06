part of 'auth_bloc.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitial extends AuthState {}

class VisibilityOnOffLoading extends AuthState {}

class VisibilityOnOffSuccess extends AuthState {
  final bool? obscureText;
  const VisibilityOnOffSuccess({this.obscureText});

  @override
  List<Object> get props => [obscureText!];
}

class VisibilityOnOff1Loading extends AuthState {}

class VisibilityOnOff1Success extends AuthState {
  final bool? obscureText1;
  const VisibilityOnOff1Success({this.obscureText1});

  @override
  List<Object> get props => [obscureText1!];
}

class GetJobLevelLoading extends AuthState {}

class GetJobLevelSuccess extends AuthState {
  final List<JobLevelModel>? jobLevelList;
  const GetJobLevelSuccess({this.jobLevelList});

  @override
  List<Object> get props => [jobLevelList!];
}

class GetJobLevelFailed extends AuthState {
  final String? message;
  const GetJobLevelFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class EmailVerificationLoading extends AuthState {}

class EmailVerificationSuccess extends AuthState {
  final EmailVerifyResponseModel? emailVerifyResponseModel;
  const EmailVerificationSuccess({this.emailVerifyResponseModel});

  @override
  List<Object> get props => [emailVerifyResponseModel!];
}

class EmailVerificationFailed extends AuthState {
  final String? message;
  const EmailVerificationFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class SendOTPLoading extends AuthState {}

class SendOTPSuccess extends AuthState {
  final OTPVerifyResponseModel? otpVerifyResponseModel;
  const SendOTPSuccess({this.otpVerifyResponseModel});

  @override
  List<Object> get props => [otpVerifyResponseModel!];
}

class SendOTPFailed extends AuthState {
  final String? message;
  const SendOTPFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class RegisterAccountLoading extends AuthState {}

class RegisterAccountSuccess extends AuthState {
  final RegisterAccountModel? registerAccountModel;
  const RegisterAccountSuccess({this.registerAccountModel});

  @override
  List<Object> get props => [registerAccountModel!];
}

class RegisterAccountFailed extends AuthState {
  final String? message;
  const RegisterAccountFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class EmailVerificationFromForgetLoading extends AuthState {}

class EmailVerificationFromForgetSuccess extends AuthState {
  final EmailVerifyResponseModel? emailVerifyResponseModel;
  const EmailVerificationFromForgetSuccess({this.emailVerifyResponseModel});

  @override
  List<Object> get props => [emailVerifyResponseModel!];
}

class EmailVerificationFromForgetFailed extends AuthState {
  final String? message;
  const EmailVerificationFromForgetFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class SendOTPFromForgetLoading extends AuthState {}

class SendOTPFromForgetSuccess extends AuthState {
  final OTPVerifyResponseModel? otpVerifyResponseModel;
  const SendOTPFromForgetSuccess({this.otpVerifyResponseModel});

  @override
  List<Object> get props => [otpVerifyResponseModel!];
}

class SendOTPFromForgetFailed extends AuthState {
  final String? message;
  const SendOTPFromForgetFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class ResetPasswordLoading extends AuthState {}

class ResetPasswordSuccess extends AuthState {
  final ResetPasswordResponseModel? resetPasswordResponseModel;
  const ResetPasswordSuccess({this.resetPasswordResponseModel});

  @override
  List<Object> get props => [resetPasswordResponseModel!];
}

class ResetPasswordFailed extends AuthState {
  final String? message;
  const ResetPasswordFailed(this.message);

  @override
  List<Object> get props => [message!];
}

class LoginLoading extends AuthState {}

class LoginSuccess extends AuthState {
  final LoginResponseModel? loginResponseModel;
  const LoginSuccess({this.loginResponseModel});

  @override
  List<Object> get props => [loginResponseModel!];
}

class LoginFailed extends AuthState {
  final String? message;
  const LoginFailed(this.message);

  @override
  List<Object> get props => [message!];
}
