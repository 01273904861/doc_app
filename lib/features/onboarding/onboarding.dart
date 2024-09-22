import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/onboarding/widgets/docotorimage_and_text.dart';
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
            SizedBox(
              height: 30.h,
            ),
            const OnBoardingLogo(),
            SizedBox(
              height: 30.h,
            ),
            const DoctorImageAndText(),
            Text(
              'Manage and schedule all of your medical\n appointments easily with Docdoc\n to get a new experience.',
              textAlign: TextAlign.center,
              style: AppTextstyles.font13GreyW400.copyWith(
                height: 1.4.h,
              ),
              
            ),
            SizedBox(height: 30.h,),
            const GetStartedButton(),
            SizedBox(height: 30.h,),

          ],
        ),
      )),
    );
  }
}
