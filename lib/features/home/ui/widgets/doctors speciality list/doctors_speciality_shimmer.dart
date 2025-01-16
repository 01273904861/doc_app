import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/features/home/ui/widgets/doctors%20speciality%20list/doctors_speciality_shimmer_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsSpecialityShimmer extends StatelessWidget {
  const DoctorsSpecialityShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100.h,
      child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemBuilder: (BuildContext context, int i) {
            return const DoctorsSpecialityShimmerItem();
          },
          separatorBuilder: (BuildContext context, int i) =>
              horizontalSpace(20),
          itemCount: 10),
    );
  }
}
