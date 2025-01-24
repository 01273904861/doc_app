import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchSection extends StatelessWidget {
  const SearchSection({super.key, this.onChanged,});
  final void Function(String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8),
      child: Row(
        children: <Widget>[
          Expanded(
            child: CustomTextField(
              onChanged: onChanged,
              hintText: 'search',
              hintTextStyle: AppTextstyles.font12GreyMeduim,
              prefixIcon: 
                  Icon(
                    Icons.search,
                    color: AppColors.lighterGrey,
                    size: 32.sp,
                  ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.list_rounded),
          ),
        ],
      ),
    );
  }
}
