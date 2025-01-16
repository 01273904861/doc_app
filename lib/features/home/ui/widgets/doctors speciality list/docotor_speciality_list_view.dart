import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/logic/home_cubit.dart';
import 'package:appoment_app/features/home/ui/widgets/doctors%20speciality%20list/doctors_speciality_list_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorSpecialityListView extends StatefulWidget {
  const DoctorSpecialityListView(
      {super.key, required this.specializationDataList});

  ///
  final List<SpecializationData?> specializationDataList;

  @override
  State<DoctorSpecialityListView> createState() =>
      _DoctorSpecialityListViewState();
}

class _DoctorSpecialityListViewState extends State<DoctorSpecialityListView> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.specializationDataList.length,
      scrollDirection: Axis.horizontal,
      itemBuilder: (BuildContext context, int i) => Padding(
        padding: EdgeInsetsDirectional.only(start: i == 0 ? 0 : 24.w),
        child: GestureDetector(
          onTap: () {
            selectedIndex = i;
            setState(() {});
            BlocProvider.of<HomeCubit>(context).getDoctorsById(
                specializationId: widget.specializationDataList[i]!.id ?? 0);
          },
          child: DoctorsSpecialityListItem(
            selectedIndex: selectedIndex == i,
            specializationData: widget.specializationDataList[i]!,
          ),
        ),
      ),
    );
  }
}
