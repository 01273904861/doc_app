import 'package:appoment_app/features/home/logic/get_specialization_cubit.dart';
import 'package:appoment_app/features/home/ui/widgets/doctors_speciality_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatelessWidget {
  const DoctorSpecialityListView(
      {super.key, required this.specializationDataList});
  final List specializationDataList;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: specializationDataList.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, i) => Padding(
          padding: EdgeInsetsDirectional.only(start: i == 0 ? 0 : 24.w),
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<HomeCubit>(context)
                  .getDoctors(specializationId: i + 1);
            },
            child: DoctorsSpecialityListItem(
              specializationData: specializationDataList[i],
            ),
          ),
        ),
      ),
    );
  }
}
