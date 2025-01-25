import 'package:appoment_app/core/networking/api_error_handler.dart';
import 'package:appoment_app/core/networking/api_result.dart';
import 'package:appoment_app/features/home/data/apis/home_api_service.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/data/models/make_appointment_request_model.dart';
import 'package:appoment_app/features/home/data/models/make_appointment_response_model.dart';

class HomeRepo {
  HomeRepo( {  required this.homeApiService});
  final HomeApiService homeApiService;
  Future<ApiResult<GetAllSpecializationsModel>> getSpecialization() async {
    try {
      final GetAllSpecializationsModel res =
          await homeApiService.getSpecialization();
      return ApiResult.success(res);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }

  Future<ApiResult> makeAppointment({required MakeAppointmentRequestModel makeAppointmentRequestModel}) async {
    try {
      final MakeAppointmentResponseModel res =
          await homeApiService.makeAppointment(makeAppointmentRequestModel);
      return ApiResult.success(res);
    } on Exception catch (e) {
      return ApiResult.failure(ErrorHandler.handle(e));
    }
  }
}
//apiservice - repo - cubit - view 
//api service has basic functions- 
//repo call api services and reuturn succes with data or failure with error
//cubit has functions to emit states based on repo result succes or failure