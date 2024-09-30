import 'package:freezed_annotation/freezed_annotation.dart';
part 'log_in_body_request.g.dart';

@JsonSerializable()
class LogInBodyRequest {
  final String email;
  final String password;

  LogInBodyRequest({required this.email, required this.password});

 Map<String, dynamic> toJson() =>
      _$LogInBodyRequestToJson(this);
}
