import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/core/widgets/app_button.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/data/models/make_appointment_request_model.dart';
import 'package:appoment_app/features/home/logic/home_cubit.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/doctor_details_item.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/header_and_content_widget.dart';
// ignore: unused_import
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendation_doctors_listview_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DoctorDetailsScreen extends StatelessWidget {
  const DoctorDetailsScreen({super.key, required this.doctorModel});
  final DoctorModel doctorModel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          doctorModel.name ?? 'unknown',
          style: AppTextstyles.font18BlackSemiBold,
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 12.w),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              DoctorDetailsItem(doctorModel: doctorModel),
              verticalSpace(30),
              HeaderAndContentSection(
                title: 'About me',
                content:
                    'this is me ${doctorModel.name!} my degree is ${doctorModel.degree!} i live at ${doctorModel.city!.name}',
              ),
              verticalSpace(20),
              HeaderAndContentSection(
                title: 'Working Time',
                content: '${doctorModel.startTime!} - ${doctorModel.endTime!}',
              ),
              verticalSpace(20),
              HeaderAndContentSection(
                  title: 'Address', content: doctorModel.address!),
              verticalSpace(20),
              HeaderAndContentSection(
                  title: 'Pengalaman Praktik',
                  content: doctorModel.city!.name!),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppButton(
                    title: 'Make An Appointment',
                    onPressed: () {
                      BlocProvider.of<HomeCubit>(context).emitMakeAppointment(
                          makeAppointmentRequestModel:
                              MakeAppointmentRequestModel(
                                  doctor_id: doctorModel.id,
                                  start_time: 'start_time',
                                  notes: 'notes'));
                    },
                  ),
                ],
              ),
              verticalSpace(50),
            ]),
      ),
    );
  }
}
//abdullah123@gmail.com