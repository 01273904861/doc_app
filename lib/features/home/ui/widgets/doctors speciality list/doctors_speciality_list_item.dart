import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialityListItem extends StatelessWidget {
  const DoctorsSpecialityListItem(
      {super.key,
      required this.specializationData,
      required this.selectedIndex});
  final SpecializationData specializationData;
  final bool selectedIndex;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        if (selectedIndex)
          Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.red),
              shape: BoxShape.circle,
            ),
            child: CircleAvatar(
              radius: 30,
              child: Image.asset(
                Assets.assetsImagesDoctorAvatar,
                width: 52.w,
                height: 54.h,
              ),
            ),
          )
        else
          CircleAvatar(
            radius: 30,
            child: Image.asset(
              Assets.assetsImagesDoctorAvatar,
              width: 50.w,
              height: 50.h,
            ),
          ),
        verticalSpace(10),
        Text(specializationData.name ?? 'general'),
      ],
    );
  }
}
