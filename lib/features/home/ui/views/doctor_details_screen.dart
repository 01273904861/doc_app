import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/core/widgets/app_button.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/doctor_details_item.dart';
import 'package:appoment_app/features/home/ui/widgets/header_and_content_widget.dart';
// ignore: unused_import
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/recommendation_doctors_listview_item.dart';
import 'package:flutter/material.dart';
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
              verticalSpace(25),
              HeaderAndContentSection(
                title: 'About me',
                content:
                    'this is me ${doctorModel.name!} my degree is ${doctorModel.degree!} i live at ${doctorModel.city!.name}',
              ),
              verticalSpace(15),
              HeaderAndContentSection(
                title: 'Working Time',
                content: '${doctorModel.startTime!} - ${doctorModel.endTime!}',
              ),
              verticalSpace(15),
              HeaderAndContentSection(
                  title: 'Address', content: doctorModel.address!),
              verticalSpace(15),
              HeaderAndContentSection(
                  title: 'Pengalaman Praktik',
                  content: doctorModel.city!.name!),
                   verticalSpace(15),
              HeaderAndContentSection(
                  title: 'Appointment price ',
                  content: doctorModel.appointPrice.toString()),
              const Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  AppButton(
                    title: 'Make An Appointment',
                    onPressed: () {
                      context.pushNamed(Routes.makeAppointmentDetailsScreen,
                          args: doctorModel);
                    },
                  ),
                ],
              ),
              verticalSpace(30),
            ]),
      ),
    );
  }
}
//abdullah123@gmail.com