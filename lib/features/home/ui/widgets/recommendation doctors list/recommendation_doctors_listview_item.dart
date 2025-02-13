import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/core/theming/fontweight_helpr.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RecommendationDoctorsListviewItem extends StatelessWidget {
  const RecommendationDoctorsListviewItem({
    super.key,
    required this.doctorModel,
  });
  final DoctorModel? doctorModel;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin:  EdgeInsets.only(bottom: 15.h),
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
                doctorModel?.name ?? 'abdullah',
                style: AppTextstyles.font16WhiteSemiBold
                    .copyWith(color: Colors.black),
              ),
              verticalSpace(10),
              Text(
             '${doctorModel?.degree} | ${doctorModel?.phone}'
              ,
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
