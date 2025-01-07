import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/logic/get_specialization_cubit.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendations_doctor_listview.dart';
import 'package:appoment_app/features/home/ui/widgets/sections_head_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationDoctorsBlocBuilder extends StatelessWidget {
  const RecommendationDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const SectionsHeaderAndSeeAll(
            title: 'Recommendation Doctor',
          ),
          BlocBuilder<HomeCubit, HomeStates>(
              buildWhen: (previous, current) =>
                  current is DoctorsFailure ||
                  current is DoctorsLoading ||
                  current is DoctorsSuccess,
              builder: (context, states) {
                return states.maybeWhen(
                    doctorsFailure: (errorMessage) =>
                        setUpFailure(errorMessage),
                    doctorsLoading: () => setUpLoading(),
                    doctorsSuccess: (doctorsList) => setUpSuccess(doctorsList),
                    orElse: () => const SizedBox.shrink());
              })
        ],
      ),
    );
  }

  Widget setUpSuccess(doctorsList) {
    final List<DoctorModel?>? doctorsModelsList = doctorsList;
    return RecommendationsDoctorListView(doctorsModel: doctorsModelsList ?? []);
  }

  Widget setUpFailure(errorMessage) {
    return const SizedBox.shrink();
  }

  Widget setUpLoading() {
    return const Center(child: CircularProgressIndicator());
  }
}
