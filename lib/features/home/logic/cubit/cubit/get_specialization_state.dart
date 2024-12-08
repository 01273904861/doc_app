part of 'get_specialization_cubit.dart';

@freezed
class GetSpecializationState<T> with _$GetSpecializationState {
  const factory GetSpecializationState.initial() = _Initial;
  const factory GetSpecializationState.loading() = Loading;
  const factory GetSpecializationState.success(T data) = Success<T>;
  const factory GetSpecializationState.failure({required String errorMessage}) = Failure;
  
    const factory GetSpecializationState.doctorsLoading() = DoctorsLoading;
  const factory GetSpecializationState.doctorsSuccess(List<DoctorModel?>? doctors) = DoctorsSuccess;
  const factory GetSpecializationState.doctorsFailure({required String errorMessage}) = DoctorsFailure;
}
