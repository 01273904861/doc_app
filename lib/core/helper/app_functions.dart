import 'package:appoment_app/core/helper/app_reg_exp.dart';

class AppFunctions {
  String? checkEmailValidation(value) {
    if (!AppRegExp().isValidEmail(value) || value == null || value?.isEmpty ??
        true) {
      return 'enter valid email';
    }
    return null;
  }

  String? checkPhoneNumberValidation(value) {
    if (!AppRegExp().isPhoneNumber(value) || value == null || value?.isEmpty ??
        true) {
      return 'enter valid phone number ';
    }
    return null;
  }
}
