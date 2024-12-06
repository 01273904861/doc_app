import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingLogo extends StatelessWidget {
  const OnBoardingLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          Assets.assetsImagesAppLogo,
          width: 45.w,
          height: 45.h,
        ),
        Text(
          'Docdoc',
          style: AppTextstyles.font20BlackMeduim,
        )
      ],
    );
  }
}
