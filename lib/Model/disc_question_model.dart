class DISCQuestionModel {
  int? id;
  int? dISCTypeIdOne;
  String? questionOne;
  int? dISCTypeIdTwo;
  String? questionTwo;
  int? dISCTypeIdThree;
  String? questionThree;
  int? dISCTypeIdFour;
  String? questionFour;

  DISCQuestionModel(
      {this.id,
      this.dISCTypeIdOne,
      this.questionOne,
      this.dISCTypeIdTwo,
      this.questionTwo,
      this.dISCTypeIdThree,
      this.questionThree,
      this.dISCTypeIdFour,
      this.questionFour});

  DISCQuestionModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dISCTypeIdOne = json['d_i_s_c_type_id_one'];
    questionOne = json['question_one'];
    dISCTypeIdTwo = json['d_i_s_c_type_id_two'];
    questionTwo = json['question_two'];
    dISCTypeIdThree = json['d_i_s_c_type_id_three'];
    questionThree = json['question_three'];
    dISCTypeIdFour = json['d_i_s_c_type_id_four'];
    questionFour = json['question_four'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['d_i_s_c_type_id_one'] = dISCTypeIdOne;
    data['question_one'] = questionOne;
    data['d_i_s_c_type_id_two'] = dISCTypeIdTwo;
    data['question_two'] = questionTwo;
    data['d_i_s_c_type_id_three'] = dISCTypeIdThree;
    data['question_three'] = questionThree;
    data['d_i_s_c_type_id_four'] = dISCTypeIdFour;
    data['question_four'] = questionFour;
    return data;
  }
}
