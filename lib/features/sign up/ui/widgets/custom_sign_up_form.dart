import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/core/widgets/app_button.dart';
import 'package:appoment_app/core/widgets/custom_text_form_field.dart';
import 'package:appoment_app/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  bool isObsecure = false;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasDigits = false;
  bool hasSpecialCharcters = false;
  bool has8Chars = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
        const CustomTextFormField(
          hintText: 'name',
        ),
        verticalSpace(20),
        const CustomTextFormField(
          hintText: 'email',
        ),
        verticalSpace(20),
        const CustomTextFormField(
          hintText: 'phone',
        ),
        verticalSpace(20),
        const CustomTextFormField(
          hintText: 'gender',
        ),
        verticalSpace(20),
        CustomTextFormField(
          hintText: 'password',
          suffixIcon: GestureDetector(
            onTap: () {
              isObsecure = !isObsecure;
              setState(() {});
            },
            child: Icon(
              isObsecure ? Icons.visibility_off : Icons.visibility,
            ),
          ),
          obscureText: isObsecure,
        ),
        verticalSpace(30),
        const CustomTextFormField(
          hintText: 'confirm password',
        ),
        verticalSpace(20),
        Align(
          alignment: Alignment.centerRight,
          child: Text(
            'forgot password?',
            style: AppTextstyles.font12BlueRegular,
          ),
        ),
        verticalSpace(10),
        PasswordValidations(
          hasLowerCase: hasLowerCase,
          has8Chars: has8Chars,
          hasDigits: hasDigits,
          hasSpecialCharcters: hasSpecialCharcters,
          hasUpperCase: hasUpperCase,
        ),
        verticalSpace(50),
        AppButton(
          onPressed: () {},
          title: 'Create Account',
        ),
      ],
    ));
  }
}
