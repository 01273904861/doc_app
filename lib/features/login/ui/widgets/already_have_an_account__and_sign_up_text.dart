import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveanAcountAndSignUpText extends StatelessWidget {
  const AlreadyHaveanAcountAndSignUpText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: 'Already have an account yet ? ',
              style: AppTextstyles.font12BlackRegular),
          TextSpan(
            text: 'Sign Up',
            style: AppTextstyles.font12BlueRegular,
          ),
        ]));
  }
}
