// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'get_specialization_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GetSpecializationResponseModel _$GetSpecializationResponseModelFromJson(
        Map<String, dynamic> json) =>
    GetSpecializationResponseModel(
      name: json['name'] as String,
      id: (json['id'] as num).toInt(),
      doctors: (json['doctors'] as List<dynamic>)
          .map((e) => DoctorModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$GetSpecializationResponseModelToJson(
        GetSpecializationResponseModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'id': instance.id,
      'doctors': instance.doctors,
    };

DoctorModel _$DoctorModelFromJson(Map<String, dynamic> json) => DoctorModel(
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
      phone: json['phone'] as String,
      photo: json['photo'] as String,
      address: json['address'] as String,
      description: json['description'] as String,
      degree: json['degree'] as String,
      appointPrice: (json['appoint_price'] as num).toInt(),
      startTime: json['start_time'] as String,
      endTime: json['end_time'] as String,
      city: CityModel.fromJson(json['city'] as Map<String, dynamic>),
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
      id: (json['id'] as num).toInt(),
      name: json['name'] as String,
    );

Map<String, dynamic> _$CityModelToJson(CityModel instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
    };
