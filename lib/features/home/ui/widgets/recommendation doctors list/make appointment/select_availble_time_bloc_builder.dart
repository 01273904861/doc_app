
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/logic/make_appointment_cubit.dart';
import 'package:appoment_app/features/home/logic/make_appointment_states.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/select_available_time_grid_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                height: 330.h,
                // child: Text('ssss'),
                child: SelectAvailbaleTimeGridview(
                  day: state.day, /////////////////
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
