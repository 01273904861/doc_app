import 'package:appoment_app/core/networking/api_error_handler.dart';
import 'package:appoment_app/core/networking/api_result.dart';
import 'package:appoment_app/core/networking/api_service.dart';
import 'package:appoment_app/features/login/data/models/log_in_body_request.dart';
import 'package:appoment_app/features/login/data/models/log_in_response.dart';

class LoginRepo {
  final ApiService apiService;

  LoginRepo({required this.apiService});

  Future<ApiResult<LogInResponse>> login(
      LogInBodyRequest logInBodyRequest) async {
    try {
      final res = await apiService.signIn(logInBodyRequest);
      return ApiResult.success(res);
      // res is loginResponseModel
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
      // error is apiErrorModel
    }
  }
}
