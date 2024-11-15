import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/login/logic/cubit/login_cubit.dart';
import 'package:appoment_app/features/login/logic/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listenWhen: (previous, current) =>
          current is Loading || current is Success || current is Failure,
      listener: (context, state) {
        state.whenOrNull(success: (loginResponse) {
          context.pop();
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text('login successful'),
                );
              });
          context.pushNamed(Routes.homeView);
        }, failure: (failureMessage) {
          setupErrorState(context, failureMessage);
        }, loading: () {
          return showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  content: SizedBox(
                      width: 200.w,
                      height: 200.h,
                      child: const Center(child: CircularProgressIndicator())),
                );
              });
        });
      },
      child: const SizedBox.shrink(),
    );
  }
}

void setupErrorState(BuildContext context, String error) {
  context.pop();
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      icon: const Icon(
        Icons.error,
        color: Colors.red,
        size: 32,
      ),
      content: Text(
        error,
        style: AppTextstyles.font12BlackRegular,
      ),
      actions: [
        TextButton(
          onPressed: () {
            context.pop();
          },
          child: Text(
            'Got it',
            style: AppTextstyles.font12BlackRegular,
          ),
        ),
      ],
    ),
  );
}
