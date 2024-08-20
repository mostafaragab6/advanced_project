import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../data/models/signup_request.dart';
import '../../../data/repos/signup_repo.dart';
import 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  final SignUpRepo _signUpRepo;
  SignupCubit(this._signUpRepo) : super(const SignupState.initial());

  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordConfimationController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitSignUpStates() async {
    emit(const SignupState.loading());

    final response = await _signUpRepo.signUp(
      SignupRequest(
        name: nameController.text,
        email: emailController.text,
        phone: phoneController.text,
        gender: 0,
        password: passwordController.text,
        passwordConfirmation: passwordConfimationController.text,
      ),
    );

    response.when(
      success: (signUpResponse) {
        emit(
          SignupState.success(signUpResponse),
        );
      },
      failure: (error) {
        emit(
          SignupState.error(error.apiErrorModel.message!),
        );
      },
    );
  }
}
