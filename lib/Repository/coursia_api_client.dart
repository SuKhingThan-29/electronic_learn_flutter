// ignore_for_file: unnecessary_null_comparison

import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/Model/competency_type_model.dart';
import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/Model/disc_type_model.dart';
import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/Model/iq_type_model.dart';
import 'package:coursia/Model/quiz_question_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';
import 'package:coursia/Utils/api_service.dart';
import 'package:coursia/Utils/exception.dart';
import 'package:dio/dio.dart';

class CoursiaApiClient {
  final _dio = Dio();

  CoursiaApiClient() {
    _dio.options.baseUrl = APIService.API_URL;

    _dio.options.connectTimeout = const Duration(seconds: 20000);
    _dio.options.receiveTimeout = const Duration(seconds: 20000);
    _dio.options.sendTimeout = const Duration(seconds: 20000);

    _dio.options.headers['Content-Type'] = 'text/plain';
    //_dio.options.headers['Content-Type'] = 'application/json; charset=UTF-8';
    //_dio.options.headers['Accept'] = 'application/json; charset=UTF-8';
    _dio.interceptors.add(
        LogInterceptor(requestBody: true, responseBody: true, request: true));

    const token =
        'eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiZWI5MDFlNGEzODhmZWI4ZDE2MjdjOTg5MDY0NDMwZDNlNmE2MjIwNzI5YzFiZTUwMWI3NTNiNzIxOTJhZjVkMGM5NmY0NjQ2ZmFjNTY1NDIiLCJpYXQiOjE2ODQ1NTE1MjEuMzk3ODY4LCJuYmYiOjE2ODQ1NTE1MjEuMzk3ODc1LCJleHAiOjE3MTYxNzM5MjEuMzI0MzY1LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.EmCIAysiN6iPVgcF6VyLtyjcpTUFUO7wW5OH0X1Tg-L9DnoNDhaJRxrvpJYnkFt8yIfv0Doq7UqgCPYiSiYOt7tgRuzrVJ82cePGayZQU-H_oiowGBwPqdIVLZYkVxrVNIlJO2xNyKHFJLs5mVzQpWbaGFmd8ZPfUIY_1UcayfCvIB4402V0mIO3SaBGRBj3zRZoiF3JwuhbGTWAzS5geA3vWsjZdskR4nGBOBIQvg01KYyGv2jSO3d6jADZnRarWxsBhFngrwDT19jDOjyGfGh5cL3qJB3PWSp9n5ZqsuB1awjj_GIaEhVFL5qgh_QnZAYukhJnf31czVMPYdGTz9BJBwE7VJXgzcqNzTMOX4STpnrJkbR-GHPwDaSje7Z2VIFx20iKdU9JLkBZOC5XheXtZZDRFqOZgKLcvO5E44mb8o4uTauBICcX6vvLqt4PuuZ-aLWUHXVn61t251nqT0AeATbnozolOuQ-bJ6zVH99kU56x7H7ExT3P1QrjpVSvVLPrxbi--vXAUjHH3vBfirmSoNAh5NXR7KP9G1aHEuw5PayBKJkGrgvltUe4_OaJKViIYnI6CtQ94CLkcy8XjLe0EbNuRW0s0PKjJ2FHvCsm4E0jeSFrTmC2XQPllt-quXh31jeq9mPD-p5xc6a_uZYP32sLqBl2eJNs9DF1HA';
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
      throw BottomPlacedException(code: 'Something went wrong');
    } on DioError catch (e) {
      throw BottomPlacedException(
          code: e.response?.data?['message'] ?? e.message);
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
      throw BottomPlacedException(code: 'Something went wrong');
    } on DioError catch (e) {
      throw BottomPlacedException(
          code: e.response?.data?['message'] ?? e.message);
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
      throw BottomPlacedException(code: 'Something went wrong');
    } on DioError catch (e) {
      throw BottomPlacedException(
          code: e.response?.data?['message'] ?? e.message);
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
      throw BottomPlacedException(code: 'Something went wrong');
    } on DioError catch (e) {
      throw BottomPlacedException(
          code: e.response?.data?['message'] ?? e.message);
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }

  Future<List<DISCQuestionModel>> getDISCQuestionList() async {
    try {
      final response = await _dio.get('frontend/v1/disc_question');
      if (response.statusCode == 200) {
        final discQuestionList = response.data['data'] as List;
        return discQuestionList
            .map((item) => DISCQuestionModel.fromJson(item))
            .toList();
      }
      throw BottomPlacedException(code: 'Something went wrong');
    } on DioError catch (e) {
      throw BottomPlacedException(
          code: e.response?.data?['message'] ?? e.message);
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
      throw BottomPlacedException(code: 'Something went wrong');
    } on DioError catch (e) {
      throw BottomPlacedException(
          code: e.response?.data?['message'] ?? e.message);
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
      throw BottomPlacedException(code: 'Something went wrong');
    } on DioError catch (e) {
      throw BottomPlacedException(
          code: e.response?.data?['message'] ?? e.message);
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

      throw BottomPlacedException(code: 'Something went wrong');
    } on DioError catch (e) {
      throw BottomPlacedException(
          code: e.response?.data?['message'] ?? e.message);
    } catch (e) {
      throw UnimplementedError("Something went wrong");
    }
  }
}
