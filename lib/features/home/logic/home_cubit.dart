import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/networking/api_error_handler.dart';
import 'package:appoment_app/core/networking/api_result.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_states.dart';
part 'home_states.freezed.dart';

///home cubit for get specialization
class HomeCubit extends Cubit<HomeStates> {
  HomeCubit(this.homeRepo) : super(const HomeStates.specializationInitial());
  final HomeRepo homeRepo;

  ///list of specializations
  List<SpecializationData>? specializationsDataList = <SpecializationData>[];

  emitGetSpecialization() async {
    emit(const HomeStates.specializationLoading());
    final ApiResult<GetAllSpecializationsModel> res =
        await homeRepo.getSpecialization();
    res.when(
      success: (GetAllSpecializationsModel res) {
        specializationsDataList = res.data ?? <SpecializationData>[];
        // get doctors of first id as default
        getDoctorsById(
            specializationId: specializationsDataList?.first.id ?? 0);
        emit(HomeStates.specializationSuccess(specializationsDataList));
      },
      failure: (ErrorHandler resError) {
        emit(HomeStates.specializationFailure(errorHandler: resError));
      },
    );
  }

  List<DoctorModel>? getAllSpecializationsDoctors(
      List<SpecializationData> dataList) {
    final List<DoctorModel> doctorsList = <DoctorModel>[];
    for (final SpecializationData element in dataList) {
      for (final DoctorModel doctor in element.doctors!) {
        doctorsList.add(doctor);
      }
    }
    return null;
  }

  ///get all doctors of specializations
  void getDoctorsById({required int specializationId}) {
    List<DoctorModel>? doctorsList = <DoctorModel>[];

    doctorsList = specializationsDataList
        ?.firstWhere((SpecializationData specialization) =>
            specialization.id == specializationId)
        .doctors;
    if (doctorsList.isNullOrEmpty()) {
      emit(
        const HomeStates.doctorsFailure(errorMessage: 'docotors not found'),
      );
    } else {
      emit(HomeStates.doctorsSuccess(doctorsList));
    }
  }
}
