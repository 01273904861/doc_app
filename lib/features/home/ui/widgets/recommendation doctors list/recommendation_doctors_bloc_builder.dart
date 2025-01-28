import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendation_doctors_shimmer.dart.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/logic/home_cubit.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendations_doctor_listview.dart';
import 'package:appoment_app/features/home/ui/widgets/section_text1_and_text2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationDoctorsBlocBuilder extends StatelessWidget {
  const RecommendationDoctorsBlocBuilder({super.key});
  @override
  Widget build(BuildContext context) {
    final List<DoctorModel?> allDoctors =
        BlocProvider.of<HomeCubit>(context).allDoctors;

    return Expanded(
      child: Column(
        children: <Widget>[
          GestureDetector(
            onTap: () {
              context.pushNamed(Routes.recommendatioDoctorsScreen,
                  args: allDoctors);
            },
            child: const SectionsTex1AndTex2(
              text2: 'see all',
              text1: 'Recommendation Doctor',
            ),
          ),
          BlocBuilder<HomeCubit, HomeStates>(
              buildWhen: (HomeStates previous, HomeStates current) =>
                  current is DoctorsFailure || current is DoctorsSuccess,
              builder: (BuildContext context, HomeStates states) {
                return states.maybeWhen(
                    doctorsFailure: (String errorMessage) =>
                        setUpFailure(errorMessage),
                    specializationLoading: () =>
                        const RecommendationDoctorsShimmer(),
                    doctorsSuccess: (List<DoctorModel?>? doctorsList) =>
                        setUpSuccess(doctorsList),
                    orElse: () => const Center(
                          child: Text('empty list'),
                        ));
              })
        ],
      ),
    );
  }

  Widget setUpSuccess(doctorsList) {
    final List<DoctorModel?>? doctorsModelsList = doctorsList;

    return RecommendationsDoctorListView(
        doctorsModel: doctorsModelsList ?? <DoctorModel>[]);
  }

  Widget setUpFailure(errorMessage) {
    return const SizedBox.shrink();
  }
}

List<DoctorModel> getDummyList() {
  return <DoctorModel>[
    DoctorModel(10, 'name', 'phone', Assets.assetsImagesDoctor, 'address',
        'description', 'degree', 10, 'startTime', 'endTime', CityModel(id: 0)),
    DoctorModel(10, 'name', 'phone', Assets.assetsImagesDoctor, 'address',
        'description', 'degree', 10, 'startTime', 'endTime', CityModel(id: 0)),
    DoctorModel(10, 'name', 'phone', Assets.assetsImagesDoctor, 'address',
        'description', 'degree', 10, 'startTime', 'endTime', CityModel(id: 0)),
    DoctorModel(10, 'name', 'phone', Assets.assetsImagesDoctor, 'address',
        'description', 'degree', 10, 'startTime', 'endTime', CityModel(id: 0)),
    DoctorModel(10, 'name', 'phone', Assets.assetsImagesDoctor, 'address',
        'description', 'degree', 10, 'startTime', 'endTime', CityModel(id: 0)),
    DoctorModel(10, 'name', 'phone', Assets.assetsImagesDoctor, 'address',
        'description', 'degree', 10, 'startTime', 'endTime', CityModel(id: 0)),
    DoctorModel(10, 'name', 'phone', Assets.assetsImagesDoctor, 'address',
        'description', 'degree', 10, 'startTime', 'endTime', CityModel(id: 0)),
  ];
}
