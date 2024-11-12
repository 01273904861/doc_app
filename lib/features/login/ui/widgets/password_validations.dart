import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';

class PasswordValidations extends StatelessWidget {
  const PasswordValidations(
      {super.key,
      required this.hasLowerCase,
      required this.hasUpperCase,
      required this.hasDigits,
      required this.hasSpecialCharcters,
      required this.has8Chars});
  final bool hasLowerCase;
  final bool hasUpperCase;
  final bool hasDigits;
  final bool hasSpecialCharcters;
  final bool has8Chars;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ValidationWidget(
          title: 'the password should be 8 letters',
          isValidate: has8Chars,
        ),
        verticalSpace(5),
        ValidationWidget(
          title: 'the password should has upper case letter',
          isValidate: hasUpperCase,
        ),
        verticalSpace(5),
        ValidationWidget(
          title: 'the password should has lower case letter',
          isValidate: hasLowerCase,
        ),
        verticalSpace(5),
        ValidationWidget(
          title: 'the password should has special charcaters',
          isValidate: hasSpecialCharcters,
        ),
        verticalSpace(5),
        ValidationWidget(
          title: 'the password should has digits',
          isValidate: hasDigits,
        ),
      ],
    );
  }
}

class ValidationWidget extends StatelessWidget {
  const ValidationWidget(
      {super.key, required this.title, required this.isValidate});
  final String title;
  final bool isValidate;
  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const CircleAvatar(
        radius: 2.5,
        backgroundColor: AppColors.grey,
      ),
      horizontalSpace(10),
      isValidate
          ? Text(
              title,
              style: AppTextstyles.font12BlackSemiBold.copyWith(
                  decoration: TextDecoration.lineThrough, color: Colors.red),
            )
          : Text(
              title,
              style: AppTextstyles.font12BlackSemiBold,
            ),
    ]);
  }
}
