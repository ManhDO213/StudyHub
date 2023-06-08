import 'package:du_an_fpt/configs/colors.dart';
import 'package:du_an_fpt/configs/constants.dart';
import 'package:du_an_fpt/configs/images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
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
    Future.delayed(
        const Duration(milliseconds: 2000),
        () => Navigator.pushReplacementNamed(
            context, Constants.onBoardingScreen));
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
                const SizedBox(
                  height: 32,
                ),
                // SizedBox(
                //     width: 129,
                //     height: 23.8,
                //     child: SvgPicture.asset(AppImages.bgSplash,
                //         color: AppColors.logoRed)),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
