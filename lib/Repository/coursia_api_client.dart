// ignore_for_file: unnecessary_null_comparison

import 'dart:convert';
import 'dart:developer';

import 'package:coursia/Model/account_register_model.dart';
import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/Model/competency_type_model.dart';
import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/Model/disc_type_model.dart';
import 'package:coursia/Model/email_verify_response_model.dart';
import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/Model/iq_type_model.dart';
import 'package:coursia/Model/job_level_model.dart';
import 'package:coursia/Model/login_response_model.dart';
import 'package:coursia/Model/otp_verify_response_model.dart';
import 'package:coursia/Model/quiz_question_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';
import 'package:coursia/Model/reset_password_response_model.dart';
import 'package:coursia/Model/static_data.dart';
import 'package:coursia/Model/subcategory_model.dart';
import 'package:coursia/Utils/api_service.dart';
import 'package:coursia/Utils/customexception.dart';
import 'package:dio/dio.dart';
import 'package:hive/hive.dart';

class CoursiaApiClient {
  final _dio = Dio();

  CoursiaApiClient() {
    _dio.options.baseUrl = APIService.API_URL;

    _dio.options.connectTimeout = const Duration(seconds: 20000);
    _dio.options.receiveTimeout = const Duration(seconds: 20000);
    _dio.options.sendTimeout = const Duration(seconds: 20000);

    // _dio.options.headers['Content-Type'] = '*/*';
    _dio.options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    _dio.options.headers['Accept'] = 'application/json; charset=UTF-8';
    _dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true, request: true));
    init();
  }

  init() async {
    var token = StaticData.loginResponseModel?.data?.token;

    if (token != null) {
      _dio.options.headers['Authorization'] = 'Bearer $token';
    }
  }

  Future<List<DISCTypeModel>> getDISCTypeList() async {
    try {
      final response = await _dio.get('frontend/v1/disc_type');
      if (response.statusCode == 200) {
        final discTypeList = response.data['data'] as List;
        return discTypeList
            .map((item) => DISCTypeModel.fromJson(item))
            .toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (e) {
      throw Exception(e.response?.data?['message'] ?? e.message);
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<List<IQTypeModel>> getIQTypeList() async {
    try {
      final response = await _dio.get('frontend/v1/iq_type');
      if (response.statusCode == 200) {
        final iqTypeList = response.data['data'] as List;
        return iqTypeList.map((item) => IQTypeModel.fromJson(item)).toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (e) {
      throw Exception(e.response?.data?['message'] ?? e.message);
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<List<CompetencyTypeModel>> getCompetencyTypeList() async {
    try {
      final response = await _dio.get('frontend/v1/competency_type');
      if (response.statusCode == 200) {
        final competencyTypeList = response.data['data'] as List;
        return competencyTypeList
            .map((item) => CompetencyTypeModel.fromJson(item))
            .toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (e) {
      throw Exception(e.response?.data?['message'] ?? e.message);
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<List<QuizTypeModel>> getQuizTypeList() async {
    try {
      final response = await _dio.get('frontend/v1/quiz_type');
      if (response.statusCode == 200) {
        final quizTypeList = response.data['data'] as List;
        return quizTypeList
            .map((item) => QuizTypeModel.fromJson(item))
            .toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (e) {
      throw Exception(e.response?.data?['message'] ?? e.message);
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<DISCQuestionModel> getDISCQuestionList() async {
    try {
      init();
      final response = await _dio.get('frontend/v1/disc_question');
      if (response.statusCode == 200) {
        return DISCQuestionModel.fromJson(response.data['data']);
      }
      throw CustomException(response.data['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${e.response?.statusCode}");
      }
      throw CustomException(
          e.response!.data['message'] ?? "Something went wrong");
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<List<IQQuestionModel>> getIQQuestionList() async {
    try {
      final response = await _dio.get('frontend/v1/iq_test');
      if (response.statusCode == 200) {
        final iqQuestionList = response.data['data'] as List;
        return iqQuestionList
            .map((item) => IQQuestionModel.fromJson(item))
            .toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (e) {
      throw Exception(e.response?.data?['message'] ?? e.message);
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<List<CompetencyQuestionModel>> getCompetencyQuestionList() async {
    try {
      final response = await _dio.get('frontend/v1/competency_question');
      if (response.statusCode == 200) {
        final competencyQuestionList = response.data['data'] as List;
        return competencyQuestionList
            .map((item) => CompetencyQuestionModel.fromJson(item))
            .toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (e) {
      throw Exception(e.response?.data?['message'] ?? e.message);
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<List<QuizQuestionModel>> getQuizQuestionList(int? quizTypeId) async {
    try {
      if (quizTypeId == null) {
        final response = await _dio.get('frontend/v1/quiz_test');
        if (response.statusCode == 200) {
          final quizQuestionList = response.data['data'] as List;
          return quizQuestionList
              .map((item) => QuizQuestionModel.fromJson(item))
              .toList();
        }
      } else {
        final response = await _dio.get('frontend/v1/quiz_test/$quizTypeId');
        if (response.statusCode == 200) {
          final quizQuestionList = response.data['data'] as List;
          return quizQuestionList
              .map((item) => QuizQuestionModel.fromJson(item))
              .toList();
        }
      }

      throw Exception('Something went wrong');
    } on DioError catch (e) {
      throw Exception(e.response?.data?['message'] ?? e.message);
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<List<JobLevelModel>> getJobLevelList() async {
    try {
      final response = await _dio.get('frontend/v1/joblevel');
      if (response.statusCode == 200) {
        final jobLevelList = response.data['data'] as List;
        return jobLevelList
            .map((item) => JobLevelModel.fromJson(item))
            .toList();
      }
      throw Exception('Something went wrong');
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${e.response?.statusCode}");
      }
      throw Exception(e.response?.data?['message'] ?? e.message);
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<EmailVerifyResponseModel> emailVerification(
      String? userName, String? email) async {
    try {
      final data = FormData.fromMap({"name": userName, "email": email});
      final response =
          await _dio.post('frontend/v1/email-verification', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return EmailVerifyResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return EmailVerifyResponseModel.fromJson(response.data);
      }

      throw CustomException(response.data['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${e.response?.statusCode}");
      }
      throw CustomException(
          e.response!.data['message'] ?? "Something went wrong");
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<OTPVerifyResponseModel> sendOTP(
      String? userName, String? email, String? otp) async {
    try {
      final data =
          FormData.fromMap({"otp": otp, "name": userName, "email": email});
      final response = await _dio.post('frontend/v1/checkotp', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return OTPVerifyResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return OTPVerifyResponseModel.fromJson(response.data);
      }

      throw CustomException(response.data['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${e.response?.statusCode}");
      }
      throw CustomException(
          e.response!.data['message'] ?? "Something went wrong");
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<RegisterAccountModel> registerAccount(String? name, String? email,
      String? password, String? confirmPassword, String? joblevel) async {
    try {
      final data = FormData.fromMap({
        "name": name,
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword,
        "job_level": joblevel
      });
      final response = await _dio.post('frontend/v1/register', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return RegisterAccountModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return RegisterAccountModel.fromJson(response.data);
      }

      throw CustomException(response.data['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${e.response?.statusCode}");
      }
      throw CustomException(
          e.response!.data['message'] ?? "Something went wrong");
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<EmailVerifyResponseModel> emailVerificationFromForget(
      String? email) async {
    try {
      final data = FormData.fromMap({"email": email});
      final response = await _dio
          .post('frontend/v1/forget_password_email_verificaion', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return EmailVerifyResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return EmailVerifyResponseModel.fromJson(response.data);
      }

      throw CustomException(response.data['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${e.response?.statusCode}");
      }
      throw CustomException(
          e.response!.data['message'] ?? "Something went wrong");
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<OTPVerifyResponseModel> sendOTPFromForget(
      String? email, String? otp) async {
    try {
      final data = FormData.fromMap({"email": email, "otp": otp});
      final response =
          await _dio.post('frontend/v1/forget_password_check_otp', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return OTPVerifyResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return OTPVerifyResponseModel.fromJson(response.data);
      }

      throw CustomException(response.data['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${e.response?.statusCode}");
      }
      throw CustomException(
          e.response!.data['message'] ?? "Something went wrong");
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<ResetPasswordResponseModel> resetPassword(
      String? email, String? password, String? confirmPassword) async {
    try {
      final data = FormData.fromMap({
        "email": email,
        "password": password,
        "password_confirmation": confirmPassword
      });
      final response =
          await _dio.post('frontend/v1/reset_password', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        return ResetPasswordResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return ResetPasswordResponseModel.fromJson(response.data);
      }
      throw CustomException(response.data['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${e.response?.statusCode}");
      }
      throw CustomException(
          e.response!.data['message'] ?? "Something went wrong");
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<LoginResponseModel> login(String? email, String? password) async {
    try {
      final data = FormData.fromMap({"email": email, "password": password});
      final response = await _dio.post('frontend/v1/login', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        var box = Hive.box("library_db");
        box.put("user", response.data);
        StaticData.loginResponseModel =
            LoginResponseModel.fromJson(response.data);

        ///To retrieve data from box

        final userData = await box.get('user');
        log('Token - ${userData?['data']['token']}');
        _dio.options.headers['Authorization'] =
            'Bearer ${userData?['data']['token']}';

        return LoginResponseModel.fromJson(response.data);
      } else if (response.statusCode == 200 &&
          response.data['success'] == false) {
        return LoginResponseModel.fromJson(response.data);
      }
      throw CustomException(response.data['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${e.response?.statusCode}");
      }
      throw CustomException(
          e.response!.data['message'] ?? "Something went wrong");
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<Result> sendDISCAnswerList(DISCQuestionModel discQuestionModel) async {
    try {
      init();
      final data = jsonEncode(discQuestionModel.sendDISCResult());
      final response =
          await _dio.post('frontend/v1/send_disc_answer', data: data);
      if (response.statusCode == 200) {
        return Result.fromJson(response.data['data']);
      }
      throw CustomException(response.data['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${e.response?.statusCode}");
      }
      throw CustomException(
          e.response!.data['message'] ?? "Something went wrong");
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<List<SubCategoryModel>> getSubCategoryList(String? mainSubName) async {
    try {
      final data = FormData.fromMap({"main_category_name": mainSubName});
      final response =
          await _dio.post('frontend/v1/get_course_subcategory', data: data);
      if (response.statusCode == 200 && response.data['success'] == true) {
        final subCategoryList = response.data['data'] as List;
        return subCategoryList
            .map((item) => SubCategoryModel.fromJson(item))
            .toList();
      }
      throw CustomException(response.data['message']);
    } on DioError catch (e) {
      if (e.type == DioErrorType.badResponse) {
        throw CustomException(
            "Received invalid status code: ${e.response?.statusCode}");
      }
      throw CustomException(
          e.response!.data['message'] ?? "Something went wrong");
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }
}
