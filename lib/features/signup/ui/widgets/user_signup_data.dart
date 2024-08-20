import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_text_form.dart';
import '../../logic/cubit/cubit/signup_cubit.dart';

class UserSignUpData extends StatefulWidget {
  const UserSignUpData({super.key});

  @override
  State<UserSignUpData> createState() => _UserSignUpDataState();
}

class _UserSignUpDataState extends State<UserSignUpData> {
  bool isPass = true;
  bool isConfirmationPass = true;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<SignupCubit>().formKey,
      child: Column(
        children: [
          AppTextForm(
            hintText: 'Name',
            controller: context.read<SignupCubit>().nameController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid name';
              }
            },
          ),
          SizedBox(
            height: 18.h,
          ),
          AppTextForm(
            hintText: 'Email',
            controller: context.read<SignupCubit>().emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid email';
              }
            },
          ),
          SizedBox(
            height: 18.h,
          ),
          AppTextForm(
            hintText: 'Phone',
            controller: context.read<SignupCubit>().phoneController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid phone number';
              }
            },
          ),
          SizedBox(
            height: 18.h,
          ),
          AppTextForm(
            hintText: 'Password',
            controller: context.read<SignupCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return 'Please enter a valid password';
              }
            },
            isObscured: isPass,
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    isPass = !isPass;
                  },
                );
              },
              icon: isPass
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
          ),
          SizedBox(
            height: 18.h,
          ),
          AppTextForm(
            hintText: "Password Confirmation",
            controller:
                context.read<SignupCubit>().passwordConfimationController,
            validator: (value) {
              if (value == null ||
                  value.isEmpty ||
                  context
                          .read<SignupCubit>()
                          .passwordConfimationController
                          .text !=
                      context.read<SignupCubit>().passwordController.text) {
                return 'Passwords does not match';
              }
            },
            isObscured: isConfirmationPass,
            suffixIcon: IconButton(
              onPressed: () {
                setState(
                  () {
                    isConfirmationPass = !isConfirmationPass;
                  },
                );
              },
              icon: isConfirmationPass
                  ? const Icon(Icons.visibility_off)
                  : const Icon(Icons.visibility),
            ),
          ),
        ],
      ),
    );
  }
}
