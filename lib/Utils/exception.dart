abstract class Exception {
  // late String code;
}

class BottomPlacedException extends Exception {
  String code;
  BottomPlacedException({this.code = ''});
}
