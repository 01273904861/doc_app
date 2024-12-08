// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_specialization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetAllSpecializationsModel _$GetAllSpecializationsModelFromJson(
        Map<String, dynamic> json) =>
    GetAllSpecializationsModel(
      message: json['message'] as String?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetAllSpecializationsModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetAllSpecializationsModelToJson(
        GetAllSpecializationsModel instance) =>
    <String, dynamic>{
      'message': instance.message,
      'data': instance.data,
    };

SpecializationData _$SpecializationDataFromJson(Map<String, dynamic> json) =>
    SpecializationData(
      name: json['name'] as String?,
      id: (json['id'] as num?)?.toInt(),
      doctors: (json['doctors'] as List<dynamic>?)
          ?.map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpecializationDataToJson(SpecializationData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'doctors': instance.doctors,
    };

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      (json['id'] as num?)?.toInt(),
      json['name'] as String?,
      json['phone'] as String?,
      json['photo'] as String?,
      json['address'] as String?,
      json['description'] as String?,
      json['degree'] as String?,
      (json['appoint_price'] as num?)?.toInt(),
      json['start_time'] as String?,
      json['end_time'] as String?,
      json['city'] == null
          ? null
          : CityModel.fromJson(json['city'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$DoctorModelToJson(DoctorModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'phone': instance.phone,
      'photo': instance.photo,
      'address': instance.address,
      'description': instance.description,
      'degree': instance.degree,
      'appoint_price': instance.appointPrice,
      'start_time': instance.startTime,
      'end_time': instance.endTime,
      'city': instance.city,
    };

CityModel _$CityModelFromJson(Map<String, dynamic> json) => CityModel(
      id: (json['id'] as num?)?.toInt(),
      name: json['name'] as String?,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
