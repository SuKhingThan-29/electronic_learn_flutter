class DISCQuestionModel {
  int? id;
  List<Questions>? questions;
  int? selectQuestion;

  DISCQuestionModel({this.id, this.questions, this.selectQuestion});

  DISCQuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    if (json['questions'] != null) {
      questions = <Questions>[];
      json['questions'].forEach((v) {
        questions!.add(Questions.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    if (questions != null) {
      data['questions'] = questions!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Questions {
  int? typeId;
  String? questionName;

  Questions({this.typeId, this.questionName});

  Questions.fromJson(Map<String, dynamic> json) {
    typeId = json['type_id'];
    questionName = json['question_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['type_id'] = typeId;
    data['question_name'] = questionName;
    return data;
  }
}
