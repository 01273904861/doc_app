import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/login/logic/cubit/login_cubit.dart';
import 'package:appoment_app/features/login/logic/cubit/login_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginBlocListener extends StatelessWidget {
  const LoginBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<LoginCubit, LoginStates>(
      listenWhen: (previous, current) =>
          current is LoginLoading || current is LoginSuccess || current is LoginFailure,
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
          context.pop();

          context.pushNamedAndRemoveUntile(Routes.homeView, predicate:  (context)=>false);
        }, failure: (failureMessage) {
          setupErrorState(context, failureMessage);
        }, loading: () {
          return showDialog(
              context: context,
              builder: (context) {
                return const Center(
                  child: CircularProgressIndicator(),
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
