import 'package:coursia/Model/image_model.dart';
import 'package:coursia/Model/quiz_type_model.dart';

class QuizQuestionModel {
  int? id;
  int? quizTypeId;
  String? questionName;
  int? mediableId;
  List<QuizAnswer>? quizAnswer;
  QuizTypeModel? quizType;
  ImageModel? image;

  QuizQuestionModel(
      {this.id,
      this.quizTypeId,
      this.questionName,
      this.mediableId,
      this.quizAnswer,
      this.quizType,
      this.image});

  QuizQuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizTypeId = json['quiz_type_id'];
    questionName = json['question_name'];
    mediableId = json['mediable_id'];
    if (json['quiz_answer'] != null) {
      quizAnswer = <QuizAnswer>[];
      json['quiz_answer'].forEach((v) {
        quizAnswer!.add(QuizAnswer.fromJson(v));
      });
    }
    quizType = json['quiz_type'] != null
        ? QuizTypeModel.fromJson(json['quiz_type'])
        : null;
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quiz_type_id'] = quizTypeId;
    data['question_name'] = questionName;
    data['mediable_id'] = mediableId;
    if (quizAnswer != null) {
      data['quiz_answer'] = quizAnswer!.map((v) => v.toJson()).toList();
    }
    if (quizType != null) {
      data['quiz_type'] = quizType!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class QuizAnswer {
  int? id;
  int? quizQuestionId;
  String? answer;
  int? correctStatus;

  QuizAnswer({this.id, this.quizQuestionId, this.answer, this.correctStatus});

  QuizAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    quizQuestionId = json['quiz_question_id'];
    answer = json['answer'];
    correctStatus = json['correct_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['quiz_question_id'] = quizQuestionId;
    data['answer'] = answer;
    data['correct_status'] = correctStatus;
    return data;
  }
}
