import 'package:du_an_fpt/router/app_router.dart';
import 'package:du_an_fpt/ui/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';

class FptApp extends StatefulWidget {
  const FptApp({Key? key}) : super(key: key);

  @override
  State<FptApp> createState() => _FptAppState();
}

class _FptAppState extends State<FptApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (ctx, _) => GlobalLoaderOverlay(
        overlayColor: Colors.black,
        overlayOpacity: 0.7,
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Kam',
          theme: ThemeData(
            appBarTheme: const AppBarTheme(
                systemOverlayStyle: SystemUiOverlayStyle.light),
            canvasColor: Colors.transparent,
          ),
          home: const SplashScreen(),
          onGenerateRoute: onGenerateRoute,
        ),
      ),
      designSize: const Size(375, 812),
    );
  }
}
