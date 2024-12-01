class AppRegExp {
  bool hasLowerCase(value) {
    return RegExp(r'[a-z]').hasMatch(value);
  }
  bool isValidEmail(value){
    return RegExp( r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$').hasMatch(value);
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
  bool isPhoneNumber(value){
    return RegExp(r'^(010|011|012|015)[0-9]{8}$').hasMatch(value); 
  }
}
