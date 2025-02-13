import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/core/theming/fontweight_helpr.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsItem extends StatelessWidget {
  const DoctorDetailsItem({
    super.key,
    required this.doctorModel,
  });
  final DoctorModel? doctorModel;
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Container(
          width: 100.w,
          height: 100.h,
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(16.sp)),
          child: Image.asset(
            fit: BoxFit.cover,
            Assets.assetsImagesDoctor,
          ),
        ),
        horizontalSpace(20),
        Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              doctorModel?.name ?? 'abdullah',
              style: AppTextstyles.font16WhiteSemiBold
                  .copyWith(color: Colors.black),
            ),
            verticalSpace(10),
            Text(
              '${doctorModel?.degree} | ${doctorModel?.phone}',
              style: AppTextstyles.font12LigtGreyRegular
                  .copyWith(fontWeight: AppFontWeightHelper.meduim),
            ),
           
         
          ],
        ),
      ],
    );
  }
}
