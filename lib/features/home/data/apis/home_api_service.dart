import 'package:appoment_app/core/networking/api_constants.dart';
import 'package:appoment_app/features/home/data/apis/home_api_constants.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';
part 'home_api_service.g.dart';
@RestApi(baseUrl: ApiConstants.baseUrl)
abstract class HomeApiService {
factory HomeApiService(Dio dio , {String baseUrl})=_HomeApiService;

@GET(HomeApiConstants.getSpecializations)
Future<GetSpecializationResponseModel> getSpecialization();
}