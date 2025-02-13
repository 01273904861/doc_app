import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/helper/spacing.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/core/widgets/app_button.dart';
import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/logic/payment_option_cubit.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/custom_header.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/custom_stepper.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/date_and_time_widget.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/payment_widget.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/summary_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
              } else {
                Navigator.pop(context);
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
            verticalSpace(20),
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
              title: 'continue',
              onPressed: () {
                setState(() {
                  _activeStepIndex < steps.length - 1
                      ? _activeStepIndex++
                      : makeAppointmentBottomSheet(context);
                });
              },
            ),
            verticalSpace(30),
          ],
        ),
      ),
    );
  }

  Future<dynamic> makeAppointmentBottomSheet(BuildContext context) {
    return showModalBottomSheet(
        context: context,
        builder: (context) {
          return SizedBox(
            height: 312.h,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Column(
                children: [
                  const CustomHeader(header: 'payment info'),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('subtotal'),
                      Text(widget.doctorModel.appointPrice.toString()),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text('tax'),
                      Text('${widget.doctorModel.appointPrice! * .25}')
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('payment total',
                          style: AppTextstyles.font16WhiteSemiBold
                              .copyWith(color: Colors.black)),
                      Text(
                          style: AppTextstyles.font16WhiteSemiBold
                              .copyWith(color: Colors.black),
                          '${widget.doctorModel.appointPrice! * .25 + widget.doctorModel.appointPrice!}')
                    ],
                  ),
                  //make appbutton with totle book now and when click go to home screen
                  const Spacer(),
                  AppButton(
                    title: 'book now',
                    onPressed: () {
                      context.pop();
                      context.pushNamed(Routes.confirmedBookScreen,
                          args: widget.doctorModel);
                    },
                  ),
                  verticalSpace(30),
                ],
              ),
            ),
          );
        });
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
        content: BlocProvider(
          create: (context) => PaymentOptionCubit()..loadData(),
          child: const PaymentWidget(),
        ),
      ),
      StepData(
        title: 'Summary',
        content: SummaryWidget(doctorModel: widget.doctorModel),
      ),
    ];
  }
}
