import 'package:coursia/Model/account_register_model.dart';
import 'package:coursia/Model/email_verify_response_model.dart';
import 'package:coursia/Model/job_level_model.dart';
import 'package:coursia/Model/otp_verify_response_model.dart';
import 'package:coursia/Model/reset_password_response_model.dart';
import 'package:coursia/Repository/coursia_repository.dart';
import 'package:coursia/Utils/functions.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  CoursiaRepository coursiaRepository = CoursiaRepository();
  AuthBloc() : super(AuthInitial()) {
    on<VisibilityOnOffEvent>(_visibilityOnOffEvent);
    on<VisibilityOnOff1Event>(_visibilityOnOff1Event);
    on<GetJobLevel>(_getJobLevel);
    on<EmailVerification>(_emailVerification);
    on<SendOTP>(_sendOTP);
    on<RegisterAccount>(_registerAccount);
    on<EmailVerificationFromForget>(_emailVerificationFromForget);
    on<SendOTPFromForget>(_sendOTPFromForget);
    on<ResetPassword>(_resetPassword);
  }

  _visibilityOnOffEvent(VisibilityOnOffEvent event, Emitter<AuthState> emit) {
    emit(VisibilityOnOffLoading());
    emit(VisibilityOnOffSuccess(obscureText: event.obscureText));
  }

  _visibilityOnOff1Event(VisibilityOnOff1Event event, Emitter<AuthState> emit) {
    emit(VisibilityOnOff1Loading());
    emit(VisibilityOnOff1Success(obscureText1: event.obscureText1));
  }

  _getJobLevel(GetJobLevel event, Emitter<AuthState> emit) async {
    emit(GetJobLevelLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const GetJobLevelFailed("No Network Connection!"));
    } else {
      try {
        List<JobLevelModel> jobLevelList;
        jobLevelList = await coursiaRepository.getJobLevelList();
        emit(GetJobLevelSuccess(jobLevelList: jobLevelList));
      } catch (e) {
        emit(GetJobLevelFailed(e.toString()));
      }
    }
  }

  _emailVerification(EmailVerification event, Emitter<AuthState> emit) async {
    emit(EmailVerificationLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const EmailVerificationFailed("No Network Connection!"));
    } else {
      try {
        EmailVerifyResponseModel emailVerifyResponseModel;
        emailVerifyResponseModel =
            await coursiaRepository.emailVerification(event.name, event.email);
        emit(EmailVerificationSuccess(
            emailVerifyResponseModel: emailVerifyResponseModel));
      } catch (e) {
        emit(EmailVerificationFailed(e.toString()));
      }
    }
  }

  _sendOTP(SendOTP event, Emitter<AuthState> emit) async {
    emit(SendOTPLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const SendOTPFailed("No Network Connection!"));
    } else {
      try {
        OTPVerifyResponseModel otpVerifyResponseModel;
        otpVerifyResponseModel =
            await coursiaRepository.sendOTP(event.name, event.email, event.otp);
        emit(SendOTPSuccess(otpVerifyResponseModel: otpVerifyResponseModel));
      } catch (e) {
        emit(SendOTPFailed(e.toString()));
      }
    }
  }

  _registerAccount(RegisterAccount event, Emitter<AuthState> emit) async {
    emit(RegisterAccountLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const RegisterAccountFailed("No Network Connection!"));
    } else {
      try {
        RegisterAccountModel registerAccountModel;
        registerAccountModel = await coursiaRepository.registerAccount(
            event.name,
            event.email,
            event.password,
            event.confirmPassword,
            event.joblevel);
        emit(
            RegisterAccountSuccess(registerAccountModel: registerAccountModel));
      } catch (e) {
        emit(RegisterAccountFailed(e.toString()));
      }
    }
  }

  _emailVerificationFromForget(
      EmailVerificationFromForget event, Emitter<AuthState> emit) async {
    emit(EmailVerificationFromForgetLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const EmailVerificationFromForgetFailed("No Network Connection!"));
    } else {
      try {
        EmailVerifyResponseModel emailVerifyResponseModel;
        emailVerifyResponseModel =
            await coursiaRepository.emailVerificationFromForget(event.email);
        emit(EmailVerificationFromForgetSuccess(
            emailVerifyResponseModel: emailVerifyResponseModel));
      } catch (e) {
        emit(EmailVerificationFromForgetFailed(e.toString()));
      }
    }
  }

  _sendOTPFromForget(SendOTPFromForget event, Emitter<AuthState> emit) async {
    emit(SendOTPFromForgetLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const SendOTPFromForgetFailed("No Network Connection!"));
    } else {
      try {
        OTPVerifyResponseModel otpVerifyResponseModel;
        otpVerifyResponseModel =
            await coursiaRepository.sendOTPFromForget(event.email, event.otp);
        emit(SendOTPFromForgetSuccess(
            otpVerifyResponseModel: otpVerifyResponseModel));
      } catch (e) {
        emit(SendOTPFromForgetFailed(e.toString()));
      }
    }
  }

  _resetPassword(ResetPassword event, Emitter<AuthState> emit) async {
    emit(ResetPasswordLoading());
    if (!await Functions.getNetworkStatus()) {
      emit(const ResetPasswordFailed("No Network Connection!"));
    } else {
      try {
        ResetPasswordResponseModel resetPasswordResponseModel;
        resetPasswordResponseModel = await coursiaRepository.resetPassword(
            event.email, event.password, event.confirmPassword);
        emit(ResetPasswordSuccess(
            resetPasswordResponseModel: resetPasswordResponseModel));
      } catch (e) {
        emit(ResetPasswordFailed(e.toString()));
      }
    }
  }
}
