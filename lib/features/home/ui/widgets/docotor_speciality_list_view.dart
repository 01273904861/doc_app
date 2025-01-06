import 'package:appoment_app/features/home/ui/widgets/specialist_image_and_name.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView({super.key, required this.specializationDataList});
 final List specializationDataList ;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 110.h,
      child: ListView.builder(
        itemCount: specializationDataList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Padding(
          padding: EdgeInsetsDirectional.only(start: i == 0 ? 0 : 24.w),
          child:  SpecialistImageAndName(specializationData: specializationDataList[i],),
        ),
      ),
    );
  }
}
