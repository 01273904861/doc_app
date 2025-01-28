import 'package:appoment_app/features/home/data/models/get_specialization_model.dart';
import 'package:appoment_app/features/home/ui/widgets/recommendation%20doctors%20list/make%20appointment/make_appointment_details_body.dart';
import 'package:flutter/material.dart';

class MakeAppointmentDetailsScreen extends StatelessWidget {
  const MakeAppointmentDetailsScreen({super.key, required this.doctorModel});
  final DoctorModel doctorModel ;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MakeAppointmentDetailsBody(doctorModel: doctorModel,),
      // body: Column(
      //     mainAxisAlignment: MainAxisAlignment.center,
      //     children: <Widget>[
      //       BlocBuilder<HomeCubit, HomeStates>(
      //         builder: (BuildContext context, HomeStates state) {
      //           return state.maybeWhen(
                  
      //             makeAppoinmentSucces: (data) {
      //             final MakeAppointmentResponseModel res =
      //                 data as MakeAppointmentResponseModel;
      //             return MakeAppointmentDetailsBody(makeAppointmentResponseModel: res,);
      //           }, makeAppointmentLoading: () {
      //             return const Center(child: CircularProgressIndicator());
      //           }, makeAppointmentFailure: (ErrorHandler err) {
      //             return Center(
      //               child: Text(
      //                 err.apiErrorModel.message ?? 'no data',
      //                 style: AppTextstyles.font18BlackRegular,
      //               ),
      //             );
      //           }, orElse: () {
      //             return Center(
      //               child: Text('no data',
      //                   style: AppTextstyles.font18BlackRegular),
      //             );
      //           });
      //         },
      //       ),
      //     ]),
    );
  }
}
