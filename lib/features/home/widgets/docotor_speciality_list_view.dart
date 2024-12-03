import 'package:appoment_app/features/home/widgets/specialist_image_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 130.h,
      child: ListView.builder(
        itemCount: 5,
        scrollDirection: Axis.horizontal,
       itemBuilder: (context, index) => const SpecialistImageAndName(),
      ),
    );
  }
}
