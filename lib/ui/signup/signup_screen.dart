import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/configs/images.dart';
import 'package:du_an_fpt/configs/string.dart';
import 'package:du_an_fpt/services/FirebaseService.dart';
import 'package:du_an_fpt/ui/components/light_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _rePasswordController = TextEditingController();
  bool isHidePassword = false;
  bool isHideRePassword = false;

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
          AppImages.bgSignUp,
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
                      AppStrings.stgstgCreateAcountTitle,
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
                    TextFormField(
                      obscureText: !isHidePassword,
                      controller: _passwordController,
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
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHidePassword = !isHidePassword;
                            });
                          },
                          child: Image.asset(!isHidePassword
                              ? AppImages.imgEyeOff
                              : AppImages.imgEye),
                        ),
                        hintText: AppStrings.stgPassword,
                        hintStyle: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                            color: AppColors.whiteG.withOpacity(0.7)),
                      ),
                    ),
                    SizedBox(
                      height: 38.h,
                    ),
                    TextFormField(
                      obscureText: !isHideRePassword,
                      controller: _rePasswordController,
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
                        suffixIcon: GestureDetector(
                          onTap: () {
                            setState(() {
                              isHideRePassword = !isHideRePassword;
                            });
                          },
                          child: Image.asset(!isHideRePassword
                              ? AppImages.imgEyeOff
                              : AppImages.imgEye),
                        ),
                        hintText: AppStrings.stgConfirmPassword,
                        hintStyle: TextStyle(
                            fontFamily: 'Rubik',
                            fontWeight: FontWeight.w400,
                            fontSize: 18.sp,
                            color: AppColors.whiteG.withOpacity(0.7)),
                      ),
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    LightButton(
                        child: const Text(AppStrings.stgSignup,
                            style: TextStyle(
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Rubik')),
                        onPressed: () async {
                          await FirebaseService().signUpWithEmail(
                              _emailController.text, _passwordController.text);
                        }),
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
