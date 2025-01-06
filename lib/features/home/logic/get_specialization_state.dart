part of 'get_specialization_cubit.dart';

@freezed
class HomeStates<T> with _$GetSpecializationState {
  const factory HomeStates.specializationInitial() = _SpecializationInitial;
  const factory HomeStates.specializationLoading() = SpecializationLoading;
  const factory HomeStates.specializationSuccess(T data) =
      SpecializationSuccess<T>;
  const factory HomeStates.specializationFailure(
      {required ErrorHandler errorHandler}) = SpecializationFailure;

  const factory HomeStates.doctorsLoading() = DoctorsLoading;
  const factory HomeStates.doctorsSuccess(List<DoctorModel?>? doctors) =
      DoctorsSuccess;
  const factory HomeStates.doctorsFailure({required String errorMessage}) =
      DoctorsFailure;
}
