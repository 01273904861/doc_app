import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/select_date_and_time_section.dart';
import 'package:appoment_app/features/home/ui/widgets/section_text1_and_text2.dart';
import 'package:flutter/material.dart';

class MakeAppointmentDetailsBody extends StatelessWidget {
  const MakeAppointmentDetailsBody(
      {super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12),
      child: Column(
        children: <Widget>[
          Text(
            'Book Appointment',
            style: AppTextstyles.font18BlackSemiBold,
          ),
          const SectionsTex1AndTex2(text1: 'title', text2: 'Set Manual'),
           SelectDateAndTimeSection(docotrModel : doctorModel),
          verticalSpace(20),
        
        ],
      ),
    );
  }
}
