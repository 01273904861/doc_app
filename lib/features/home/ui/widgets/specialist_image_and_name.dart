import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_images.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SpecialistImageAndName extends StatelessWidget {
  const SpecialistImageAndName({super.key});

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
        const Text('general'),
      ],
    );
  }
}
