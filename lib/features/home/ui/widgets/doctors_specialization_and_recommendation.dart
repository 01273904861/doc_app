import 'package:appoment_app/features/home/logic/get_specialization_cubit.dart';
import 'package:appoment_app/features/home/ui/widgets/sections_head_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/get_specialization_model.dart';
import 'docotor_speciality_list_view.dart';
import 'recommendations_doctor_listview.dart';

class DoctorSpecialityAndRecondationBlocBuilder extends StatelessWidget {
  const DoctorSpecialityAndRecondationBlocBuilder({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<GetSpecializationCubit, GetSpecializationState>(
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
              return Expanded(
                child: Column(
                  children: [
                    DoctorSpecialityListView(
                      specializationDataList: specializationDataList ?? [],
                    ),
                    const SectionsHeaderAndSeeAll(
                      title: 'Recommendation Doctor',
                    ),
                    RecommendationsDoctorListView(
                        doctorsModel:
                            specializationDataList?[0]?.doctors ?? []),
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
