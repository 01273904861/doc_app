import 'package:appoment_app/core/networking/api_error_handler.dart';
import 'package:appoment_app/core/networking/api_result.dart';
import 'package:appoment_app/core/networking/api_service.dart';
import 'package:appoment_app/features/sign%20up/data/models/sign_up_request_body.dart';
import 'package:appoment_app/features/sign%20up/data/models/sign_up_response_model.dart';

class SignUpRepo {
  final ApiService apiService;
  SignUpRepo({required this.apiService});

  Future<ApiResult<SignUpResponseModel>> signUp(
      SignUpRequestBody signUpRequestBody) async {
    try {
      final res = await apiService.signUp(signUpRequestBody);
      return ApiResult.success(res);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
