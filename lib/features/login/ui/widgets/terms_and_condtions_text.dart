import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';

class TermsAndConditionsText extends StatelessWidget {
  const TermsAndConditionsText({super.key});

  @override
  Widget build(BuildContext context) {
    return RichText(
      textAlign: TextAlign.center,
      text: TextSpan(
      children: [
        //  
        TextSpan(text: 'By logging, you agree to our',style: AppTextstyles.font12LigtGreyRegular
         ),
        TextSpan(text: 'Terms & Conditions and PrivacyPolicy.',style: AppTextstyles.font12BlackRegular) 
      ],
    ));
  }
}