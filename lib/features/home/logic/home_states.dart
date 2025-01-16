part of 'home_cubit.dart';

@freezed
class HomeStates<T> with _$GetSpecializationState {
  //specialization
  const factory HomeStates.specializationInitial() = _SpecializationInitial;
  const factory HomeStates.specializationLoading() = SpecializationLoading;
  const factory HomeStates.specializationSuccess(T data) =
      SpecializationSuccess<T>;
  const factory HomeStates.specializationFailure(
      {required ErrorHandler errorHandler}) = SpecializationFailure;
//doctors
  const factory HomeStates.doctorsSuccess(List<DoctorModel?>? doctors) =
      DoctorsSuccess;
  const factory HomeStates.doctorsFailure({required String errorMessage}) =
      DoctorsFailure;
}
