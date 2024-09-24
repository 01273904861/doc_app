import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomField extends StatelessWidget {
  const CustomField(
      {super.key,
      required this.hintText,
       this.suffixIcon,
      this.enabledBorderColor,
      this.focusdBorderColor,
      this.enabledBorder,
      this.focusedBorder,
      this.horizontalPadding,
      this.hintTextStyle,
      this.suffixIconColor,
      this.backgroundColor,
      this.obscureText,
      this.verticalPadding,
      this.borderRadius});
  final String hintText;
  final Widget? suffixIcon;
  final Color? enabledBorderColor;
  final Color? focusdBorderColor;
  final double? enabledBorder;
  final double? focusedBorder;
  final double? horizontalPadding;
  final double? verticalPadding;
  final TextStyle? hintTextStyle;
  final Color? suffixIconColor;
  final Color? backgroundColor;
  final bool? obscureText;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: enabledBorderColor ?? AppColors.morelightGrey),
          borderRadius: BorderRadius.circular(borderRadius ?? 16),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide:
              BorderSide(color: focusdBorderColor ?? AppColors.mainBlue),
          borderRadius: BorderRadius.circular(borderRadius ?? 16.sp),
        ),
        contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 17.w,
            vertical: verticalPadding ?? 20.h),
        hintText: hintText,
        hintStyle: hintTextStyle ?? AppTextstyles.font12LigtGreyRegular,
        suffixIcon: suffixIcon ?? const Icon(Icons.visibility),
        filled: true,
        fillColor: backgroundColor ?? AppColors.theMostlightGrey,
      ),
      obscureText: obscureText ?? false,
    );
  }
}
