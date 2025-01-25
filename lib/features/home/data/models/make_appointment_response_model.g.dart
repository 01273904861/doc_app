// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'make_appointment_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MakeAppointmentResponseModel _$MakeAppointmentResponseModelFromJson(
        Map<String, dynamic> json) =>
    MakeAppointmentResponseModel(
      id: (json['id'] as num?)?.toInt(),
      doctor: json['doctor'] == null
          ? null
          : DoctorModel.fromJson(json['doctor'] as Map<String, dynamic>),
      patient: json['patient'] == null
          ? null
          : PatientModel.fromJson(json['patient'] as Map<String, dynamic>),
      appointment_time: json['appointment_time'] as String?,
      appointment_end_time: json['appointment_end_time'] as String?,
      status: json['status'] as String?,
      notes: json['notes'] as String?,
      appointment_price: json['appointment_price'] as String?,
    );

Map<String, dynamic> _$MakeAppointmentResponseModelToJson(
        MakeAppointmentResponseModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'doctor': instance.doctor,
      'patient': instance.patient,
      'appointment_time': instance.appointment_time,
      'appointment_end_time': instance.appointment_end_time,
      'status': instance.status,
      'notes': instance.notes,
      'appointment_price': instance.appointment_price,
    };

PatientModel _$PatientModelFromJson(Map<String, dynamic> json) => PatientModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
      email: json['email'] as String?,
      phone: json['phone'] as String?,
      gender: (json['gender'] as num?)?.toInt(),
    );

Map<String, dynamic> _$PatientModelToJson(PatientModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'phone': instance.phone,
      'gender': instance.gender,
    };
