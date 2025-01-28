import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/data/models/seven_days_model.dart';
import 'package:appoment_app/features/home/logic/make_appointment_cubit.dart';
import 'package:appoment_app/features/home/logic/make_appointment_states.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/select_available_time_grid_view.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/select_date_listview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SelectDateAndTimeSection extends StatefulWidget {
  const SelectDateAndTimeSection({super.key, required this.docotrModel});
  final   DoctorModel docotrModel;
  @override
  State<SelectDateAndTimeSection> createState() =>
      _SelectDateAndTimeSectionState();
}

class _SelectDateAndTimeSectionState extends State<SelectDateAndTimeSection> {
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
        SizedBox(
          height: 63.h,
          child: SelectDateListview(
            sevenDaysOfWeek: sevenDaysOfweek,
          ),
        ),
        verticalSpace(20),
        Row(
          children: <Widget>[
            Text(
              'Available time',
              style: AppTextstyles.font16WhiteSemiBold
                  .copyWith(color: Colors.black),
            ),
          ],
        ),
        SelectAvailbaleTimeBlocBuilder(docotrModel: widget.docotrModel)
      ],
    );
  }
}

class SelectAvailbaleTimeBlocBuilder extends StatelessWidget {
  const SelectAvailbaleTimeBlocBuilder({
    super.key,
    required this.docotrModel,
  });
  final DoctorModel docotrModel;
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MakeAppointmentCubit, MakeAppointmentStates>(
      builder: (BuildContext context, MakeAppointmentStates state) {
        return state is DetermineDaySucess
            ? SizedBox(
                height: 400.h,
                // child: Text('ssss'),
                child: SelectAvailbaleTimeGridview(
                  day: state.day,
                  docotrModel: docotrModel,
                ),
              )
            : Center(
                child: Text(
                  'no data',
                  style: AppTextstyles.font18BlackRegular,
                ),
              );
      },
    );
  }
}
