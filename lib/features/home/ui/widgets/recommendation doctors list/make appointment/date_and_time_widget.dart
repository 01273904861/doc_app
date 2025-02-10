import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/data/models/seven_days_model.dart';
import 'package:appoment_app/features/home/logic/make_appointment_cubit.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/custom_header.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/select_availble_time_bloc_builder.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/select_date_listview.dart';
import 'package:appoment_app/features/home/ui/widgets/section_text1_and_text2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DateAndTimeWidget extends StatefulWidget {
  const DateAndTimeWidget({super.key, required this.doctrModel});
  final DoctorModel doctrModel;
  @override
  State<DateAndTimeWidget> createState() => _DateAndTimeWidgetState();
}

class _DateAndTimeWidgetState extends State<DateAndTimeWidget> {
  late SevenDaysOfweek sevenDaysOfweek;
  @override
  void initState() {
    sevenDaysOfweek = SevenDaysOfweek();
    context
        .read<MakeAppointmentCubit>()
        .emitSelectedDay(sevenDaysOfweek.dayList[0]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        const SectionsTex1AndTex2(text1: 'title', text2: 'Set Manual'),
        SizedBox(
          height: 70.h,
          child: SelectDateListview(
            sevenDaysOfWeek: sevenDaysOfweek,
          ),
        ),
        verticalSpace(20),
        const Row(
          children: <Widget>[
            CustomHeader(header: 'Available time'),
          ],
        ),
        SelectAvailbaleTimeBlocBuilder(docotrModel: widget.doctrModel)
      ],
    );
  }
}
