
import 'package:appoment_app/core/networking/api_constants.dart';
import 'package:appoment_app/features/login/data/models/log_in_body_request.dart';
import 'package:appoment_app/features/login/data/models/log_in_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'api_service.g.dart';
@RestApi(baseUrl: ApiConstants.baseUrl)
 abstract class ApiService {
 factory ApiService(Dio dio , {String baseUrl})= _ApiService;
 @POST(ApiConstants.login)

 Future <LogInResponse>signIn(
 @Body()LogInBodyRequest logInBodyRequest,
 );
}