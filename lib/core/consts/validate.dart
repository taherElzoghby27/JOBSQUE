bool validEmail(String? value) {
  RegExp pattern = RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
  String input = value!;
  bool isMatch = pattern.hasMatch(input);
  return isMatch;
}

bool validPassword(String? value) {
  RegExp pattern = RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)[a-zA-Z\d]{8,}$');
  String input = value!;
  bool isMatch = pattern.hasMatch(input);
  return isMatch;
}
