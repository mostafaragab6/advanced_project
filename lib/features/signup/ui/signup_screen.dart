import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/styles.dart';
import '../../../core/widgets/app_text_button.dart';
import '../logic/cubit/cubit/signup_cubit.dart';
import 'widgets/signup_bloc_listener.dart';
import 'widgets/user_signup_data.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(
              horizontal: 30.0.w,
              vertical: 60.0.h,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Create Account',
                  style: TextStyles.font24Blue700Weight(),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Text(
                  'Sign up now and start exploring all that our app has to offer. We\'re excited to welcome you to our community!',
                  style: TextStyles.font14Grey400Weight(),
                ),
                SizedBox(
                  height: 36.h,
                ),
                const UserSignUpData(),
                SizedBox(
                  height: 40.h,
                ),
                AppTextButton(
                  buttonText: 'Create Account',
                  onPressed: () {
                    validateAndSignUp(context);
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
                          text: 'Already have an account? ',
                          style: TextStyles.font13Black400Weight(),
                        ),
                        TextSpan(
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.pushReplacementNamed(
                                context,
                                Routes.loginScreen,
                              );
                            },
                          text: 'Sign In',
                          style: TextStyles.font12Blue400Weight(),
                        ),
                      ],
                    ),
                  ),
                ),
                const SignupBlocListener(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void validateAndSignUp(BuildContext context) {
    if (context.read<SignupCubit>().formKey.currentState!.validate()) {
      context.read<SignupCubit>().emitSignUpStates();
    }
  }
}
