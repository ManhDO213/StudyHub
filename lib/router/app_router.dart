import 'package:du_an_fpt/configs/constants.dart';
import 'package:du_an_fpt/ui/dash_board/dash_board_screen.dart';
import 'package:du_an_fpt/ui/forgot_password/forgot_password_screen.dart';
import 'package:du_an_fpt/ui/login/login_screen.dart';
import 'package:du_an_fpt/ui/onboarding/onboarding_screen.dart';
import 'package:du_an_fpt/ui/signup/signup_screen.dart';
import 'package:du_an_fpt/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';

Route<dynamic> onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case Constants.splashScreen:
      return generateRouter(widget: const SplashScreen());
    case Constants.onBoardingScreen:
      return generateRouter(widget: const OnBoardingScreen());
    case Constants.loginScreen:
      return generateRouter(widget: const LoginScreen());
    case Constants.signupScreen:
      return generateRouter(widget: const SignupScreen());
    case Constants.forgotPasswordScreen:
      return generateRouter(widget: const ForgotPasswordScreen());
    case Constants.dashBoardScreen:
      return generateRouter(widget: const DashBoardScreen());
    default:
      throw ('This route name does not exit');
  }
}

generateRouter({required Widget widget}) {
  return MaterialPageRoute(builder: (context) => widget);
}
