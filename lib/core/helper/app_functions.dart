import 'package:appoment_app/core/constants/shared_pref_keys.dart';
import 'package:appoment_app/core/helper/app_reg_exp.dart';
import 'package:appoment_app/core/helper/shared_pref_helper.dart';
import 'package:appoment_app/core/networking/dio_factory.dart';

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
 static Future<void> saveUserToken({required String token}) async{
  await  SharedPrefHelper.setSecuredData(SharedPrefKeys.userTokenKey, token);
    DioFactory.addTokenAfterLogin(token: token);
  }
}
