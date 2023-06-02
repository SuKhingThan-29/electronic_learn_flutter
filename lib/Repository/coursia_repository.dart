import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/Model/competency_type_model.dart';
import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/Model/disc_type_model.dart';
import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/Model/iq_type_model.dart';
import 'package:coursia/Model/job_level_model.dart';
import 'package:coursia/Model/otp_verify_response_model.dart';
import 'package:coursia/Model/quiz_question_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';
import 'package:coursia/Model/email_verify_response_model.dart';
import 'package:coursia/Repository/coursia_api_client.dart';

class CoursiaRepository {
  CoursiaApiClient coursiaApiClient = CoursiaApiClient();

  Future<List<DISCTypeModel>> getDISCTypeList() async {
    return await coursiaApiClient.getDISCTypeList();
  }

  Future<List<IQTypeModel>> getIQTypeList() async {
    return await coursiaApiClient.getIQTypeList();
  }

  Future<List<CompetencyTypeModel>> getCompetencyTypeList() async {
    return await coursiaApiClient.getCompetencyTypeList();
  }

  Future<List<QuizTypeModel>> getQuizTypeList() async {
    return await coursiaApiClient.getQuizTypeList();
  }

  Future<List<DISCQuestionModel>> getDISCQuestionList() async {
    return await coursiaApiClient.getDISCQuestionList();
  }

  Future<List<IQQuestionModel>> getIQQuestionList() async {
    return await coursiaApiClient.getIQQuestionList();
  }

  Future<List<CompetencyQuestionModel>> getCompetencyQuestionList() async {
    return await coursiaApiClient.getCompetencyQuestionList();
  }

  Future<List<QuizQuestionModel>> getQuizQuestionList(int? quizTypeId) async {
    return await coursiaApiClient.getQuizQuestionList(quizTypeId);
  }

  Future<List<JobLevelModel>> getJobLevelList() async {
    return await coursiaApiClient.getJobLevelList();
  }

  Future<EmailVerifyResponseModel> emailVerification(
      String? userName, String? email) async {
    return await coursiaApiClient.emailVerification(userName, email);
  }

  Future<OTPVerifyResponseModel> sendOTP(
      String? userName, String? email, String? otp) async {
    return await coursiaApiClient.sendOTP(userName, email, otp);
  }
}
