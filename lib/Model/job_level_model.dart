// ignore_for_file: must_be_immutable

class JobLevelModel {
  int? id;
  String? name;

  JobLevelModel({this.id, this.name});

  JobLevelModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
