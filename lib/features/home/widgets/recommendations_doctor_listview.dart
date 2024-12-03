import 'package:appoment_app/features/home/widgets/docotor_image_and_some_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationsDoctorListView extends StatelessWidget {
  const RecommendationsDoctorListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 320.h,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => Padding(
          padding: EdgeInsetsDirectional.only(start: index == 0 ? 0 : 24.w),
          child: const DoctorImageAndSomeData(),
        ),
      ),
    );
  }
}
