import 'package:appoment_app/features/home/data/repos/home_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'get_specialization_state.dart';
part 'get_specialization_cubit.freezed.dart';

class GetSpecializationCubit extends Cubit<GetSpecializationState> {
  GetSpecializationCubit(this.homeRepo)
      : super(const GetSpecializationState.initial());
  final HomeRepo homeRepo;
  emitGetSpecialization() async {
    final res = await homeRepo.getSpecialization();
    res.when(
      success: (res) {
        emit(GetSpecializationState.success(res));
      },
      failure: (res) {
        emit(GetSpecializationState.failure(errorMessage: res.apiErrorModel.message ?? ''));
      },
    );
  }
}
