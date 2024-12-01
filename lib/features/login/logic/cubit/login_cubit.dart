import 'package:appoment_app/features/login/data/models/log_in_request_body.dart';
import 'package:appoment_app/features/login/data/repos/login_repo.dart';
import 'package:appoment_app/features/login/logic/cubit/login_states.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

class LoginCubit extends Cubit<LoginStates> {
  final LoginRepo _loginRepos;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> signInFormKey = GlobalKey();
  LoginCubit(this._loginRepos) : super(const LoginStates.initial());

  void emitLoginStates() async {
    emit(const LoginStates.loading());
    final response = await _loginRepos.login(LoginRequestBody(
        email: emailController.text, password: passwordController.text));

    response.when(success: (loginResponse) async {
     
      emit(LoginStates.success(loginResponse));
     
    }, failure: (error) {
      emit(
        LoginStates.failure(errorMessage: error.apiErrorModel.message ?? ''),
      );
    });
  }
}
