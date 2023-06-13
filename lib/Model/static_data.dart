import 'package:coursia/Model/login_response_model.dart';

class StaticData {
  static List<int> discAnswerList = [];
  // static List<IQQuestionModel> iqQuestionList = [];
  static LoginResponseModel? loginResponseModel;

  ///For Gender DropDown
  static List<Map<String, dynamic>> mapGenderList = [
    {'id': 1, 'name': 'Male'},
    {'id': 2, 'name': 'Female'}
  ];

  ///For Cost DropDown
  static List<Map<String, dynamic>> costList = [
    {'id': 1, 'name': 'UnPaid'},
    {'id': 2, 'name': 'Paid'}
  ];

  ///For user Level DropDown
  static List<Map<String, dynamic>> userLevelList = [
    {'id': 1, 'name': 'Beginner'},
    {'id': 2, 'name': 'Intermediate'},
    {'id': 3, 'name': 'Advanced'}
  ];
}
