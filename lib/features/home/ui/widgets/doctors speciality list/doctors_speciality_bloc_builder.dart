import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/networking/api_error_handler.dart';
import 'package:appoment_app/features/home/ui/widgets/doctors%20speciality%20list/doctors_speciality_shimmer.dart';
import 'package:appoment_app/features/home/logic/home_cubit.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendation_doctors_shimmer.dart.dart';
import 'package:appoment_app/features/home/ui/widgets/section_text1_and_text2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../data/models/get_specialization_model.dart';
import 'docotor_speciality_list_view.dart';

class DoctorsSpecialityBlocBuilder extends StatelessWidget {
  const DoctorsSpecialityBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SectionsTex1AndTex2(
          text2: 'see all',
          text1: 'Doctor Speciality',
        ),
        BlocBuilder<HomeCubit, HomeStates>(
          buildWhen: (HomeStates previous, HomeStates current) =>
              current is SpecializationFailure ||
              current is SpecializationLoading ||
              current is SpecializationSuccess,
          builder: (BuildContext context, HomeStates state) {
            return state.maybeWhen(
              specializationLoading: () {
                return SizedBox(
                  height: 110.h,
                  child: const DoctorsSpecialityShimmer(),
                );
              },
              specializationSuccess: (specializationData) {
                final List<SpecializationData?>? specializationDataList =
                    specializationData;
                return SizedBox(
                  height: 110.h,
                  child: DoctorSpecialityListView(
                    specializationDataList:
                        specializationDataList ?? <SpecializationData?>[],
                  ),
                );
              },
              specializationFailure: (ErrorHandler errorHandler) {
                return const SizedBox.shrink();
              },
              orElse: () {
                return const SizedBox.shrink();
              },
            );
          },
        ),
      ],
    );
  }

  Widget setUpLoading() {
    return Column(
      children: <Widget>[
        const DoctorsSpecialityShimmer(),
        verticalSpace(30),
        const RecommendationDoctorsShimmer(),
      ],
    );
  }
}
