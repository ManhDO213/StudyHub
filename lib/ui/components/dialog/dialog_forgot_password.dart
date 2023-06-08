import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/configs/string.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DialogForgotPassword extends StatefulWidget {
  final String title;
  final Function navigate;

  const DialogForgotPassword(
      {Key? key, required this.title, required this.navigate})
      : super(key: key);

  @override
  DialogForgotPasswordState createState() => DialogForgotPasswordState();
}

class DialogForgotPasswordState extends State<DialogForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      elevation: 0,
      backgroundColor: AppColors.blurGray,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14.r),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(
                left: 16.w, right: 16.w, top: 16.h, bottom: 16.h),
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 13.0.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'Arial',
                  letterSpacing: 0.5),
            ),
          ),
          Divider(
            height: 0.5.h,
            color: AppColors.lineGray,
          ),
          Padding(
            padding: EdgeInsets.only(top: 11.h, bottom: 9.5.h),
            child: InkWell(
              onTap: () {
                widget.navigate();
              },
              child: Center(
                child: Text(
                  AppStrings.stgOk,
                  style: TextStyle(
                      fontSize: 17.0.sp,
                      color: AppColors.systemBlue,
                      fontWeight: FontWeight.normal,
                      fontFamily: 'Arial',
                      letterSpacing: 0.5.w),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
