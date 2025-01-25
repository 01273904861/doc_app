// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_appointment_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeAppointmentRequestModel _$MakeAppointmentRequestModelFromJson(
        Map<String, dynamic> json) =>
    MakeAppointmentRequestModel(
      doctor_id: (json['doctor_id'] as num?)?.toInt(),
      start_time: json['start_time'] as String?,
      notes: json['notes'] as String?,
    );

Map<String, dynamic> _$MakeAppointmentRequestModelToJson(
        MakeAppointmentRequestModel instance) =>
    <String, dynamic>{
      'doctor_id': instance.doctor_id,
      'start_time': instance.start_time,
      'notes': instance.notes,
    };
