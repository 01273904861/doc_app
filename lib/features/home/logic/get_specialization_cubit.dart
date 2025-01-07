import 'package:appoment_app/core/networking/api_error_handler.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_specialization_state.dart';
part 'get_specialization_cubit.freezed.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(const HomeStates.specializationInitial());
  final HomeRepo homeRepo;
  List<SpecializationData>? specializationsDataList = [];

  emitGetSpecialization() async {
    emit(const HomeStates.specializationLoading());
    final res = await homeRepo.getSpecialization();
    res.when(
      success: (res) {
        specializationsDataList = res.data ?? [];
        // get doctors of first id as default
        getDoctors(specializationId: specializationsDataList?.first.id ?? 0);
        emit(HomeStates.specializationSuccess(specializationsDataList));
      },
      failure: (resError) {
        emit(HomeStates.specializationFailure(errorHandler: resError));
      },
    );
  }

  List<DoctorModel>? getAllSpecializationsDoctors(
      List<SpecializationData> dataList) {
    List<DoctorModel> doctorsList = [];
    for (var element in dataList) {
      for (var doctor in element.doctors!) {
        doctorsList.add(doctor);
      }
    }
    return null;
  }

  void getDoctors({required int specializationId}) {
    List<DoctorModel>? doctorsList = [];

    doctorsList = specializationsDataList
        ?.firstWhere((specialization) => specialization.id == specializationId)
        .doctors;
    if (doctorsList?.isEmpty ?? true) {
      emit(
        const HomeStates.doctorsFailure(errorMessage: 'docotors not found'),
      );
    } else {
      emit(HomeStates.doctorsSuccess(doctorsList));
    }
  }
}
