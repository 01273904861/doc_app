import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  // ignore: public_member_api_docs
  const CustomTextField({
    super.key,
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
    this.borderRadius,
    this.controller,
    this.prefixIcon,
    this.onChanged,
  });

  /// The text to be displayed as a hint in the text form field.
  final String hintText;
  final void Function(String)? onChanged;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
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
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
    
      controller: controller,
      onChanged: onChanged,
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
        errorBorder: customErrorBorder(),
        focusedErrorBorder: customErrorBorder(),
        contentPadding: EdgeInsets.symmetric(
            horizontal: horizontalPadding ?? 17.w,
            vertical: verticalPadding ?? 20.h),
        hintText: hintText,
        hintStyle: hintTextStyle ?? AppTextstyles.font12LigtGreyRegular,
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        filled: true,
        fillColor: backgroundColor ?? AppColors.theMostlightGrey,
      ),
      obscureText: obscureText ?? false,
    );
  }

  String? defaultCheckValidation(value) {
    if (value == null || value?.isEmpty ?? true) {
      return 'this field is required';
    } else {
      return null;
    }
  }

  OutlineInputBorder customErrorBorder() {
    return const OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red),
      borderRadius: BorderRadius.all(Radius.circular(16)),
    );
  }
}
