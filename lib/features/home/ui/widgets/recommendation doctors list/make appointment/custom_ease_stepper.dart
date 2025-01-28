import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:easy_stepper/easy_stepper.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomEaseStepper extends StatefulWidget {
  CustomEaseStepper({super.key, required this.activeStep});
  int activeStep = 0;
  @override
  State<CustomEaseStepper> createState() => _CustomEaseStepperState();
}

class _CustomEaseStepperState extends State<CustomEaseStepper> {
  @override
  Widget build(BuildContext context) {
    return EasyStepper(
      lineStyle: LineStyle(
        defaultLineColor: AppColors.lighterGrey,
        lineType: LineType.normal,
        lineWidth: 2.w,
      ),
       showLoadingAnimation: false,
      activeStep: widget.activeStep, steps: <EasyStep>[
      customEasyStep(title: 'Date & Time', number: '1' , isActive: widget.activeStep == 1),
      customEasyStep(title: 'Payment', number: '2,', isActive: widget.activeStep == 2),
      customEasyStep(title: 'Salary', number: '3', isActive: widget.activeStep == 3),
    ]);
  }

  EasyStep customEasyStep({required String title, required String number ,required bool isActive}) {
    return EasyStep(
        customTitle: Text(
          title,
          textAlign: TextAlign.center,
          style: AppTextstyles.font12BlackRegular,
        ),
        customStep: CircleAvatar(
          backgroundColor: isActive ? AppColors.mainBlue : AppColors.lighterGrey,
          radius: 32,
          child: Text(
            number,
            style: AppTextstyles.font12GreyMeduim.copyWith(color: Colors.white),
          ),
        ));
  }
}
