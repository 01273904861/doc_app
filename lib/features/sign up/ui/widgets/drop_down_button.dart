import 'package:appoment_app/core/theming/app_colors.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/sign%20up/logic/cubit/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

const List<String> list = <String>['male', 'female'];

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton({super.key});

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  String dropdownValue = list[0];
  late TextEditingController genderController;

  @override
  void initState() {
    genderController = context.read<SignUpCubit>().genderController;
    genderController.text = '0';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: Colors.white,
      value: dropdownValue,
      icon: const Icon(Icons.arrow_drop_down, color: AppColors.black),
      elevation: 4,
      style: TextStyle(
        color: AppColors.black,
        fontSize: 16.sp,
        fontWeight: FontWeight.w500,
      ),
      decoration: InputDecoration(
        contentPadding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 10.h),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide:
              const BorderSide(color: AppColors.theMostlightGrey, width: 1.5),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide:
              const BorderSide(color: AppColors.theMostlightGrey, width: 1.5),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(16.r),
          borderSide:
              const BorderSide(color: AppColors.theMostlightGrey, width: 1.5),
        ),
        filled: true,
        fillColor: AppColors.theMostlightGrey,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
          genderController.text = (value == 'male') ? '0' : '1';
        });
      },
      items: list.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Row(
            children: [
              Icon(
                value == 'male' ? Icons.male : Icons.female,
                color: AppColors.grey,
              ),
              SizedBox(width: 10.w),
              Text(
                value.capitalize(),
                style: AppTextstyles.font14LigtGreyRegular
                    .copyWith(color: AppColors.black),
              ),
            ],
          ),
        );
      }).toList(),
    );
  }
}

extension StringExtension on String {
  String capitalize() => '${this[0].toUpperCase()}${substring(1)}';
}
