import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ui/components/dialog/dialog_forgot_password.dart';

class DialogHelper {
  static Future<void> showDialogSendMailForgotPassword(
      BuildContext context, String content, Function navigate) async {
    await showDialog(
      barrierDismissible: false,
      barrierColor: Colors.black26,
      context: context,
      builder: (context) {
        return SizedBox(
            width: 271.w,
            height: 150.h,
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 2, sigmaY: 2),
              child: DialogForgotPassword(
                title: content,
                navigate: navigate,
              ),
            ));
      },
    );
  }
}
