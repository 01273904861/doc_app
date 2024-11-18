  import 'package:appoment_app/core/helper/app_reg_exp.dart';

class AppFunctions{
 static String? checkEmailValidation(value){
    if( !AppRegExp().isValidEmail(value)||value == null || value?.isEmpty ?? true ){
      return 'enter valid email';
    }  
    return null;
  } 
}