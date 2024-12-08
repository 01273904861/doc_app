import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_specialization_state.dart';
part 'get_specialization_cubit.freezed.dart';

class GetSpecializationCubit extends Cubit<GetSpecializationState> {
  GetSpecializationCubit(this.homeRepo)
      : super(const GetSpecializationState.initial());
  final HomeRepo homeRepo;
  List<SpecializationData>? specializationsDataList = [];

  emitGetSpecialization() async {
    emit(const GetSpecializationState.loading());
    final res = await homeRepo.getSpecialization();
    res.when(
      success: (res) {
        specializationsDataList = res.data;
        // get doctors of first id as default
        getDoctors(specializationId: specializationsDataList?.first.id ?? 0);
        emit(GetSpecializationState.success(specializationsDataList));
      },
      failure: (res) {
        emit(GetSpecializationState.failure(
            errorMessage: res.apiErrorModel.message ??
                'failed to fetch specializations'));
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
        const GetSpecializationState.doctorsFailure(
            errorMessage: 'docotors not found'),
      );
    } else {
      emit(GetSpecializationState.doctorsSuccess(doctorsList));
    }
  }
}
