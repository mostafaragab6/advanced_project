import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/widgets/app_text_form.dart';
import '../../logic/cubit/login_cubit.dart';

class EmailAndPassword extends StatefulWidget {
  const EmailAndPassword({super.key});

  @override
  State<EmailAndPassword> createState() => _EmailAndPasswordState();
}

class _EmailAndPasswordState extends State<EmailAndPassword> {
  bool isPass = true;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: context.read<LoginCubitCubit>().formKey,
      child: Column(
        children: [
          AppTextForm(
            hintText: 'Email',
            controller: context.read<LoginCubitCubit>().emailController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid email";
              }
            },
          ),
          SizedBox(
            height: 18.h,
          ),
          AppTextForm(
            hintText: 'Password',
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
            isObscured: isPass,
            controller: context.read<LoginCubitCubit>().passwordController,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "Please enter a valid password";
              }
            },
          ),
          SizedBox(
            height: 24.h,
          ),
        ],
      ),
    );
  }
}
