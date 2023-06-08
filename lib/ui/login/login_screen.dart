import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/configs/constants.dart';
import 'package:du_an_fpt/configs/images.dart';
import 'package:du_an_fpt/configs/string.dart';
import 'package:du_an_fpt/services/FirebaseService.dart';
import 'package:du_an_fpt/ui/components/light_button.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  bool isHidePassword = false;
  bool _isRememberMe = false;

  @override
  void initState() {
    initializeApp();
    super.initState();
  }

  initializeApp() async {
    WidgetsFlutterBinding.ensureInitialized();
    await Firebase.initializeApp();
    bool isLoggedin = await FirebaseService().checkUserLoggedin();
    debugPrint('isLoggedin => ${isLoggedin}');
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
          AppImages.bgLogin,
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
                        AppImages.imgArrowLeft,
                        height: 30.h,
                        width: 30.w,
                        fit: BoxFit.cover,
                      ),
                    ),
                    SizedBox(
                      height: 40.h,
                    ),
                    Text(
                      AppStrings.stgWelcome,
                      style: TextStyle(
                          fontFamily: 'Rubik',
                          fontWeight: FontWeight.w500,
                          fontSize: 26.sp,
                          color: AppColors.kPrimaryColor),
                    ),
                    const Spacer(),
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
                      height: 26.h,
                    ),
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Theme(
                              data: Theme.of(context).copyWith(
                                  unselectedWidgetColor: AppColors.grey400),
                              child: Container(
                                height: 20.0.h,
                                width: 20.0.w,
                                decoration: BoxDecoration(
                                    border: Border.all(color: AppColors.whiteF),
                                    borderRadius: BorderRadius.circular(5.r)),
                                child: Opacity(
                                  opacity: _isRememberMe ? 1 : 0,
                                  child: Checkbox(
                                    value: _isRememberMe,
                                    checkColor: AppColors.blackA,
                                    activeColor: AppColors.kPrimaryColor,
                                    onChanged: (value) => setState(() {
                                      _isRememberMe = !_isRememberMe;
                                    }),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 7.w,
                            ),
                            Text(
                              AppStrings.stgRemember,
                              style: TextStyle(
                                  color: AppColors.blackH,
                                  fontFamily: 'Poppins',
                                  fontSize: 15.sp,
                                  fontWeight: FontWeight.w500),
                            )
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            Navigator.pushNamed(
                                context, Constants.forgotPasswordScreen);
                          },
                          child: Text(
                            AppStrings.stgForgotPassword,
                            style: TextStyle(
                                color: AppColors.greenS,
                                fontFamily: 'Poppins',
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w500),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 26.h,
                    ),
                    LightButton(
                        child: const Text(AppStrings.stgLogin,
                            style: TextStyle(
                                color: AppColors.kPrimaryColor,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Rubik')),
                        onPressed: () async {
                          var userCredential = await FirebaseService()
                              .signInWithEmail(_emailController.text,
                                  _passwordController.text);
                          debugPrint('userCredential => ${userCredential}');
                          Navigator.pushNamedAndRemoveUntil(context,
                              Constants.dashBoardScreen, (route) => false);
                        }),
                    SizedBox(
                      height: 39.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Flexible(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(top: 16),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: AppColors.blackH
                                            .withOpacity(0.5)))),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 9.w),
                          child: Text(AppStrings.stgOr,
                              style: TextStyle(
                                  color: AppColors.blackH,
                                  fontWeight: FontWeight.w400,
                                  fontSize: 18.sp,
                                  fontFamily: 'Poppins')),
                        ),
                        Flexible(
                          flex: 1,
                          child: Container(
                            margin: const EdgeInsets.only(top: 16),
                            decoration: BoxDecoration(
                                border: Border(
                                    bottom: BorderSide(
                                        width: 1,
                                        color: AppColors.blackH
                                            .withOpacity(0.5)))),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 35.h,
                    ),
                    SizedBox(
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () async {
                          var userCredential =
                              await FirebaseService().signInWithGoogle();
                          debugPrint('userCredential => ${userCredential}');
                          Navigator.pushNamedAndRemoveUntil(context,
                              Constants.dashBoardScreen, (route) => false);
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor,
                          shadowColor: Colors.transparent,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                              side: BorderSide(
                                  color: AppColors.blackH.withOpacity(0.66))),
                        ),
                        child: Stack(
                          children: [
                            Image.asset(
                              AppImages.imgGoogle,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(AppStrings.stgLoginGoogle,
                                    style: TextStyle(
                                        fontFamily: 'Poppins',
                                        fontSize: 16.sp,
                                        color:
                                            AppColors.blackA.withOpacity(0.60),
                                        fontWeight: FontWeight.w600)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 33.h,
                    )
                  ],
                ),
              ),
            )),
      ],
    );
  }
}
