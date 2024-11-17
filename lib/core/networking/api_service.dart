import 'package:appoment_app/core/networking/api_constants.dart';
import 'package:appoment_app/features/login/data/models/log_in_request_body.dart';
import 'package:appoment_app/features/login/data/models/log_in_response.dart';
import 'package:appoment_app/features/sign%20up/data/models/sign_up_request_body.dart';
import 'package:appoment_app/features/sign%20up/data/models/sign_up_response_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';

@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @POST(ApiConstants.login)
  Future<LoginResponse> signIn(
    @Body() LoginRequestBody logInBodyRequest,
  );

  @POST(ApiConstants.signUp)
  Future<SignUpResponseModel> signUp(
      @Body() SignUpRequestBody signUpRequestBody);
}
