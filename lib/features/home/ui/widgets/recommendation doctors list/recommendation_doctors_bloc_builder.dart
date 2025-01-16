import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendation_doctors_shimmer.dart.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/logic/home_cubit.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendations_doctor_listview.dart';
import 'package:appoment_app/features/home/ui/widgets/sections_head_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RecommendationDoctorsBlocBuilder extends StatelessWidget {
  const RecommendationDoctorsBlocBuilder({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        children: <Widget>[
          const SectionsHeaderAndSeeAll(
            title: 'Recommendation Doctor',
          ),
          BlocBuilder<HomeCubit, HomeStates>(
              buildWhen: (HomeStates previous, HomeStates current) =>
                  current is DoctorsFailure ||
                  current is DoctorsLoading ||
                  current is DoctorsSuccess,
              builder: (BuildContext context, HomeStates states) {
                return states.maybeWhen(
                    doctorsFailure: (String errorMessage) =>
                        setUpFailure(errorMessage),
                    specializationLoading: () =>
                        const RecommendationDoctorsShimmer(),
                    doctorsSuccess: (List<DoctorModel?>? doctorsList) =>
                        setUpSuccess(doctorsList),
                    orElse: () => const SizedBox.shrink());
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
      DoctorModel(
          10,
          'name',
          'phone',
          Assets.assetsImagesDoctor,
          'address',
          'description',
          'degree',
          10,
          'startTime',
          'endTime',
          CityModel(id: 0)),
      DoctorModel(
          10,
          'name',
          'phone',
          Assets.assetsImagesDoctor,
          'address',
          'description',
          'degree',
          10,
          'startTime',
          'endTime',
          CityModel(id: 0)),
      DoctorModel(
          10,
          'name',
          'phone',
          Assets.assetsImagesDoctor,
          'address',
          'description',
          'degree',
          10,
          'startTime',
          'endTime',
          CityModel(id: 0)),
      DoctorModel(
          10,
          'name',
          'phone',
          Assets.assetsImagesDoctor,
          'address',
          'description',
          'degree',
          10,
          'startTime',
          'endTime',
          CityModel(id: 0)),
      DoctorModel(
          10,
          'name',
          'phone',
          Assets.assetsImagesDoctor,
          'address',
          'description',
          'degree',
          10,
          'startTime',
          'endTime',
          CityModel(id: 0)),
      DoctorModel(
          10,
          'name',
          'phone',
          Assets.assetsImagesDoctor,
          'address',
          'description',
          'degree',
          10,
          'startTime',
          'endTime',
          CityModel(id: 0)),
      DoctorModel(
          10,
          'name',
          'phone',
          Assets.assetsImagesDoctor,
          'address',
          'description',
          'degree',
          10,
          'startTime',
          'endTime',
          CityModel(id: 0)),
    ];
  }