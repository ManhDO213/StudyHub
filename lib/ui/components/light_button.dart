import 'package:du_an_fpt/configs/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LightButton extends StatelessWidget {
  final Widget child;
  final VoidCallback? onPressed;
  final Color? color;

  const LightButton(
      {Key? key, required this.child, required this.onPressed, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(10.r),
      color: color ?? AppColors.greenS,
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(vertical: 16.h, horizontal: 16.w),
        onPressed: onPressed,
        child: child,
      ),
    );
  }
}
