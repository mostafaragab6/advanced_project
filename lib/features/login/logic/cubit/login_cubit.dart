import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../data/models/login_request.dart';
import '../../data/repos/login_repo.dart';
import 'login_state.dart';

class LoginCubitCubit extends Cubit<LoginCubitState> {
  final LoginRepo _loginRepo;
  LoginCubitCubit(this._loginRepo) : super(const LoginCubitState.initial());

  TextEditingController passwordController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  void emitLoginStates() async {
    emit(const LoginCubitState.loading());

    final response = await _loginRepo.login(
      LoginRequest(
        email: emailController.text,
        password: passwordController.text,
      ),
    );

    response.when(
      success: (loginRespose) {
        emit(
          LoginCubitState.success(loginRespose),
        );
      },
      failure: (error) {
        emit(
          LoginCubitState.error(error.apiErrorModel.message ?? ''),
        );
      },
    );
  }
}
