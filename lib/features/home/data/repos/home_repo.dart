import 'package:appoment_app/core/networking/api_error_handler.dart';
import 'package:appoment_app/core/networking/api_result.dart';
import 'package:appoment_app/features/home/data/apis/home_api_service.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';

class HomeRepo {
  final HomeApiService homeApiService;

  HomeRepo({required this.homeApiService});

  Future<ApiResult<GetSpecializationResponseModel>> getSpecialization() async {
    try {
      final res = await homeApiService.getSpecialization();
      return ApiResult.success(res);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
