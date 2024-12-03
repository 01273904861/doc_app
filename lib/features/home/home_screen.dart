import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/features/home/widgets/app_bar_icon.dart';
import 'package:appoment_app/features/home/widgets/app_bar_title.dart';
import 'package:appoment_app/features/home/widgets/docotor_speciality_list_view.dart';
import 'package:appoment_app/features/home/widgets/doctors_container.dart';
import 'package:appoment_app/features/home/widgets/recommendations_doctor_listview.dart';
import 'package:appoment_app/features/home/widgets/sections_head_and_see_all.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const AppBarTitle(),
        actions: const [AppBarIcon()],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              const DoctorsContainer(),
              verticalSpace(20),
              const SectionsHeaderAndSeeAll(
                title: 'Doctor Speciality',
              ),
              verticalSpace(20),
              const DoctorSpecialityListView(),
              verticalSpace(20),
              const SectionsHeaderAndSeeAll(
                title: 'Recommendation Doctor',
              ),
              verticalSpace(20),
              const RecommendationsDoctorListView(),
            ],
          ),
        ),
      ),
    ));
  }
}
