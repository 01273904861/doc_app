import 'package:json_annotation/json_annotation.dart';
part 'sign_up_response_model.g.dart';

@JsonSerializable()
class SignUpResponseModel {
  String message;
  Data data;
  bool? status;
  int? code;
  SignUpResponseModel({required this.message, required this.data});
  factory SignUpResponseModel.fromJson(Map<String, dynamic> json) =>
      _$SignUpResponseModelFromJson(json);
}

@JsonSerializable()
class Data {
  final String? token;
  @JsonKey(name: 'username')
  final String? userName;

  Data({this.token, this.userName});
  factory Data.fromJson(Map<String, dynamic> json) => _$DataFromJson(json);
}
