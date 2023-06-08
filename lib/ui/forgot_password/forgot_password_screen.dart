import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/configs/images.dart';
import 'package:du_an_fpt/configs/string.dart';
import 'package:du_an_fpt/services/FirebaseService.dart';
import 'package:du_an_fpt/ui/components/light_button.dart';
import 'package:du_an_fpt/utils/dialog_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final TextEditingController _emailController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Image.asset(
          AppImages.bgForgotPassword,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
            extendBodyBehindAppBar: true,
            resizeToAvoidBottomInset: false,
            body: SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 40.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 24.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Image.asset(
                        AppImages.imgArrowLeftBlack,
                        height: 30.h,
                        width: 30.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Text(
                      AppStrings.stgForgotPasswordTitle,
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          fontSize: 26.sp,
                          color: AppColors.whiteB),
                    ),
                    SizedBox(
                      height: 51.h,
                    ),
                    TextFormField(
                      controller: _emailController,
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w400,
                          fontSize: 18.sp,
                          color: AppColors.whiteG),
                      decoration: InputDecoration(
                          border: UnderlineInputBorder(
                            borderSide: BorderSide(
                                color: AppColors.blackA.withOpacity(0.15)),
                          ),
                          hintText: AppStrings.stgEmail,
                          hintStyle: TextStyle(
                              fontFamily: 'Rubik',
                              fontWeight: FontWeight.w400,
                              fontSize: 18.sp,
                              color: AppColors.whiteG.withOpacity(0.7))),
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                    LightButton(
                        child: const Text(AppStrings.stgSend,
                            style: TextStyle(
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Rubik')),
                        onPressed: () async {
                          await FirebaseService()
                              .resetPassword(_emailController.text);
                          DialogHelper.showDialogSendMailForgotPassword(
                              context, AppStrings.stgNotificationResetPassword,
                              () {
                                Navigator.pop(context);
                                Navigator.pop(context);
                              },);
                        }),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
