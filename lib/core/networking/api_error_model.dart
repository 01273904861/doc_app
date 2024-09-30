import 'package:freezed_annotation/freezed_annotation.dart';
part 'api_error_model.g.dart';

@JsonSerializable()
class ApiErrorModel {
   String? message;
   int? code;

  ApiErrorModel({ this.message,  this.code});
  factory ApiErrorModel.fromJson(Map<String, dynamic> json) =>
      _$ApiErrorModelFromJson(json);
      Map<String , dynamic>toJson()=>_$ApiErrorModelToJson(this);
}
