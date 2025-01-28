import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:flutter/material.dart';

class HeaderAndContentSection extends StatelessWidget {
  const HeaderAndContentSection(
      {super.key, required this.title, required this.content});
  final String title;
  final String content;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          title,
          style:
              AppTextstyles.font16WhiteSemiBold.copyWith(color: Colors.black),
        ),
        verticalSpace(15),
        Text(
          content,
        
          style: AppTextstyles.font14GreyRegular,
        ),
      ],
    );
  }
}
