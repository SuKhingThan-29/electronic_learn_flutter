import 'package:coursia/Model/image_model.dart';
import 'package:coursia/Model/iq_type_model.dart';

class IQQuestionModel {
  int? id;
  int? iqTypeId;
  String? questionName;
  int? mediableId;
  List<IqAnswer>? iqAnswer;
  IQTypeModel? iqType;
  ImageModel? image;

  IQQuestionModel(
      {this.id,
      this.iqTypeId,
      this.questionName,
      this.mediableId,
      this.iqAnswer,
      this.iqType,
      this.image});

  IQQuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iqTypeId = json['iq_type_id'];
    questionName = json['question_name'];
    mediableId = json['mediable_id'];
    if (json['iq_answer'] != null) {
      iqAnswer = <IqAnswer>[];
      json['iq_answer'].forEach((v) {
        iqAnswer!.add(IqAnswer.fromJson(v));
      });
    }
    iqType =
        json['iq_type'] != null ? IQTypeModel.fromJson(json['iq_type']) : null;
    image = json['image'] != null ? ImageModel.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['iq_type_id'] = iqTypeId;
    data['question_name'] = questionName;
    data['mediable_id'] = mediableId;
    if (iqAnswer != null) {
      data['iq_answer'] = iqAnswer!.map((v) => v.toJson()).toList();
    }
    if (iqType != null) {
      data['iq_type'] = iqType!.toJson();
    }
    if (image != null) {
      data['image'] = image!.toJson();
    }
    return data;
  }
}

class IqAnswer {
  int? id;
  int? iQQuestionId;
  String? answer;
  int? correctStatus;

  IqAnswer({this.id, this.iQQuestionId, this.answer, this.correctStatus});

  IqAnswer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    iQQuestionId = json['i_q_question_id'];
    answer = json['answer'];
    correctStatus = json['correct_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['i_q_question_id'] = iQQuestionId;
    data['answer'] = answer;
    data['correct_status'] = correctStatus;
    return data;
  }
}
