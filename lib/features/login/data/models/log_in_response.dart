import 'package:freezed_annotation/freezed_annotation.dart';
part 'log_in_response.g.dart';

@JsonSerializable()
class LogInResponse {
  final String message;
  final UserData? data;
  final bool status;
  final int code;

  LogInResponse(
      {required this.message,
      required this.data,
      required this.status,
      required this.code});
  factory LogInResponse.fromJson(Map<String, dynamic> json) =>
      _$LogInResponseFromJson(json);
}

@JsonSerializable()
class UserData {
  final String token;
  final String username;

  UserData({required this.token, required this.username});

  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);
}
