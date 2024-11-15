import 'package:appoment_app/core/helper/app_reg_exp.dart';
import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/core/widgets/app_button.dart';
import 'package:appoment_app/core/widgets/custom_text_form_field.dart';
import 'package:appoment_app/features/login/logic/cubit/login_cubit.dart';
import 'package:appoment_app/features/login/ui/widgets/password_validations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CustomLogInForm extends StatefulWidget {
  const CustomLogInForm({super.key});

  @override
  State<CustomLogInForm> createState() => _CustomLogInFormState();
}

class _CustomLogInFormState extends State<CustomLogInForm> {
  bool isObsecure = false;
  bool hasLowerCase = false;
  bool hasUpperCase = false;
  bool hasDigits = false;
  bool hasSpecialCharcters = false;
  bool has8Chars = false;
  late TextEditingController passwordController;
  @override
  void initState() {
    passwordController = context.read<LoginCubit>().passwordController;
    passwordContollerChanges();
    super.initState();
  }

  passwordContollerChanges() {
    passwordController.addListener(() {
      setState(() {
        hasLowerCase = AppRegExp().hasLowerCase(passwordController.text);
        has8Chars = AppRegExp().has8Chars(passwordController.text);
        hasUpperCase = AppRegExp().hasUpperCase(passwordController.text);
        hasDigits = AppRegExp().hasDigits(passwordController.text);
        hasSpecialCharcters =
            AppRegExp().hasSpecialCharacters(passwordController.text);
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    final loginCubit = context.read<LoginCubit>();

    return  Form(
            key: loginCubit.signInFormKey,
            child: Column(
              children: [
               
                CustomTextFormField(
                  controller: loginCubit.emailController,
                  hintText: 'email',
                ),
                verticalSpace(20),
                CustomTextFormField(
                  controller: loginCubit.passwordController,
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
                  onPressed: () {
                    if (loginCubit.signInFormKey.currentState!.validate()) {
                      loginCubit.emitLoginStates();
                    }
                  },
                  title: 'log in',
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

