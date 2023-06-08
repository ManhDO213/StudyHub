import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/configs/constants.dart';
import 'package:du_an_fpt/configs/images.dart';
import 'package:du_an_fpt/configs/string.dart';
import 'package:du_an_fpt/ui/components/light_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({Key? key}) : super(key: key);

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Image.asset(
          AppImages.bgSplash,
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          fit: BoxFit.cover,
        ),
        Scaffold(
          resizeToAvoidBottomInset: false,
          body: SafeArea(
            bottom: false,
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 40.w),
              child: Column(
                children: <Widget>[
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                          style: TextStyle(
                              fontFamily: 'Rubik',
                              fontSize: 64,
                              fontWeight: FontWeight.w300),
                          children: [
                            TextSpan(
                                text: 'Study',
                                style: TextStyle(
                                    color: AppColors.gray1,
                                    fontStyle: FontStyle.italic)),
                            TextSpan(
                                text: 'HUB',
                                style: TextStyle(
                                  color: AppColors.greenN,
                                )),
                          ]),
                    ),
                  ),
                  const Spacer(),
                  LightButton(
                      child: const Text(AppStrings.stgLogin,
                          style: TextStyle(
                              color: AppColors.kPrimaryColor,
                              fontWeight: FontWeight.w600,
                              fontFamily: 'Rubik')),
                      onPressed: () {
                        Navigator.pushNamed(context, Constants.loginScreen);
                      }),
                  Container(
                    margin: EdgeInsets.only(bottom: 33.h, top: 23.h),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushNamed(context, Constants.signupScreen);
                      },
                      child: const Text(
                        AppStrings.stgCreateAcount,
                        style: TextStyle(fontFamily: 'Rubik'),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
