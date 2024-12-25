part of 'get_specialization_cubit.dart';

@freezed
class GetSpecializationState<T> with _$GetSpecializationState {
  const factory GetSpecializationState.specializationInitial() =
      _SpecializationInitial;
  const factory GetSpecializationState.specializationLoading() =
      SpecializationLoading;
  const factory GetSpecializationState.specializationSuccess(T data) =
      SpecializationSuccess<T>;
  const factory GetSpecializationState.specializationFailure(
      {required ErrorHandler errorHandler}) = SpecializationFailure ;

  const factory GetSpecializationState.doctorsLoading() = DoctorsLoading;
  const factory GetSpecializationState.doctorsSuccess(
      List<DoctorModel?>? doctors) = DoctorsSuccess;
  const factory GetSpecializationState.doctorsFailure(
      {required String errorMessage}) = DoctorsFailure;
}
