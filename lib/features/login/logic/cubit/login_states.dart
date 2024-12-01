import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_states.freezed.dart';

@Freezed()
class LoginStates<T> with _$LoginStates {
  const factory LoginStates.initial() = _Initial;

  const factory LoginStates.loading() = LoginLoading;
  const factory LoginStates.success(T data) = LoginSuccess<T>;
  const factory LoginStates.failure({required String errorMessage}) = LoginFailure;
}
