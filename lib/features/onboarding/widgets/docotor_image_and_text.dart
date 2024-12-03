import 'package:appoment_app/core/theming/app_images.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorImageAndText extends StatelessWidget {
  const DoctorImageAndText({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 520.h,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Image.asset(AppImages.onBoardingBackground),
          Container(
            foregroundDecoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Colors.white,
                  Colors.white.withOpacity(.1),
                ],
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                stops: const [0.14, .4],
              ),
            ),
            child: Image.asset(AppImages.onBoardingDoctor),
          ),
          Positioned(
            bottom: 10.h,
            child: Text(
              'Best Doctor \nAppointment App',
              textAlign: TextAlign.center,
              style: AppTextstyles.font32BlueBold,
            ),
          )
        ],
      ),
    );
  }
}
