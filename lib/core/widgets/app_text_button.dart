import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theming/colors.dart';
import '../theming/styles.dart';

class AppTextButton extends StatelessWidget {
  final Color? backgroundColor;
  final double? buttonWidth;
  final double? buttonheight;
  final double? horizontalPadding;
  final double? verticalPadding;
  final String buttonText;
  final VoidCallback onPressed;

  const AppTextButton(
      {super.key,
      this.backgroundColor,
      this.buttonWidth,
      this.buttonheight,
      this.horizontalPadding,
      this.verticalPadding,
      required this.buttonText,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      style: ButtonStyle(
        backgroundColor:
            WidgetStateProperty.all(backgroundColor ?? ColorsManager.mainBlue),
        shape: WidgetStateProperty.all(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
        ),
        fixedSize: WidgetStateProperty.all(
          Size(
            buttonWidth?.w ?? double.maxFinite,
            buttonheight?.h ?? 50.h,
          ),
        ),
        padding: WidgetStateProperty.all(
          EdgeInsets.symmetric(
            horizontal: horizontalPadding?.w ?? 12.w,
            vertical: verticalPadding?.h ?? 14.h,
          ),
        ),
      ),
      onPressed: onPressed,
      child: Text(
        buttonText,
        style: TextStyles.font16White600Weight(),
      ),
    );
  }
}
