import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistImageAndName extends StatelessWidget {
  const SpecialistImageAndName({super.key, required this.specializationData});
 final SpecializationData specializationData;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CircleAvatar(
            radius: 30,
            child: Image.asset(
              Assets.assetsImagesDoctorAvatar,
              width: 50.w,
              height: 50.h,
            )),
        verticalSpace(10),
         Text(specializationData.name?? "general"),
      ],
    );
  }
}
