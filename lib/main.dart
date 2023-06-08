import 'dart:async';
import 'package:du_an_fpt/app.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  runZonedGuarded(() {
    var fptApp = FptApp();
    runApp(fptApp);
  }, (error, stackTrace) {
    debugPrint('[Error Open App] => $error - $stackTrace');
  });
}
