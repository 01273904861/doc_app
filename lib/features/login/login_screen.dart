import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/login/ui/widgets/already_have_an_account__and_sign_up_text.dart';
import 'package:appoment_app/features/login/ui/widgets/custom_log_in_form.dart';
import 'package:appoment_app/features/login/ui/widgets/login_bloc_listener.dart';
import 'package:appoment_app/features/login/ui/widgets/terms_and_condtions_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogInScreen extends StatelessWidget {
  const LogInScreen({super.key});

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
                  'Welcome Back',
                  style: AppTextstyles.font24BlueBold,
                ),
                verticalSpace(10),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: AppTextstyles.font14GreyRegular,
                ),
                verticalSpace(30),
                const CustomLogInForm(),
                verticalSpace(30),
                const TermsAndConditionsText(),
                verticalSpace(50),
                Center(
                    child: AlreadyHaveanAcountAndSignUpText(
                  onTap: () {
                    context.pushNamedAndRemoveUntile(Routes.signUpScreen, predicate: (route) => false,);
                  },
                  text1: 'Already have an account yet ? ',
                  text2: 'Sign UP',
                )),
                verticalSpace(50),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
