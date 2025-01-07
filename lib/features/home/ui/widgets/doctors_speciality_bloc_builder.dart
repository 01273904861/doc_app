import 'package:appoment_app/features/home/logic/get_specialization_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/models/get_specialization_model.dart';
import 'docotor_speciality_list_view.dart';

class DoctorsSpecialityBlocBuilder extends StatelessWidget {
  const DoctorsSpecialityBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeStates>(
        buildWhen: (previous, current) =>
            current is SpecializationFailure ||
            current is SpecializationLoading ||
            current is SpecializationSuccess,
        builder: (context, state) {
          return state.maybeWhen(
            specializationLoading: () {
              return const Center(child: CircularProgressIndicator());
            },
            specializationSuccess: (specializationData) {
              final List<SpecializationData?>? specializationDataList =
                  specializationData;
              return SizedBox(
                height: 110.h,
                child: Column(
                  children: [
                    DoctorSpecialityListView(
                      specializationDataList: specializationDataList ?? [],
                    ),
                  ],
                ),
              );
            },
            specializationFailure: (errorHandler) {
              return const SizedBox.shrink();
            },
            orElse: () {
              return const SizedBox.shrink();
            },
          );
        });
  }
}
