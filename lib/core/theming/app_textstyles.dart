import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppTextstyles {
  static TextStyle font13GreyW400 = TextStyle(
    color: AppColors.grey,
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );
  static TextStyle font32BlueW700 = TextStyle(
    color: AppColors.mainBlue,
    fontWeight: FontWeight.w700,
    fontSize: 32.sp,
  );
  static TextStyle font20BlackW500 = TextStyle(
    color: AppColors.black,
    fontWeight: FontWeight.w500,
    fontSize: 20.sp,
  );
  static TextStyle font16WhitekW600 = TextStyle(
    color: Colors.white,
    fontWeight: FontWeight.w600,
    fontSize: 16.sp,
  );
}
