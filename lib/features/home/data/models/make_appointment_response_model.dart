import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:json_annotation/json_annotation.dart';
part 'make_appointment_response_model.g.dart';

@JsonSerializable()
class MakeAppointmentResponseModel {
final String? message;
final MakeAppointmentResponseDataModel? data;

  MakeAppointmentResponseModel({this.message, this.data});

  factory MakeAppointmentResponseModel.fromJson(Map<String, dynamic> json) =>
      _$MakeAppointmentResponseModelFromJson(json);
}
@JsonSerializable()
class MakeAppointmentResponseDataModel {
  const MakeAppointmentResponseDataModel(
      {required this.id,
      required this.doctor,
      required this.patient,
      required this.appointment_time,
      required this.appointment_end_time,
      required this.status,
      required this.notes,
      required this.appointment_price});
  factory MakeAppointmentResponseDataModel.fromJson(Map<String, dynamic> json) =>
      _$MakeAppointmentResponseDataModelFromJson(json);

  final int? id;
  final DoctorModel? doctor;
  final PatientModel? patient;
  final String? appointment_time,
      appointment_end_time,
      status,
      notes;
  final double? appointment_price;
}

@JsonSerializable()
class PatientModel {
  PatientModel(
      {required this.id,
      required this.name,
      required this.email,
      required this.phone,
      required this.gender});
  factory PatientModel.fromJson(Map<String, dynamic> json) =>
      _$PatientModelFromJson(json);

  final int? id;
  final String? name;
  final String? email;
  final String? phone;
  final String? gender;
}
