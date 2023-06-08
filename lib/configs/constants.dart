import 'package:flutter/cupertino.dart';
import 'package:meta/meta.dart';

@immutable
class Constants {
  /* Routing Names */
  static const String splashScreen = '/splash';
  static const String onBoardingScreen = '/on-boarding';
  static const String loginScreen = '/login';
  static const String signupScreen = '/signup';
  static const String createAccountScreen = '/create-account';
  static const String createAccountSocialScreen = '/create-account-social';
  static const String forgotPasswordScreen = '/forgot-edit_password';
  static const String createNewPasswordScreen = '/create-new-edit_password';
  static const String dashBoardScreen = '/dash_board-screen';

}
enum UserRole { PATIENT }

/* define Button Name */
class ButtonName{
  static String next = 'Next';
  static String back = 'Back';
  static String pair = 'Pair';
}

/* define String Names */
class StringName{
  static String notifications = 'Notifications';
  static String messages = 'Messages';
  static String completed = 'Completed';
  static String reset = 'reset';
  static String next = 'Next';
  static String back = 'Back';
  static String run = 'Run';
  static String pause = 'Pause';
  static String allow = 'Allow';
  static String reScan = 'Re-Scan';
  static String pair = 'Pair';
  static String stats = 'Stats';
  static String lastSession = 'Last session';
  static String sevenDay = '7 days';
  static String thirtyDay = '30 days';

  static String dataOfflineMode = 'Data is offline mode';
  static String pairNewDevice = 'Pairing to a new Kam device will cause your currently paired device to disconnect';
  static String notConnectedDeviceFound = 'No connected devices found.';
  static String noNotifications = 'No notifications';
  static String kamCPAPUnit = 'Kam CPAP unit';
  static String kamRing = 'Kam Ring';
  static String pairToNewKamDevice = 'Pair to New Kam Device';
  static String connectingDevice = 'Connecting device...';
  static String searchingDevice = 'Searching for device...';
  static String pairDevice = 'Pair Device';
  static String pairDeviceSuccess = 'successfully paired';
  static String guidePairDevice = 'We need to connect to your device by bluetooth in order to set it up. Press “pair” and then “Ok” on the following popup';
  static String networkNotAvailable = 'Network not available';
}

