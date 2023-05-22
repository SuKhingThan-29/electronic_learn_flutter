import 'package:coursia/Model/competency_type_model.dart';

class CompetencyQuestionModel {
  int? id;
  int? competencyTypeId;
  String? level;
  String? question;
  CompetencyTypeModel? competencyType;

  CompetencyQuestionModel(
      {this.id,
      this.competencyTypeId,
      this.level,
      this.question,
      this.competencyType});

  CompetencyQuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    competencyTypeId = json['competency_type_id'];
    level = json['level'];
    question = json['question'];
    // competencyType = json['competency_type'];
    competencyType = json['competency_type'] != null
        ? CompetencyTypeModel.fromJson(json['competency_type'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['competency_type_id'] = competencyTypeId;
    data['level'] = level;
    data['question'] = question;
    // data['competency_type'] = competencyType;
    if (competencyType != null) {
      data['competency_type'] = competencyType!.toJson();
    }
    return data;
  }
}
