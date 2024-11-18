import 'package:appoment_app/features/sign%20up/data/models/sign_up_request_body.dart';
import 'package:appoment_app/features/sign%20up/data/repos/sign_up_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_state.dart';
part 'sign_up_cubit.freezed.dart';

class SignUpCubit extends Cubit<SignUpState> {
  SignUpCubit(this._signUpRepo) : super(const SignUpState.initial());
  final SignUpRepo _signUpRepo;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController passwordConfirmationController =
      TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController genderController = TextEditingController();
  final GlobalKey<FormState> signUpFormKey = GlobalKey();
  void emitSignUpSates() {
    _signUpRepo.signUp(SignUpRequestBody(
      name: nameController.text,
      email: emailController.text,
      password: passwordController.text,
      phone: phoneController.text,
      gender: int.parse(genderController.text),
      passwordConfirmation: passwordConfirmationController.text,
    ));
  }
}
