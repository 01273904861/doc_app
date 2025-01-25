import 'package:freezed_annotation/freezed_annotation.dart';
part 'login_states.freezed.dart';

@Freezed()
class LogInStates<T> with _$LogInStates {
  const factory LogInStates.initial() = _Initial;

  const factory LogInStates.loading() = LoginLoading;
  const factory LogInStates.success(T data) = LoginSuccess<T>;
  const factory LogInStates.failure({required String errorMessage}) =
      LoginFailure;
}
