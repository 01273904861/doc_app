import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/login/ui/widgets/already_have_an_account__and_sign_up_text.dart';
import 'package:appoment_app/features/login/ui/widgets/terms_and_condtions_text.dart';
import 'package:appoment_app/features/sign%20up/ui/widgets/custom_sign_up_form.dart';
import 'package:appoment_app/features/sign%20up/ui/widgets/sign_up_bloc_listener.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 30.w, vertical: 30.h),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: AppTextstyles.font24BlueBold,
                ),
                verticalSpace(10),
                Text(
                  'Sign up now and start exploring all that our \napp has to offer. We\'re excited to welcome \nyou to our community!',
                  style: AppTextstyles.font14GreyRegular,
                ),
                verticalSpace(30),
                const CustomSignUpForm(),
                verticalSpace(30),
                const TermsAndConditionsText(),
                verticalSpace(50),
                const Center(
                    child: AlreadyHaveanAcountAndSignUpText(
                  text1: 'Already have an account yet ? ',
                  text2: 'Sign In',
                )),
                verticalSpace(50),
                const SignUpBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
