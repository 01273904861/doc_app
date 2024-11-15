part 'sign_up_request_body.g.dart';

class SignUpRequestBody {
  final String name;
  final String email;
  final String password;
  final String phone;
  final bool gender;
  final String passwordConfirmation;

  SignUpRequestBody(
      {required this.name,
      required this.email,
      required this.password,
      required this.phone,
      required this.gender,
      required this.passwordConfirmation});

  Map<String, dynamic> toJson() => _$SignUpRequestBodyToJson(this);
}
