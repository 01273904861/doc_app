import 'package:appoment_app/core/constants/shared_pref_keys.dart';
import 'package:appoment_app/core/helper/app_reg_exp.dart';
import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/helper/shared_pref_helper.dart';
import 'package:appoment_app/core/networking/dio_factory.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/login/data/models/log_in_request_body_model.dart';

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

  static Future<void> saveUserToken({required String token}) async {
    await SharedPrefHelper.setSecuredData(SharedPrefKeys.userTokenKey, token);
    DioFactory.addTokenAfterLogin(token: token);
  }

  static List<DoctorModel?>? searchDoctors(
      {required List<DoctorModel> doctors, required String doctorName}) {
    if (doctors.isNullOrEmpty()) return <DoctorModel?>[];

    return doctors
        .where((DoctorModel doctor) =>
            doctor.name?.toLowerCase().contains(doctorName.toLowerCase()) ??
            false)
        .toList();

    // return doctors
    //     .where((DoctorModel doctor) =>
    //         doctor.name?.toLowerCase().startsWith(doctorName.toLowerCase()) ??
    //         false)
    //     .toList();
  }

 static  Future<void> saveUserData(String email, password) async {
    await SharedPrefHelper.setData(SharedPrefKeys.emailKey, email);
    await SharedPrefHelper.setSecuredData(SharedPrefKeys.passwordKey, password);
  }
  static Future <LoginRequestBodyModel>getUserData()async{
   final email =await SharedPrefHelper.getString(SharedPrefKeys.emailKey);
   final password =await SharedPrefHelper.getSecuredData(SharedPrefKeys.passwordKey);
    return LoginRequestBodyModel(email: email, password: password);
  }
}
