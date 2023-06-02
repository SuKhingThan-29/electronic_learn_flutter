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
