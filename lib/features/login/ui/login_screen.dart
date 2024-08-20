import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/cubit/login_cubit.dart';
import 'widgets/email_and_password.dart';
import 'widgets/login_bloc_listener.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.w,
              vertical: 60.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Welcome Back',
                  style: TextStyles.font24Blue700Weight(),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'We\'re excited to have you back, can\'t wait to see what you\'ve been up to since you last logged in.',
                  style: TextStyles.font14Grey400Weight(),
                ),
                SizedBox(
                  height: 36.h,
                ),
                const EmailAndPassword(),
                Align(
                  alignment: AlignmentDirectional.centerEnd,
                  child: Text(
                    'Forget Password?',
                    style: TextStyles.font12Blue400Weight(),
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                AppTextButton(
                  buttonText: 'Login',
                  onPressed: () {
                    validateThenLogin(context);
                  },
                ),
                SizedBox(
                  height: 30.h,
                ),
                RichText(
                  textAlign: TextAlign.center,
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: 'By logging, you agree to our ',
                        style: TextStyles.font13LightGrey400Weight(),
                      ),
                      TextSpan(
                        text: 'Terms & Conditions ',
                        style: TextStyles.font13Black400Weight(),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: TextStyles.font13LightGrey400Weight(),
                      ),
                      TextSpan(
                        text: 'PrivacyPolicy.',
                        style: TextStyles.font13Black400Weight(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 40.h,
                ),
                Align(
                  child: RichText(
                    textAlign: TextAlign.center,
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: 'Do not have an account yet? ',
                          style: TextStyles.font13Black400Weight(),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushNamed(
                                context,
                                Routes.signUpScreen,
                              );
                            },
                          text: 'Sign Up',
                          style: TextStyles.font12Blue400Weight(),
                        ),
                      ],
                    ),
                  ),
                ),
                const LoginBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateThenLogin(BuildContext context) {
    if (context.read<LoginCubitCubit>().formKey.currentState!.validate()) {
      context.read<LoginCubitCubit>().emitLoginStates();
    }
  }
}
