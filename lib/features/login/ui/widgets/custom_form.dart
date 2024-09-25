import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';

class CustomForm extends StatefulWidget {
  const CustomForm({super.key});

  @override
  State<CustomForm> createState() => _CustomFormState();
}

class _CustomFormState extends State<CustomForm> {
  final GlobalKey<FormState> formKey = GlobalKey();
  bool isObsecure = false;
  @override
  Widget build(BuildContext context) {
    return Form(
        child: Column(
      children: [
         CustomField(
          hintText: 'email',
       
        ),
        verticalSpace(20),
        CustomField(
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
      ],
    ));
  }
}
