import 'package:appoment_app/core/networking/api_error_handler.dart';
import 'package:appoment_app/features/home/data/models/make_appointment_response_model.dart';
import 'package:appoment_app/features/home/logic/home_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MakeAppointmentDetailsScreen extends StatelessWidget {
  const MakeAppointmentDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<HomeCubit, HomeStates>(
              builder: (BuildContext context, HomeStates state) {
                return state.maybeWhen(makeAppoinmentSucces: (data) {
                  final MakeAppointmentResponseModel res =
                      data as MakeAppointmentResponseModel;
                  return Text(res.data!. appointment_end_time!);
                }, makeAppointmentLoading: () {
                  return const Center(child: CircularProgressIndicator());
                }, makeAppointmentFailure: (ErrorHandler err) {
                  return const Center(
                    child: Text('no data to build'),
                  );
                }, orElse: () {
                  return const Center(
                    child: Text('no data to build'),
                  );
                });
              },
            ),
          ]),
    );
  }
}
