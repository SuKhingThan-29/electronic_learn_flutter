import 'package:coursia/Model/competency_question_model.dart';
import 'package:coursia/Model/competency_type_model.dart';
import 'package:coursia/Model/disc_question_model.dart';
import 'package:coursia/Model/disc_type_model.dart';
import 'package:coursia/Model/iq_question_model.dart';
import 'package:coursia/Model/iq_type_model.dart';
import 'package:coursia/Model/quiz_question_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';
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

  Future<List<QuizQuestionModel>> getQuizQuestionList() async {
    return await coursiaApiClient.getQuizQuestionList();
  }
}
