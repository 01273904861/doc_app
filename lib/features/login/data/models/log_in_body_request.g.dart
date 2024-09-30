// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'log_in_body_request.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LogInBodyRequest _$LogInBodyRequestFromJson(Map<String, dynamic> json) =>
    LogInBodyRequest(
      email: json['email'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$LogInBodyRequestToJson(LogInBodyRequest instance) =>
    <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
