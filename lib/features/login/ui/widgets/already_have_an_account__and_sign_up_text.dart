import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';

class AlreadyHaveanAcountAndSignUpText extends StatelessWidget {
  const AlreadyHaveanAcountAndSignUpText({super.key, required this.text1, required this.text2});
  final String text1 ;
  final String text2 ;
  @override
  Widget build(BuildContext context) {
    return RichText(
    
        textAlign: TextAlign.center,
        text: TextSpan(children: [
          TextSpan(
              text: text1,
              style: AppTextstyles.font12BlackRegular),
          TextSpan(
            text: text2,
            style: AppTextstyles.font12BlueRegular,
          ),
        ]));
  }
}
