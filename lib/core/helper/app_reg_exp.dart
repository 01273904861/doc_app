class AppRegExp {
  bool hasLowerCase(value) {
    return RegExp(r'[a-z]').hasMatch(value);
  }

  bool hasUpperCase(value) {
    return RegExp(r'[A-Z]').hasMatch(value);
  }

  bool hasDigits(value) {
    return RegExp(r'\d').hasMatch(value);
  }

  bool hasSpecialCharacters(value) {
    return RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(value);
  }

  bool has8Chars(value) {
    return RegExp(r'^(?=.{8,})').hasMatch(value);
  }
}
