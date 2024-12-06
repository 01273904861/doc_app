import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorsContainer extends StatelessWidget {
  const DoctorsContainer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 195.h,
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            padding: EdgeInsets.all(16.sp),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(24.r),
                color: AppColors.mainBlue),
            width: double.infinity,
            height: 175.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Book and \nschedule with \nnearest doctor',
                  style: AppTextstyles.font16WhiteMeduim,
                ),
                verticalSpace(10),
                Expanded(
                  child: ElevatedButton(
                      onPressed: () {}, child: const Text('Find Nearby')),
                )
              ],
            ),
          ),
          Positioned(
              right: 10.w,
              top: 0,
              child: Image.asset(height: 200.h, Assets.assetsImagesOnBoardingDoctor))
        ],
      ),
    );
  }
}
