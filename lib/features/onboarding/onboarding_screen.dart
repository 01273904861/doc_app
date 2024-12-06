import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/onboarding/widgets/docotor_image_and_text.dart';
import 'package:appoment_app/features/onboarding/widgets/get_started_button.dart';
import 'package:appoment_app/features/onboarding/widgets/onboarding_logo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: SingleChildScrollView(
        child: Column(
          children: [
            verticalSpace(30),
            const OnBoardingLogo(),
            verticalSpace(30),
            const DoctorImageAndText(),
            Text(
              'Manage and schedule all of your medical\n appointments easily with Docdoc\n to get a new experience.',
              textAlign: TextAlign.center,
              style: AppTextstyles.font13Greyregular.copyWith(
                height: 1.4.h,
              ),
            ),
            verticalSpace(30),
            const GetStartedButton(),
            verticalSpace(30),
          ],
        ),
      )),
    );
  }
}
