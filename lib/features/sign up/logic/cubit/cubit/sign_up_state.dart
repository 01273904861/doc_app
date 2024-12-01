part of 'sign_up_cubit.dart';

@freezed
class SignUpState<T> with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = SignUpLoading;
  const factory SignUpState.success(T data) = SignUpSuccess<T>;
  const factory SignUpState.failure({required String message}) = SignUpFailure;
}
