import 'package:appoment_app/core/helper/extension.dart';
import 'package:appoment_app/core/routings/routes.dart';
import 'package:appoment_app/core/theming/app_textstyles.dart';
import 'package:appoment_app/features/sign%20up/logic/cubit/cubit/sign_up_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SignUpBlocListener extends StatelessWidget {
  const SignUpBlocListener({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocListener<SignUpCubit, SignUpState>(
      listenWhen: (previous, current) =>
          current is SignUpLoading || current is SignUpSuccess || current is SignUpFailure,
      listener: (context, state) {
        state.whenOrNull(success: (signUpResponse) {
          context.pop();
          showDialog(
              context: context,
              builder: (context) {
                return const AlertDialog(
                  content: Text('sign up  successful'),
                );
              });
          context.pop();

          context.pushNamed(Routes.homeView);
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
