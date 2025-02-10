import 'package:appoment_app/core/helper/app_functions.dart';
import 'package:appoment_app/features/login/data/models/log_in_request_body_model.dart';
import 'package:appoment_app/features/login/data/repos/login_repo.dart';
import 'package:appoment_app/features/login/logic/cubit/login_states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LogInCubit extends Cubit<LogInStates> {
  final LoginRepo _loginRepos;

  final GlobalKey<FormState> signInFormKey = GlobalKey();
  LogInCubit(this._loginRepos) : super(const LogInStates.initial());

  void emitLoginStates({required String email, required String password}) async {
    emit(const LogInStates.loading());
    final response = await _loginRepos.login(
      LoginRequestBodyModel(
          email: email, password: password),
    );
   
    response.when(
      success: (loginResponse) async {
        await AppFunctions.saveUserToken(
            token: loginResponse.userData?.token ?? '');

         await AppFunctions.saveUserData(email,password);
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
