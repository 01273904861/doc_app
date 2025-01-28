import 'package:appoment_app/features/home/ui/widgets/app_bar_icon.dart';
import 'package:appoment_app/features/home/ui/widgets/app_bar_title.dart';
import 'package:appoment_app/features/home/ui/widgets/doctors_container.dart';
import 'package:appoment_app/features/home/ui/widgets/doctors%20speciality%20list/doctors_speciality_bloc_builder.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/custom_ease_stepper.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendation_doctors_bloc_builder.dart';
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
        actions: const <Widget>[AppBarIcon()],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w),
        child: Column(
          children: <Widget>[
            CustomEaseStepper(activeStep: 1),
            const Expanded(child: Text('data'))
          ],
        ),

        // child: Column(
        //   children: <Widget>[
        //     const DoctorsBlueContainer(),
        //     const DoctorsSpecialityBlocBuilder(),
        //     RecommendationDoctorsBlocBuilder(),
        //   ],
        // ),
      ),
    ));
  }
}
