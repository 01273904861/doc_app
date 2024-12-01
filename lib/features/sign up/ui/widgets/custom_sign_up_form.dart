import 'package:appoment_app/core/helper/app_reg_exp.dart';
import 'package:appoment_app/core/helper/app_functions.dart';
import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/core/widgets/app_button.dart';
import 'package:appoment_app/core/widgets/custom_text_form_field.dart';
import 'package:appoment_app/features/login/ui/widgets/password_validations.dart';
import 'package:appoment_app/features/sign%20up/logic/cubit/cubit/sign_up_cubit.dart';
import 'package:appoment_app/features/sign%20up/ui/widgets/drop_down_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomSignUpForm extends StatefulWidget {
  const CustomSignUpForm({super.key});

  @override
  State<CustomSignUpForm> createState() => _CustomSignUpFormState();
}

class _CustomSignUpFormState extends State<CustomSignUpForm> {
  bool isObsecure = false;
  bool isObsecure2 = false;

  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasDigits = false;
  bool hasSpecialCharacters = false;
  bool has8Chars = false;

  late TextEditingController passwordController;
  @override
  void initState() {
    passwordController = context.read<SignUpCubit>().passwordController;
    checkPasswordValidations();
    super.initState();
  }

  void checkPasswordValidations() {
    passwordController.addListener(() {
      has8Chars = AppRegExp().has8Chars(passwordController.text);
      hasDigits = AppRegExp().hasDigits(passwordController.text);
      hasLowerCase = AppRegExp().hasLowerCase(passwordController.text);
      hasUpperCase = AppRegExp().hasUpperCase(passwordController.text);
      hasSpecialCharacters =
          AppRegExp().hasSpecialCharacters(passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    final signUp = context.read<SignUpCubit>();
    return Form(
        key: signUp.signUpFormKey,
        child: Column(
          children: [
            CustomTextFormField(
              controller: signUp.nameController,
              hintText: 'name',
            ),
            verticalSpace(20),
            CustomTextFormField(
              controller: signUp.emailController,
              hintText: 'email',
              checkValidation: AppFunctions().checkEmailValidation,
            ),
            verticalSpace(20),
            CustomTextFormField(
              checkValidation: AppFunctions().checkPhoneNumberValidation,
              controller: signUp.phoneController,
              hintText: 'phone',
            ),
            verticalSpace(20),
            const CustomDropdownButton(),
            verticalSpace(20),
            CustomTextFormField(
              controller: signUp.passwordController,
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
            CustomTextFormField(
              controller: signUp.passwordConfirmationController,
              hintText: 'confirm password',
              suffixIcon: GestureDetector(
                  onTap: () {
                    isObsecure2 = !isObsecure2;
                    setState(() {});
                  },
                  child: Icon(
                      isObsecure2 ? Icons.visibility_off : Icons.visibility)),
              obscureText: isObsecure2,
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
              hasSpecialCharcters: hasSpecialCharacters,
              hasUpperCase: hasUpperCase,
            ),
            verticalSpace(50),
            AppButton(
              onPressed: () {
                if (signUp.signUpFormKey.currentState!.validate()) {
                  signUp.emitSignUpSates();
                }
              },
              title: 'Create Account',
            ),
          ],
        ));
  }

  @override
  void dispose() {
    passwordController.dispose();
    super.dispose();
  }
}
