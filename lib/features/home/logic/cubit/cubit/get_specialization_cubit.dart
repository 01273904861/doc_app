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

        emit(GetSpecializationState.success(res));
      },
      failure: (res) {
        emit(GetSpecializationState.failure(
            errorMessage: res.apiErrorModel.message ?? ''));
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

  List<DoctorModel>? getDoctors(int specializationId) {
    for (var element in specializationsDataList!) {
      if (element.id == specializationId) {
        return element.doctors;
      }
    }
    return null;
  }
}
