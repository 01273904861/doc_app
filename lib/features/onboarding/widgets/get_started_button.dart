import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GetStartedButton extends StatelessWidget {
  const GetStartedButton({super.key});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        minimumSize: WidgetStateProperty.all(Size(311.w, 52.h)),
        backgroundColor:
            WidgetStateProperty.all(AppColors.mainBlue), // Corrected this
      ),
      onPressed: () {
        context.pushNamed(Routes.loginScreen);
      },
      child: Text(
        'Get started',
        style: AppTextstyles
            .font16WhitekSemiBold, // Assuming this is defined in AppTextstyles
      ),
    );
  }
}
