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
