import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/core/widgets/app_button.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/custom_stepper.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/date_and_time_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MakeAppointmentDetailsScreen extends StatefulWidget {
  const MakeAppointmentDetailsScreen({super.key, required this.doctorModel});
  final DoctorModel doctorModel;

  @override
  State<MakeAppointmentDetailsScreen> createState() =>
      _MakeAppointmentDetailsScreenState();
}

class _MakeAppointmentDetailsScreenState
    extends State<MakeAppointmentDetailsScreen> {
  int _activeStepIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<StepData> steps = stepList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Book Appointment',
          style: AppTextstyles.font18BlackSemiBold,
        ),
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            setState(() {
              if (_activeStepIndex > 0) {
                _activeStepIndex--;
              }
            });
          },
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: Column(
          children: <Widget>[
            const SizedBox(height: 20),
            CustomStepper(
              currentStep: _activeStepIndex,
              steps: steps,
              onStepTapped: (int index) {
                setState(() {
                  _activeStepIndex = index;
                });
              },
            ),
            steps[_activeStepIndex].content,
            const Spacer(),
            AppButton(
              title: _activeStepIndex == steps.length - 1
                  ? 'Confirm Appointment'
                  : 'Next',
              onPressed: () {
                setState(() {
                  if (_activeStepIndex < steps.length - 1) {
                    _activeStepIndex++;
                  }
                  if (_activeStepIndex == steps.length - 1) {                   
                  }
                });
              },
            ),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }

  List<StepData> stepList() {
    return <StepData>[
      StepData(
        title: 'Date & Time',
        content: DateAndTimeWidget(
          doctrModel: widget.doctorModel,
        ),
      ),
      StepData(
        title: 'Payment',
        content: const Text('Enter payment details'),
      ),
      StepData(
        title: 'Payment',
        content: const Text('Enter payment details'),
      ),
    ];
  }
}

