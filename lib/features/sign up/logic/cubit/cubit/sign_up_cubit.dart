import 'package:appoment_app/core/helper/app_functions.dart';
import 'package:appoment_app/core/networking/api_error_handler.dart';
import 'package:appoment_app/core/networking/api_result.dart';
import 'package:appoment_app/features/sign%20up/data/models/sign_up_request_body.dart';
import 'package:appoment_app/features/sign%20up/data/models/sign_up_response_model.dart';
import 'package:appoment_app/features/sign%20up/data/repos/sign_up_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class signUpCubit extends Cubit<SignUpState> {
  signUpCubit(this._signUpRepo) : super(const SignUpState.initial());
  final SignUpRepo _signUpRepo;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey();
  int x = 5;
  Future<void> emitSignUpSates() async {
    emit(const SignUpLoading());
    final ApiResult<SignUpResponseModel> res = await _signUpRepo.signUp(
      SignUpRequestBody(
        name: nameController.text,
        email: emailController.text,
        password: passwordController.text,
        phone: phoneController.text,
        gender: int.parse(genderController.text),
        passwordConfirmation: passwordConfirmationController.text,
      ),
    );
    res.when(
      success: (SignUpResponseModel responseSuccess) {
        AppFunctions.saveUserToken(token: responseSuccess.data.token ?? '');
        AppFunctions.saveUserData(
            emailController.text, passwordController.text);
        emit(SignUpSuccess(res));
      },
      failure: (ErrorHandler failure) {
        emit(SignUpFailure(message: failure.apiErrorModel.message ?? ' '));
      },
    );
  }
}
