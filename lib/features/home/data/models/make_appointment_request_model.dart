import 'package:json_annotation/json_annotation.dart';
part 'make_appointment_request_model.g.dart';
@JsonSerializable()
class MakeAppointmentRequestModel {
  MakeAppointmentRequestModel({required this.doctor_id, required this.start_time, required this.notes});

  final int? doctor_id ;
  final String? start_time , notes;
  Map<String, dynamic> toJson() => _$MakeAppointmentRequestModelToJson(this);
 
  
}