part of 'sign_up_cubit.dart';

@freezed
class SignUpState<T> with _$SignUpState {
  const factory SignUpState.initial() = _Initial;
  const factory SignUpState.loading() = Loading;
  const factory SignUpState.success(T data) = Succes<T>;
  const factory SignUpState.failure({required String message}) = Failure;

}
