import 'package:appoment_app/core/helper/app_functions.dart';
import 'package:appoment_app/features/login/data/models/log_in_request_body_model.dart';
import 'package:appoment_app/features/login/data/repos/login_repo.dart';
import 'package:appoment_app/features/login/logic/cubit/login_states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LogInCubit extends Cubit<LogInStates> {
  final LoginRepo _loginRepos;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormKey = GlobalKey();
  LogInCubit(this._loginRepos) : super(const LogInStates.initial());

  void emitLoginStates() async {
    emit(const LogInStates.loading());
    final response = await _loginRepos.login(
      LoginRequestBodyModel(
          email: emailController.text, password: passwordController.text),
    );

    response.when(
      success: (loginResponse) async {
        await AppFunctions.saveUserToken(
            token: loginResponse.userData?.token ?? '');
        emit(
          LogInStates.success(loginResponse),
        );
      },
      failure: (error) {
        emit(
          LogInStates.failure(errorMessage: error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
