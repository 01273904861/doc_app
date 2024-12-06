import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/core/theming/fontweight_helpr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorImageAndSomeData extends StatelessWidget {
  const DoctorImageAndSomeData({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(16.r),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            width: 110.w,
            height: 110.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
            ),
            child: Image.asset(
              Assets.assetsImagesDoctor,
            ),
          ),
          horizontalSpace(10),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Dr. Randy Wigham',
                style: AppTextstyles.font16WhiteSemiBold
                    .copyWith(color: Colors.black),
              ),
              verticalSpace(10),
              Text(
                'General | RSUD Gatot Subroto',
                style: AppTextstyles.font12LigtGreyRegular
                    .copyWith(fontWeight: AppFontWeightHelper.meduim),
              ),
            ],
          )
        ],
      ),
    );
  }
}
